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
local userSettingRTPPrestigeCore 	= (Game_GetUserSetting("JFD_RTP_PRESTIGE_CORE") == 1)
local userSettingRTPSovereigntyCore = (Game_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID   	  = GameInfoTypes["CIVILIZATION_JFD_ROME_JULIUS"]
local resourceCaptainsID  = GameInfoTypes["RESOURCE_JFD_CAPTAINS"]
-------------------------------------------------------------------------------------------------------------------------
-- Rome (Julius): Declare the Triumvirate
-------------------------------------------------------------------------------------------------------------------------
local buildingClassCourthouseID = GameInfoTypes["BUILDINGCLASS_COURTHOUSE"]
local resourceCoalID		  = GameInfoTypes["RESOURCE_COAL"]
local techIndustrializationID = GameInfoTypes["TECH_INDUSTRIALIZATION"]
local techSteampowerID		  = GameInfoTypes["TECH_STEAM_POWER"]
local unitClassGreatGeneral		= GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local Decisions_JFD_RomeJulius_Triumvirate = {}
	Decisions_JFD_RomeJulius_Triumvirate.Name = "TXT_KEY_DECISIONS_JFD_ROME_JULIUS_TRIUMVIRATE"
	Decisions_JFD_RomeJulius_Triumvirate.Desc = "TXT_KEY_DECISIONS_JFD_ROME_JULIUS_TRIUMVIRATE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RomeJulius_Triumvirate, "CIVILIZATION_JFD_ROME_JULIUS")
	Decisions_JFD_RomeJulius_Triumvirate.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local playerID = player:GetID()
		local playerTeamID = player:GetTeam()
		local playerTeam = Teams[playerTeamID]
		if load(player, "Decisions_JFD_RomeJulius_Triumvirate") then
			if userSettingRTPSovereigntyCore then
				Decisions_JFD_RomeJulius_Triumvirate.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_JULIUS_TRIUMVIRATE_ENACTED_DESC_SOVEREIGNTY")
			else
				Decisions_JFD_RomeJulius_Triumvirate.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_JULIUS_TRIUMVIRATE_ENACTED_DESC")
			end
			return false, false, true 
		end
		local capital = player:GetCapitalCity() 
		if (not capital) then return false, false end
		
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		if capital:IsOriginalCapital() then
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
		
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		if player:GetUnitClassCount(unitClassGreatGeneral) >= 3 then
			req2 = true
			reqIcon2 = "[ICON_CHECKBOX]"
		end
		
		local req3 = false
		local reqIcon3 = "[ICON_UNCHECKBOX]"
		if player:GetBuildingClassCount(buildingClassCourthouseID) >= 2 then
			req3 = true
			reqIcon3 = "[ICON_CHECKBOX]"
		end
		
		local req4 = false
		local reqIcon4 = "[ICON_UNCHECKBOX]"
		if player:GetBuildingClassCount(buildingClassCourthouseID) >= 2 then
			req4 = true
			reqIcon4 = "[ICON_CHECKBOX]"
		end
		
		local req3 = false
		local reqIcon3 = "[ICON_UNCHECKBOX]"
		if Player_GetNumCityStateAllies(playerID) >= 1 then
			req3 = true
			reqIcon3 = "[ICON_CHECKBOX]"
		end
		
		local costGAP = Game_GetRound((player:GetGoldenAgeProgressMeter()*50)/100)
		local costYieldDesc = "Golden Age Points"
		if userSettingRTPPrestigeCore then
			costYieldDesc = "Prestige"
		end
		local costGold = Game_GetRound(300*iMod)
		if userSettingRTPSovereigntyCore then
			Decisions_JFD_RomeJulius_Triumvirate.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_JULIUS_TRIUMVIRATE_DESC_SOVEREIGNTY", reqIcon1, reqIcon2, reqIcon3, reqIcon4, costGAP, costYieldDesc, costGold)
		else
			Decisions_JFD_RomeJulius_Triumvirate.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_JULIUS_TRIUMVIRATE_DESC", reqIcon1, reqIcon2, reqIcon3, reqIcon4, costGAP, costYieldDesc, costGold)
		end
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if (not req3) then return true, false end
		if (not req4) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 3 then return true, false end
		if player:GetGoldenAgeProgressMeter() < costGAP then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_RomeJulius_Triumvirate.DoFunc = (
	function(player)
		local costGAP = Game_GetRound((player:GetGoldenAgeProgressMeter()*50)/100)
		local costGold = Game_GetRound(300*iMod)
		player:ChangeGoldenAgeProgressMeter(-costGAP)
		player:ChangeGold(-costGold)
		local resourceID = iMagistrate
		player:ChangeNumResourceTotal(iMagistrate, -3)
		if userSettingRTPSovereigntyCore then
			player:SetNumFreeReforms(3)
		else
			player:SetNumFreePolicies(3)
		end
		Player_SendWorldEvent(player, g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ROME_JULIUS_TRIUMVIRATE", player:GetName(), player:GetCivilizationShortDescription()))
		save(player, "Decisions_JFD_RomeJulius_Triumvirate", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RomeJulius_Triumvirate", Decisions_JFD_RomeJulius_Triumvirate)
-------------------------------------------------------------------------------------------------------------------------
-- Rome (Julius): Compose new Commentaries
-------------------------------------------------------------------------------------------------------------------------
local techWritingID = GameInfoTypes["TECH_WRITING"]
local Decisions_JFD_RomeJulius_Commentaries = {}
	Decisions_JFD_RomeJulius_Commentaries.Name = "TXT_KEY_DECISIONS_JFD_ROME_JULIUS_COMMENTARII"
	Decisions_JFD_RomeJulius_Commentaries.Desc = "TXT_KEY_DECISIONS_JFD_ROME_JULIUS_COMMENTARII_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RomeJulius_Commentaries, "CIVILIZATION_JFD_ROME_JULIUS")
	Decisions_JFD_RomeJulius_Commentaries.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local playerTeamID = player:GetTeam()
		local playerTeam = Teams[playerTeamID]
		local era = load(player, "Decisions_JFD_RomeJulius_Commentaries")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_JFD_RomeJulius_Commentaries", nil)
			else
				Decisions_JFD_RomeJulius_Commentaries.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_JULIUS_COMMENTARII_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local team = Teams[player:GetTeam()]
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		if playerTeam:GetAtWarCount(true) > 0 then
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
	
		local team = Teams[player:GetTeam()]
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		if playerTeam:IsHasTech(techWritingID) then
			req2 = true
			reqIcon2 = "[ICON_CHECKBOX]"
		end
		
		local currentEraID = player:GetCurrentEra()+1
		local costCulture = Game_GetRound((currentEraID*10)*iMod)
		local resourceID = iMagistrate
		local strResource = "[ICON_MAGISTRATES] Magistrates"
		if resourceCaptainsID then
			resourceID = resourceCaptainsID
			strResource = "[ICON_JFD_CAPTAINS] Captains"
		end	
		local rewardGGPoints = 0
		for unit in player:Units() do
			local unitLevel = unit:GetLevel()
			rewardGGPoints = rewardGGPoints + (unitLevel*2)
		end
		rewardGGPoints = Game_GetRound(rewardGGPoints)
		Decisions_JFD_RomeJulius_Commentaries.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_JULIUS_COMMENTARII_DESC", reqIcon1, reqIcon2, costCulture, strResource, rewardGGPoints)
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < 1 then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end 
		return true, true
	end
	)
	
	Decisions_JFD_RomeJulius_Commentaries.DoFunc = (
	function(player)
		local currentEraID = player:GetCurrentEra()+1
		local costCulture = Game_GetRound((currentEraID*10)*iMod)
		player:ChangeJONSCulture(-costCulture)
		local resourceID = iMagistrate
		if resourceCaptainsID then
			resourceID = resourceCaptainsID
		end	
		player:ChangeNumResourceTotal(resourceID, -1)
		
		local rewardGGPoints = 0
		for unit in player:Units() do
			local unitLevel = unit:GetLevel()
			rewardGGPoints = rewardGGPoints + (unitLevel*2)
			unit:ChangeDamage(-20)
		end
		rewardGGPoints = Game_GetRound(rewardGGPoints)
		player:ChangeCombatExperience(rewardGGPoints)
		Player_SendWorldEvent(player, g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ROME_JULIUS_COMMENTARII", player:GetName(), player:GetCivilizationShortDescription()))
		save(player, "Decisions_JFD_RomeJulius_Commentaries", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RomeJulius_Commentaries", Decisions_JFD_RomeJulius_Commentaries)
--=======================================================================================================================
--=======================================================================================================================
