-- CatherineFunctions
-- Author: Nuclear Consensus
-- DateCreated: 8/11/2018 3:36:55 PM
--------------------------------------------------------------
-- Included Files
--------------------------------------------------------------
include("PlotIterators.lua")
include("FLuaVector.lua")
--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus.SS_TAKEN or slotStatus == SlotStatus.SS_COMPUTER) then
			if PreGame.GetCivilization(iSlot) == civilisationCatherineID then
				return true
			end
		end
	end

	return false
end

function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()

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
-- Localized Variables
--------------------------------------------------------------
local civilizationID = GameInfoTypes.CIVILIZATION_RUSSIA
local isCivActive = JFD_IsCivilisationActive(civilizationID)

local traitCatherineID = GameInfoTypes.TRAIT_DJ_NAKAZ
local buildingCatherineProductionID = GameInfoTypes.BUILDING_DJ_CATHERINE_PRODUCTION

local buildingFinishingSchoolID = GameInfoTypes.BUILDING_DJ_FINISHING_SCHOOL
local buildingFinishingGPID = GameInfoTypes.BUILDING_DJ_FINISHING_GP
local validGuilds = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE Type LIKE '%GUILD'") do
	validGuilds[row.ID] = true
end

if isCivActive then
	print("Empress Catherine II is in this game.")
end
--------------------------------------------------------------
-- DJ_CatherineII_OnCityConstructed
--------------------------------------------------------------
function DJ_CatherineII_OnCityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinor() or player:IsBarbarian() then return end
	-- IMPERIAL INSTRUCTIONS
	if HasTrait(player, traitCatherineID) then
		local building = GameInfo.Buildings[buildingID]
		local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
		if buildingClass.MaxGlobalInstances ~= -1 or buildingClass.MaxPlayerInstances ~= -1 then return end
		local city = player:GetCityByID(playerID)
		local cityPlot = city:Plot()
		local cityGarrison = cityPlot:GetUnit()
		if cityGarrison and cityGarrison:IsGreatPerson() then
			local isClaimTwice = false
			if city:GetWeLoveTheKingDayCounter() > 0 then
				isClaimTwice = true
			end
			local cityPlot = city:Plot()
			local isPlayerHuman = player:IsHuman() and player:IsTurnActive()
			if isClaimTwice then
				if isPlayerHuman then
					local plot = city:GetNextBuyablePlot()
					local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
					Events.GameplayFX(hex.x, hex.y, -1)
				end
				city:DoJONSCultureLevelIncrease()
			end
			if isPlayerHuman then
				local plot = city:GetNextBuyablePlot()
				local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
				Events.GameplayFX(hex.x, hex.y, -1)
			end
			city:DoJONSCultureLevelIncrease()
		end
	end
end

GameEvents.CityConstructed.Add(DJ_CatherineII_OnCityConstructed)
--------------------------------------------------------------
-- DJ_CatherineII_OnPlayerDoTurn
--------------------------------------------------------------
function DJ_CatherineII_OnPlayerDoTurn(playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinor() or player:IsBarbarian() then return end
	-- IMPERIAL INSTRUCTIONS
	if HasTrait(player, traitCatherineID) then
		for city in player:Cities() do
			local numBonus = 1
			if city:GetWeLoveTheKingDayCounter() > 0 then
				numBonus = 2
			end
			local cityPlot = city:Plot()
			local cityGarrison = cityPlot:GetUnit()
			if cityGarrison and cityGarrison:IsGreatPerson() then
				city:SetNumRealBuilding(buildingCatherineProductionID, numBonus)
			end
		end
	end
	-- FINISHING SCHOOL
	for city in player:Cities() do
		if city:IsHasBuilding(buildingFinishingSchoolID) then
			for k,v in pairs(validBuildings) do
				if city:IsHasBuilding(k) then
					city:SetNumRealBuilding(buildingFinishingGPID, 1)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DJ_CatherineII_OnPlayerDoTurn)
--------------------------------------------------------------
print("CatherineFunctions.lua loaded successfully!")