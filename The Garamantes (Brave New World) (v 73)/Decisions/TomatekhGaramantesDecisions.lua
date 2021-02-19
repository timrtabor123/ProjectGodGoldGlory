--Tomatekh

print("Garamantes Decisions")

local isCulDiv = (GameInfoTypes.PROMOTION_JFD_SEMITIC_MOVES ~= nil)

--Cave Dwellers
local uWarChariot = GameInfoTypes.UNIT_EGYPTIAN_WARCHARIOT
local tWheel = GameInfoTypes.TECH_THE_WHEEL;

local Decisions_GaramantesCaveDwellers = {}
	Decisions_GaramantesCaveDwellers.Name = "TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CAVE_DWELLERS"
	Decisions_GaramantesCaveDwellers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CAVE_DWELLERS_DESC")
	HookDecisionCivilizationIcon(Decisions_GaramantesCaveDwellers, "CIVILIZATION_ANCIENT_LIBYA_MOD")
	Decisions_GaramantesCaveDwellers.Weight = nil
	Decisions_GaramantesCaveDwellers.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_GaramantesCaveDwellers") == true then
			Decisions_GaramantesCaveDwellers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CAVE_DWELLERS_ENACTED_DESC")
			return false, false, true
		end		

		local iCost = 3;
		if isCulDiv then
			iCost = 4;
		end

		Decisions_GaramantesCaveDwellers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_CAVE_DWELLERS_DESC", iCost)

		local cUnitCount = 0;
		for pUnit in pPlayer:Units() do
			if (pUnit:IsCombatUnit()) then
				cUnitCount = cUnitCount + 1;
			end
		end

		if isCulDiv then
			if cUnitCount < 4 then return true, false end
		elseif not isCulDiv then
			if cUnitCount < 3 then return true, false end
		end

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_MEDIEVAL"] then return true, false end

		return true, true
	end
	)
	
	Decisions_GaramantesCaveDwellers.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_GARAMANTES_CAVE_DWELLERS_MOD"], true)

		local pTeam = pPlayer:GetTeam();
		local pcCity = pPlayer:GetCapitalCity();
		if (Teams[pTeam]:IsHasTech(tWheel)) then 
			pUnit = pPlayer:InitUnit(uWarChariot, pcCity:GetX(), pcCity:GetY(), UNITAI_RANGED);
			pUnit:JumpToNearestValidPlot();
		end

		save(pPlayer, "Decisions_GaramantesCaveDwellers", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"], "Decisions_GaramantesCaveDwellers", Decisions_GaramantesCaveDwellers)

local iTechWheel = GameInfo.Technologies["TECH_THE_WHEEL"].ID

GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 
	if (iTech == iTechWheel) then
		local gPlayer = 0;
		local pTeam = 999;
		for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local pPlayer = Players[iPlayer]
			if (pPlayer:IsAlive()) then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
					gPlayer = pPlayer;
					pTeam = pPlayer:GetTeam();
				end
			end
		end
		if gPlayer ~= 0 then
			if pTeam == iTeam then
				if load(gPlayer, "Decisions_GaramantesCaveDwellers") == true then
					local pcCity = gPlayer:GetCapitalCity();
					pUnit = gPlayer:InitUnit(uWarChariot, pcCity:GetX(), pcCity:GetY(), UNITAI_RANGED);
					pUnit:JumpToNearestValidPlot();
				end
			end
		end
	end
end)

--Water Wells
local iFoggaras = GameInfo.Improvements["IMPROVEMENT_GARAMANTES_MOD_FOGGORA"].ID
local fFoggoras = GameInfoTypes.FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER
local bGaraDecDummy = GameInfoTypes.BUILDING_GARAMANTES_DEC_OASIS_DUMMY;

local Decisions_GaramantesWaterWells = {}
	Decisions_GaramantesWaterWells.Name = "TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_WATER_WELLS"
	Decisions_GaramantesWaterWells.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_WATER_WELLS_DESC")
	HookDecisionCivilizationIcon(Decisions_GaramantesWaterWells, "CIVILIZATION_ANCIENT_LIBYA_MOD")
	Decisions_GaramantesWaterWells.Weight = nil
	Decisions_GaramantesWaterWells.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_GaramantesWaterWells") == true then
			Decisions_GaramantesWaterWells.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_WATER_WELLS_ENACTED_DESC")
			return false, false, true
		end		

		Decisions_GaramantesWaterWells.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GARAMANTES_WATER_WELLS_DESC")
		
		local pTeam = pPlayer:GetTeam();
		if Teams[pTeam]:GetAtWarCount(true) == 0 then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetImprovementCount(iFoggaras) < 3) then return true, false end

		return true, true
	end
	)
	
	Decisions_GaramantesWaterWells.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		local FoggarasCheck = 3;
		local sPlot = 0;
		for iPlot = 0, Map.GetNumPlots() - 1, 1 do
			local pPlot = Map.GetPlotByIndex(iPlot)
			local pID = pPlayer:GetID()
			if pPlot:GetOwner() ~= -1 then
				if pPlot:GetOwner() == pID then 
					if (pPlot:GetImprovementType() == iFoggaras) then
						if FoggarasCheck > 0 then
							FoggarasCheck = FoggarasCheck - 1;
							pPlot:SetImprovementType(-1)
							if pPlot:GetFeatureType() == fFoggoras then
								pPlot:SetFeatureType(-1);
							end
							local title = "Foggara Destroyed";
							local descr = "A Foggara has been destroyed!";
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERAL, descr, title, pPlot:GetX(), pPlot:GetY());
						end
					end
				end
			end
		end

		for pCity in pPlayer:Cities() do
			if not (pCity:IsHasBuilding(bGaraDecDummy)) then
				pCity:SetNumRealBuilding(bGaraDecDummy, 1);
			end
		end

		save(pPlayer, "Decisions_GaramantesWaterWells", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"], "Decisions_GaramantesWaterWells", Decisions_GaramantesWaterWells)

local tDesert = GameInfoTypes.TERRAIN_DESERT

function GetGaramantesPlayer()		
	local pPlayer = 0;
	for xPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local xPlayer = Players[xPlayer];
		if xPlayer:IsAlive() then
			if (xPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) then
				pPlayer = xPlayer;
				break
			end
		end
	end
	return pPlayer;
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local oPlayer = Players[iPlayer];
	if (oPlayer:IsAlive()) then
		local pPlayer = GetGaramantesPlayer();
		if load(pPlayer, "Decisions_GaramantesWaterWells") == true then
			local oTeam = oPlayer:GetTeam();
			local pTeam = pPlayer:GetTeam();
			if Teams[oTeam]:IsAtWar(pTeam) then
				for oUnit in oPlayer:Units() do	
					local oPlot = oUnit:GetPlot()
					if oPlot:GetOwner() ~= -1 then
						if (Players[oPlot:GetOwner()] == pPlayer) then
							if (oPlot:GetTerrainType() == tDesert) then
								if oUnit:GetCurrHitPoints() >= 6 then
									--oUnit:ChangeDamage(math.min(oUnit:GetDamage(), 5));
									oUnit:ChangeDamage(5);
								end
							end
						end
					end
				end
			end
		end
	end
end);

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ANCIENT_LIBYA_MOD"]) then
			if load(pPlayer, "Decisions_GaramantesWaterWells") == true then
				for pCity in pPlayer:Cities() do
					if not (pCity:IsHasBuilding(bGaraDecDummy)) then
						pCity:SetNumRealBuilding(bGaraDecDummy, 1);
					end
				end
			end
		end
	end
end)