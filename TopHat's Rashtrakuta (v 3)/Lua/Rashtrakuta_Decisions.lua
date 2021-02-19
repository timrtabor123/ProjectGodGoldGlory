--=======================================================================================================================
print("Rashtrakuta Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

function JFD_IsEDActive()
	local cPDLLID = "1f941088-b185-4159-865c-472df81247b2"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local bIsEDActive = JFD_IsEDActive()
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
local civilizationID  = GameInfoTypes.CIVILIZATION_THP_RASHTRAKUTA
local mathCeil = math.ceil

-------------------------------------------------------------------------------------------------------------------------
-- Rashtrakuta: Begin Commerce with the Mappila
-------------------------------------------------------------------------------------------------------------------------
local bMappilaBuliding = GameInfoTypes.BUILDING_THP_MAPPILA_GOLD
local pMappilaPolicy = GameInfoTypes.POLICY_DECISIONS_THP_RASHTRAKUTA_MAPPILA
local tOptics = GameInfoTypes.TECH_OPTICS
local rHorse = GameInfoTypes.RESOURCE_HORSE

local Decisions_THP_Rashtrakuta_Mappila = {}
	Decisions_THP_Rashtrakuta_Mappila.Name = "TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA"
	Decisions_THP_Rashtrakuta_Mappila.Desc = "TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA_DESC"
	HookDecisionCivilizationIcon(Decisions_THP_Rashtrakuta_Mappila, "CIVILIZATION_THP_RASHTRAKUTA")
	Decisions_THP_Rashtrakuta_Mappila.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
        	if player:HasPolicy(pMappilaPolicy) then
                	Decisions_THP_Rashtrakuta_Mappila.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA_ENACTED_DESC")
	                return false, false, true
           	end
		local goldCost = mathCeil(200*iMod)
		Decisions_THP_Rashtrakuta_Mappila.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA_DESC", goldCost)
		if not (Teams[player:GetTeam()]:IsHasTech(tOptics)) then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Rashtrakuta_Mappila.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(200*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
        	player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(pMappilaPolicy, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_RASHTRAKUTA_MAPPILA", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
		for cCity in player:Cities() do
			cCity:SetNumRealBuilding(bMappilaBuilding, 1)
			if cCity:IsCoastal() then
				local pCityPlot = cCity:Plot()
				if pCityPlot and pCityPlot:GetNumResource() < 1 then
					pCityPlot:SetResourceType(rHorse, 2)
				else
					for i = 0, cCity:GetNumCityPlots(), 1 do
						local pPlot = cCity:GetCityIndexPlot(i)
						if (not pPlot:GetNumResource() > 0) and (not pPlot:IsWater()) then
							pPlot:SetResourceType(rHorse, 2)
							break
						end
					end
				end
			end
		end
	end
	)

	Decisions_THP_Rashtrakuta_Mappila.Monitors = {}
	Decisions_THP_Rashtrakuta_Mappila.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerID)
		local pPlayer = Players[playerID]
		if pPlayer:HasPolicy(pMappilaPolicy) then
			if pPlayer:CountNumBuildings(bMappilaBuilding) ~= pPlayer:GetNumCities() then
				for cCity in pPlayer:Cities() do
					cCity:SetNumRealBuilding(bMappilaBuliding, 1)
				end
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Rashtrakuta_Mappila", Decisions_THP_Rashtrakuta_Mappila)

-------------------------------------------------------------------------------------------------------------------------
-- Rashtrakuta: Collect Emergency Taxes
-------------------------------------------------------------------------------------------------------------------------

local pTaxationPolicy = GameInfoTypes.POLICY_DECISIONS_THP_RASHTRAKUTA_TAXATION
local fForest = GameInfoTypes.FEATURE_FOREST
local fJungle = GameInfoTypes.FEATURE_JUNGLE

-- edit this to tweak how much gold you get per forest/jungle tile
local iPerTile = 10

local Decisions_THP_Rashtrakuta_Taxation = {}
	Decisions_THP_Rashtrakuta_Taxation.Name = "TXT_KEY_DECISIONS_THP_RASHTRAKUTA_TAXATION"
	Decisions_THP_Rashtrakuta_Taxation.Desc = "TXT_KEY_DECISIONS_THP_RASHTRAKUTA_TAXATION_DESC"
	HookDecisionCivilizationIcon(Decisions_THP_Rashtrakuta_Taxation, "CIVILIZATION_THP_RASHTRAKUTA")
	Decisions_THP_Rashtrakuta_Taxation.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_THP_Rashtrakuta_Taxation") == true then
			Decisions_THP_Rashtrakuta_Taxation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_RASHTRAKUTA_TAXATION_ENACTED_DESC")
			return false, false, true
		end
		if Teams[player:GetTeam()]:GetAtWarCount(false) < 1 then return true, false end
		if player:CalculateGoldRate() > -1 then return true, false end
		local cultureCost = mathCeil(200*iMod)
		-- Decisions_THP_Rashtrakuta_Taxation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_RASHTRAKUTA_TAXATION_DESC", cultureCost)
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Rashtrakuta_Taxation.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(200*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeJONSCulture(-cultureCost)
        	save(player, "Decisions_THP_Rashtrakuta_Taxation", true)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(pTaxationPolicy, true)	
		local iProfit = 0
		for cCity in pPlayer:Cities() do
			for i = 0, cCity:GetNumCityPlots(), 1 do
				local pPlot = cCity:GetCityIndexPlot(i)
				if (pPlot:GetFeatureType() == fForest) or (pPlot:GetFeatureType() == fJungle) then
					iProfit = iProfit + iPerTile
				end
			end
		end
		player:ChangeGold(iProfit)

		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_RASHTRAKUTA_TAXATION", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Rashtrakuta_Taxation", Decisions_THP_Rashtrakuta_Taxation)

--
--
