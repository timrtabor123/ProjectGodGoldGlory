-- JFD_Civs_RomeAugustus_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_RomeAugustus_DTP.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  		= Locale.ConvertTextKey
local g_MapGetPlot				= Map.GetPlot
local g_MathCeil				= math.ceil
local g_MathFloor				= math.floor
local g_MathMax					= math.max
local g_MathMin					= math.min
				
local Players 					= Players
local HexToWorld 				= HexToWorld
local ToHexFromGrid 			= ToHexFromGrid
local Teams 					= Teams

local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local activeTeamID				= activePlayer:GetTeam()
local activeTeam				= Teams[activeTeamID]
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
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local buildingForumID		= GameInfoTypes["BUILDING_JFD_FORUM"]
local traitRomeAugustusID 	= GameInfoTypes["TRAIT_JFD_ROME_AUGUSTUS"]
local unitLegionID			= GameInfoTypes["UNIT_ROMAN_LEGION"]
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_RomeAugustus_PlayerDoTurn
local buildingForumGreatPeopleID = GameInfoTypes["BUILDING_JFD_FORUM_GREAT_PEOPLE"]
function JFD_RomeAugustus_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	--From Brick to Marble
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	if HasTrait(player, traitRomeAugustusID) then
		local yieldGAP = JFD_RomeAugustus_GetGAPFromBuildings(playerID)
		if yieldGAP > 0 then
			player:ChangeGoldenAgeProgressMeter(yieldGAP)
		end
	end
	
	--Forum
	local isGoldenAge = player:IsGoldenAge()
	for city in player:Cities() do
		city:SetNumRealBuilding(buildingForumGreatPeopleID, 0)
		if (isGoldenAge and city:IsHasBuilding(buildingForumID)) then
			city:SetNumRealBuilding(buildingForumGreatPeopleID, 1)
		end
	end

	--Legion
	for unit in player:Units() do
		if unit:GetUnitType() == unitLegionID then
			unit:SetHasPromotion(unitPromotionLegionActiveID, false)
			unit:SetHasPromotion(unitPromotionLegionInactiveID, true)
			
			local isAdjacentToLegion = false
			local unitPlot = unit:GetPlot()
			if isCPActive then
				isAdjacentLegion = unit:IsAdjacentToUnit(unitLegionID, true, false)
			else
				for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					isAdjacentLegion = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():GetUnitType() == unitLegionID)
					if isAdjacentLegion then 
						break
					end
				end
			end
			unit:SetHasPromotion(unitPromotionLegionActiveID, isAdjacentLegion)
			unit:SetHasPromotion(unitPromotionLegionInactiveID, (not isAdjacentLegion))
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_RomeAugustus_PlayerDoTurn)
--=======================================================================================================================
--=======================================================================================================================
