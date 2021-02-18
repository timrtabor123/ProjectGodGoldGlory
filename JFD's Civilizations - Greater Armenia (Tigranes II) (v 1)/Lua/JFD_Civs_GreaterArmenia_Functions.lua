-- JFD_Civs_GreaterArmenia_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")
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
-- UTILITIES
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
local isCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
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
-------------------------------------------------------------------------------------------------------------------------
--Player_GetAtWarCount
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
function Player_GetAtWarCount(player, isLarger)
	local playerTeam = Teams[player:GetTeam()]
	local numAtWar = 0
	local numCities = player:GetNumCities()
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if playerTeam:IsAtWar(otherPlayer:GetTeam()) and ((not isLarger) or (isLarger and otherPlayer:GetNumCities() > numCities)) then
			numAtWar = numAtWar + 1
		end
	end
	return numAtWar
end	
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local buildingSiegeWorkshopID 	= GameInfoTypes["BUILDING_JFD_SIEGE_WORKSHOP"]
local traitGreaterArmeniaID 	= GameInfoTypes["TRAIT_JFD_GREATER_ARMENIA"]
local promotionAzatavrearID  	= GameInfoTypes["PROMOTION_JFD_AZATAVREAR"]
local unitAzatavrearID  		= GameInfoTypes["UNIT_JFD_AZATAVREAR"]
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GreaterArmenia_PlayerDoTurn
local buildingGreaterArmeniaProductionID = GameInfoTypes["BUILDING_JFD_GREATER_ARMENIA_PRODUCTION"]
local buildingSiegeWorkshopProductionID  = GameInfoTypes["BUILDING_JFD_SIEGE_WORKSHOP_PRODUCTION"]
local buildingCastleID 					 = GameInfoTypes["BUILDING_CASTLE"]
local buildingWallsID  					 = GameInfoTypes["BUILDING_WALLS"]
local unitCombatMountedID  				 = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local function JFD_GreaterArmenia_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	---ARTAXIAD SHAHANSHAH
	if HasTrait(player, traitGreaterArmeniaID) then
		local numBuilding = 0
		for city in player:Cities() do
			if city:IsHasBuilding(buildingCastleID) then
				numBuilding = numBuilding + 1
			end
			if city:IsHasBuilding(buildingWallsID) then
				numBuilding = numBuilding + 1
			end
			city:SetNumRealBuilding(buildingGreaterArmeniaProductionID, numBuilding)
			
			local unitGarrison = city:GetGarrisonedUnit()
			if (unitGarrison and unitGarrison:GetUnitCombatType() == unitCombatMountedID) then
				if city:GetResistanceTurns() > 0 then
					city:ChangeResistanceTurns(-city:GetResistanceTurns())
				end
			end
		end
	end
	
	--AZATAVREAR
	local numWars = g_MathMin(Player_GetAtWarCount(player), 3)
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionAzatavrearID) then
			unit:ChangeDamage(-(numWars*10))
		end
	end
		
	--SIEGE WORKSHOP
	local numTradeRoutes = 0
	local tradeRoutes = player:GetTradeRoutes()
	for _, tradeRoute in ipairs(tradeRoutes) do
		local fromCity = tradeRoute.FromCity
		if fromCity:IsHasBuilding(buildingSiegeWorkshopID) then
			numTradeRoutes = numTradeRoutes + 1
		end
	end
	for city in player:Cities() do
		city:SetNumRealBuilding(buildingSiegeWorkshopProductionID, numTradeRoutes)
	end
						
	--SPECIAL ACHIEVEMENT
	if playerID ~= activePlayerID then return end
	if (not isAAActive) then return end
	if IsAAUnlocked('AA_JFD_GREATER_ARMENIA_SPECIAL') then return end
	if Player_GetAtWarCount(player, true) >= 3 then
		UnlockAA('AA_JFD_GREATER_ARMENIA_SPECIAL');
	end
end
GameEvents.PlayerDoTurn.Add(JFD_GreaterArmenia_PlayerDoTurn)
--------------------------------------------------------------------------------------------------------------------------
--JFD_GreaterArmenia_CityConstructed
local resourceHorsesID = GameInfoTypes["RESOURCE_HORSE"]
local function JFD_GreaterArmenia_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	---ARTAXIAD SHAHANSHAH
	if buildingID ~= buildingWallsID and buildingID ~= buildingCastleID then return end
	if HasTrait(player, traitGreaterArmeniaID) then
		local city = player:GetCityByID(cityID)
		player:ChangeNumResourceTotal(resourceHorsesID, 1)
		
		local numBuilding = 0
		if city:IsHasBuilding(buildingCastleID) then
			numBuilding = numBuilding + 1
		end
		if city:IsHasBuilding(buildingWallsID) then
			numBuilding = numBuilding + 1
		end
		city:SetNumRealBuilding(buildingGreaterArmeniaProductionID, numBuilding)
	end
end
GameEvents.CityConstructed.Add(JFD_GreaterArmenia_CityConstructed)
--=======================================================================================================================
--=======================================================================================================================
