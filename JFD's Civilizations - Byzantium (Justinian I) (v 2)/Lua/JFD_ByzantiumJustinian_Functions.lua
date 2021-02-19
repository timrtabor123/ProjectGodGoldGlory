-- JFD_ByzantiumJustinian_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("UniqueDiplomacyUtils.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()

--HasTrait
function HasTrait(player, traitID)
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
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingMiscBuildingSounds = JFD_GetUserSetting("JFDLC_MISC_CIV_BUILDING_SOUNDS") == 1
local userSettingRTPClaimsCore		= JFD_GetUserSetting("JFD_RTP_CLAIMS_CORE") == 1
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
local civilizationByzantiumID		 = GameInfoTypes["CIVILIZATION_BYZANTIUM"]
local civilizationByzantiumAlexiosID = GameInfoTypes["CIVILIZATION_JFD_BYZANTIUM_ALEXIOS"]
local civilizationPersiaID			 = GameInfoTypes["CIVILIZATION_PERSIA"]
--JFD_ByzantiumJustinian_SequenceGameInitComplete
function JFD_ByzantiumJustinian_SequenceGameInitComplete()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman() and player:IsTurnActive()) then
			local civilizationID = player:GetCivilizationType()
			if civilizationID == civilizationByzantiumID then
				ChangeDiplomacyResponse("LEADER_JFD_JUSTINIAN", "RESPONSE_FIRST_GREETING",  "TXT_KEY_LEADER_JFD_JUSTINIAN_FIRSTGREETING%",	"TXT_KEY_LEADER_JFD_JUSTINIAN_THEODORA_FIRSTGREETING_1",	500)
				ChangeDiplomacyResponse("LEADER_JFD_JUSTINIAN", "RESPONSE_DEFEAT",			"TXT_KEY_LEADER_JFD_JUSTINIAN_DEFEAT%",			"TXT_KEY_LEADER_JFD_JUSTINIAN_THEODORA_DEFEATED_1",			500)
				break
			elseif civilizationID == civilizationByzantiumAlexiosID then
				ChangeDiplomacyResponse("LEADER_JFD_JUSTINIAN", "RESPONSE_FIRST_GREETING",  "TXT_KEY_LEADER_JFD_JUSTINIAN_FIRSTGREETING%",	"TXT_KEY_LEADER_JFD_JUSTINIAN_ALEXIOS_FIRSTGREETING_1",		500)
				ChangeDiplomacyResponse("LEADER_JFD_JUSTINIAN", "RESPONSE_DEFEAT",			"TXT_KEY_LEADER_JFD_JUSTINIAN_DEFEAT%",			"TXT_KEY_LEADER_JFD_JUSTINIAN_ALEXIOS_DEFEATED_1",			500)
				break
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_ByzantiumJustinian_SequenceGameInitComplete)
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local g_BuildingID				= nil
local g_CitySelectedID			= nil
local g_PlayerID				= nil

local traitByzantiumJustinianID = GameInfoTypes["TRAIT_JFD_BYZANTIUM_JUSTINIAN"]
----------------------------------------------------------------------------------------------------------------------------
-- RENOVATIO IMPERII
----------------------------------------------------------------------------------------------------------------------------
local buildingByzantiumBarracksID	= GameInfoTypes["BUILDING_JFD_BYZANTIUM_JUSTINIAN_BARRACKS"]
local buildingByzantiumCourthouseID = GameInfoTypes["BUILDING_JFD_BYZANTIUM_JUSTINIAN_COURTHOUSE"]
local buildingByzantiumTempleID		= GameInfoTypes["BUILDING_JFD_BYZANTIUM_JUSTINIAN_TEMPLE"]
local buildingBarracksID			= GameInfoTypes["BUILDING_BARRACKS"]
local buildingCourthouseID			= GameInfoTypes["BUILDING_COURTHOUSE"]
local buildingTempleID				= GameInfoTypes["BUILDING_TEMPLE"]
local techBarracksType				= GameInfo.Buildings["BUILDING_BARRACKS"].PrereqTech
local techBarracksID				= GameInfoTypes[techBarracksType]
local techCourthouseType			= GameInfo.Buildings["BUILDING_COURTHOUSE"].PrereqTech
local techCourthouseID				= GameInfoTypes[techCourthouseType]
local techTempleType				= GameInfo.Buildings["BUILDING_TEMPLE"].PrereqTech
local techTempleID					= GameInfoTypes[techTempleType]
--Decision
local policyCodeOfJustinianID		= GameInfoTypes["POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_CODE"]
local buildingByzantiumChanceryID   = GameInfoTypes["BUILDING_JFD_BYZANTIUM_JUSTINIAN_CHANCERY"] or -1
local buildingByzantiumMCourtID		= GameInfoTypes["BUILDING_JFD_BYZANTIUM_JUSTINIAN_M_COURT"] or -1
local buildingChanceryID			= GameInfoTypes["BUILDING_JFD_CHANCERY"] or -1
local buildingMCourtID				= GameInfoTypes["BUILDING_JFD_MAGISTRATE_COURT"] or -1
local techChanceryType				= -1
local techChanceryID				= -1
local techMCourtType				= -1
local techMCourtID					= -1
if userSettingRTPClaimsCore then
	techChanceryType				= GameInfo.Buildings["BUILDING_JFD_CHANCERY"].PrereqTech
	techChanceryID					= GameInfoTypes[techChanceryType]
	techMCourtType					= GameInfo.Buildings["BUILDING_JFD_MAGISTRATE_COURT"].PrereqTech
	techMCourtID					= GameInfoTypes[techMCourtType]
end
local buildings = {}
	buildings[buildingByzantiumBarracksID]				= {}
	buildings[buildingByzantiumBarracksID].BuildingID	= buildingBarracksID
	buildings[buildingByzantiumBarracksID].PolicyID		= nil
	buildings[buildingByzantiumBarracksID].TechID		= techBarracksID
	buildings[buildingByzantiumChanceryID]				= {}
	buildings[buildingByzantiumChanceryID].BuildingID	= buildingChanceryID
	buildings[buildingByzantiumChanceryID].PolicyID		= policyCodeOfJustinianID
	buildings[buildingByzantiumChanceryID].TechID		= techChanceryID
	buildings[buildingByzantiumCourthouseID]			= {}
	buildings[buildingByzantiumCourthouseID].BuildingID	= buildingCourthouseID
	buildings[buildingByzantiumCourthouseID].PolicyID	= nil
	buildings[buildingByzantiumCourthouseID].TechID		= techCourthouseID
	buildings[buildingByzantiumMCourtID]				= {}
	buildings[buildingByzantiumMCourtID].BuildingID		= buildingMCourtID
	buildings[buildingByzantiumMCourtID].PolicyID		= policyCodeOfJustinianID
	buildings[buildingByzantiumMCourtID].TechID			= techMCourtID
	buildings[buildingByzantiumTempleID]				= {}
	buildings[buildingByzantiumTempleID].BuildingID		= buildingTempleID
	buildings[buildingByzantiumTempleID].PolicyID		= nil
	buildings[buildingByzantiumTempleID].TechID			= techTempleID
--JFD_ByzantiumJustinian_RenovatioImperii_CityCanConstruct
function JFD_ByzantiumJustinian_RenovatioImperii_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	if buildingID == buildingByzantiumCourthouseID then
		if player:IsAlive() and HasTrait(player, traitByzantiumJustinianID) then
			local city = player:GetCityByID(cityID)
			if (not city:IsCapital()) then return false end
			if (not Teams[player:GetTeam()]:IsHasTech(techCourthouseID)) then return false end
			local hasValidCityForCourthouse = false
			for city in player:Cities() do
				if (city:IsOccupied() and (not city:IsHasBuilding(buildingCourthouseID))) then
					hasValidCityForCourthouse = true
					break
				end
			end
			return hasValidCityForCourthouse
		else return false end
	else
		for thisBuildingID, thisBuilding in pairs(buildings) do
			if buildingID == thisBuildingID then
				if player:IsAlive() and HasTrait(player, traitByzantiumJustinianID) then
					if (thisBuilding.PolicyID and (not player:HasPolicy(thisBuilding.PolicyID))) then return false end	
					local city = player:GetCityByID(cityID)
					if (not city:IsHasBuilding(thisBuilding.BuildingID)) then return false end
					if (not city:IsCapital()) then return false end
					if (not Teams[player:GetTeam()]:IsHasTech(thisBuilding.TechID)) then return false end
					local hasValidCityForCourthouse = false
					for city in player:Cities() do
						if (not city:IsHasBuilding(thisBuilding.BuildingID)) then
							hasValidCityForCourthouse = true
							break
						end
					end
					return hasValidCityForCourthouse
				else return false end
			end
		end
	end
	return true
end
GameEvents.CityCanConstruct.Add(JFD_ByzantiumJustinian_RenovatioImperii_CityCanConstruct)

--JFD_ByzantiumJustinian_RenovatioImperii_CityConstructed
function JFD_ByzantiumJustinian_RenovatioImperii_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitByzantiumJustinianID)) then return end
	for thisBuildingID, thisBuilding in pairs(buildings) do
		if buildingID == thisBuildingID then
			local city = player:GetCityByID(cityID)
			if (player:IsHuman() and player:IsTurnActive()) then
				JFD_ByzantiumJustinian_RenovatioImperii_ShowPopup(playerID, cityID, thisBuilding.BuildingID)
			else
				for otherCity in player:Cities() do
					if (not otherCity:IsHasBuilding(thisBuilding.BuildingID)) then
						otherCity:SetNumRealBuilding(thisBuilding.BuildingID, 1)
					end
				end
			end
			city:SetNumRealBuilding(buildingID, 0)
			if (not thisBuilding.PolicyID) then
				local rewardGGPoints = math.ceil(city:GetBuildingPurchaseCost(thisBuilding.BuildingID)/10)
				player:ChangeCombatExperience(rewardGGPoints)
				if (player:IsHuman() and player:IsTurnActive()) then
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_GREAT_PEOPLE][ENDCOLOR]", rewardGGPoints), true)
				end
			end
		end
	end
end
GameEvents.CityConstructed.Add(JFD_ByzantiumJustinian_RenovatioImperii_CityConstructed)
----------------------------------------------------------------------------------------------------------------------------
-- CATAPHRACT
----------------------------------------------------------------------------------------------------------------------------
--JFD_ByzantiumJustinian_Cataphract_PlayerDoTurn
local buildingCataphractID = GameInfoTypes["BUILDING_JFD_CATAPHRACT"]
function JFD_ByzantiumJustinian_Cataphract_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitByzantiumJustinianID)) then return end
	local numCitiesUnderControl = 0
	for otherPlayerID = 0, GameDefines.MAX_PLAYERS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
			for city in otherPlayer:Cities() do
				if city:GetOriginalOwner() == playerID then
					numCitiesUnderControl = numCitiesUnderControl + 1
				end
			end
		end
	end
	for city in player:Cities() do 
		city:SetNumRealBuilding(buildingCataphractID, numCitiesUnderControl)
	end
end
GameEvents.PlayerDoTurn.Add(JFD_ByzantiumJustinian_Cataphract_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
-- HIPPODROME
----------------------------------------------------------------------------------------------------------------------------
--JFD_ByzantiumJustinian_Hippodrome_CityConstructed
local buildingHippodromeID = GameInfoTypes["BUILDING_JFD_HIPPODROME"]
function JFD_ByzantiumJustinian_Hippodrome_CityConstructed(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitByzantiumJustinianID)) then return end
	if (isGold or isFaith) then return end
	local city = player:GetCityByID(cityID)
	if (not city:IsHasBuilding(buildingHippodromeID)) then return end
	local unit = player:GetUnitByID(unitID)
	local rewardGold = (unit:GetExperience())
	player:ChangeGold(rewardGold)
	if (player:IsHuman() and player:IsTurnActive()) then
		local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
		Events.GameplayFX(hex.x, hex.y, -1)
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_YELLOW]+{1_Num}[ENDCOLOR] [ICON_GOLD]", rewardGold), true)
	end
	city:SetNumRealBuilding(buildingByzantineID, 0)
end
GameEvents.CityTrained.Add(JFD_ByzantiumJustinian_Hippodrome_CityConstructed)
--==========================================================================================================================
-- AI FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
------------------------------------------------------------------------------------------------------------------------
-- CODE OF JUSTINIAN
------------------------------------------------------------------------------------------------------------------------
--JFD_ByzantiumJustinian_RenovatioImperii_SelectButton
function JFD_ByzantiumJustinian_RenovatioImperii_SelectButton()
	Controls.MainUIBG:SetHide(true)
	Controls.MainUI:SetHide(true)	
	local city = activePlayer:GetCityByID(g_CitySelectedID)
	city:SetNumRealBuilding(g_BuildingID, 1)
	if userSettingMiscBuildingSounds then
		for row in GameInfo.BuildingClass_ConstructionAudio("BuildingClassType = '" .. GameInfo.Buildings[g_BuildingID].BuildingClass .. "' AND ConstructionAudio IS NOT NULL") do
			Events.AudioPlay2DSound(row.ConstructionAudio)
		end
	end
end
Controls.SelectButton:RegisterCallback(Mouse.eLClick, JFD_ByzantiumJustinian_RenovatioImperii_SelectButton)

--JFD_ByzantiumJustinian_RenovatioImperii_CityInstanceMenu
function JFD_ByzantiumJustinian_RenovatioImperii_CityInstanceMenu(cityID)
	local cityDesc = activePlayer:GetCityByID(cityID):GetName()
	Controls.CityInstanceMenu:GetButton():LocalizeAndSetText(cityDesc)
	g_CitySelectedID = cityID
	g_PlayerID = activePlayerID

	Controls.SelectButton:SetDisabled(false)
	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_BYZANTIUM_JUSTINIAN_BUTTON_TT", cityDesc, GameInfo.Buildings[g_BuildingID].Description)
end

--JFD_ByzantiumJustinian_RenovatioImperii_ShowPopup
function JFD_ByzantiumJustinian_RenovatioImperii_ShowPopup(playerID, cityID, buildingID)
	g_BuildingID = buildingID
	Events.AudioPlay2DSound("AS2D_SOUND_JFD_BYZANTIUM_JUSTINIAN")
	CivIconHookup(activePlayerID, 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
	Controls.MainUIBG:SetHide(false)
	Controls.MainUI:SetHide(false)
	Controls.CityInstanceMenu:ClearEntries()
	for city in activePlayer:Cities() do
		if (((g_BuildingID == buildingCourthouseID and city:IsOccupied()) or g_BuildingID ~= buildingCourthouseID) and (not city:IsHasBuilding(g_BuildingID))) then
			local entry = {}
			Controls.CityInstanceMenu:BuildEntry("InstanceOne", entry)
			entry.Button:SetVoid1(city:GetID())
			entry.Button:LocalizeAndSetText(city:GetName())
		end
	end
	Controls.SelectButton:SetDisabled(true)
	Controls.CityInstanceMenu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_BYZANTIUM_JUSTINIAN_MENU")
	Controls.CityInstanceMenu:CalculateInternals()
	Controls.CityInstanceMenu:RegisterSelectionCallback(JFD_ByzantiumJustinian_RenovatioImperii_CityInstanceMenu)
end

--JFD_ByzantiumJustinian_RenovatioImperii_FindOnMapButton
function JFD_ByzantiumJustinian_RenovatioImperii_FindOnMapButton()
	local city = activePlayer:GetCityByID(g_CitySelectedID)
	local plot = city:Plot()
	if plot then
		UI.DoSelectCityAtPlot(plot)
		UI.LookAt(plot, 0)
		local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
		Events.GameplayFX(hex.x, hex.y, -1) 
	end
end
Controls.FindOnMapButton:RegisterCallback(Mouse.eLClick, JFD_ByzantiumJustinian_RenovatioImperii_FindOnMapButton)
--==========================================================================================================================
--==========================================================================================================================