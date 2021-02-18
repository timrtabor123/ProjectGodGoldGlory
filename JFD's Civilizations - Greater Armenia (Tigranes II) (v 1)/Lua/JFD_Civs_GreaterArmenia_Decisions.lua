-- JFD_Civs_GreaterArmenia_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Greater Armenia Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  		= Locale.ConvertTextKey
local g_MathCeil				= math.ceil
local g_MathFloor				= math.floor
local g_MathMax					= math.max
local g_MathMin					= math.min
				
local Players 					= Players
local Teams 					= Teams

local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local activeTeamID				= activePlayer:GetTeam()
local activeTeam				= Teams[activeTeamID]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--Game_GetRound
function Game_GetRound(num, idp)
	local mult = 10^(idp or 0)
	return g_MathFloor(num * mult + 0.5) / mult
end
local g_GetRound = Game_GetRound
------------------------------------------------------------------------------------------------------------------------
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
local userSettingRTPSovereigntyCore = (Game_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID  = GameInfoTypes["CIVILIZATION_JFD_GREATER_ARMENIA"]
local eraMedievalID   = GameInfoTypes["ERA_MEDIEVAL"]
-------------------------------------------------------------------------------------------------------------------------
-- Greater Armenia: Consolidate Power over the Nakharars
-------------------------------------------------------------------------------------------------------------------------
local resourceHorsesID 		  = GameInfoTypes["RESOURCE_HORSE"]
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local unitGreatGeneralID  	  = GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitAzatavrearID    	  = GameInfoTypes["UNIT_JFD_AZATAVREAR"]
local Decisions_JFD_GreaterArmenia_Nakharars = {}
	Decisions_JFD_GreaterArmenia_Nakharars.Name = "TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_NAKHARARS"
	Decisions_JFD_GreaterArmenia_Nakharars.Desc = "TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_NAKHARARS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_GreaterArmenia_Nakharars, "CIVILIZATION_JFD_GREATER_ARMENIA")
	Decisions_JFD_GreaterArmenia_Nakharars.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_JFD_GreaterArmenia_Nakharars") == true then
			Decisions_JFD_GreaterArmenia_Nakharars.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_NAKHARARS_ENACTED_DESC")
			return false, false, true 
		end
		
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		local resourceCount = player:GetNumResourceAvailable(resourceHorsesID, true)
		if resourceCount >= 3 then
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
		
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		local unitCount = player:GetUnitClassCount(unitClassGreatGeneralID)
		if unitCount >= 3 then
			req2 = true
			reqIcon2 = "[ICON_CHECKBOX]"
		end
		
		local costGold = g_GetRound(((100)*iMod)*unitCount)
		local strLeaderTitle = "Great King"
		if userSettingRTPSovereigntyCore then
			strLeaderTitle = player:GetstrLeaderTitleShort() 
		end
		Decisions_JFD_GreaterArmenia_Nakharars.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_NAKHARARS_DESC", strLeaderTitle, reqIcon1, reqIcon2, costGold)	
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_GreaterArmenia_Nakharars.DoFunc = (
	function(player)
		local unitCount = player:GetUnitClassCount(unitClassGreatGeneralID)
		local costGold = g_GetRound(((100)*iMod)*unitCount)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		for unit in player:Units() do
			if unit and unit:GetUnitType() == unitGreatGeneralID then
				local plotX, plotY = unit:GetX(), unit:GetY()
				unit:Kill(-1)
				player:InitUnit(unitAzatavrearID, plotX, plotY)
			end
		end
		Player_SendWorldEvent(player, g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_GREATER_ARMENIA_NAKHARARS", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_GreaterArmenia_Nakharars", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_GreaterArmenia_Nakharars", Decisions_JFD_GreaterArmenia_Nakharars)
-------------------------------------------------------------------------------------------------------------------------
-- Greater Armenia: Patron Greek Theatre
-------------------------------------------------------------------------------------------------------------------------
local policyDecisionsGreaterArmeniaGreekTheatreID = GameInfoTypes["POLICY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE"]
local Decisions_JFD_GreaterArmenia_GreekTheatre = {}
	Decisions_JFD_GreaterArmenia_GreekTheatre.Name = "TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE"
	Decisions_JFD_GreaterArmenia_GreekTheatre.Desc = "TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_GreaterArmenia_GreekTheatre, "CIVILIZATION_JFD_GREATER_ARMENIA")
	Decisions_JFD_GreaterArmenia_GreekTheatre.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyDecisionsGreaterArmeniaGreekTheatreID) then
			Decisions_JFD_GreaterArmenia_GreekTheatre.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE_ENACTED_DESC")
			return false, false, true 
		end
		
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		local hasForeignCapital = false
		for city in player:Cities() do
			if city:GetOriginalOwner() ~= player:GetID() and city:IsOriginalCapital() then
				hasForeignCapital = true
				break
			end
		end
		if hasForeignCapital then
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
		
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		if player:GetCurrentEra() >= eraMedievalID then
			req2 = true
			reqIcon2 = "[ICON_CHECKBOX]"
		end
		
		local numCities = player:GetNumCities()
		local costCulture = g_GetRound((numCities*20)*iMod)
		local costGold = g_GetRound((numCities*50)*iMod)
		Decisions_JFD_GreaterArmenia_GreekTheatre.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE_DESC", reqIcon1, reqIcon2, costCulture, costGold)	
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_GreaterArmenia_GreekTheatre.DoFunc = (
	function(player)
		local numCities = player:GetNumCities()
		local costCulture = g_GetRound((numCities*20)*iMod)
		local costGold = g_GetRound((numCities*50)*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeGold(-costGold)
		if isCPActive then
			player:GrantPolicy(policyDecisionsGreaterArmeniaGreekTheatreID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyDecisionsGreaterArmeniaGreekTheatreID, true)
		end
		Player_SendWorldEvent(player, g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_GREATER_ARMENIA_GREEK_THEATRE", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_GreaterArmenia_GreekTheatre", Decisions_JFD_GreaterArmenia_GreekTheatre)
--=======================================================================================================================
--=======================================================================================================================
