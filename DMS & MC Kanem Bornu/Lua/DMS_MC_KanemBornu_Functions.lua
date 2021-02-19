-- DMS_MC_KanemBornu_Functions
-- Author: DMS
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua")
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
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end

local userSettingBuildCharges = JFD_GetUserSetting("JFD_CID_MISC_BUILD_CHARGES") == 1
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local bPrintForDebug = DMS_GetUserSetting("DMS_KANEM_BORNU_DEBUGGING_ON") == 1

function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
--IsUsingCiD
----------------------------------------------------------------------------------------------------------------------------
function IsUsingCiD()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "10e9728f-d61c-4317-be4f-7d52d6bae6f4" then
			return true
		end
	end
	return false
end
local isUsingCiD = IsUsingCiD()
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
----------------------------------------------------------------------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPDLL then 
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
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end     
----------------------------------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID 						= Game.GetActivePlayer()
local activePlayer 							= Players[activePlayerID]
local activePlayerTeam 						= Teams[Game.GetActiveTeam()]
local civilisationKanemBornuID				= GameInfoTypes["CIVILIZATION_DMS_MC_KANEM_BORNU"]
local isKanemBornuCivActive 				= JFD_IsCivilisationActive(civilisationKanemBornuID)
local isKanemBornuActivePlayer 				= activePlayer:GetCivilizationType() == civilisationKanemBornuID
-- unique components 
local traitNoneToFearThanGodID				= GameInfoTypes["TRAIT_DMS_MC_WITH_NONE_TO_FEAR_BUT_GOD"]
local buildingWasiliramID					= GameInfoTypes["BUILDING_DMS_MC_WASILIRAM"]
local unitAskawrID							= GameInfoTypes["UNIT_DMS_MC_ASKAWR"]
local promotionCivilianRangedExtraMovementID= GameInfoTypes["PROMOTION_DMS_MC_EXTRA_MOVEMENT"]
local promotionCivilianRangedRetreatID		= GameInfoTypes["PROMOTION_DMS_MC_RETREAT"]
local promotionAskawrPerfectPrinceID		= GameInfoTypes["PROMOTION_DMS_MC_PERFECT_PRINCE"]
local promotionAskawrStrength1ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_1"]
local promotionAskawrStrength2ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_2"]
local promotionAskawrStrength3ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_3"]
local promotionAskawrStrength4ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_4"]
local promotionAskawrStrength5ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_5"]
local promotionAskawrStrength6ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_6"]
local promotionAskawrStrength7ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_7"]
local promotionAskawrStrength8ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_8"]
local promotionAskawrStrength9ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_9"]
local promotionAskawrStrength10ID			= GameInfoTypes["PROMOTION_DMS_MC_ASKAWR_STRENGTH_10"]

if isKanemBornuCivActive then
	print("Mai Idris Alauma of the Kanem-Bornu Empire joins the game!")
end
--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- DMS_WithNoneToFearButGod_ExtraMovement
----------------------------------------------------------------------------------------------------------------------------
function DMS_WithNoneToFearButGod_ExtraMovement(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitNoneToFearThanGodID) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit and ((not pUnit:IsCombatUnit()) or pUnit:IsRanged()) then
			DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement initializing for unit on plot (" .. iX .. "," .. iY ..")..")
			local pPlot = pUnit:GetPlot()
			if pPlot then
				local pPlotWorkingCity = pPlot:GetWorkingCity()
				if pPlotWorkingCity then
					DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: Found working city to be " .. pPlotWorkingCity:GetName() .. "..")
					local pPlotWorkingCityOwner = pPlotWorkingCity:GetOwner()
					if pPlotWorkingCityOwner == iPlayer then
						DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: " .. pPlotWorkingCity:GetName() .. " is owned by " .. pPlayer:GetCivilizationShortDescription() .. "..")
						if (pPlotWorkingCity:IsCapital()) or (pPlayer:IsCapitalConnectedToCity(pPlotWorkingCity)) then
							DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: " .. pPlotWorkingCity:GetName() .. " either is the Capital or is connected to it..")
							if (not pUnit:IsHasPromotion(promotionCivilianRangedExtraMovementID)) then
								
								pUnit:SetHasPromotion(promotionCivilianRangedExtraMovementID, true)
								DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: the unit receiving promotion with extra movement..")
							else
								DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: the unit already has the correct promotion - do nothing..")
							end
						else
							DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: the unit is near a city not connected to the capital - do nothing..")
							if pUnit:IsHasPromotion(promotionCivilianRangedExtraMovementID) then
								pUnit:SetHasPromotion(promotionCivilianRangedExtraMovementID, false)
							end
						end
					else
						DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: the unit is near a city not owned by the player - do nothing..")
						if pUnit:IsHasPromotion(promotionCivilianRangedExtraMovementID) then
							pUnit:SetHasPromotion(promotionCivilianRangedExtraMovementID, false)
						end
					end
				else
					DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: the unit is not near a city - do nothing..")
					if pUnit:IsHasPromotion(promotionCivilianRangedExtraMovementID) then
						pUnit:SetHasPromotion(promotionCivilianRangedExtraMovementID, false)
					end
				end
			else
				DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: plot returns nil - do nothing..")
				if pUnit:IsHasPromotion(promotionCivilianRangedExtraMovementID) then
					pUnit:SetHasPromotion(promotionCivilianRangedExtraMovementID, false)
				end
			end
		else
			DMS_Print("DMS_WithNoneToFearButGod_ExtraMovement: unit is not a civilian nor ranged - do nothing..")
		end
	end
end

GameEvents.UnitSetXY.Add(DMS_WithNoneToFearButGod_ExtraMovement)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions
----------------------------------------------------------------------------------------------------------------------------
function DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions(iPlayer)
	local pPlayer = Players[iPlayer]
	if (not HasTrait(pPlayer, traitNoneToFearThanGodID)) then
		DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions initializing for player " .. pPlayer:GetCivilizationShortDescription() .. "..")
		DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: iterate through major civs..")
		for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pOtherPlayer = Players[i]
			if HasTrait(pOtherPlayer, traitNoneToFearThanGodID) then
				DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: found Kanem-Bornu, iterate through its units..")
				for pUnit in pOtherPlayer:Units() do
					if pUnit and ((not pUnit:IsCombatUnit()) or pUnit:IsRanged()) then
						DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: found ranged or civilian unit..")
						local pPlot = pUnit:GetPlot()
						if pPlot then
							local pPlotWorkingCity = pPlot:GetWorkingCity()
							if pPlotWorkingCity then
								DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: Found working city to be " .. pPlotWorkingCity:GetName() .. "..")
								local pPlotWorkingCityOwner = pPlotWorkingCity:GetOwner()
								if pPlotWorkingCityOwner == pOtherPlayer:GetID() then
									DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: " .. pPlotWorkingCity:GetName() .. " is owned by " .. pOtherPlayer:GetCivilizationShortDescription() .. "..")
									if (pPlotWorkingCity:IsCapital()) or (pOtherPlayer:IsCapitalConnectedToCity(pPlotWorkingCity)) then
										DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: " .. pPlotWorkingCity:GetName() .. " either is the Capital or is connected to it..")
										if (not pUnit:IsHasPromotion(promotionCivilianRangedRetreatID)) then
											DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: unit doesn't have the retreat promotion..")
											pUnit:SetHasPromotion(promotionCivilianRangedRetreatID, true)
											DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: granted the unit the retreat promotion..")
										else
											DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: unit already had the retreat promotion - do nothing..")
										end
									else
										DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: working city is either not the capital or not connected to it..")
									end
								else
									DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: working city does not belong to kanem-bornu..")
								end
							end
						end
					else
						DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: this unit is not civilian nor ranged - do nothing..")
					end
				end
			end
		end
	elseif HasTrait(pPlayer, traitNoneToFearThanGodID) then
		DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions initializing for player " .. pPlayer:GetCivilizationShortDescription() .. "..")
		DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: iterate through its units..")
		for pUnit in pPlayer:Units() do
			if pUnit and ((not pUnit:IsCombatUnit()) or pUnit:IsRanged()) then
				DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: unit found is civilian or ranged..")
				if pUnit:IsHasPromotion(promotionCivilianRangedRetreatID) then
					DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: unit has the retreat promotion..")
					pUnit:SetHasPromotion(promotionCivilianRangedRetreatID, false)
					DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: removed retreat promotion from unit..")
				else
					DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: unit didn't have the retreat promotion - do nothing..")
				end
			else
				DMS_Print("DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions: this unit is not civilian nor ranged - do nothing..")
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DMS_WithNoneToFearButGod_ExtraMovementRemovePromotions)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage
----------------------------------------------------------------------------------------------------------------------------
function DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage(iPlayer)
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if HasTrait(pPlayer, traitNoneToFearThanGodID) then
		DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage initializing..")
		DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: iterate through cities..")
		for pCity in pPlayer:Cities() do
			if pCity and (pCity:IsCapital() or pPlayer:IsCapitalConnectedToCity(pCity)) then
				DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: " .. pCity:GetName() .. " either is the Capital or is connected to it..")
				
				local iDamageByFaith = pCity:GetFaithPerTurn() * 3
				if iDamageByFaith > 15 then
					iDamageByFaith = math.floor(15 + (0.4 * pCity:GetFaithPerTurn()))
					DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: iDamageByFaith = math.floor(15 + (0.4 * " .. pCity:GetFaithPerTurn() .. ")) = " .. iDamageByFaith .. "..")
				else
					DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: iDamageByFaith = " .. iDamageByFaith .. "..")
				end
				

				for pPlot in PlotAreaSweepIterator(pCity:Plot(), 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if pPlot and pPlot:IsUnit() then
						DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: found unit on plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")..")
						local iNumTileUnits = pPlot:GetNumUnits()
						for i = 0, pPlot:GetNumUnits() do
							local pUnit = pPlot:GetUnit(i)
							if pUnit then
								local iUnitOwner = pUnit:GetOwner()
								if iUnitOwner and iUnitOwner ~= iPlayer and pTeam:IsAtWar(Players[iUnitOwner]:GetTeam()) then
									DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: unit is not friendly..")
									if (100 - pUnit:GetDamage()) <= 15 then
										DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: unit only has " .. (100 - pUnit:GetDamage()) .. " HP, so can't inflict damage..")
									elseif (100 - pUnit:GetDamage()) > 15 + iDamageByFaith then
										pUnit:ChangeDamage(iDamageByFaith)
										DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: unit has " .. (100 - pUnit:GetDamage()) .. " HP; inflict " .. iDamageByFaith .. " damage..")
									else
										local iDamageByFaithMinimized = iDamageByFaith - (iDamageByFaith - ((100 - pUnit:GetDamage()) - 15))
										pUnit:ChangeDamage(iDamageByFaithMinimized)
										DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: unit has " .. (100 - pUnit:GetDamage()) .. " HP; inflict " .. iDamageByFaithMinimized .. " damage..")
									end
								else
									DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: unit is friendly (or one of our own)..")
								end
							end
						end
					end
				end
			else
				DMS_Print("DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage: " .. pCity:GetName() .. " is not connected to the capital - do nothing..")
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DMS_WithNoneToFearButGod_ConnectedCitiesInflictDamage)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Askawr_PillageTilesCombatStrength
----------------------------------------------------------------------------------------------------------------------------
function DMS_Askawr_PillageTilesCombatStrength(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitNoneToFearThanGodID) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit then
			if (pUnit:GetUnitType() == unitAskawrID) or (pUnit:IsHasPromotion(promotionAskawrPerfectPrinceID)) then
				local pUnitPlot = pUnit:GetPlot()
				DMS_Print("DMS_Askawr_PillageTilesCombatStrength initalizing for Askawr unit on plot (" .. pUnitPlot:GetX() .. "," .. pUnitPlot:GetY() .. ")..")
				if pUnitPlot then
					local iNumPillagedImprovements = 0
					DMS_Print("DMS_Askawr_PillageTilesCombatStrength: iterate through plots to find pillaged improvements..")
					for pPlot in PlotAreaSweepIterator(pUnitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
						if pPlot then
							if pPlot:GetImprovementType() and pPlot:IsImprovementPillaged() then
								DMS_Print("DMS_Askawr_PillageTilesCombatStrength: pillage improvement found at plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")..")
								iNumPillagedImprovements = iNumPillagedImprovements + 1
								DMS_Print("DMS_Askawr_PillageTilesCombatStrength: iNumPillagedImprovements = " .. iNumPillagedImprovements .. "..")
							end
						end
					end
					if iNumPillagedImprovements == 0 then
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 0 pillaged improvements - remove promotions..")
						pUnit:SetHasPromotion(promotionAskawrStrength1ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength2ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength3ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength4ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength5ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength6ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength7ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength8ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength9ID, false)
						pUnit:SetHasPromotion(promotionAskawrStrength10ID, false)
					elseif iNumPillagedImprovements == 1 then
						pUnit:SetHasPromotion(promotionAskawrStrength1ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 1 pillaged improvement - grant promotion..")
					elseif iNumPillagedImprovements == 2 then
						pUnit:SetHasPromotion(promotionAskawrStrength2ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 2 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 3 then
						pUnit:SetHasPromotion(promotionAskawrStrength3ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 3 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 4 then
						pUnit:SetHasPromotion(promotionAskawrStrength4ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 4 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 5 then
						pUnit:SetHasPromotion(promotionAskawrStrength5ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 5 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 6 then
						pUnit:SetHasPromotion(promotionAskawrStrength6ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 6 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 7 then
						pUnit:SetHasPromotion(promotionAskawrStrength7ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 7 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 8 then
						pUnit:SetHasPromotion(promotionAskawrStrength8ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 8 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 9 then
						pUnit:SetHasPromotion(promotionAskawrStrength9ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 9 pillaged improvements - grant promotion..")
					elseif iNumPillagedImprovements == 10 then
						pUnit:SetHasPromotion(promotionAskawrStrength10ID, true)
						DMS_Print("DMS_Askawr_PillageTilesCombatStrength: 10 pillaged improvements - grant promotion..")
					end
				end
			end
		end
	end
end

GameEvents.UnitSetXY.Add(DMS_Askawr_PillageTilesCombatStrength)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Askawr_WorkerWorksFaster
----------------------------------------------------------------------------------------------------------------------------
function DMS_Askawr_WorkerWorksFaster(iPlayer)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitNoneToFearThanGodID) then
		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:IsHasPromotion(promotionAskawrPerfectPrinceID) then
				local pPlot = pUnit:GetPlot()
				if pPlot then
					DMS_Print("DMS_Askawr_WorkerWorksFaster initializing for Askawr (or upgraded from one) on plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")..")
					local iNumTileUnits = pPlot:GetNumUnits()
					--if iNumTileUnits > 1 then
						DMS_Print("DMS_Askawr_WorkerWorksFaster: iterate through units on plot to see if there's another unit beside the Askawr..")
						for i = 0, pPlot:GetNumUnits() do
							local pOtherUnit = pPlot:GetUnit(i)
							if pOtherUnit and pOtherUnit ~= pUnit then
								DMS_Print("DMS_Askawr_WorkerWorksFaster: another unit found..")
								if pOtherUnit:WorkRate() > 0 then
									if (not userSettingBuildCharges) then
										DMS_Print("DMS_Askawr_WorkerWorksFaster: player is not using CiD Worker Charges..")
										DMS_Print("DMS_Askawr_WorkerWorksFaster: unit has a workrate..")
										if pOtherUnit:IsWork() then
											DMS_Print("DMS_Askawr_WorkerWorksFaster: unit is working..")
											local iCurrentBuild = pOtherUnit:GetBuildType()
											local pTeam = Teams[pPlayer:GetTeam()]
											local iBuildTime = pPlot:GetBuildProgress(iCurrentBuild, pTeam)
											DMS_Print("DMS_Askawr_WorkerWorksFaster: build time of is " .. iBuildTime .. "..")
											--pPlot:ChangeBuildProgress(iCurrentBuild, (pOtherUnit:WorkRate() * 2), pTeam)
											pPlot:ChangeBuildProgress(iCurrentBuild, (pOtherUnit:WorkRate() * 1.5))
											DMS_Print("DMS_Askawr_WorkerWorksFaster: changed the build time from " .. iBuildTime .. " to  " .. iBuildTime + (pOtherUnit:WorkRate()) .. "..")
										else
											DMS_Print("DMS_Askawr_WorkerWorksFaster: unit is not working - do nothing..")
										end
									elseif userSettingBuildCharges then
										DMS_Print("DMS_Askawr_WorkerWorksFaster: player is using CiD Worker Charges..")
										pPlayer:ChangeFaith(1)
											
										if pPlayer:IsHuman() then
											Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_POSITIVE_TEXT]+ 1 [ICON_PEACE] Faith[ENDCOLOR]", 0)
										end
									end
								else
									DMS_Print("DMS_Askawr_WorkerWorksFaster: unit does not have a workrate - do nothing..")
								end
							else
								DMS_Print("DMS_Askawr_WorkerWorksFaster: no other unit found - do nothing..")
							end
						end
					--end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DMS_Askawr_WorkerWorksFaster)
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------