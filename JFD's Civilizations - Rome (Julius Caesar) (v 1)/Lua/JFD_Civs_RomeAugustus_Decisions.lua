-- JFD_Civs_RomeJulius_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Japan (Tojo) Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
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
-------------------------------------------------------------------------------------------------------------------------
--Player_GetNumCityStateAllies
local defineMaxMinorPlayers = GameDefines["MAX_MINOR_CIVS"]
function Player_GetNumCityStateAllies(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local numAllies = 0
	for otherPlayerID = 0, defineMaxMinorPlayers-1, 1 do
		if otherPlayerID ~= playerID then
			local otherPlayer = Players[otherPlayerID]
			local otherPlayerTeamID = otherPlayer:GetTeam()
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetMinorCivFriendshipLevelWithMajor(playerID) == 2) then
				numAllies = numAllies + 1
			end
		end
	end
	return numAllies
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
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID   	  = GameInfoTypes["CIVILIZATION_ROME"]
local resourceInventorsID = GameInfoTypes["RESOURCE_JFD_INVENTORS"]
-------------------------------------------------------------------------------------------------------------------------
-- Rome (Augustus): Compose new Commentaries
-------------------------------------------------------------------------------------------------------------------------
local techCalendarID				= GameInfoTypes["TECH_CALENDAR"]
local resourceDecisionsRomanWineID  = GameInfoTypes["RESOURCE_DECISIONS_JFD_ROMAN_WINE"]
local resourceWineID				= GameInfoTypes["RESOURCE_WINE"]
tDecisions.Decisions_JFD_Rome_PanemEtCircenses = nil
tDecisions.Decisions_RomanPanem = nil
local Decisions_JFD_RomeAugustus_Wine = {}
	Decisions_JFD_RomeAugustus_Wine.Name = "TXT_KEY_DECISIONS_JFD_ROME_AUGUSTUS_WINE"
	Decisions_JFD_RomeAugustus_Wine.Desc = "TXT_KEY_DECISIONS_JFD_ROME_AUGUSTUS_WINE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RomeAugustus_Wine, "CIVILIZATION_ROME")
	Decisions_JFD_RomeAugustus_Wine.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local playerTeamID = player:GetTeam()
		local playerTeam = Teams[playerTeamID]
		local era = load(player, "Decisions_JFD_RomeAugustus_Wine")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_JFD_RomeAugustus_Wine", nil)
			else
				Decisions_JFD_RomeAugustus_Wine.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_AUGUSTUS_WINE_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local team = Teams[player:GetTeam()]
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		local numWine = player:GetNumResourceAvailable(resourceWineID, false)
		if numWine > 1 then
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
	
		local team = Teams[player:GetTeam()]
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		if playerTeam:IsHasTech(techCalendarID) then
			req2 = true
			reqIcon2 = "[ICON_CHECKBOX]"
		end
		
		local costGold = Game_GetRound((200*numWine)*iMod)
		local resourceID = iMagistrate
		local strResource = "[ICON_MAGISTRATES] Magistrates"
		if resourceInventorsID then
			resourceID = resourceInventorsID
			strResource = "[ICON_JFD_INVENTORS] Inventors"
		end	
		Decisions_JFD_RomeAugustus_Wine.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_AUGUSTUS_WINE_DESC", reqIcon1, reqIcon2, costGold, strResource)
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_RomeAugustus_Wine.DoFunc = (
	function(player)
		local numWine = player:GetNumResourceAvailable(resourceWineID, false)
		local costGold = Game_GetRound((200*numWine)*iMod)
		player:ChangeGold(-costGold)
		local resourceID = iMagistrate
		if resourceInventorsID then
			resourceID = resourceInventorsID
		end	
		player:ChangeNumResourceTotal(resourceID, -2)
		player:ChangeNumResourceTotal(resourceWineID, -numWine)
		player:ChangeNumResourceTotal(resourceDecisionsRomanWineID, numWine)
		Player_SendWorldEvent(player, g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ROME_AUGUSTUS_WINE", player:GetName(), player:GetCivilizationShortDescription()))
		save(player, "Decisions_JFD_RomeAugustus_Wine", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RomeAugustus_Wine", Decisions_JFD_RomeAugustus_Wine)
--=======================================================================================================================
--=======================================================================================================================
