-- DMS_Kalinago_Decisions
-- Author: DMS
--=======================================================================================================================--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
print("DMS's The Kalinago's Decisions: loaded")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local bPrintForDebug = DMS_GetUserSetting("DMS_KALINAGO_DEBUGGING_ON") == 1

function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- GetNearestCity (adapted from Sukritact's Sami civ)
------------------------------------------------------------------------------------------------------------------------
function GetNearestCity(pPlayer, plotX, plotY)
	local iDistance = nil
	local pTargetCity = nil
	for pCity in pPlayer:Cities() do
		if not(iDistance) or iDistance > Map.PlotDistance(plotX, plotY, pCity:GetX(), pCity:GetY()) then
			pTargetCity = pCity
			iDistance = Map.PlotDistance(plotX, plotY, pCity:GetX(), pCity:GetY())
		end
	end
	return(pTargetCity)
end
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationKalinagoID			= GameInfoTypes["CIVILIZATION_DMS_KALINAGO"]
local traitSpiritOfTheRockID			= GameInfoTypes["TRAIT_DMS_SPIRIT_OF_THE_ROCK"]
local unitBuyeisID						= GameInfoTypes["UNIT_DMS_BUYEIS"]
local buildingKarbayID					= GameInfoTypes["BUILDING_DMS_KARBAY"]
local tablePromotionOuboutou			= {}
for i = 1, 25 do 
	tablePromotionOuboutou[i]			= GameInfoTypes["PROMOTION_DMS_OUBOUTOU_" .. i .. "_A"]
end
local promotionOuboutouNearbyUnitsID	= GameInfoTypes["PROMOTION_DMS_OUBOUTOU_NEARBY"]
local combatTypeMeleeID					= GameInfoTypes["UNITCOMBAT_MELEE"]
local combatTypeReconID					= GameInfoTypes["UNITCOMBAT_RECON"]
local combatTypeGunID					= GameInfoTypes["UNITCOMBAT_GUN"]
local combatTypeMountedID				= GameInfoTypes["UNITCOMBAT_MOUNTED"]
local combatTypeSiegeID					= GameInfoTypes["UNITCOMBAT_SIEGE"]
local combatTypeArcherID				= GameInfoTypes["UNITCOMBAT_ARCHER"]
local eraRenaissanceID					= GameInfoTypes["ERA_RENAISSANCE"]
local buildingTheSnakeKingID			= GameInfoTypes["BUILDING_DMS_THE_SNAKE_KING"]
local promotionSpiritOfTheRockID		= GameInfoTypes["PROMOTION_DMS_SPIRIT_OF_THE_ROCK"]
local pBarbarians						= Players[63]
local mathFloor							= math.floor
-------------------------------------------------------------------------------------------------------------------------
-- Kalinago: The Snake King
-------------------------------------------------------------------------------------------------------------------------
local Decisions_TheSnakeKing = {}
	Decisions_TheSnakeKing.Name = "TXT_KEY_DECISIONS_DMS_THE_SNAKE_KING"
	Decisions_TheSnakeKing.Desc = "TXT_KEY_DECISIONS_DMS_THE_SNAKE_KING_DESC"
	HookDecisionCivilizationIcon(Decisions_TheSnakeKing, civilisationKalinagoID)
	Decisions_TheSnakeKing.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationKalinagoID) then return false, false end
		if load(pPlayer, "Decisions_TheSnakeKing") == true then
			Decisions_TheSnakeKing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_THE_SNAKE_KING_ENACTED_DESC")
			return false, false, true 
		end
			
		local iFaithCost = math.ceil(100 * iMod)
		local iCultureCost = math.ceil(200 * iMod)
		Decisions_TheSnakeKing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_THE_SNAKE_KING_DESC", iFaithCost, iCultureCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1)	then return true, false end
		if (pPlayer:GetFaith() < iFaithCost)							then return true, false end
		if (pPlayer:GetJONSCulture() < iCultureCost)					then return true, false end
		if (pPlayer:GetCurrentEra() > eraRenaissanceID)					then return true, false end
		
		return true, true
	end
	)
	
	Decisions_TheSnakeKing.DoFunc = (
	function(pPlayer)
		local iFaithCost = math.ceil(100 * iMod)
		local iCultureCost = math.ceil(200 * iMod)
		pPlayer:ChangeFaith(-iFaithCost)
		pPlayer:ChangeJONSCulture(-iCultureCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		for pCity in pPlayer:Cities() do
			if pCity and pCity:IsHasBuilding(buildingKarbayID) then
				pCity:SetNumRealBuilding(buildingTheSnakeKingID, 1)
			end
		end

		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:IsCombatUnit() then
				local pPlot = pUnit:GetPlot()
				if pPlot and pPlot:IsCoastalLand() then
					pUnit:ChangeExperience(10)
				end
			end
		end

		save(pPlayer, "Decisions_TheSnakeKing", true)
	end
	)

	Decisions_TheSnakeKing.Monitors = {}
	Decisions_TheSnakeKing.Monitors[GameEvents.CityConstructed] = (
	function(iOwner, iCity, eBuildingType, bGold, bFaithOrCulture)
		local pPlayer = Players[iOwner]
		if load(pPlayer, "Decisions_TheSnakeKing") == true then
			local pCity = player:GetCityByID(iCity)
			if eBuildingType == buildingKarbayID then
				pCity:SetNumRealBuilding(buildingTheSnakeKingID, 1)
			end
		end		
	end
	)

Decisions_AddCivilisationSpecific(civilisationKalinagoID, "Decisions_TheSnakeKing", Decisions_TheSnakeKing)
-------------------------------------------------------------------------------------------------------------------------
-- Kalinago: Spirit Of The Rock
-------------------------------------------------------------------------------------------------------------------------
local Decisions_SpiritOfTheRock = {}
	Decisions_SpiritOfTheRock.Name = "TXT_KEY_DECISIONS_DMS_SPIRIT_OF_THE_ROCK"
	Decisions_SpiritOfTheRock.Desc = "TXT_KEY_DECISIONS_DMS_SPIRIT_OF_THE_ROCK_DESC"
	Decisions_SpiritOfTheRock.Data1 = {}
	Decisions_SpiritOfTheRock.Data2 = nil
	Decisions_SpiritOfTheRock.Data3 = nil
	Decisions_SpiritOfTheRock.Data4 = nil
	HookDecisionCivilizationIcon(Decisions_SpiritOfTheRock, civilisationKalinagoID)
	Decisions_SpiritOfTheRock.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationKalinagoID) then return false, false end
		if load(pPlayer, "Decisions_SpiritOfTheRock") == true then
			Decisions_SpiritOfTheRock.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_SPIRIT_OF_THE_ROCK_ENACTED_DESC")
			return false, false, true 
		end
		
		local iGoldCost = math.ceil(250 * iMod)
		Decisions_SpiritOfTheRock.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_SPIRIT_OF_THE_ROCK_DESC", iGoldCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2)	then return true, false end
		if (pPlayer:GetGold() < iGoldCost) 								then return true, false end

		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			local validUnit = false
			if pUnit:GetUnitCombatType() == combatTypeMeleeID or pUnit:GetUnitCombatType() == combatTypeReconID or pUnit:GetUnitCombatType() == combatTypeGunID then
				for i = 1, 25 do
					if (pUnit:IsHasPromotion(tablePromotionOuboutou[i]) == false) then
						validUnit = true
					else
						DMS_Print("Decisions_SpiritOfTheRock: This unit is the current ouboutou unit and thus cannot be added to the table..")
					end
				end
			end
			if validUnit == true then
				table.insert(Decisions_SpiritOfTheRock.Data1, pUnit)
			end
		end
		
		if #Decisions_SpiritOfTheRock.Data1 < 3 						then return true, false end

		return true, true
	end
	)
	
	Decisions_SpiritOfTheRock.DoFunc = (
	function(pPlayer)
		DMS_Print("Decisions_SpiritOfTheRock enacted..")
		local iPlayer = pPlayer:GetID()
		local iGoldCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iGoldCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		local iRandom1 = GetRandom(1,#Decisions_SpiritOfTheRock.Data1)
		Decisions_SpiritOfTheRock.Data2 = Decisions_SpiritOfTheRock.Data1[iRandom1]
		table.remove(Decisions_SpiritOfTheRock.Data1, iRandom1)
		Decisions_SpiritOfTheRock.Data2:SetHasPromotion(promotionSpiritOfTheRockID, true)
		Decisions_SpiritOfTheRock.Data2:ChangeDamage(mathFloor((Decisions_SpiritOfTheRock.Data2:GetMaxHitPoints() - Decisions_SpiritOfTheRock.Data2:GetDamage()) * 0.5))

		local iRandom2 = GetRandom(1,#Decisions_SpiritOfTheRock.Data1)
		Decisions_SpiritOfTheRock.Data3 = Decisions_SpiritOfTheRock.Data1[iRandom2]
		table.remove(Decisions_SpiritOfTheRock.Data1, iRandom2)
		Decisions_SpiritOfTheRock.Data3:SetHasPromotion(promotionSpiritOfTheRockID, true)
		Decisions_SpiritOfTheRock.Data3:ChangeDamage(mathFloor((Decisions_SpiritOfTheRock.Data3:GetMaxHitPoints() - Decisions_SpiritOfTheRock.Data3:GetDamage()) * 0.5))

		local iRandom3 = GetRandom(1,#Decisions_SpiritOfTheRock.Data1)
		Decisions_SpiritOfTheRock.Data4 = Decisions_SpiritOfTheRock.Data1[iRandom3]
		table.remove(Decisions_SpiritOfTheRock.Data1, iRandom3)

		local pNewUnit = pBarbarians:InitUnit(Decisions_SpiritOfTheRock.Data4:GetUnitType(), Decisions_SpiritOfTheRock.Data4:GetPlot():GetX(), Decisions_SpiritOfTheRock.Data4:GetPlot():GetY())
		pNewUnit:SetExperience(Decisions_SpiritOfTheRock.Data4:GetExperience())
		pNewUnit:SetLevel(Decisions_SpiritOfTheRock.Data4:GetLevel())
		for unitPromotion in GameInfo.UnitPromotions() do
			local iPromotionID = unitPromotion.ID;
			if (Decisions_SpiritOfTheRock.Data4:IsHasPromotion(iPromotionID)) then
				if (pNewUnit:IsPromotionValid(iPromotionID)) then
					pNewUnit:SetHasPromotion(iPromotionID, true)
				end
			end
		end
		if Decisions_SpiritOfTheRock.Data4 then
			Decisions_SpiritOfTheRock.Data4:Kill(-1)
		end

		save(pPlayer, "Decisions_SpiritOfTheRock", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationKalinagoID, "Decisions_SpiritOfTheRock", Decisions_SpiritOfTheRock)
--=======================================================================================================================
--=======================================================================================================================