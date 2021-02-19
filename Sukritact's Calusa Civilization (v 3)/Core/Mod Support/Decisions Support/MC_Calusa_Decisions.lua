-- Calusa Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Calusa Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Calusa: Initiate Canal Construction
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CalusaCanal = {}
	Decisions_CalusaCanal.Name = "TXT_KEY_DECISIONS_CALUSACANAL"
	Decisions_CalusaCanal.Desc = "TXT_KEY_DECISIONS_CALUSACANAL_DESC"
	HookDecisionCivilizationIcon(Decisions_CalusaCanal, "CIVILIZATION_MC_CALUSA")
	Decisions_CalusaCanal.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_CALUSA then return false, false end
		if load(pPlayer, "Decisions_CalusaCanal") == true then
			Decisions_CalusaCanal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALUSACANAL_ENACTED_DESC")
			return false, false, true
		end

		local iCost = math.ceil(200 * iMod)
		Decisions_CalusaCanal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALUSACANAL_DESC", iCost)
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MASONRY)) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_THE_WHEEL)) then return true, false end

		local bMarsh = nil
		for pCity in pPlayer:Cities() do
			local pPlot = pCity:Plot()
			if pPlot:GetFeatureType() == GameInfoTypes.FEATURE_MARSH then bMarsh = true break end
		end
		if not(bMarsh) then  return true, false end

		return true, true
	end
	)
	
	Decisions_CalusaCanal.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(200 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_CALUSACANAL, true)		

		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALUSACANAL, 1)
		end

		save(pPlayer, "Decisions_CalusaCanal", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_CALUSA, "Decisions_CalusaCanal", Decisions_CalusaCanal)
-------------------------------------------------------------------------------------------------------------------------
-- Calusa: Begin Salvage Operations
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CalusaSalvage = {}
	Decisions_CalusaSalvage.Name = "TXT_KEY_DECISIONS_CALUSASALVAGE"
	Decisions_CalusaSalvage.Desc = "TXT_KEY_DECISIONS_CALUSASALVAGE_DESC"
	HookDecisionCivilizationIcon(Decisions_CalusaSalvage, "CIVILIZATION_MC_CALUSA")
	Decisions_CalusaSalvage.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_CALUSA then return false, false end
		if load(pPlayer, "Decisions_CalusaSalvage") == true then
			Decisions_CalusaSalvage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALUSASALVAGE_ENACTED_DESC")
			return false, false, true
		end

		local iCost = math.ceil(100 * iMod)
		Decisions_CalusaSalvage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALUSASALVAGE_DESC", iCost)
		if (pPlayer:GetJONSCulture() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ASTRONOMY)) then return true, false end

		local pTargetCity = nil
		for pCity in pPlayer:Cities() do 
			if pCity:IsCoastal() then  pTargetCity = pCity break end
		end
		if pTargetCity == nil then return true, false end  		

		return true, true
	end
	)
	
	Decisions_CalusaSalvage.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(100 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_CALUSASALVAGE, true)	

		save(pPlayer, "Decisions_CalusaSalvage", true)
	end
	)

	Decisions_CalusaSalvage.Monitors = {}
	Decisions_CalusaSalvage.Monitors[GameEvents.UnitPrekill] = (
	function (iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)

		-- Must have been killed by another Player
		if iPlayer == iByPlayer then return end
		if iByPlayer == -1 then return end

		local pPlayer = Players[iPlayer]

		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:GetDomainType() ~= GameInfoTypes.DOMAIN_SEA then return end

		local pPlot = pUnit:GetPlot()
		local iPlotOwner = pPlot:GetOwner()
		if iPlotOwner == -1 then return end
		local pPlotOwner = Players[iPlotOwner]
		if not(pPlotOwner:HasPolicy(GameInfoTypes.POLICY_DECISIONS_CALUSASALVAGE)) then return end

		local iReward = GameInfo.Units[iUnitType].Cost or 0
		if iReward < 1 then return end
		iReward = math.ceil(iReward * iMod)

		pPlayer:ChangeGold(iReward)		
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_CALUSA, "Decisions_CalusaSalvage", Decisions_CalusaSalvage)
--=======================================================================================================================
--=======================================================================================================================