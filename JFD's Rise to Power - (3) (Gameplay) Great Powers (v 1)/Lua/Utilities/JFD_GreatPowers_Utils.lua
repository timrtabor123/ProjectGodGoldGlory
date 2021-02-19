-- JFD_GreatPowers_Utils
-- Author: JFD
-- DateCreated: 4/16/2020 11:56:52 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("JFD_RTP_Utils.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
local g_GetRound		= Game.GetRound
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--=======================================================================================================================
-- CACHED TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--g_JFD_GreatPowers_Table
local g_JFD_GreatPowers_Table = {}
local g_JFD_GreatPowers_Count = 1
for row in DB.Query("SELECT * FROM JFD_GreatPowers;") do 	
	g_JFD_GreatPowers_Table[g_JFD_GreatPowers_Count] = row
	g_JFD_GreatPowers_Count = g_JFD_GreatPowers_Count + 1
end
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_IsCPActive  = Game.IsCPActive()
local g_IsVMCActive = Game.IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- GREAT POWER UTILS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GREAT POWER UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:GetGreatPowerStatus
function Player.GetGreatPowerStatus(player)
	if (not GameInfo) then return end

	local numGPStats = player:CalculateGreatPowerStats()
	
	--g_JFD_GreatPowers_Table
	local greatPowersTable = g_JFD_GreatPowers_Table
	local numGreatPowers = #greatPowersTable
	for index = 1, numGreatPowers do
		local row = greatPowersTable[index]
		if numGPStats >= row.MinThreshold then
			return row.ID
		end
	end

	return -1
end
----------------------------------------------------------------------------------------------------------------------------
--Player:CalculateGreatPowerStats
function Player.CalculateGreatPowerStats(player, returnsAvg)
	if (not GameInfo) then return end

	local numPopulation = player:GetTotalPopulation()
	local numGlobalPopulaton = Game.GetTotalPopulation()
	local numPercentPopulaton = g_GetRound(((numPopulation/numGlobalPopulaton)*100),3)
	local numLand = player:GetNumPlots()
	local numGlobalLand = Map.GetNumPlots()
	local numPercentLand = g_GetRound(((numLand/numGlobalLand)*100),3)
	
	local numMilitary = player:GetMilitaryMight()
	local numGlobalMilitary = 0
	for otherPlayerID = 0, defineMaxMinorCivs, 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsAlive() and otherPlayerID ~= playerID then
			numGlobalMilitary = numGlobalMilitary + otherPlayer:GetMilitaryMight()
		end
	end
	local numPercentMilitary = g_GetRound(((numMilitary/numGlobalMilitary)*100),3)

	local religionID = player:GetReligionCreatedByPlayer()
	local numPercentReligion = 0
	if religionID > 0 then
		local numReligion = Game.GetNumCitiesFollowing(religionID)
		local numGlobalReligion = Game.GetNumCities()
		numPercentReligion = g_GetRound(((numReligion/numGlobalReligion)*100),3)
		numPercentReligion = g_GetRound(numPercentReligion/2)
	end

	local numAvg = g_GetRound((numPercentPopulaton+numPercentLand+numPercentMilitary+numPercentReligion)/4)
	if (not returnsAvg) then
		local numAvgTotal = 0
		for otherPlayerID = 0, defineMaxMinorCivs, 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() and otherPlayerID ~= playerID then
				numAvgTotal = numAvgTotal + otherPlayer:CalculateGreatPowerStats(true)
			end
		end
		return g_GetRound(((numAvg/numAvgTotal)*100))
	else
		return numAvg
	end
end
--==========================================================================================================================
--==========================================================================================================================