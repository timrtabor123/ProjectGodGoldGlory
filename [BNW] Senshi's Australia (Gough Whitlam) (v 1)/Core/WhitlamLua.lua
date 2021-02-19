-- Gonna be a bit of a mess cause I'm combining code from Dusklad an Tophatlad, nd code Chrisy did for other civs which I nicked
-- When there's some error someone deigns to investigate I apologise in advance :yukasperm:
--------------------------------------------------------------
include("C15_IteratorPack_v2.lua")

function JFD_IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus.SS_TAKEN or slotStatus == SlotStatus.SS_COMPUTER) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end

	return false
end
--------------------------------------------------------------
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()
--------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPActive then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
end

local civilizationID = GameInfoTypes.CIVILIZATION_SENSHI_WHITLAM
local isCivActive = JFD_IsCivilizationActive(civilizationID)
if isCivActive then
	print("Prime Minister Gough Whitlam is in this game.")
end
--------------------------------------------------------------
-- IT'S TIME
--------------------------------------------------------------
local traitWhitlamID = GameInfoTypes.TRAIT_SENSHI_WHITLAM
local speedsGAMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldenAgePercent)/100)
local numGATurns = 10
local validPolicies = {}
for row in DB.Query("SELECT ID FROM Policies WHERE Level = 3 OR Type LIKE '%FINISHER'") do
	validPolicies[row.ID] = true
end
--------------------------------------------------------------
print("Checking list of valid Policies")
for k, v in pairs(validPolicies) do
	print(k, v)
end
--------------------------------------------------------------
function DJ_WhitlamPolicyGoldenAge(playerID, policyID)
	local player = Players[playerID]
	if HasTrait(player, traitWhitlamID) then
		for k, v in pairs (validPolicies) do
			if policyID == k then
				local bonusGATurns = math.floor(speedsGAMod * numGATurns)
				player:ChangeGoldenAgeTurns(bonusGATurns)
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(DJ_WhitlamPolicyGoldenAge)

function Whitlam_AdoptPolicy(playerID, policyID)
  local pPlayer = Players[playerID]
  if HasTrait(pPlayer, traitWhitlamID) then
    local iBranch = GameInfoTypes[GameInfo.Policies[policyID].PolicyBranchType]
    if (pPlayer:GetNumPoliciesInBranch(iBranch) >= 5) then
      local bonusGATurns = (math.floor(speedsGAMod * numGATurns))
      pPlayer:ChangeGoldenAgeTurns(bonusGATurns)
    end
  end
end
GameEvents.PlayerAdoptPolicy.Add(Whitlam_AdoptPolicy)

local tSpecialists = {}
local iTableNum = 1
for row in DB.Query("SELECT * FROM Specialists WHERE Type <> 'SPECIALIST_CITIZEN'") do
    tSpecialists[iTableNum] = {Type = row.ID, Bonus = row.GreatPeopleRateChange}
    iTableNum = iTableNum + 1
end

local iCiv = GameInfoTypes["CIVILIZATION_SENSHI_WHITLAM"]
local iYieldDummy = GameInfoTypes["BUILDING_SENSHI_WHITLAM_GOLDEN_AGE"]

function Whitlam_DoubleGPP(playerID)
    local pPlayer = Players[playerID]
    if pPlayer:GetCivilizationType() == iCiv then
        if pPlayer:IsGoldenAge() then
            for pCity in pPlayer:Cities() do
                if pPlayer:GetCapitalCity() == pCity then
                  pCity:SetNumRealBuilding(iYieldDummy, 1)
                else
                  pCity:SetNumRealBuilding(iYieldDummy, 0)
                end
                for k, v in ipairs(tSpecialists) do
                    local iSpecNum = (pCity:GetSpecialistCount(v.Type) * v.Bonus * 100)
                    pCity:ChangeSpecialistGreatPersonProgressTimes100(v.Type, iSpecNum)
                end
            end
        else
            if pPlayer:CountNumBuildings(iYieldDummy) > 0 then
              for pCity in pPlayer:Cities() do
                  pCity:SetNumRealBuilding(iYieldDummy, 0)
                  if (pPlayer:CountNumBuildings(iYieldDummy) == 0) then return end
              end
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(Whitlam_DoubleGPP)
--------------------------------------------------------------
-- GAF NOMAD
--------------------------------------------------------------
local iPlane = GameInfoTypes["UNIT_SENSHI_GAF_NOMAD"]
local iPlaneClass = GameInfoTypes[GameInfo.Units[iPlane].Class]
local iPlaneDummy = GameInfoTypes["BUILDING_SENSHI_WHITLAM_PLANE_DUMMY"]

function C15_PlaneHandle(pPlayer)
	if pPlayer:GetUnitClassCount(iPlaneClass) ~= pPlayer:CountNumBuildings(iPlaneDummy) then
		for pCity in pPlayer:Cities() do
			local iCount = 0
			for pUnit in C15_PlotUnitsIterator(pCity:Plot()) do
				if pUnit:GetUnitType() == iPlane then
					iCount = iCount + 1
				end
			pCity:SetNumRealBuilding(iPlaneDummy, iCount)
			end
		end
	end
end

function Whitlam_NomadDummy(playerID)
	local pPlayer = Players[playerID]
	C15_PlaneHandle(pPlayer)
end

GameEvents.PlayerDoTurn.Add(Whitlam_NomadDummy)

function Whitlam_SetXY(playerID, unitID, iX, iY) -- Hopefully planes proc this when they rebase
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit and pUnit:GetUnitType() == iPlane then
		C15_PlaneHandle(pPlayer)
	end
end

GameEvents.UnitSetXY.Add(Whitlam_SetXY)
--------------------------------------------------------------
-- NATIONAL GALLERY
--------------------------------------------------------------
local buildingNationalGalleryID = GameInfoTypes.BUILDING_SENSHI_NATIONAL_GALLERY
local buildingclassMuseumID = GameInfoTypes.BUILDINGCLASS_MUSEUM
local buildingGalleryHappinessID = GameInfoTypes.BUILDING_SENSHI_GALLERY_HAPPINESS
--------------------------------------------------------------
function DJ_NationalGalleryHappiness(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilizationID and player:IsAlive()) then
		for city in player:Cities() do
			if city:IsHasBuilding(buildingNationalGalleryID) then
				local defBonus = city:GetNumGreatWorksInBuilding(buildingclassMuseumID)
				if defBonus >= 3 then
					city:SetNumRealBuilding(buildingGalleryHappinessID, defBonus*2)
				else
					city:SetNumRealBuilding(buildingGalleryHappinessID, defBonus)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DJ_NationalGalleryHappiness)