-- JFD_ByzantiumJustinian_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Byzantium (Justinian) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--GetRound
function GetRound(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		print("sending World Event", description)
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--IsCPActive
function IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = IsCPActive()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--Game.GetUserSetting
function Game.GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingRTPClaimsCore		= (Game.GetUserSetting("JFD_RTP_CLAIMS_CORE") == 1)
local userSettingRTPSovereigntyCore = (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
local userSettingRTPSupplyCaptains  = (Game.GetUserSetting("SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS") == 1)
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID			= GameInfoTypes["CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN"]
local resourceCaptainsID		= GameInfoTypes["RESOURCE_JFD_CAPTAINS"]
-------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Justinian): Compile the Corpus Juris Civilis
-------------------------------------------------------------------------------------------------------------------------
local eraClassicalID			= GameInfoTypes["ERA_CLASSICAL"]
local policyCitizenshipID       = GameInfoTypes["POLICY_CITIZENSHIP"]
local policyCodeOfJustinianID	= GameInfoTypes["POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_CODE"]
local policyLegalismID		    = GameInfoTypes["POLICY_LEGALISM"]
local reformSystemCivilID		= GameInfoTypes["REFORM_JFD_SYSTEM_CIVIL"]
local techWritingID				= GameInfoTypes["TECH_WRITING"]
local Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis = {}
	Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_CODE"
	Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_CODE_DESC"
	Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.Era = eraClassicalID
	HookDecisionCivilizationIcon(Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis, "CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN")
	Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyCodeOfJustinianID) then
			if (userSettingRTPClaimsCore and userSettingRTPSovereigntyCore) then
				local govtTitleShort = player:GetGovernmentShortDescription()
				Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_CODE_ENACTED_DESC_CLAIMS", govtTitleShort)	
			else
				Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_CODE_ENACTED_DESC")
			end
			return false, false, true
		end
		local costGold = GetRound(400*iMod)
		if (userSettingRTPClaimsCore and userSettingRTPSovereigntyCore) then
			local govtTitleShort = player:GetGovernmentShortDescription()
			Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_CODE_DESC_CLAIMS", govtTitleShort, costGold)
			if (not player:HasGovernment()) then return true, false end
		else
			Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_CODE_DESC", costGold)
			if (not Teams[player:GetTeam()]:IsHasTech(techWritingID)) then return true, false end
		end
		if player:GetNumResourceAvailable(iMagistrate, false) < 3 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costGold = GetRound(400*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -3)
		if (userSettingRTPClaimsCore and userSettingRTPSovereigntyCore) then
			JFD_SetHasReform(playerID, reformSystemCivilID, true, true)
		else
			if (not player:HasPolicy(policyCitizenshipID)) then
				player:SetHasPolicy(policyCitizenshipID, true)
			else
				player:SetNumFreePolicies(1)
			end
			if (not player:HasPolicy(policyLegalismID)) then
				player:SetHasPolicy(policyLegalismID, true)
			else
				player:SetNumFreePolicies(1)
			end
		end
		if isCPActive then
			player:GrantPolicy(policyCodeOfJustinianID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyCodeOfJustinianID, true)
		end
		JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BYZANTIUM_JUSTINIAN_CODE", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis", Decisions_JFD_ByzantiumJustinian_CorpusJurisCivilis)
-------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Justinian): Restore the Roman Empire
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID	  = GameInfoTypes["ERA_RENAISSANCE"]
local policyDecisionsByzantiumJustinianRomanEmpireID = GameInfoTypes["POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME"]
local reformStateEmpireID = GameInfoTypes["REFORM_JFD_STATE_EMPIRE"]
local worldSize			  = GameInfo.Worlds[Map.GetWorldSize()].DefaultPlayers
local Decisions_JFD_ByzantiumJustinian_RomanEmpire = {}
	Decisions_JFD_ByzantiumJustinian_RomanEmpire.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_ROME"
	Decisions_JFD_ByzantiumJustinian_RomanEmpire.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_ROME_DESC"
	Decisions_JFD_ByzantiumJustinian_RomanEmpire.Era = eraRenaissanceID
	HookDecisionCivilizationIcon(Decisions_JFD_ByzantiumJustinian_RomanEmpire, "CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN")
	Decisions_JFD_ByzantiumJustinian_RomanEmpire.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyDecisionsByzantiumJustinianRomanEmpireID) then
			if userSettingRTPSovereigntyCore then
				Decisions_JFD_ByzantiumJustinian_RomanEmpire.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_ROME_ENACTED_DESC_SOVEREIGNTY")	
			else
				Decisions_JFD_ByzantiumJustinian_RomanEmpire.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_ROME_ENACTED_DESC")
			end
			return false, false, true
		end
		local numCities = ((worldSize)*2)
		local costGold = GetRound((numCities*100)*iMod)
		if (userSettingRTPSovereigntyCore and userSettingRTPSupplyCaptains) then
			Decisions_JFD_ByzantiumJustinian_RomanEmpire.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_ROME_DESC_SOVEREIGNTY", costGold, numCities)
			if (not player:HasGovernment()) then return true, false end
		else
			Decisions_JFD_ByzantiumJustinian_RomanEmpire.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_ROME_DESC", costGold, numCities)
		end
		if player:GetNumCities() < numCities then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if (userSettingRTPSovereigntyCore and userSettingRTPSupplyCaptains and player:GetNumResourceAvailable(resourceCaptainsID, false) < 2) then return true, false end
		if ((not (userSettingRTPSovereigntyCore and userSettingRTPSupplyCaptains)) and player:GetGold() < costGold) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_ByzantiumJustinian_RomanEmpire.DoFunc = (
	function(player)
		local playerID = player:GetID()
		if (not (userSettingRTPSovereigntyCore and userSettingRTPSupplyCaptains)) then
			local numCities = ((worldSize)*2)
			local costGold = GetRound((numCities*100)*iMod)
			player:ChangeGold(-costGold)
		else
			player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		end
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGoldenAgeTurns(12)
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_ROME_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_ROME_SHORT_DESC")
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_ROME_ADJECTIVE")
		if (userSettingRTPSovereigntyCore and userSettingRTPSupplyCaptains) then
			player:SetHasReform(playerID, reformStateEmpireID, true, true)
		end
		if isCPActive then
			player:GrantPolicy(policyDecisionsByzantiumJustinianRomanEmpireID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyDecisionsByzantiumJustinianRomanEmpireID, true)
		end
		JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BYZANTIUM_JUSTINIAN_ROME", player:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_ByzantiumJustinian_RomanEmpire", Decisions_JFD_ByzantiumJustinian_RomanEmpire)
--=======================================================================================================================
--=======================================================================================================================
