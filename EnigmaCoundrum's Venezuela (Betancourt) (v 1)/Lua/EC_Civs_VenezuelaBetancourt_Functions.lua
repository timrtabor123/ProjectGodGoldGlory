-- EC_Civs_VenezuelaBetancourt_Functions
-- Author: EC
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
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
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildinOilAdvisoryID = GameInfoTypes["BUILDING_EC_OIL_ADVISORY"]

local traitVenezuelaBetancourtID = GameInfoTypes["TRAIT_EC_VENEZUELA_BETANCOURT"]

local unitBeautyQueenID = GameInfoTypes["UNIT_EC_BEAUTY_QUEEN"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--EC_VenezuelaBetancourt_PlayerDoTurn
local buildingColosseumID = GameInfoTypes["BUILDING_COLOSSEUM"]
local buildingStadiumID = GameInfoTypes["BUILDING_STADIUM"]
local buildingTavernID = GameInfoTypes["BUILDING_EE_TAVERN"]
local buildingMenagerieID = GameInfoTypes["BUILDING_EE_MENAGERIE"]
local buildingZooID = GameInfoTypes["BUILDING_THEATRE"]
local buildingDummyOilAdvisory1ID = GameInfoTypes["BUILDING_DUMMY_EC_OIL_ADVISORY_1"]
local buildingDummyOilAdvisory2ID = GameInfoTypes["BUILDING_DUMMY_EC_OIL_ADVISORY_2"]
local buildingDummyVenezuelaBetancourtArtist1ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1"]
local buildingDummyVenezuelaBetancourtArtist2ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2"]
local buildingDummyVenezuelaBetancourtArtist3ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3"]
local buildingDummyVenezuelaBetancourtArtist4ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4"]
local buildingDummyVenezuelaBetancourt1ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_1"]
local buildingDummyVenezuelaBetancourt2ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_2"]
local buildingDummyVenezuelaBetancourt3ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_3"]
local buildingDummyVenezuelaBetancourt4ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_4"]
local buildingDummyVenezuelaBetancourt5ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_5"]
local buildingDummyVenezuelaBetancourt6ID = GameInfoTypes["BUILDING_DUMMY_VENEZUELA_BETANCOURT_6"]
local specialistMerchantID = GameInfoTypes["SPECIALIST_MERCHANT"]
local yieldGoldID = GameInfoTypes["YIELD_GOLD"]
local yieldScienceID = GameInfoTypes["YIELD_SCIENCE"]

local happinessBuildings = {}
	happinessBuildings[buildingColosseumID] = buildingDummyVenezuelaBetancourtArtist1ID
	happinessBuildings[buildingStadiumID] = buildingDummyVenezuelaBetancourtArtist4ID
	if (not buildingMenagerieID) then
		happinessBuildings[buildingZooID] = buildingDummyVenezuelaBetancourtArtist3ID
	end
	if buildingMenagerieID then
		happinessBuildings[buildingMenagerieID] = buildingDummyVenezuelaBetancourtArtist3ID
	end
	if buildingTavernID then
		happinessBuildings[buildingTavernID] = buildingDummyVenezuelaBetancourtArtist2ID
	end
local function EC_VenezuelaBetancourt_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UNIQUE ABILITY
	if (not HasTrait(player, traitVenezuelaBetancourtID)) then return end

	local numDoFs = 0
	local numPro = 0
	local numGol = 0
	local numFai = 0
	local numFoo = 0
	local numCul = 0
	local numSci = 0
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsAlive() then
			local otherPlayerTeamID = otherPlayer:GetTeam()
			if player:IsDoF(otherPlayerID) or otherPlayer:IsDoF(playerID) then
				numDoFs = numDoFs + 1
				local otherCapital = otherPlayer:GetCapitalCity()
				if otherCapital then
					numPro = g_MathFloor((otherCapital:GetCurrentProductionDifference()*5)/100)
					numGol = g_MathFloor((otherCapital:GetYieldRate(yieldGoldID)*5)/100)
					numFai = g_MathFloor((otherCapital:GetFaithPerTurn()*5)/100)
					numFoo = g_MathFloor((otherCapital:FoodDifference()*5)/100)
					numCul = g_MathFloor((otherCapital:GetJONSCulturePerTurn()*5)/100)
					numSci = g_MathFloor((otherCapital:GetYieldRate(yieldScienceID)*5)/100)
				end
			end
		end
	end
	local numAllies = 0
	for otherPlayerID = 0, defineMaxMinorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsAlive() and otherPlayer:GetCapitalCity() then
			if otherPlayer:IsAllies(playerID) then
				numAllies = numAllies + 1
			end
		end
	end
	playerCapital:SetNumRealBuilding(buildingDummyVenezuelaBetancourt1ID, numPro)
	playerCapital:SetNumRealBuilding(buildingDummyVenezuelaBetancourt5ID, numGol)
	playerCapital:SetNumRealBuilding(buildingDummyVenezuelaBetancourt6ID, numFai)
	playerCapital:SetNumRealBuilding(buildingDummyVenezuelaBetancourt4ID, numFoo)
	playerCapital:SetNumRealBuilding(buildingDummyVenezuelaBetancourt2ID, numCul)
	playerCapital:SetNumRealBuilding(buildingDummyVenezuelaBetancourt3ID, numSci)

	--UNIQUE BUILDING
	for city in player:Cities() do
		local numDum1 = 0
		local numDum2 = 0
		if city:IsHasBuilding(buildinOilAdvisoryID) then
			numDum1 = numDoFs
			numDum2 = numAllies
		end		
		city:SetNumRealBuilding(buildingDummyOilAdvisory1ID, numDum1)
		city:SetNumRealBuilding(buildingDummyOilAdvisory2ID, numDum2)

		for buildingID, dummyBuildingID in pairs(happinessBuildings) do
			if city:IsHasBuilding(buildingID) then
				if (not city:IsHasBuilding(dummyBuildingID)) then
					city:SetNumRealBuilding(dummyBuildingID, 1)
				end
				if city:GetNumSpecialistsInBuilding(dummyBuildingID) > 0 then
					city:ChangeSpecialistGreatPersonProgressTimes100(specialistMerchantID, 100)
				end
			else
				if city:IsHasBuilding(dummyBuildingID) then
					city:SetNumRealBuilding(dummyBuildingID, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(EC_VenezuelaBetancourt_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--EC_VenezuelaBetancourt_CityConstructed
function EC_VenezuelaBetancourt_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local city = player:GetCityByID(cityID)
	local plot = g_MapGetPlot(city:GetX(), city:GetY())

	--UNIQUE ABILITY
	if (not HasTrait(player, traitVenezuelaBetancourtID)) then return end
	if happinessBuildings[buildingID] then
		city:SetNumRealBuilding(happinessBuildings[buildingID], 1)
	end
end
GameEvents.CityConstructed.Add(EC_VenezuelaBetancourt_CityConstructed)
----------------------------------------------------------------------------------------------------------------------------
--EC_VenezuelaBetancourt_CitySoldBuilding
function EC_VenezuelaBetancourt_CitySoldBuilding(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local city = player:GetCityByID(cityID)
	local plot = g_MapGetPlot(city:GetX(), city:GetY())

	--UNIQUE ABILITY
	if (not HasTrait(player, traitVenezuelaBetancourtID)) then return end
	if happinessBuildings[buildingID] then
		city:SetNumRealBuilding(happinessBuildings[buildingID], 0)
	end
end
GameEvents.CitySoldBuilding.Add(EC_VenezuelaBetancourt_CitySoldBuilding)
----------------------------------------------------------------------------------------------------------------------------
--EC_VenezuelaBetancourt_UnitPrekill
local function EC_VenezuelaBetancourt_UnitPrekill(unitOwnerID, unitID, unitTypeID, plotX, plotY, isDelay, killingPlayerID)
	local player = Players[unitOwnerID]
	if unitOwnerID == killingPlayerID then return end
	if killingPlayerID ~= -1 then return end
	if isDelay then return end
	if (not player) then return end
	if (not player:IsAlive()) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UNIQUE UNIT
	if (not player:IsGoldenAge()) then return end
	if unitTypeID == unitBeautyQueenID then
		local unit = player:GetUnitByID(unitID)
		local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
		if plot:GetOwner() > -1 and plot:GetOwner() ~= unitOwnerID then
			player:ChangeNumFreePolicies(1)
		end
	end
end
if (not g_IsVMCActive) then
	GameEvents.UnitPrekill.Add(EC_VenezuelaBetancourt_UnitPrekill)
end
------------------------------------------------------------------------------------------------------------------------
--EC_VenezuelaBetancourt_GreatPersonExpended
local function EC_VenezuelaBetancourt_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not unitTypeID) then unitTypeID = unitID end
	if (not plotX) then return end

	--UNIQUE UNIT
	if (not player:IsGoldenAge()) then return end
	if unitTypeID == unitBeautyQueenID then
		local unit = player:GetUnitByID(unitID)
		local plot = g_MapGetPlot(plotX, plotY)
		if plot:GetOwner() > -1 and plot:GetOwner() ~= unitOwnerID then
			player:ChangeNumFreePolicies(1)
		end
	end
end
if g_IsVMCActive then
	GameEvents.GreatPersonExpended.Add(EC_VenezuelaBetancourt_GreatPersonExpended)
end
--=======================================================================================================================
--=======================================================================================================================
