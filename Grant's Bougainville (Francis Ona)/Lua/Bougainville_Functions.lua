-- Dumnonii_Functions
-- Author: User
-- DateCreated: 4/4/2019 6:06:16 PM
--------------------------------------------------------------
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
include("AdditionalAchievementsUtility.lua")
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "gt_Bougainville";
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetDistance	= Map.GetDistance
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if g_IsCPActive then 
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
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilisationID)
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

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-- GT_GetUserSetting
function GT_GetUserSetting(type)
	for row in GameInfo.GT_Bougainville_UserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end

-- GT_Print
local printForDebugOna = GT_GetUserSetting("GT_BOUGAINVILLE_DEBUGGING_ON") == 1
function BougainvillePrint(string)
	if (not printForDebugOna) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- GetNearestCity
----------------------------------------------------------------------------------------------------------------------------
function GetNearestCity(player, plot)
    local distance = 9999
    for city in player:Cities() do
        local cityPlot = city:Plot()
        local between = Map.PlotDistance(cityPlot:GetX(), cityPlot:GetY(), plot:GetX(), plot:GetY())
        if between < distance then
            distance = between
            closest = city
        end
    end
    return closest
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--Game_IsAAActive
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
local civilizationID						= GameInfoTypes["CIVILIZATION_GT_BOUGAINVILLE"]
local traitBoogieID							= GameInfoTypes["TRAIT_GT_COCONUT_REVOLUTION"]
local unitMeekemauiID						= GameInfoTypes["UNIT_GT_MEKEMAUI_DEFENCE_FORCE"]
local buildingUVistractID					= GameInfoTypes["BUILDING_GT_U_VISTRACT"]
local isBougainvilleActivePlayer 			= activePlayer:GetCivilizationType() == civilizationID
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
--[BRACKETS IF WORKS]
-------------------------
-- COCONUT REVOLUTION --
------------------------
local improvementMineID = GameInfoTypes["IMPROVEMENT_MINE"]
local buildMineID = GameInfo.Builds["BUILD_MINE"].ID
local yieldGold = GameInfo.Yields["YIELD_GOLD"].ID
local yieldProd = GameInfo.Yields["YIELD_PRODUCTION"].ID
function GT_CoconutRevolution_WartimePDT(playerID)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	local numCities = player:GetNumCities()
	local goldYield = 0
	local prodYield = 0
	local prodCSYield = 0
	local goldCSYield = 0
	if not HasTrait(player, traitBoogieID) then return end
	BougainvillePrint("GT_CoconutRevolution_WartimePDT: bougainville has" .. numCities .. "cities")
	if not Teams[player:GetTeam()]:GetAtWarCount(false) > 0 then return end
	BougainvillePrint("GT_CoconutRevolution_WartimePDT: bougainville at war")
	for ID = 0, defineMaxMajorCivs -1, 1 do
		BougainvillePrint("GT_CoconutRevolution_WartimePDT: iterating major civs")
		local ally = Players[ID]
		if ally:IsDoF(playerID) then
			BougainvillePrint("GT_CoconutRevolution_WartimePDT: finding friends")
			local capitalPlot = capital:GetPlot()
			local nearestCity = GetNearestCity(ally, capitalPlot)
			BougainvillePrint("GT_CoconutRevolution_WartimePDT: iterating ally cities")
			for ID = 0, city:GetNumCityPlots()-1, 1 do
				BougainvillePrint("GT_CoconutRevolution_WartimePDT: iterating ally city plots")
				local plot = nearestCity:GetCityIndexPlot(ID)
				if plot:GetImprovementType() == improvementMineID then
					BougainvillePrint("GT_CoconutRevolution_WartimePDT: iterating ally city plots")
					goldYield = plot:GetYieldWithBuild(buildMineID, yieldGold, false, ID)
					prodYield = plot:GetYieldWithBuild(buildMineID, yieldProd, false, ID)
				end
			end			
		end
		player:ChangeGold(goldYield)
		local cityProd = g_MathMin(prodYield/numCities)
		BougainvillePrint("GT_CoconutRevolution_WartimePDT: adding Gold and Production from ally mines")
		for city in player:Cities() do
			city:ChangeProduction(cityProd)
		end
	end
	for ID = 0, defineMaxMinorCivs -1, 1 do
		local cityStateAlly = Players[ID]
		if cityStateAlly:GetInfluenceLevel(playerID) > 2 then
			local capital = player:GetCapitalCity()
			local cityStateCapital = cityStateAlly:GetCapitalCity()
			for ID = 0, cityStateCapital:GetNumCityPlots()-1, 1 do
				BougainvillePrint("GT_CoconutRevolution_WartimePDT: iterating city-state ally city plots")
				local plot = cityStateCapital:GetCityIndexPlot(ID)
				if plot:GetImprovementType() == improvementMineID then
					goldCSYield = plot:GetYieldWithBuild(buildMineID, yieldGold, false, ID)
					prodCSYield = plot:GetYieldWithBuild(buildMineID, yieldProd, false, ID)
				end
			end
		end
		player:ChangeGold(goldCSYield)
		local cityCSProd = g_MathMin(prodCSYield/numCities)
		for city in player:Cities() do
			city:ChangeProduction(cityCSProd)
			BougainvillePrint("GT_CoconutRevolution_WartimePDT: adding Gold and Production from CS mines")
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_CoconutRevolution_WartimePDT)

--units spawn on mines when invading happens
local promotionCoconutRevolutionariesID = GameInfoTypes["PROMOTION_GT_COCONUT_REVOLUTION"]
local promotionNoTerrainPenalties = GameInfoTypes["PROMOTION_IGNORE_TERRAIN_COST"]
local unitWarriorID = GameInfoTypes["UNIT_WARRIOR"]
local unitPikemanID = GameInfoTypes["UNIT_PIKEMAN"]
local unitInfantryID = GameInfoTypes["UNIT_INFANTRY"]
local buildingCoconutID = GameInfoTypes["BUILDING_GT_COCONUT_REVOLUTION"]
function GT_CoconutRevolution_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) or (unit:GetUnitCombatType() == -1) then return end
	local plot = unit:GetPlot()
	if plot then
		local ownerID = plot:GetOwner()
		if not (ownerID > -1) then return end
		BougainvillePrint("GT_CoconutRevolution_UnitSetXY: checking for owner")
		local owner = Players[ownerID]
		if not HasTrait(owner, traitBoogieID) then return end
		BougainvillePrint("GT_CoconutRevolution_UnitSetXY: tile owner is Bougainville")
		if not owner then return end
		if owner:IsBarbarian() then return end
		if owner:IsMinorCiv() then return end
		local capital = owner:GetCapitalCity()
		if Teams[owner:GetTeam()]:IsAtWar(player:GetTeam()) then
			BougainvillePrint("GT_CoconutRevolution_UnitSetXY: bougainville at war")
			for city in owner:Cities() do
				if city:IsHasBuilding(buildingCoconutID) then return end
				for ID = 0, city:GetNumCityPlots()-1, 1 do
					BougainvillePrint("GT_CoconutRevolution_UnitSetXY: iterating plots")
					local minedPlot = city:GetCityIndexPlot(ID)
					if minedPlot and minedPlot:GetResourceType() then
						local minerUnit = minedPlot:GetUnit()
						if (not minerUnit) or (not minerUnit:IsHasPromotion(promotionCoconutRevolutionID)) then
							if minedPlot:GetImprovementType() == improvementMineID and not minedPlot:IsImprovementPillaged() then 
								BougainvillePrint("GT_CoconutRevolution_UnitSetXY: iterating mines")
								local eraID = owner:GetCurrentEra()
								local coconutRebel = nil
								if eraID < 3 then
									BougainvillePrint("GT_CoconutRevolution_UnitSetXY: spawning classical units")
									coconutRebel = owner:InitUnit(unitWarriorID, minedPlot:GetX(), minedPlot:GetY())
									coconutRebel:SetHasPromotion(promotionCoconutRevolutionariesID, true)
									if city:GetWeLoveTheKingDayCounter() > 0 then
										coconutRebel:SetHasPromotion(promotionNoTerrainPenalties, true)
									end
								elseif eraID < 5 then
									coconutRebel = owner:InitUnit(unitPikemanID, minedPlot:GetX(), minedPlot:GetY())
									coconutRebel:SetHasPromotion(promotionCoconutRevolutionariesID, true)
									if city:GetWeLoveTheKingDayCounter() > 0 then
										coconutRebel:SetHasPromotion(promotionNoTerrainPenalties, true)
									end
								elseif eraID < 7 then 
									coconutRebel = owner:InitUnit(unitInfantryID, minedPlot:GetX(), minedPlot:GetY())
									coconutRebel:SetHasPromotion(promotionCoconutRevolutionariesID, true)
									if city:GetWeLoveTheKingDayCounter() > 0 then
										coconutRebel:SetHasPromotion(promotionNoTerrainPenalties, true)
									end									
								elseif eraID > 7 then
									coconutRebel = owner:InitUnit(unitMeekemauiID, minedPlot:GetX(), minedPlot:GetY())
									coconutRebel:SetHasPromotion(promotionCoconutRevolutionariesID, true)
									if city:GetWeLoveTheKingDayCounter() > 0 then
										coconutRebel:SetHasPromotion(promotionNoTerrainPenalties, true)
									end
								end
								BougainvillePrint("GT_CoconutRevolution_UnitSetXY: units spawned on mines")
							end
						end
					end
				end
			end
			capital:SetNumRealBuilding(buildingCoconutID, 1)
		else
			capital:SetNumRealBuilding(buildingCoconutID, 0)
		end
	end
end
GameEvents.UnitSetXY.Add(GT_CoconutRevolution_UnitSetXY)

function GT_CoconutRevolution_PlayerDoTurn(playerID)
	local player = Players[playerID]
	-- Coconut Rebels
	for ID = 0, defineMaxMajorCivs -1, 1 do
		local owner = Players[ID]
		if owner then
			BougainvillePrint("GT_CoconutRevolution_PlayerDoTurn: safe zone detected")
			if not (owner ~= player and Teams[owner:GetTeam()]:IsAtWar(player:GetTeam())) then return end
			BougainvillePrint("GT_CoconutRevolution_PlayerDoTurn: bougainville at war")
			for unit in player:Units() do
				BougainvillePrint("GT_CoconutRevolution_PlayerDoTurn: iterating units")
				local plot = unit:GetPlot()
				if plot:IsWater() then return end
				if Players[plot:GetOwner()] == owner then
					for rebelUnit in owner:Units() do
						if rebelUnit:IsHasPromotion(promotionCoconutRevolutionariesID) then
							if not rebelUnit:IsFriendlyTerritory(ID) then
								BougainvillePrint("GT_CoconutRevolution_PlayerDoTurn: rebels have gone out of their safe zone")
								if JFD_GetRandom(1, 100) > 20 then
									rebelUnit:Kill()
									BougainvillePrint("GT_CoconutRevolution_PlayerDoTurn: unit killed")
								end
							end
						end
					end
				else
					for rebelUnit in owner:Units() do
						if rebelUnit:IsHasPromotion(promotionCoconutRevolutionariesID) then
							BougainvillePrint("GT_CoconutRevolution_PlayerDoTurn: no enemies in safe zone, rebels dismissed")
							rebelUnit:Kill()
							owner:ChangeGold(owner:GetNumUnits() * 2)
							BougainvillePrint("GT_CoconutRevolution_PlayerDoTurn: gold recieved")
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_CoconutRevolution_PlayerDoTurn)
------------------------------
-- ME'EKEMAUI DEFENCE FORCE --
------------------------------
local promotionFriendlyTerritoryID = GameInfoTypes["PROMOTION_GT_MEEKEMAUI"]
local promotionLogisticsID = GameInfoTypes["PROMOTION_LOGISTICS"]
local promotionAttackingMercenaryID = GameInfoTypes["PROMOTION_GT_ATTACKING_MERCENARY"]
local promotionPurchasedWithGold = GameInfoTypes["PROMOTION_GT_PURCHASED_WITH_GOLD"]
local featureJungleID = GameInfoTypes["FEATURE_JUNGLE"]

--[WORKS]
function GT_Mekemaui_GoldPurchase_CityTrained(playerID, cityID, unitID, isGold)
	if not isGold then return end
	local player = Players[playerID]
	for ID = 0, defineMaxMajorCivs -1, 1 do
		BougainvillePrint("GT_Mekemaui_GoldPurchase_CityTrained: iterating players")
		local boogiePlayer = Players[ID]
		local boogieTeam = Teams[boogiePlayer:GetTeam()]
		if not HasTrait(boogiePlayer, traitBoogieID) then return end
		BougainvillePrint("GT_Mekemaui_GoldPurchase_CityTrained: player is Bougainville")
		if Teams[player:GetTeam()]:IsAtWarWith(boogieTeam) then
			local unit = player:GetUnitByID(unitID)
			unit:SetHasPromotion(promotionPurchasedWithGold, true)
			BougainvillePrint("GT_Mekemaui_GoldPurchase_CityTrained: unit purchased with gold")
		end
	end
end
GameEvents.CityTrained.Add(GT_Mekemaui_GoldPurchase_CityTrained)

--[WORKS]
function GT_Mekemaui_PlayerDoTurn(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		local plot = unit:GetPlot()
		BougainvillePrint("GT_Mekemaui_PlayerDoTurn: iterating units")
		--50% Defensive strength outside friendly territory.
		if plot:GetOwner() == playerID then
			if unit:GetUnitType() == unitMeekemauiID then 
				unit:SetHasPromotion(promotionFriendlyTerritoryID, true)
				BougainvillePrint("GT_Mekemaui_PlayerDoTurn: in safe zone")
			end
		else
			if unit:IsHasPromotion(promotionFriendlyTerritoryID) then
				unit:SetHasPromotion(promotionFriendlyTerritoryID, false)
				BougainvillePrint("GT_Mekemaui_PlayerDoTurn: not in safe zone")
			end
		end
		
		if unit:GetUnitType() == unitMeekemauiID then 
			BougainvillePrint("GT_Mekemaui_PlayerDoTurn: unit is mekemaui")
			for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local adjacentUnit = adjacentPlot:GetUnit()
				if adjacentUnit and adjacentUnit:GetOwner() > -1 then
					local adjacentOwner = Players[adjacentUnit:GetOwner()]
					local adjacentTeam = Teams[adjacentOwner:GetTeam()]
					if Teams[player:GetTeam()]:IsAtWar(adjacentTeam) then
						if adjacentUnit:IsHasPromotion(promotionPurchasedWithGold) then
							unit:SetHasPromotion(promotionAttackingMercenaryID, true)
							BougainvillePrint("GT_Mekemaui_PlayerDoTurn: strengthening Meekemaui")
						else
							unit:SetHasPromotion(promotionAttackingMercenaryID, false)
						end
					else
						unit:SetHasPromotion(promotionAttackingMercenaryID, false)
					end
				end
			end
		end
		
		if plot:GetFeatureType() == featureJungleID then
			if unit:GetUnitType() == unitMeekemauiID then 
				unit:SetHasPromotion(promotionLogisticsID, true)
				BougainvillePrint("GT_Mekemaui_PlayerDoTurn: Meekemaui can attack twice")
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Mekemaui_PlayerDoTurn)
----------------
-- U-VISTRACT --
----------------
local buildingUVistractTourismID = GameInfoTypes["BUILDING_GT_UVISTRACT_TOURISM"]
local buildingUVistractWLKTD = GameInfoTypes["BUILDING_GT_UVISTRACT_WLTKD"]
local unitMerchantID = GameInfoTypes["UNIT_MERCHANT"]

function GT_UVistract_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	for unit in player:Units() do
		if not unit:GetUnitType() == unitMerchantID then return end
		BougainvillePrint("GT_UVistract_UnitSetXY: merchant detected")
		for city in player:Cities() do
			local plot = unit:GetPlot()
			if not plot then return end
			local owner = Players[plot:GetOwner()]
			if owner and (owner:IsMinorCiv() or owner:IsDoF(player)) then
				BougainvillePrint("GT_UVistract_UnitSetXY: owner is CS or DoF partner")
				if city:IsHasBuilding(buildingUVistractID) then
					city:SetNumRealBuilding(buildingUVistractTourismID, 1)
					BougainvillePrint("GT_UVistract_UnitSetXY: tourism")
				end
			else
				city:SetNumRealBuilding(buildingUVistractTourismID, 0)
				BougainvillePrint("GT_UVistract_UnitSetXY: no tourism")
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_UVistract_UnitSetXY)

function GT_UVistract_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local numMinedPlot = 0
	for city in player:Cities() do
		if not city:IsHasBuilding(buildingUVistractTourismID) then return end
		BougainvillePrint("GT_UVistract_PlayerDoTurn: city has tourism dummy")
		for ID = 0, city:GetNumCityPlots()-1, 1 do
			BougainvillePrint("GT_UVistract_PlayerDoTurn: iterating plots")
			local minedPlot = city:GetCityIndexPlot(ID)
			if minedPlot:IsBeingWorked() then	
				numMinedPlot = numMinedPlot + 1
			end
		end
		local tourism = (city:GetBaseTourism()/numMinedPlot)
		BougainvillePrint("GT_UVistract_PlayerDoTurn: city has tourism")
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(minedPlot:GetX(), minedPlot:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[ICON_TOURISM] [COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_MOVES] [ICON_CULTURE]", tourism), true)
		end
		city:ChangeJONSCultureStored(tourism)
		BougainvillePrint("GT_UVistract_PlayerDoTurn: tourism converted 2 culture")
		local WLTKDCount = city:GetWeLoveTheKingDayCounter()
		if (WLTKDCount > 0 and not city:IsHasBuilding(buildingUVistractWLKTD)) then
			city:ChangeWeLoveTheKingDayCounter(WLTKDCount * 2)
			city:SetNumRealBuilding(buildingUVistractWLKTD, 1)
			BougainvillePrint("GT_UVistract_PlayerDoTurn: WLTKD doubled")
		elseif WLTKDCount > 1 then
			city:SetNumRealBuilding(buildingUVistractWLKTD, 0)
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_UVistract_PlayerDoTurn)
----------
-- MCIS --
----------
g_Bougainville_MCIS_TipControls = {}
TTManager:GetTypeControlTable("Bougainville_MCIS_Tooltip", g_Bougainville_MCIS_TipControls)
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "Bougainville_MCIS", ["SortOrder"] = 1})
end
if isBougainvilleActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
function CityInfoStackDirty(key, instance)
	if key ~= "Bougainville_MCIS" then return end
	ProcessCityScreen(instance)
end
if isBougainvilleActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
----------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	print("city == true")
	instance.IconFrame:SetToolTipType("Bougainville_MCIS_Tooltip")
	IconHookup(3, 64, "GT_BOUGAINVILLE_ATLAS", instance.IconImage)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_U_VISTRACT")) .. "[ENDCOLOR]" -- Header
	local textHelp = Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_U_VISTRACT_TOOLTIP") -- Text
	g_Bougainville_MCIS_TipControls.Heading:SetText(textDescription)
	g_Bougainville_MCIS_TipControls.Body:SetText(textHelp)
	g_Bougainville_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end		
--==========================================================================================================================			
--==========================================================================================================================
	