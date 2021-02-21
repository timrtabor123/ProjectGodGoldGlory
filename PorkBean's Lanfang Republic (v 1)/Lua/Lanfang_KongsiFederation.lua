--------------------
--PorkBean's Lanfang Republic
--Trait: Kongsi Federation
--------------------

include("NewSaveUtils");

local iLanfangCiv = GameInfoTypes.CIVILIZATION_PB_LANFANG;
local iLanfangDummyBuilding = GameInfoTypes.BUILDING_LF_KONGSI_DUMMY; --hidden building, flags city as having 4 or more mines
local iLanfangDummyBuildingClass = GameInfoTypes.BUILDINGCLASS_LF_KONGSI_DUMMY; --buildingclass of hidden building, used for counting total
local impMine = GameInfoTypes["IMPROVEMENT_MINE"];
local impQuarry = GameInfoTypes["IMPROVEMENT_QUARRY"];
local pbFreedom = "POLICY_BRANCH_FREEDOM";
local notificationDummy = GameInfoTypes["BUILDING_LF_NOTIFICATION_DUMMY"];
local iMineCount = 0;
local iRequiredCities = 1;

local PolT = {}
local TenT = {}

for row in GameInfo.Policies() do
	if (row.IconAtlasAchieved) and (not row.PolicyBranchType) and (row.CultureCost == 0) and (not string.gmatch("_X", row.Type)) then
		PolT[row.ID] = false;
	elseif row.PolicyBranchType == pbFreedom then
		TenT[row.ID] = false;
	end
end

for row in GameInfo.PolicyBranchTypes() do
	if row.FreePolicy then
		PolT[GameInfoTypes[row.FreePolicy]] = row.ID;
	end
end

function Lanfang_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--checks if city is working 4 or more mines/quarries, if so, grant 1 of dummy building
function LanfangMinesCheck(iPlayer)
	local pPlayer = Players[iPlayer];	
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iLanfangCiv then
		for pCity in pPlayer:Cities() do
		iMineCount = 0
			for i = 0, pCity:GetNumCityPlots()-1, 1 do --iterate the plots in a city (credit whoward69)
				local pPlot = pCity:GetCityIndexPlot(i)
				if (pPlot) then
					if pPlot:IsBeingWorked() then
						if pPlot:GetWorkingCity() == pCity then
							if not pPlot:IsImprovementPillaged() then
								if pPlot:GetImprovementType(-1) == impMine then
									iMineCount = iMineCount+1
								elseif pPlot:GetImprovementType(-1) == impQuarry then
									iMineCount = iMineCount+1
								end							
							end
						end
					end
				end
			end
			if iMineCount >= 3 then
				print(pCity, " has 3 or more mines, granting dummy building")
				pCity:SetNumRealBuilding(iLanfangDummyBuilding, 1);
			else
				print(pCity, " has fewer than 3 mines, removing dummy building")
				pCity:SetNumRealBuilding(iLanfangDummyBuilding, 0);
			end
		end
	end
end

--at the end of the turn, check if requirements are met for new random policy (count number of dummy buildings)
function LanfangPolicyCheck(iPlayer)
    local pPlayer = Players[iPlayer];
	if GetPersistentProperty("persRequiredCities") then
		iRequiredCities = GetPersistentProperty("persRequiredCities")
	end
    if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iLanfangCiv then
        if (pPlayer:GetBuildingClassCount(iLanfangDummyBuildingClass) == iRequiredCities) then
            print("Lanfang has met the required ", iRequiredCities, " cities working 3 or more mines for the next policy")
            LanfangPolicyGrant(iPlayer);
            iRequiredCities = iRequiredCities+1 --increases required number of cities working 4 or more mines
			SetPersistentProperty("persRequiredCities", iRequiredCities)
            pPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_BEATEN, Locale.ConvertTextKey('TXT_KEY_TRAIT_LF_KONGSI_FEDERATION_GRANTED_POLTREE', iRequiredCities), Locale.ConvertTextKey('TXT_KEY_TRAIT_LF_KONGSI_FEDERATION_GRANTED_SHORT'), -1, -1, notificationDummy, -1);
            print("Next policy requires ", iRequiredCities, " cities working 3 or more mines")
        end
    end
end


---determines if lanfang should receive a policy tree or freedom tenant, chooses at random and grants (code derived from LastSword's Casimir IV of Poland)
function LanfangPolicyGrant(iPlayer)
	local hTab = {}
	local tTab = {}
	for polID, isOpener in pairs(PolT) do
		if not Players[iPlayer]:HasPolicy(polID) then
			table.insert(hTab, polID)
		end
	end
	for polID, isOpener in pairs(TenT) do
		if not Players[iPlayer]:HasPolicy(polID) then
			table.insert(tTab, polID)
		end
	end	
	print("social policy openers to choose from: ", #hTab)
	print("social tenets to choose from: ", #tTab)
	if #hTab > 0 then --if there are social policy trees remaining, choose one at random and unlock
		local luckyPolicty = hTab[Lanfang_GetRandom(1, #hTab)];
		Players[iPlayer]:SetNumFreePolicies(1)
        Players[iPlayer]:SetNumFreePolicies(0)
		if PolT[luckyPolicty] then
			Players[iPlayer]:SetPolicyBranchUnlocked(PolT[luckyPolicty], true)
		end
		Players[iPlayer]:SetHasPolicy(luckyPolicty, true);
		print("policy", luckyPolicty, "unlocked")
	else if #tTab > 0 then --if there are no social policy trees remaining, choose a random freedom tenet
		local luckyTenety = tTab[Lanfang_GetRandom(1, #tTab)];
		Players[iPlayer]:SetNumFreePolicies(1)
        Players[iPlayer]:SetNumFreePolicies(0)
		
		Players[iPlayer]:SetHasPolicy(luckyTenety, true);
		print("tenet", luckyTenety, "unlocked")
	end
end
end



GameEvents.PlayerDoTurn.Add(LanfangMinesCheck);
GameEvents.PlayerDoTurn.Add(LanfangPolicyCheck);