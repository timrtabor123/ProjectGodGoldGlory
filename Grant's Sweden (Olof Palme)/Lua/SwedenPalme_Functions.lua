-- Sweden_Palme_Functions
-- Author: grant
-- DateCreated: 3/14/2019 5:47:29 PM
--------------------------------------------------------------
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
include("AdditionalAchievementsUtility.lua")
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
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- LOCALS
--==========================================================================================================================
local civilizationID 			= GameInfoTypes["CIVILIZATION_GT_SWEDEN_PALME"]
local traitPalmeID				= GameInfoTypes["TRAIT_GT_SWEDEN_PALME"]
local unitUbatsjagareID			= GameInfoTypes["UNIT_GT_UBATSJAGARE"]
local buildingAgestaID			= GameInfoTypes["BUILDING_GT_AGESTA"]
local IsPalmeActive				= JFD_IsCivilisationActive(civilizationID)
local IsPalmeActivePlayer		= activePlayer:GetCivilizationType() == civilizationID
-------------------------------------------------------------------------------------------------------------------------
local buildingKallarModsID 		= GameInfoTypes["BUILDING_GT_KALLAR_MODS"]
-------------------------------------------------------------------------------------------------------------------------
local buildingAgestaProductionID	= GameInfoTypes["BUILDING_GT_SWEDEN_PALME"]
local buildingAgestaFoodID			= GameInfoTypes["BUILDING_GT_AGESTA_FOOD"]
local buildingAgestaScienceID		= GameInfoTypes["BUILDING_GT_AGESTA_SCIENCE"]
-------------------------------------------------------------------------------------------------------------------------
local promotionUbatsjagareHealID				= GameInfoTypes["PROMOTION_GT_UBATSJAGARE_HEAL"]
local promotionUbatsjagareFocusFoodID			= GameInfoTypes["PROMOTION_GT_UBATSJAGARE_FOCUS_FOOD"]
local promotionUbatsjagareFocusGoldID			= GameInfoTypes["PROMOTION_GT_UBATSJAGARE_FOCUS_GOLD"]
local promotionUbatsjagareFocusProductionID		= GameInfoTypes["PROMOTION_GT_UBATSJAGARE_FOCUS_PRODUCTION"]
local promotionUbatsjagareFocusCultureID		= GameInfoTypes["PROMOTION_GT_UBATSJAGARE_FOCUS_CULTURE"]
local promotionUbatsjagareCaptureID 			= GameInfoTypes["PROMOTION_PRIZE_SHIPS"]
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-------------------------
-- DOM KALLAR OSS MODS --
-------------------------
--Denouncing civilizations with a different starting policy tree or ideology increases the Local Happiness of Cities according to their Production output. 
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
function GT_DomKallarOssMods_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if HasTrait(player, traitPalmeID) then
		local numDenouncedCivs = 0
		local numDoFCivs = 0
		print("GT_DomKallarOssMods_PlayerDoTurn: Passed HasTrait")
		for i = 0, defineMaxMajorCivs - 1, 1 do
			if i and i ~= playerID then
				local otherPlayer = Players[i]
				if otherPlayer and otherPlayer:IsEverAlive() then
					print("GT_DomKallarOssMods_PlayerDoTurn: Passed otherPlayer")
					if player:GetCurrentEra() > eraRenaissanceID then
						print("GT_DomKallarOssMods_PlayerDoTurn: Passed Industrial Era")
						local otherIdeology = otherPlayer:GetLateGamePolicyTree() 
						local playerIdeology = player:GetLateGamePolicyTree()
						if otherIdeology ~= playerIdeology then
							if player:IsDenouncedPlayer(i) or otherPlayer:IsDenouncedPlayer(playerID) then
								print("GT_DomKallarOssMods_PlayerDoTurn: Passed Denunciation Check")
								numDenouncedCivs = numDenouncedCivs + 1
							end
						else	
							if player:IsDoF(i) or otherPlayer:IsDof(playerID) then
								numDoFCivs = numDoFCivs + 1
							end
						end
					else	
						local firstPlayerBranch = player:GetBranchPicked1()
						local firstOtherBranch = otherPlayer:GetBranchPicked1()
						if firstOtherBranch ~= firstPlayerBranch then
							if player:IsDenouncedPlayer(i) or otherPlayer:IsDenouncedPlayer(playerID) then
								numDenouncedCivs = numDenouncedCivs + 1
							end
						else
							if player:IsDoF(i) or otherPlayer:IsDoF(playerID) then
								numDoFCivs = numDoFCivs + 1
							end
						end						
					end
					if numDenouncedCivs > 0 then
						print("Sweden has denounced" .. numDenouncedCivs .. "Civilizations")
						for city in player:Cities() do
							local productionOutput = city:GetProduction()
							print("GT_DomKallarOssMods_PlayerDoTurn: Passed Production Denunciation check")
							city:SetNumRealBuilding(buildingKallarModsID, g_MathMin(productionOutput/10))
							if player:IsHuman() then
								local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
								Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_HAPPINESS_1]", g_MathMin(productionOutput/10)), true)
							end	
						end					
					end
					if numDoFCivs > 0 then
						print("Sweden has befriended" .. numDoFCivs .. "Civilizations")
						for city in player:Cities() do
							local happiness = (player:GetExcessHappiness()/2)
							local playerTeam = Teams[player:GetTeam()]
							local playerTeamTech = playerTeam:GetTeamTechs()
							print("GT_DomKallarOssMods_PlayerDoTurn: Passed Science Friendship check")
							playerTeamTech:ChangeResearchProgress(happiness * numDoFCivs)
							if player:IsHuman() then
								local city = player:GetCapitalCity()
								local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
								Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", (happiness/2) * numDoFCivs), true)
							end
						end
					end
				end		
			end
		end
	end
end 
GameEvents.PlayerDoTurn.Add(GT_DomKallarOssMods_PlayerDoTurn)
-----------------
-- UBATSJAGARE --
-----------------	
--Gains a unique promotion based on the Focus of the city it is trained in, and heals per the nearest city's local Happiness. 
function GT_Ubatsjagare_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local city = player:GetCityByID(cityID)
	if HasTrait(player, traitPalmeID) then
		if unit:GetUnitType() == unitUbatsjagareID then
			local focusType = city:GetFocusType()
			print("setting promotion for" .. focusType .. "")
			if focusType == 0 then
				unit:SetHasPromotion(promotionUbatsjagareFocusFoodID, true)
			elseif focusType == 2 or focusType == 7 then
				unit:SetHasPromotion(promotionUbatsjagareFocusGoldID, true)
			elseif focusType == 5 or focusType == 3 then
				unit:SetHasPromotion(promotionUbatsjagareFocusCultureID, true)
			elseif focusType == 1 or focusType == 6 then
				unit:SetHasPromotion(promotionUbatsjagareFocusProductionID, true)
			elseif focusType == 4 then
				unit:SetHasPromotion(promotionUbatsjagareFocusScienceID, true)
			end
		end
	end
end
GameEvents.CityTrained.Add(GT_Ubatsjagare_CityTrained)

function GT_Ubatsjagare_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = Map.GetPlot(unitX, unitY)
	if HasTrait(player, traitPalmeID) then
		if unit:GetUnitType() == unitUbatsjagareID then
			if not plot:GetOwner() ~= playerID then
				unit:SetHasPromotion(promotionUbatsjagareCaptureID, false)
			else
				unit:SetHasPromotion(promotionUbatsjagareCaptureID, true)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_Ubatsjagare_UnitSetXY)

function GT_Ubatsjagare_Promotions_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local hasCapturedSub = false
	local hasUbatsjagare = false
	if HasTrait(player, traitPalmeID) then
		for capturedUnit in player:Units() do
			if capturedUnit:GetUnitType() == unitSubmarineID or  capturedUnit:GetUnitType() == unitNuclearSubmarineID then
				if capturedUnit:GetOriginalOwner() ~= playerID then
					hasCapturedSub = true
					break
				end
			end
		end
		if hasCapturedSub then
			for unit in player:Units() do
				if unit:GetUnitType() == unitUbatsjagareID then
					hasUbatsjagare = true
					if unit:IsHasPromotion(promotionUbatsjagareFocusFoodID) then
						player:ChangeFood(5)
						if player:IsHuman() then
							local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_FOOD]", 5), true)
						end	
					elseif unit:IsHasPromotion(promotionUbatsjagareFocusGoldID) then
						player:ChangeGold(15)
						if player:IsHuman() then
							local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_GOLD]", 15), true)
						end	
					elseif unit:IsHasPromotion(promotionUbatsjagareFocusScienceID) then
						local playerTeam = Teams[player:GetTeam()]
						local playerTeamTech = playerTeam:GetTeamTechs()
						playerTeamTech:ChangeResearchProgress(15)
						if player:IsHuman() then
							local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", 15), true)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Ubatsjagare_Promotions_PlayerDoTurn)

function GT_Ubatsjagare_Promotions_SerialEventUnitSetDamage(playerID, unitID, newDamage, oldDamage)
	if newDamage > oldDamage then
		local player = Players[playerID]
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == unitUbatsjagareID then
			local plot = unit:GetPlot()
			if plot:GetOwner() == -1 then
				if unit:IsHasPromotion(promotionUbatsjagareFocusProductionID) then
					local nearestCity = GetNearestCity(player, plot)
					local distance = g_MapGetDistance(nearestCity:GetX(), nearestCity:GetY(), plot:GetX(), plot:GetY())
					nearestCity:ChangeProduction()
					if player:IsHuman() then
						local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
						Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", distance), true)
					end
				end
			elseif plot:GetOwner() == playerID then
				if plot:IsCoastal() then
					if unit:IsHasPromotion(promotionUbatsjagareFocusCultureID) then
						player:ChangeJONSCulture(25)
						if player:IsHuman() then
							local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", 25), true)
						end
					end
				end
			end
		end
	end
	return
end
GameEvents.SerialEventUnitSetDamage.Add(GT_Ubatsjagare_Promotions_SerialEventUnitSetDamage)

function GT_Ubatsjagare_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if HasTrait(player, traitPalmeID) then
		for city in player:Cities() do
			for ID = 0, city:GetNumCityPlots()-1, 1 do
			local plot = city:GetCityIndexPlot(ID)
				local unit = plot:GetUnit()
				if unit and unit:GetUnitType() == unitUbatsjagareID then
					if unit:IsHurt() then
						local localHappiness = city:GetLocalHappiness()
						unit:ChangeDamage(-localHappiness)
						if player:IsHuman() then
							local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
							Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_HAPPINESS_1]", localHappiness), true)
						end	
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Ubatsjagare_PlayerDoTurn)
------------
-- AGESTA --
------------
--New buildings begin with +1 of their [ICON_RESEARCH] Science and [ICON_FOOD] Food yields.
local scienceBuildings = {}
for buildingsRow in DB.Query("SELECT ID FROM Buildings WHERE NOT (Type = 'BUILDING_PALACE' OR Type = 'BUILDING_OXFORD_UNIVERSITY' OR Type = 'BUILDING_GREAT_LIBRARY') AND Type IN (SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_SCIENCE' UNION SELECT BuildingType FROM Building_YieldChangesPerPop WHERE YieldType = 'YIELD_SCIENCE' UNION SELECT BuildingType FROM Building_YieldModifiers WHERE YieldType = 'YIELD_SCIENCE') ") do
	scienceBuildings[buildingsRow.ID] = 1
end

local foodBuildings = {}
for buildingsRow in DB.Query("SELECT ID FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_FOOD' UNION SELECT BuildingType FROM Building_YieldChangesPerPop WHERE YieldType = 'YIELD_FOOD' UNION SELECT BuildingType FROM Building_YieldModifiers WHERE YieldType = 'YIELD_FOOD') ") do
	foodBuildings[buildingsRow.ID] = 1
end

function GT_Agesta_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if HasTrait(player, traitPalmeID) then
		if city:IsHasBuilding(buildingAgestaID) then
			if foodBuildings[buildingID] then
				local numAgestaFoods = city:GetNumRealBuilding(buildingAgestaFoodID)
				city:SetNumRealBuilding(buildingAgestaFoodID, (numAgestaFoods + 1))
			elseif scienceBuildings[buildingID] then
				local numAgestaSciences = city:GetNumRealBuilding(buildingAgestaScienceID)
				city:SetNumRealBuilding(buildingAgestaScienceID, (numAgestaSciences + 1))
			end
		end
	end
end
GameEvents.CityConstructed.Add(GT_Agesta_CityConstructed)

function GT_Agesta_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local agestaProduction = 0
	if HasTrait(player, traitPalmeID) then
		local playerTeam = Teams[player:GetTeam()]
		for i = 0, defineMaxMajorCivs - 1, 1 do
			if i and i ~= playerID then
				local otherPlayer = Players[i]
				local otherTeam = Teams[otherPlayer:GetTeam()]
				if playerTeam:IsHasResearchAgreement(otherTeam) then
					agestaProduction = agestaProduction + 1
				end
				if playerTeam:IsHasTradeAgreement(otherTeam) then
					agestaProduction = agestaProduction + 1
				end
				if playerTeam:IsDefensivePact(otherTeam) then
					agestaProduction = agestaProduction + 1
				end
			end
		end
		if agestaProduction > 0 then
			for city in player:Cities() do
				if city:IsHasBuilding(buildingAgestaID) then
					city:SetNumRealBuilding(buildingAgestaProductionID, agestaProduction)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Agesta_PlayerDoTurn)
----------
-- MCIS --
----------
g_Sweden_Palme_MCIS_TipControls = {}
TTManager:GetTypeControlTable("Sweden_Palme_MCIS_Tooltip", g_Sweden_Palme_MCIS_TipControls)
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "Sweden_Palme_MCIS", ["SortOrder"] = 1})
end
if IsPalmeActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
function CityInfoStackDirty(key, instance)
	if key ~= "Sweden_Palme_MCIS" then return end
	ProcessCityScreen(instance)
end
if IsPalmeActivePlayer then
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
	instance.IconFrame:SetToolTipType("Sweden_Palme_MCIS_Tooltip")
	IconHookup(3, 64, "GT_SWEDEN_PALME_ATLAS", instance.IconImage)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_AGESTA")) .. "[ENDCOLOR]" -- Header
	local textHelp = Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_AGESTA_TOOLTIP") -- Text
	g_Sweden_Palme_MCIS_TipControls.Heading:SetText(textDescription)
	g_Sweden_Palme_MCIS_TipControls.Body:SetText(textHelp)
	g_Sweden_Palme_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end		
--==========================================================================================================================			
--==========================================================================================================================