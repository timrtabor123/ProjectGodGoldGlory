-- JFD_Civs_EnglandHenryVIII_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--include("PlotIterators.lua")
include("UniqueDiplomacyUtilsV2.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
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
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--=======================================================================================================================
-- DIPLOMACY FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
--JFD_EnglandHenryVIII_SequenceGameInitComplete
local leaderEnglandElizabethIID = GameInfoTypes["LEADER_ELIZABETH"]
local leaderEnglandHenryVID = GameInfoTypes["LEADER_JFD_ENGLAND_HENRY_V"]
local leaderHabsburgsCharlesVID = GameInfoTypes["LEADER_JFD_HABSBURGS_CHARLES_V"]
local function JFD_EnglandHenryVIII_SequenceGameInitComplete()
	for playerID = 0, defineMaxMajorCivs - 1, 1 do
        local player = Players[playerID]
		local leaderID = player:GetLeaderType()
		if (player:IsAlive() and playerID == Game.GetActivePlayer() and leaderID == leaderEnglandElizabethIID) then
			ChangeDiplomacyResponse("LEADER_JFD_ENGLAND_HENRY_VIII", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_ELIZABETH_FIRSTGREETING_1", 500)
			ChangeDiplomacyResponse("LEADER_JFD_ENGLAND_HENRY_VIII", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DEFEATED%", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_ELIZABETH_DEFEATED_1", 500)
			break
		elseif (player:IsAlive() and playerID == Game.GetActivePlayer() and leaderID == leaderEnglandHenryVID) then
			ChangeDiplomacyResponse("LEADER_JFD_ENGLAND_HENRY_VIII", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_HENRY_V_FIRSTGREETING_1", 500)
			ChangeDiplomacyResponse("LEADER_JFD_ENGLAND_HENRY_VIII", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DEFEATED%", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_HENRY_V_DEFEATED_1", 500)
			break
		elseif (player:IsAlive() and playerID == Game.GetActivePlayer() and leaderID == leaderHabsburgsCharlesVID) then
			ChangeDiplomacyResponse("LEADER_JFD_ENGLAND_HENRY_VIII", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_CHARLES_V_FIRSTGREETING_1", 500)
			ChangeDiplomacyResponse("LEADER_JFD_ENGLAND_HENRY_VIII", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DEFEATED%", "TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_CHARLES_V_DEFEATED_1", 500)
			break
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_EnglandHenryVIII_SequenceGameInitComplete)
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingDummyEnglandHenryVIIIID = GameInfoTypes["BUILDING_DUMMY_JFD_ENGLAND_HENRY_VIII"]
local buildingJoustingGroundsID  = GameInfoTypes["BUILDING_JFD_JOUSTING_GROUNDS"]

local defineWLTKDTurns = GameDefines["CITY_RESOURCE_WLTKD_TURNS"]

local traitEnglandHenryVIIIID = GameInfoTypes["TRAIT_JFD_ENGLAND_HENRY_VIII"]

local unitGrandCarrackID = GameInfoTypes["UNIT_JFD_GRAND_CARRACK"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_EnglandHenryV_PlayerDoTurn
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions;") do 	
	g_Religions_Table[g_Religions_Count] = row.ID
	g_Religions_Count = g_Religions_Count + 1
end
local function JFD_EnglandHenryV_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitEnglandHenryVIIIID)) then return end
	
	local mainReligionID = player:GetReligionCreatedByPlayer()
	if Player.HasStateReligion then
		if mainReligionID == -1 then
			mainReligionID = player:GetStateReligion()
		end
	end
	if mainReligionID == -1 then
		mainReligionID = player:GetCapitalCity():GetReligiousMajority() 
	end

	for city in player:Cities() do
		city:SetNumRealBuilding(buildingDummyEnglandHenryVIIIID, 0)
		if city:GetWeLoveTheKingDayCounter() > 0 then
			if mainReligionID > 0 then
				--g_Religions_Table
				local religionsTable = g_Religions_Table
				local numReligions = #religionsTable
				for index = 1, numReligions do
					local otherReligionID = religionsTable[index]
					if otherReligionID ~= mainReligionID then
						if city:IsReligionInCity(otherReligionID) then
							city:ConvertPercentFollowers(mainReligionID, otherReligionID, 100) 
						end
					end
				end
				city:ConvertPercentFollowers(mainReligionID, -1, 100) 
			end			
			city:SetNumRealBuilding(buildingDummyEnglandHenryVIIIID, 1)
		end			
	end
end
GameEvents.PlayerDoTurn.Add(JFD_EnglandHenryV_PlayerDoTurn)
-------------------------------------------------------------------------------------------------------------------------
--JFD_EnglandHenryVIII_CityBeginsWLTKD
local function JFD_EnglandHenryVIII_CityBeginsWLTKD(playerID, plotX, plotY, turns)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitEnglandHenryVIIIID)) then return end
	city:SetNumRealBuilding(buildingDummyEnglandHenryVIIIID, 1)
end
GameEvents.CityBeginsWLTKD.Add(JFD_EnglandHenryVIII_CityBeginsWLTKD)
-------------------------------------------------------------------------------------------------------------------------
--JFD_EnglandHenryVIII_CityEndsWLTKD
local function JFD_EnglandHenryVIII_CityEndsWLTKD(playerID, plotX, plotY, turns)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then return end
	
	--UNIQUE TRAIT
	city:SetNumRealBuilding(buildingDummyEnglandHenryVIIIID, 0)
end
GameEvents.CityEndsWLTKD.Add(JFD_EnglandHenryVIII_CityEndsWLTKD)
-------------------------------------------------------------------------------------------------------------------------
--JFD_EnglandHenryVIII_CityCaptureComplete
local function JFD_EnglandHenryVIII_CityCaptureComplete(oldOwnerID, isCapital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitEnglandHenryVIIIID)) then return end
	if (not isCapital) then return end

	for city in player:Cities() do
		local numWLTKD = city:GetWeLoveTheKingDayCounter()
		local numWLTKDTurns = (defineWLTKDTurns-numWLTKD)
		if numWLTKDTurns > 0 then
			city:ChangeWeLoveTheKingDayCounter(numWLTKDTurns)
			city:SetNumRealBuilding(buildingDummyEnglandHenryVIIIID, 1)
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFD_EnglandHenryVIII_CityCaptureComplete)
-------------------------------------------------------------------------------------------------------------------------
--JFD_EnglandHenryVIII_PlayerAdoptPolicy
local function JFD_EnglandHenryVIII_PlayerAdoptPolicy(playerID, policyID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitEnglandHenryVIIIID)) then return end
	local policy = GameInfo.Policies[policyID]
	local policyBranchType = policy.PolicyBranchType
	local policyBranchFinisher = GameInfo.PolicyBranchTypes[policyBranchType].FreeFinishingPolicy
	local policyBranchFinisherID = GameInfoTypes[policyBranchFinisher]
	if (not player:HasPolicy(policyBranchFinisherID)) then return end
	for city in player:Cities() do
		local numWLTKD = city:GetWeLoveTheKingDayCounter()
		local numWLTKDTurns = (defineWLTKDTurns-numWLTKD)
		if numWLTKDTurns > 0 then
			city:ChangeWeLoveTheKingDayCounter(numWLTKDTurns)
			city:SetNumRealBuilding(buildingDummyEnglandHenryVIIIID, 1)
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFD_EnglandHenryVIII_PlayerAdoptPolicy)
-------------------------------------------------------------------------------------------------------------------------
--JFD_EnglandHenryVIII_CityTrained
local unitCombatMountedID = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local function JFD_EnglandHenryVIII_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	local city = player:GetCityByID(cityID) 
	local unit = player:GetUnitByID(unitID)
	
	--UNIQUE BUILDING
	if unit:GetUnitCombatType() == unitCombatMountedID then 
		if city:IsHasBuilding(buildingJoustingGroundsID) then
			local numCulture = unit:GetExperience()
			player:ChangeJONSCulture(numCulture)
			if player:IsHuman() and player:IsTurnActive() then
				local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_MAGENTA]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", numCulture), true)
			end
		end
	end
	
	--UNIQUE UNIT
	if unit:GetUnitType() == unitGrandCarrackID then
		for city in player:Cities() do
			if city:GetResistanceTurns() > 0 then
				city:ChangeResistanceTurns(-2)
			end
		end	
	end
end
GameEvents.CityTrained.Add(JFD_EnglandHenryVIII_CityTrained)
--=======================================================================================================================
--=======================================================================================================================