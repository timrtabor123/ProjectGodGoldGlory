-- AlexIIIFunctions
-- Author: DuskJockey
-- DateCreated: 12/2/2019 10:10:02 PM
--------------------------------------------------------------
-- GLOBALS
--------------------------------------------------------------
include("FLuaVector.lua")
include("AdditionalAchievementsUtility.lua")
--------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------
function JFD_IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
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
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
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
--------------------------------------------------------------
local civilizationID  = GameInfoTypes["CIVILIZATION_DJ_ALBA"]
local isCivActive	  = JFD_IsCivilizationActive(civilizationID)
if isCivActive then
	print("Alexander III is in this game.")
end
--------------------------------------------------------------
-- TREATY OF PERTH
--------------------------------------------------------------
local traitAlexIIIID = GameInfoTypes["TRAIT_DJ_TREATY_OF_PERTH"]
local buildingNavalCultureID = GameInfoTypes["BUILDING_DJ_NAVAL_CULTURE"]
local buildingGAMarkerID = GameInfoTypes["BUILDING_DJ_GA_MARKER"]
local speedsGAMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldenAgePercent)/100)
local defensiveBuildings = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE Defense > 0 AND Capital = 0 AND GreatWorkCount >= 0 AND WonderSplashImage IS NULL") do
	defensiveBuildings[row.ID] = true
end
--------------------------------------------------------------
print("Checking list of defensive Buildings")
table.sort(defensiveBuildings)
for k, v in pairs(defensiveBuildings) do
	print (k, v)
end
--------------------------------------------------------------
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
--------------------------------------------------------------
function DJ_DefenseInfraUnits(playerID, cityID, buildingID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if HasTrait(player, traitAlexIIIID) and player:IsAlive() then
		if player:IsGoldenAge() then
			for k, v in pairs(defensiveBuildings) do
				if buildingID == k then
					local city = player:GetCityByID(cityID)
					local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
					player:InitUnit(unitID, city:GetX(), city:GetY())
				end
			end
		end
	end
end
if isCivActive then
	GameEvents.CityConstructed.Add(DJ_DefenseInfraUnits)
end
--------------------------------------------------------------
function DJ_AlexIIIOnPeaceGoldenAge(teamID, otherTeamID)
	local team = Teams[teamID]
	local otherTeam = Teams[otherTeamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	local otherPlayerID = otherTeam:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	local rawBonus = 7
	if otherPlayer:IsMinorCiv() or player:IsMinorCiv() then return end
	if HasTrait(player, traitAlexIIIID) and player:IsAlive() then
		local numMarkers = player:CountNumBuildings(buildingGAMarkerID)
		if numMarkers > 0 then
			rawBonus = rawBonus + numMarkers
		end
		local bonus = math.floor(rawBonus * speedsGAMod)
		player:ChangeGoldenAgeTurns(bonus)
		print("A Golden Age has begun for Scotland")
		for city in player:Cities() do
			if city:GetNumRealBuilding(buildingGAMarkerID) > 0 then
				city:SetNumRealBuilding(buildingGAMarkerID, 0)
			end
		end
	elseif HasTrait(otherPlayer, traitAlexIIIID) and otherPlayer:IsAlive() then
		local numMarkers = otherPlayer:CountNumBuildings(buildingGAMarkerID)
		if numMarkers > 0 then
			rawBonus = rawBonus + numMarkers
		end
		local bonus = math.floor(rawBonus * speedsGAMod)
		otherPlayer:ChangeGoldenAgeTurns(bonus)
		print("A Golden Age has begun for Scotland")
		for city in otherPlayer:Cities() do
			if city:GetNumRealBuilding(buildingGAMarkerID) > 0 then
				city:SetNumRealBuilding(buildingGAMarkerID, 0)
			end
		end
	end	
end

if isCivActive then
	GameEvents.MakePeace.Add(DJ_AlexIIIOnPeaceGoldenAge)
end
--------------------------------------------------------------
-- LYMPHAD
--------------------------------------------------------------
local unitLymphadID = GameInfoTypes["UNIT_DJ_LYMPHAD"]
local buildingLymphadTrainingID = GameInfoTypes["BUILDING_DJ_LYMPHAD_TRAINING"]
local promotionExtraAttackID = GameInfoTypes["PROMOTION_EXTRA_ATTACK"]
--------------------------------------------------------------
function DJ_LymphadBonuses(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID and player:IsAlive() then
		for city in player:Cities() do
			if player:IsGoldenAge() then
				city:SetNumRealBuilding(buildingLymphadTrainingID, 1)
			else
				if city:GetNumRealBuilding(buildingLymphadTrainingID) > 0 then
					city:SetNumRealBuilding(buildingLymphadTrainingID, 0)
				end
			end
		end
	end
	for unit in player:Units() do
		if unit:GetUnitType() == unitLymphadID then
			print("Unit is a Lymphad")
			local unitPlot = unit:GetPlot()
			local plotOwner = unitPlot:GetOwner()
			local unitOwner = unit:GetOwner()
			local hasPromotion = false
			if unitPlot and plotOwner ~= -1 then
				print("Lymphad not on neutral territory")
				if plotOwner == unitOwner then
					hasPromotion = true
					print("Lymphad is in friendly territory; adding promotion")
				end
			end
			unit:SetHasPromotion(promotionExtraAttackID, hasPromotion)
			if hasPromotion == true then
				unit:ChangeMoves(60)
			end
		end
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(DJ_LymphadBonuses)
end
--------------------------------------------------------------
-- GAISGEACH
--------------------------------------------------------------
local unitGaisgeachID = GameInfoTypes["UNIT_DJ_GAISGEACH"]
local buildingGaisgeachProdID = GameInfoTypes["BUILDING_DJ_GAISGEACH_PROD"]
--------------------------------------------------------------
function DJ_GaisgeachBonus(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		local unitGarrison = city:GetGarrisonedUnit()
		if unitGarrison and unitGarrison:GetUnitType() == unitGaisgeachID then
			if city:IsProductionBuilding() then
				local bonus = unitGarrison:GetLevel()
				city:SetNumRealBuilding(buildingGaisgeachProdID, bonus)
				print(city:GetName() .. " now has " .. bonus .. " Gaisgeach dummy buildings")
			end
		elseif city:GetNumRealBuilding(buildingGaisgeachProdID) > 0 then
			city:SetNumRealBuilding(buildingGaisgeachProdID, 0)
		end
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(DJ_GaisgeachBonus)
end
--------------------------------------------------------------
-- ADDITIONAL ACHIEVEMENT
--------------------------------------------------------------
local leaderAlexIID = GameInfoTypes["LEADER_JFD_ALEXANDER_I"]
local leaderBradPittID = GameInfoTypes["LEADER_ALEXANDER"]
local achievementAlbaSpecialID = GameInfoTypes["AA_DJ_ALBA_SPECIAL"]
--------------------------------------------------------------
function DJ_AlbaAASpecial(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID and player:IsAlive() then
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local isAlexIDoF = false
			local isBradPittDoF = false
			if otherPlayer:GetLeaderType() == leaderAlexIID and otherPlayer:IsDoF(playerID) then
				isAlexIDoF = true
			end
			if otherPlayer:GetLeaderType() == leaderBradPittID and otherPlayer:IsDoF(playerID) then
				isBradPittDoF = true
			end
			if isAlexIDoF and isBradPittDoF then
				UnlockAA(achievementAlbaSpecialID)
			end
		end
	end
end

if not IsAAUnlocked(achievementAlbaSpecialID) and isCivActive then
	GameEvents.PlayerDoTurn.Add(DJ_AlbaAASpecial)
end
--------------------------------------------------------------
print("AlbaFunctions.lua loaded successfully!")