-- JFD_Civs_RomeJulius_Functions
-- Author: JFD
-- DateCreated: 8/2/2013 7:09:28 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
include("UniqueDiplomacyUtilsV2.lua")
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
local userSettingRTPSovereigntyCore = (Game_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- INIT
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--g_Civilization_FreePolicies_Table
local g_Civilization_FreePolicies_Table = {}
local g_Civilization_FreePolicies_Count = 1
for row in DB.Query("SELECT * FROM Civilization_FreePolicies;") do 	
	g_Civilization_FreePolicies_Table[g_Civilization_FreePolicies_Count] = row
	g_Civilization_FreePolicies_Count = g_Civilization_FreePolicies_Count + 1
end

--JFD_LoadScreenClose
local function JFD_LoadScreenClose()
	for playerID = 0, defineMaxMajorCivs - 1 do
		local player = Players[playerID]
	
		--g_Civilization_FreePolicies_Table
		local policiesTable = g_Civilization_FreePolicies_Table
		local numPolicies = #policiesTable
		for index = 1, numPolicies do
			local row = policiesTable[index]
			local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
			if civType == row.CivilizationType then
				local policyID = GameInfoTypes[row.PolicyType]
				if isCPActive then 
					player:GrantPolicy(policyID, true)
				else
					player:SetNumFreePolicies(1)
					player:SetHasPolicy(policyID, true)
				end
			end
		end
	end
end
Events.LoadScreenClose.Add(JFD_LoadScreenClose)
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
--JFD_RomeJulius_SequenceGameInitComplete
local civilizationRomeAugustusID		= GameInfoTypes["CIVILIZATION_ROME"]
local civilizationRomePompeyID			= GameInfoTypes["CIVILIZATION_UC_ROMAN_REPUBLIC"]
local civilizationPtolemiesCleopatraID	= GameInfoTypes["CIVILIZATION_TCM_PTOLEMIES"]
local function JFD_RomeJulius_SequenceGameInitComplete()
	for playerID = 0, defineMaxMajorCivs - 1, 1 do
        local player = Players[playerID]
		local civilizationID = player:GetCivilizationType()
		if civilizationID == civilizationRomeAugustusID then
			ChangeDiplomacyResponse("LEADER_JFD_JULIUS", "RESPONSE_FIRST_GREETING", 	"TXT_KEY_LEADER_JFD_JULIUS_FIRSTGREETING%", 	"TXT_KEY_LEADER_JFD_JULIUS_AUGUSTUS_FIRSTGREETING_1", 	500)
			ChangeDiplomacyResponse("LEADER_JFD_JULIUS", "RESPONSE_DEFEATED", 			"TXT_KEY_LEADER_JFD_JULIUS_DEFEATED%", 			"TXT_KEY_LEADER_JFD_JULIUS_AUGUSTUS_DEFEATED_1", 		500)
			break
		elseif civilizationPtolemiesCleopatraID then
			ChangeDiplomacyResponse("LEADER_JFD_JULIUS", "RESPONSE_FIRST_GREETING", 	"TXT_KEY_LEADER_JFD_JULIUS_FIRSTGREETING%", 	"TXT_KEY_LEADER_JFD_JULIUS_CLEOPATRA_FIRSTGREETING_1", 	500)
			ChangeDiplomacyResponse("LEADER_JFD_JULIUS", "RESPONSE_DEFEATED", 			"TXT_KEY_LEADER_JFD_JULIUS_DEFEATED%", 			"TXT_KEY_LEADER_JFD_JULIUS_CLEOPATRA_DEFEATED_1", 		500)
			break
		elseif civilizationRomePompeyID then
			ChangeDiplomacyResponse("LEADER_JFD_JULIUS", "RESPONSE_FIRST_GREETING", 	"TXT_KEY_LEADER_JFD_JULIUS_FIRSTGREETING%", 	"TXT_KEY_LEADER_JFD_JULIUS_POMPEY_FIRSTGREETING_1", 	500)
			ChangeDiplomacyResponse("LEADER_JFD_JULIUS", "RESPONSE_DEFEATED", 			"TXT_KEY_LEADER_JFD_JULIUS_DEFEATED%", 			"TXT_KEY_LEADER_JFD_JULIUS_POMPEY_DEFEATED_1", 			500)
			break
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_RomeJulius_SequenceGameInitComplete)
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local traitRomeJuliusID  = GameInfoTypes["TRAIT_JFD_ROME_JULIUS"]
local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitPraetorianID   = GameInfoTypes["UNIT_JFD_PRAETORIAN"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_RomeJulius_PlayerDoTurn
local unitPromotionPraetorianActiveID 	= GameInfoTypes["PROMOTION_JFD_PRAETORIAN_ACTIVE"]
local unitPromotionPraetorianInactiveID = GameInfoTypes["PROMOTION_JFD_PRAETORIAN_INACTIVE"]
local function JFD_RomeJulius_PlayerDoTurn(playerID, cityID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--Praetorian
	for unit in player:Units() do
		if unit:GetUnitType() == unitPraetorianID then
			unit:SetHasPromotion(unitPromotionPraetorianActiveID, false)
			unit:SetHasPromotion(unitPromotionPraetorianInactiveID, true)
			
			local isAdjacentToPraetorian = false
			local plot = unit:GetPlot()
			if isCPActive then
				isStackedGreatGeneral = unit:IsWithinDistanceOfUnit(unitGreatGeneralID, 1, true, false)
			else
				for ID = 0,(plot:GetNumUnits() - 1) do
					local unit = plot:GetUnit(ID)
					if unit:GetUnitType() == unitGreatGeneralID then
						isStackedGreatGeneral = true
						break
					end
				end
			end
			unit:SetHasPromotion(unitPromotionPraetorianActiveID, isStackedGreatGeneral)
			unit:SetHasPromotion(unitPromotionPraetorianInactiveID, (not isStackedGreatGeneral))
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_RomeJulius_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_RomeJulius_UnitKilledInCombat
local function JFD_RomeJulius_UnitKilledInCombat(killerID, killedID, killedUnitType)
	local player = Players[killerID]
	if (not player:IsAlive()) then return end

	--Dictator Perpetuo
	if (not HasTrait(player, traitRomeJuliusID)) then return end
	local playerKilled = Players[killedID]
	if playerKilled:IsBarbarian() then
		local yieldGGP = g_MathCeil(GameInfo.Units[killedUnitType].Combat)
		player:ChangeCombatExperience(yieldGGP)
	end
end
GameEvents.UnitKilledInCombat.Add(JFD_RomeJulius_UnitKilledInCombat)
----------------------------------------------------------------------------------------------------------------------------
--JFD_RomeJulius_SerialEventUnitCreated
local promotionDictatorPerpetuoID = GameInfoTypes["PROMOTION_JFD_DICTATOR_PERPETUO"]
local function JFD_RomeJulius_SerialEventUnitCreated(playerID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--Dictator Perpetuo
	if (not HasTrait(player, traitRomeJuliusID)) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitType() ~= unitGreatGeneralID then return end
	if unit:IsHasPromotion(promotionDictatorPerpetuoID) then return end
	local yieldCulture = ((player:GetNextPolicyCost()*20)/100)
	player:ChangeJONSCulture(yieldCulture)
	unit:SetHasPromotion(promotionDictatorPerpetuoID, true)
	if player:IsHuman() and player:IsTurnActive() then
		local plotX, plotY = unit:GetX(), unit:GetY()
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_MAGENTA]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", yieldCulture), true)
	end
end
if (not userSettingRTPSovereigntyCore) then
	Events.SerialEventUnitCreated.Add(JFD_RomeJulius_SerialEventUnitCreated)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_RomeJulius_UnitCreated
local function JFD_RomeJulius_UnitCreated(playerID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--Dictator Perpetuo
	if (not HasTrait(player, traitRomeJuliusID)) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitType() ~= unitGreatGeneralID then return end
	local reformCooldownChange = ((player:GetReformCooldown()*20)/100)
	player:ChangeReformCooldown(-reformCooldownChange)
	if player:IsHuman() and player:IsTurnActive() then
		local plotX, plotY = unit:GetX(), unit:GetY()
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num} [ICON_JFD_REFORM] Cooldown[ENDCOLOR]", reformCooldownChange), true)
	end
end
if userSettingRTPSovereigntyCore then
	GameEvents.UnitCreated.Add(JFD_RomeJulius_UnitCreated)
end
--==========================================================================================================================
--==========================================================================================================================
