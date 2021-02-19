-- DMS_Eritrea_Functions
-- Author: DMS
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
local function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bPrintForDebug = DMS_GetUserSetting("DMS_ERITREA_DEBUGGING_ON") == 1
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
----------------------------------------------------------------------------------------------------------------------------
local function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
local function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
local function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- HasTrait
----------------------------------------------------------------------------------------------------------------------------
local function HasTrait(player, traitID)
	if isCPDLL then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
local function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- VARIABLES
--==========================================================================================================================
-- Player and Components
----------------------------------------------------------------------------------------------------------------------------
local Players									= Players
local activePlayerID 							= Game.GetActivePlayer()
local activePlayer 								= Players[activePlayerID]
local activePlayerTeam 							= Teams[Game.GetActiveTeam()]
local civilisationEritrea						= GameInfoTypes["CIVILIZATION_DMS_ERITREA"]
local traitGedli								= GameInfoTypes["TRAIT_DMS_GEDLI"]
local buildingCablewayStation					= GameInfoTypes["BUILDING_DMS_CABLEWAY_STATION"]
local buildingCablewayStationExtraProduction	= GameInfoTypes["BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION"]
local unitPenneDiFalco							= GameInfoTypes["UNIT_DMS_PENNE_DI_FALCO"]
local promotionAskariCavalry					= GameInfoTypes["PROMOTION_DMS_ASKARI_CAVALRY"]
local buildingAskariExtraProduction				= GameInfoTypes["BUILDING_DMS_ASKARI_EXTRA_PRODUCTION"]
local promotionStrengthFromPolicies				= GameInfoTypes["PROMOTION_DMS_STRENGTH_FROM_POLICIES"]
local domainLand								= GameInfoTypes["DOMAIN_LAND"]
local tablePromotionFlankingBonus = {}
for i = 1, 20 do
	tablePromotionFlankingBonus[i] = GameInfoTypes["PROMOTION_DMS_FLANKING_BONUS_" .. i .. ""]
end
local stringFormat								= string.format
local isEritreaCivActive 						= JFD_IsCivilisationActive(civilisationEritrea)
local isEritreaActivePlayer 					= activePlayer:GetCivilizationType() == civilisationEritrea
if isEritreaCivActive then
	print("Hamid Idris Awate of Eritrea joins in this game!")
end
----------------------------------------------------------------------------------------------------------------------------
-- Math
----------------------------------------------------------------------------------------------------------------------------
local mathCeil 									= math.ceil
local mathMin									= math.min
----------------------------------------------------------------------------------------------------------------------------
-- GameEvents
----------------------------------------------------------------------------------------------------------------------------
local PlayerDoTurn								= GameEvents.PlayerDoTurn.Add
local CityTrained								= GameEvents.CityTrained.Add
local UnitSetXY									= GameEvents.UnitSetXY.Add
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-- DMS_Eritrea_UA_GetNumPoliciesAdopted
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UA_GetNumPoliciesAdopted(player)
	local numPoliciesAdopted = 0
	if isCPDLL then
		numPoliciesAdopted = player:GetNumPolicies()
	else
		for branch = 0, 9 do
			if player:IsPolicyBranchUnlocked(branch) then
				numPoliciesAdopted = numPoliciesAdopted + player:GetNumPoliciesInBranch(branch)
			end
		end
	end
	DMS_Print("DMS_Eritrea_UA_GetNumPoliciesAdopted: numPoliciesAdopted = ".. numPoliciesAdopted)
	return numPoliciesAdopted
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UA_GetMilitaryUnitIDsInTable
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UA_GetMilitaryUnitIDsInTable(player)
	local tableMilitaryUnitIDs = {}
	local i = 1
	for unit in player:Units() do
		if unit:IsCombatUnit() then
			tableMilitaryUnitIDs[i] = unit
			i = i + 1
		end
	end
	DMS_Print("DMS_Eritrea_UA_GetMilitaryUnitIDsInTable: #tableMilitaryUnitIDs = ".. #tableMilitaryUnitIDs)
	return tableMilitaryUnitIDs
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UA_ResetCombatStrengthFromPolicies
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UA_ResetCombatStrengthFromPolicies(unit)
	if unit:IsHasPromotion(promotionStrengthFromPolicies) then
		unit:SetHasPromotion(promotionStrengthFromPolicies, false)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UA_GrantCombatSrengthAndMoves
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UA_GrantCombatSrengthAndMoves(player, numPoliciesAdopted, tableMilitaryUnitIDs)
	local numUnitsToRewardPromotion = mathCeil(numPoliciesAdopted / 2)
	if numUnitsToRewardPromotion == 0 then return end
	if #tableMilitaryUnitIDs == 0 then return end
	if numUnitsToRewardPromotion > #tableMilitaryUnitIDs then 
		numUnitsToRewardPromotion = mathMin(numUnitsToRewardPromotion, #tableMilitaryUnitIDs) -- can't give the bonus to more units than the player has
	end
	DMS_Print("DMS_Eritrea_UA_GrantCombatSrengthAndMoves: numUnitsToRewardPromotion = ".. numUnitsToRewardPromotion)
	local tableRandomMilitaryUnitIDs = {}
	local i = 1
	DMS_Print("DMS_Eritrea_UA_GrantCombatSrengthAndMoves: starting while loop..")
	while numUnitsToRewardPromotion > 0 do
		DMS_Print("DMS_Eritrea_UA_GrantCombatSrengthAndMoves: numUnitsToRewardPromotion = ".. numUnitsToRewardPromotion)
		local randomUnit = tableMilitaryUnitIDs[JFD_GetRandom(1, #tableMilitaryUnitIDs)] -- unitID
		if randomUnit ~= nil or randomUnit ~= -1 then
			tableRandomMilitaryUnitIDs[i] = randomUnit
			DMS_Print("DMS_Eritrea_UA_GrantCombatSrengthAndMoves: adding unit = ".. i)
			i = i + 1
			numUnitsToRewardPromotion = numUnitsToRewardPromotion - 1
		end
	end
	if #tableRandomMilitaryUnitIDs == 0 then return end
	for k, unit in ipairs(tableRandomMilitaryUnitIDs) do
		--local unit = player:GetUnitByID(unitID)
		if unit ~= nil and unit ~= -1 then
			unit:SetHasPromotion(promotionStrengthFromPolicies, true)
			DMS_Print("DMS_Eritrea_UA_GrantCombatSrengthAndMoves: granting promotion to unit ".. k)
			--unit:ChangeMoves(60)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UB_ResetExtraProduction
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UB_ResetExtraProduction(city)
	if not city:IsHasBuilding(buildingCablewayStationExtraProduction) then return end
	city:SetNumRealBuilding(buildingCablewayStationExtraProduction, 0)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UB_GetCapitalProductionType
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UB_GetCapitalProductionType(capital)
	local capitalProductionType = nil
	local bUnit = capital:IsProductionUnit()
	local bBuilding = capital:IsProductionBuilding()
	if bUnit then 
		capitalProductionType = capital:GetProductionUnit()
		DMS_Print("DMS_Eritrea_UB_GetCapitalProductionType: bUnit and capitalProductionType = ".. capitalProductionType)
	elseif bBuilding then
		capitalProductionType = capital:GetProductionBuilding()
		DMS_Print("DMS_Eritrea_UB_GetCapitalProductionType: bBuilding and capitalProductionType = ".. capitalProductionType)
	end
	return bUnit, bBuilding, capitalProductionType
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UB_ExtraProductionFromCapitalProduction
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UB_ExtraProductionFromCapitalProduction(city, bUnit, bBuilding, capitalProductionType)
	DMS_Print("DMS_Eritrea_UB_ExtraProductionFromCapitalProduction: city = " .. city:GetName())
	local cityProductionType = nil
	if bUnit and city:IsProductionUnit() then
		cityProductionType = city:GetProductionUnit()
		DMS_Print("DMS_Eritrea_UB_ExtraProductionFromCapitalProduction: bUnit")
	elseif bBuilding and city:IsProductionBuilding() then
		cityProductionType = city:GetProductionBuilding()
		DMS_Print("DMS_Eritrea_UB_ExtraProductionFromCapitalProduction: bBuilding")
	end
	if cityProductionType == nil or cityProductionType == -1 then return end
	if cityProductionType ~= capitalProductionType then return end
	city:SetNumRealBuilding(buildingCablewayStationExtraProduction, 1)
	DMS_Print("DMS_Eritrea_UB_ExtraProductionFromCapitalProduction: added 1 buildingCablewayStationExtraProduction")
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UU_FlankingBonusReset
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UU_FlankingBonusReset(unit)
	if not unit:IsHasPromotion(promotionAskariCavalry) then return end
	for i = 1, 20 do
		unit:SetHasPromotion(tablePromotionFlankingBonus[i], false)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UU_CountConnectedCities
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UU_CountConnectedCities(player, city)
	if not player:IsCapitalConnectedToCity(city) then return 0 end
	DMS_Print("DMS_Eritrea_UU_CountConnectedCities: " .. city:GetName() .. " is connected..")
	return 1
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UU_FlankingBonusFromConnectedCities
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UU_FlankingBonusFromConnectedCities(unit, numConnectedCities)
	if unit:GetUnitType() ~= unitPenneDiFalco then return end
	numConnectedCities = mathMin(numConnectedCities, 20)
	DMS_Print("DMS_Eritrea_UU_FlankingBonusFromConnectedCities: numConnectedCities = " .. numConnectedCities)
	unit:SetHasPromotion(tablePromotionFlankingBonus[numConnectedCities], true)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UA_GetTotalProduction
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UA_GetTotalProduction(city, totalProduction)
	local cityProduction = city:GetProduction()
	if cityProduction == nil or cityProduction == -1 then return end
	DMS_Print("DMS_Eritrea_UA_GetTotalProduction: city = " .. city:GetName() .. ", cityProduction = " .. cityProduction)
	return totalProduction + cityProduction
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UA_GetMeanProduction
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UA_GetMeanProduction(player, totalProduction)
	DMS_Print("DMS_Eritrea_UA_GetMeanProduction: meanProduction = " .. mathCeil(totalProduction / player:GetNumCities()))
	return mathCeil(totalProduction / player:GetNumCities())
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UA_CultureFromMeanProduction
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UA_CultureFromMeanProduction(player, meanProduction)
	player:ChangeJONSCulture(mathMin(50, meanProduction))
	DMS_Print("DMS_Eritrea_UA_CultureFromMeanProduction: mathMin(50, meanProduction) = " .. mathMin(50, meanProduction))
	if not player:IsHuman() then return end
	Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]+" .. mathMin(50, meanProduction) .. "[ENDCOLOR] [ICON_CULTURE] Culture from [ICON_PRODUCTION] Production!");
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UU_ProductionFromGarrison
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UU_ProductionFromGarrison(city)
	local garrisonedUnit = city:GetGarrisonedUnit()
	if garrisonedUnit ~= nil and garrisonedUnit ~= -1 then
		if garrisonedUnit:IsHasPromotion(promotionAskariCavalry) then
			if not city:IsHasBuilding(buildingAskariExtraProduction) then
				city:SetNumRealBuilding(buildingAskariExtraProduction, 1)
				DMS_Print("DMS_Eritrea_UU_ProductionFromGarrison: added 1 buildingAskariExtraProduction")
			end
		else
			if city:IsHasBuilding(buildingAskariExtraProduction) then
				city:SetNumRealBuilding(buildingAskariExtraProduction, 0)
				DMS_Print("DMS_Eritrea_UU_ProductionFromGarrison: removed 1 buildingAskariExtraProduction")
			end
		end
	else
		if city:IsHasBuilding(buildingAskariExtraProduction) then
			city:SetNumRealBuilding(buildingAskariExtraProduction, 0)
			DMS_Print("DMS_Eritrea_UU_ProductionFromGarrison: removed 1 buildingAskariExtraProduction")
		end
	end
end
--==========================================================================================================================
-- MAIN FUNCTIONS
--==========================================================================================================================
-- DMS_Eritrea_PlayerDoTurn
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	if not HasTrait(player, traitGedli) then return end
	local turn = Game.GetGameTurn()
	DMS_Print(stringFormat("DMS_Eritrea_PlayerDoTurn: playerID: %i, turn: %i", playerID, turn))
	local capital = player:GetCapitalCity()
	if capital == nil or capital == -1 then return end
	local bUnit, bBuilding, capitalProductionType = DMS_Eritrea_UB_GetCapitalProductionType(capital)
	local numConnectedCities = 0
	for city in player:Cities() do
		DMS_Eritrea_UB_ResetExtraProduction(city)
		if not city:IsCapital() then
			DMS_Eritrea_UB_ExtraProductionFromCapitalProduction(city, bUnit, bBuilding, capitalProductionType)
		end
		numConnectedCities = numConnectedCities + DMS_Eritrea_UU_CountConnectedCities(player, city)
	end
	if numConnectedCities == 0 then return end
	for unit in player:Units() do
		DMS_Eritrea_UA_ResetCombatStrengthFromPolicies(unit)
		DMS_Eritrea_UU_FlankingBonusFromConnectedCities(unit, numConnectedCities)
	end
	local numPoliciesAdopted = DMS_Eritrea_UA_GetNumPoliciesAdopted(player)
	local tableMilitaryUnitIDs = DMS_Eritrea_UA_GetMilitaryUnitIDsInTable(player)
	DMS_Eritrea_UA_GrantCombatSrengthAndMoves(player, numPoliciesAdopted, tableMilitaryUnitIDs)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_CityTrained
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_CityTrained(playerID, cityID, unitID, bGold, bFaithOrCulture)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	if not HasTrait(player, traitGedli) then return end
	local city = player:GetCityByID(cityID)
	if city == nil or city == -1 then return end
	local unit = player:GetUnitByID(unitID)
	if unit == nil or unit == -1 then return end
	if unit:GetDomainType() ~= domainLand then return end
	local turn = Game.GetGameTurn()
	DMS_Print("DMS_Eritrea_CityTrained: playerID: " .. playerID .. ", turn: " .. turn .. ", city: " .. city:GetName() .. "..")
	local totalProduction = 0
	for city in player:Cities() do
		totalProduction = DMS_Eritrea_UA_GetTotalProduction(city, totalProduction)
	end
	local meanProduction = DMS_Eritrea_UA_GetMeanProduction(player, totalProduction)
	if meanProduction == 0 then return end
	DMS_Eritrea_UA_CultureFromMeanProduction(player, meanProduction)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_UnitSetXY
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Eritrea_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	local unit = player:GetUnitByID(unitID)
	if unit == nil or unit == -1 then return end
	--local plot = Map.GetPlot(unitX, unitY)
	--if plot == nil or plot == -1 then return end
	for city in player:Cities() do
		DMS_Eritrea_UU_ProductionFromGarrison(city)
	end
end
--==========================================================================================================================
-- GAMEEVENTS
--==========================================================================================================================
PlayerDoTurn(DMS_Eritrea_PlayerDoTurn)
CityTrained(DMS_Eritrea_CityTrained)
UnitSetXY(DMS_Eritrea_UnitSetXY)
--==========================================================================================================================
--==========================================================================================================================