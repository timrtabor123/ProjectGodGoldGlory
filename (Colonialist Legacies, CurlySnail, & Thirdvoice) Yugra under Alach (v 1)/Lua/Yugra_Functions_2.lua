-- Yugra_Functions
-- Author: User
-- DateCreated: 4/4/2019 6:06:16 PM
--------------------------------------------------------------
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetDistance	= Map.GetDistance
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if g_IsCPActive then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end
	return false
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--Game_IsAAActive
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
local civilizationID 		= GameInfoTypes["CIVILIZATION_CTCL_YUGRA"]
local traitYugraID			= GameInfoTypes["TRAIT_CTCL_LUXSACRIFICE"]
local buildingNevedID		= GameInfoTypes["BUILDING_CTCL_NEVED"]
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
----------------------------------------
-- SACRIFICIES TO THE WORLD SURVEYOR --
----------------------------------------
--Tiles containing Luxury Resources provide a +50% Defensive bonus
local promotionArmorID = GameInfoTypes["PROMOTION_CS_BONUSARMOR"]
local tableLuxes = {}
for row in DB.Query("SELECT * FROM Resources WHERE (ResourceClassType = 'RESOURCECLASS_LUXURY');") do
	tableLuxes[GameInfoTypes[row.Type]] = true
end
function Yugra_WorldSurveyor_UnitSetXY(playerID, unitID, unitX, unitY)
    local player = Players[playerID]
    if (not HasTrait(player, traitYugraID)) then return end
    local unit = player:GetUnitByID(unitID)
    if (not unit) then return end
    local plot = Map.GetPlot(unitX, unitY)
	print("Check WS 0")
    if plot and tableLuxes[plot:GetResourceType()] then
		print("Check WS 1")
        if player:GetResourceExport(plot:GetResourceType()) > 0 then
			print("Check WS 2")
            if (not unit:IsHasPromotion(promotionArmorID)) then
                unit:SetHasPromotion(promotionArmorID, true)
            end
		else
			unit:SetHasPromotion(promotionArmorID, false)
		end
    else
        unit:SetHasPromotion(promotionArmorID, false)
    end
end
GameEvents.UnitSetXY.Add(Yugra_WorldSurveyor_UnitSetXY)
--Cities founded on Luxury Resources generate Great Artist Points
local buildingSettlerMarkerID = GameInfoTypes["BUILDING_CS_YUGRA_LUXURY_SETTLE"]
local specialistArtistID = GameInfo.Specialists["SPECIALIST_ARTIST"].ID
function Yugra_WorldSurveyor_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not HasTrait(player, traitYugraID)) then return end
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if tableLuxes[plot:GetResourceType()] then
		if city:GetReligiousMajority() > 0 then
			city:SetNumRealBuilding(buildingSettlerMarkerID, 1)
		end
	end
end
GameEvents.PlayerCityFounded.Add(Yugra_WorldSurveyor_PlayerCityFounded)

function Yugra_WorldSurveyor_CityConvertsReligion(playerID, religionID, iX, iY)
    local city = Map.GetPlot(iX, iY):GetPlotCity()
    if (not city) then return end
    if religionID > 0 then
        city:SetNumRealBuilding(buildingSettlerMarkerID, 1)
    else
        city:SetNumRealBuilding(buildingSettlerMarkerID, 0)
    end
end
GameEvents.CityConvertsReligion.Add(Yugra_WorldSurveyor_CityConvertsReligion)

function Yugra_WorldSurveyor_PlayerDoTurn(playerID)
    local player = Players[playerID]
    if (not HasTrait(player, traitYugraID)) then return end
    for city in player:Cities() do
        if city:IsHasBuilding(buildingSettlerMarkerID) then
          city:ChangeSpecialistGreatPersonProgressTimes100(specialistArtistID, (city:GetPopulation() * 50))
        end
    end
    for unit in player:Units() do
        local iFaithGain = 0
        if unit:IsHasPromotion(promotionArmorID) then
            iFaithGain = iFaithGain + 2
        end
        player:ChangeFaith(iFaithGain)
    end
end
GameEvents.PlayerDoTurn.Add(Yugra_WorldSurveyor_PlayerDoTurn)
--Settlers born in these Cities provide a Great Work of Art slot to Cities they found.
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local promotionYugraSettlerID = GameInfoTypes["PROMOTION_CS_YUGRA_SETTLER"]
local buildingYugraGreatWorkID = GameInfoTypes["BUILDING_CS_YUGRA_ART"]
function Yugra_WorldSurveyor_CityTrained(playerID, cityID, unitID, isGold, isFaithOrCulture)
	if isGold or isFaithOrCulture then return end
	local player = Players[playerID]
	if (not HasTrait(player, traitYugraID)) then return end
	local unit = player:GetUnitByID(unitID)
	local city = player:GetCityByID(cityID)
	if (not city:IsHasBuilding(buildingSettlerMarkerID)) then return end
	if (not unit:GetUnitType() == unitSettlerID) then return end
	unit:SetHasPromotion(promotionYugraSettlerID, true)
end
GameEvents.CityTrained.Add(Yugra_WorldSurveyor_CityTrained)

function Yugra_WorldSurveyor_UnitPreKill(playerID, unitID,	unitType, plotX, plotY, isDelay, killingPlayerID)
	if (not isDelay) then return end
	local player = Players[playerID]
	if (not HasTrait(player, traitYugraID)) then return end
	print("Trait cleared")
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	local unit = player:GetUnitByID(unitID)
	if (not unit:GetUnitType() == unitSettlerID) then return end
	print("UnitType cleared")
	if (not unit:GetPlot() == plot) then return end
	print("Plot cleared")
	if (not unit:IsHasPromotion(promotionYugraSettlerID)) then return end
	print("PromotionCleared")
	if (not city) or (city:IsCapital()) then return end
	city:SetNumRealBuilding(buildingYugraGreatWorkID, 1)
	print("City Success")
end
GameEvents.UnitPrekill.Add(Yugra_WorldSurveyor_UnitPreKill)
-------------------
-- MOOSE CAVALRY --
-------------------
local promotionBlitzID = GameInfoTypes["PROMOTION_CS_BONUSATTACK"]
local unitCombatMounted = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local improvementCampID = GameInfoTypes["IMPROVEMENT_CAMP"]
--Gains the Heavy Charge promotion when beginning turn on a Luxury Resource in friendly territory
local unitMoose = GameInfoTypes["UNIT_CTCL_MOOSECAV"]
local unitclassKnight = GameInfoTypes["UNITCLASS_KNIGHT"]

function Yugra_MooseCavalry_HeavyCharge(playerID)
	local player = Players[playerID]
	if not player:HasUnitOfClassType(unitclassKnight) then return end
	for unit in player:Units() do
		if unit:GetUnitType() == unitMoose then
			unit:SetHasPromotion(promotionBlitzID, false)
			local plot = unit:GetPlot()
			if plot then
				print("Check Moose 1")
				if (plot:GetOwner() == playerID) and (plot:GetNumResource() > 0) then
					print("Check Moose 2")
					if tableLuxes[plot:GetResourceType()] then
						unit:SetHasPromotion(promotionBlitzID, true)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(Yugra_MooseCavalry_HeavyCharge)

--Cities can train Moose Cavalry
function Yugra_MooseCavalry_CityCanTrain(playerID, cityID, unitType)
    if unitType == unitMoose then
        local player = Players[playerID]
        local city = player:GetCityByID(cityID)
        for ID = 0, city:GetNumCityPlots()-1, 1 do
            local plot = city:GetCityIndexPlot(ID)
            if plot and plot:GetImprovementType() == improvementCampID then
                return true
            end
        end
        return false
    end
    return true
end
GameEvents.CityCanTrain.Add(Yugra_MooseCavalry_CityCanTrain)

--Requires a Camp in city radius rather than Horses.
local buildingMooseTrain = GameInfoTypes["BUILDING_CS_MOOSETRAIN"]
function Yugra_MooseCavalry_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local numCamps = 0
	for city in player:Cities() do
		for ID = 0, city:GetNumCityPlots()-1, 1 do
			local plot = city:GetCityIndexPlot(ID)
			if plot and plot:GetImprovementType() == improvementCampID then
				numCamps = numCamps + 1	
				city:SetNumRealBuilding(buildingMooseTrain, (numCamps + player:GetNumResourceAvailable(resourceCaviarID)))
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Yugra_MooseCavalry_PlayerDoTurn)

--Double Experience when all resources are traded away
local expPromo = GameInfoTypes["PROMOTION_CS_BONUSEXP"]

function Yugra_MooseCav_Check(playerID)
	player = Players[playerID]
	for k, v in pairs(tableLuxes) do
		if player:GetNumResourceTotal(k, false) > 0 then
			local tableResource = {}
			tableResource[k] = false
			if (player:GetResourceExport(k) > 0) then
				tableResource[k] = true
			end
			if not tableResource[k] then
				print("Resource Failed")
				return false
			end
		end
	end
	return true
end

function Yugra_MooseCav_DoubleEXP(playerID)
	local player = Players[playerID]
	if (not HasTrait(player, traitYugraID)) then return end
	
	local resBool = Yugra_MooseCav_Check(playerID)
	print("Event Check")

	for unit in player:Units() do
		if unit:GetUnitType() == unitMoose then
			print("EXP Check")
			if resBool then
				print("EXP Success")
				unit:SetHasPromotion(expPromo, true)
			else
				print("EXP Fail")
				unit:SetHasPromotion(expPromo, false)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(Yugra_MooseCav_DoubleEXP)

-----------
-- NEVED --
-----------
--An additional +5% of Food is carried over after growth for each type of Luxury Resource worked by the City
local buildingNevedStoreID = GameInfoTypes["BUILDING_CS_NEVED_STORE"]
function Yugra_Neved_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not HasTrait(player, traitYugraID)) then return end
		for city in player:Cities() do
		local numLuxes = 0
		if (not city:IsHasBuilding(buildingNevedID)) then return end
		for ID = 0, city:GetNumCityPlots()-1, 1 do
			local plot = city:GetCityIndexPlot(ID)
			if tableLuxes[plot:GetResourceType()] then
				if plot:IsBeingWorked() then
					numLuxes = numLuxes + 1
				end
			end
		end
		city:SetNumRealBuilding(buildingNevedStoreID, numLuxes)
	end
end
GameEvents.PlayerDoTurn.Add(Yugra_Neved_PlayerDoTurn)
--Spawns a Caviar Luxury Resource on an available freshwater tile in the city radius.
local resourceCaviarID = GameInfoTypes["RESOURCE_CS_CAVIAR"]
local marshID = GameInfoTypes["FEATURE_MARSH"]

function Yugra_Neved_CityConstructed(playerID, cityID, buildingID)
	if buildingID == buildingNevedID then
		local player = Players[playerID]
		if (not HasTrait(player, traitYugraID)) then return end
		local city = player:GetCityByID(cityID)
		for ID = 0, city:GetNumCityPlots()-1, 1 do
			local plot = city:GetCityIndexPlot(ID)
			if (plot:IsFreshWater()) and (plot:GetResourceType() == -1) and (not plot:IsCity()) and (not plot:IsRoughGround()) then
				plot:SetResourceType(resourceCaviarID) 
				plot:SetFeatureType(marshID)
				return
			end
		end
	end
end
GameEvents.CityConstructed.Add(Yugra_Neved_CityConstructed)
--==========================================================================================================================			
--==========================================================================================================================