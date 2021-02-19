-- JFD_Civs_IndoGreeks_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_Civs_IndoGreeks_DTP.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--Player_SendNotification
function Player_SendNotification(player, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local notificationID = NotificationTypes[notificationType]
	local teamID = player:GetTeam()
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end   
-------------------------------------------------------------------------------------------------------------------------
--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local buildingRoyalSilversmithID = GameInfoTypes["BUILDING_JFD_ROYAL_SILVERSMITH"]
local civilizationIndoGreeksID = GameInfoTypes["CIVILIZATION_JFD_INDO_GREEKS"]
local traitIndoGreeksID = GameInfoTypes["TRAIT_JFD_INDO_GREEKS"]
local unitWarMahoutID = GameInfoTypes["UNIT_JFD_WAR_MAHOUT"]
-------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------------------------------------
--JFD_IndoGreeks_PlayerDoTurn
local buildingRoyalSilversmithConnectedID = GameInfoTypes["BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED"]
local buildingRoyalSilversmithConnectedOtherID = GameInfoTypes["BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED_OTHER"]
local function JFD_IndoGreeks_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	--DHARMIKASA
	if HasTrait(player, traitIndoGreeksID) then
		local numGAP = Player_GetGoldenAgePointsFromCultureAndFaith(player)
		if numGAP > 0 then
			player:ChangeGoldenAgeProgressMeter(numGAP)
		end

		--ROYAL SILVERSMITH
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingRoyalSilversmithConnectedID, 0)
			city:SetNumRealBuilding(buildingRoyalSilversmithConnectedOtherID, 0)
	
			if city:IsHasBuilding(buildingRoyalSilversmithID) then
				if player:IsCapitalConnectedToCity(city) or city:IsCapital() then
					city:SetNumRealBuilding(buildingRoyalSilversmithConnectedID, 1)
				end
				
				local numCitiesConnected = 0
				local plot = g_MapGetPlot(city:GetX(), city:GetY())
				for adjacentPlot in PlotAreaSweepIterator(plot, 5, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					local otherCity = adjacentPlot:GetPlotCity()
					if otherCity then
						if otherCity ~= city and otherCity:GetOwner() == playerID then
							if player:IsCapitalConnectedToCity(otherCity) then
								numCitiesConnected = numCitiesConnected + 1
								if numCitiesConnected >= 3 then return end
							end
						end
					end
				end
				city:SetNumRealBuilding(buildingRoyalSilversmithConnectedOtherID, numCitiesConnected)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_IndoGreeks_PlayerDoTurn)
-------------------------------------------------------------------------------------------------------------------------
--JFD_IndoGreeks_CityCaptureComplete
local function JFD_IndoGreeks_CityCaptureComplete(oldPlayerID, isCapital, plotX, plotY, newPlayerID)
	local player = Players[newPlayerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
			
	--DHARMIKASA
	if (not HasTrait(player, traitIndoGreeksID)) then return end
	
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()

	local religionToConvertID = city:GetReligiousMajority()
	for city in player:Cities() do
		if city:GetOriginalOwner() == newPlayerID then
			if city:IsCapital() then
				local thisDominantReligionID = city:GetReligiousMajority()
				city:ConvertPercentFollowers(religionToConvertID, -1, 30) 
				city:ConvertPercentFollowers(religionToConvertID, 0, 30) 
				city:ConvertPercentFollowers(religionToConvertID, thisDominantReligionID, 30) 
			else
				local thisDominantReligionID = city:GetReligiousMajority()
				city:ConvertPercentFollowers(religionToConvertID, -1, 20) 
				city:ConvertPercentFollowers(religionToConvertID, 0, 20) 
				city:ConvertPercentFollowers(religionToConvertID, thisDominantReligionID, 20) 
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFD_IndoGreeks_CityCaptureComplete)
-------------------------------------------------------------------------------------------------------------------------
--JFD_IndoGreeks_CityTrained
local function JFD_IndoGreeks_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end

	--AKALI
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() ~= unitWarMahoutID then return end
	if (not HasTrait(player, traitIndoGreeksID)) then return end

	local city = player:GetCityByID(cityID)
	if city:GetOriginalOwner() ~= playerID then
		unit:ChangeExperience(city:GetPopulation()*2)
	end
end
GameEvents.CityTrained.Add(JFD_IndoGreeks_CityTrained)
--=======================================================================================================================
--=======================================================================================================================
