-- Lua Script1
-- Author: pedro
-- DateCreated: 08/10/20 12:15:25 PM
--------------------------------------------------------------
include("PlotIterators.lua")

local songhaiID = GameInfoTypes["CIVILIZATION_UC_SONGHAI"]

--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

-------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit
-------------------------------------------------------------------------------------------------------------------------
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

local isSonghaiCivActive	= JFD_IsCivilisationActive(songhaiID)

function SonniAli(killerID, killedID, killedUnitType)
	local player = Players[killerID]
	if (not player:IsAlive()) then return end

	if not player:GetCivilizationType() == songhaiID then return end
	local playerKilled = Players[killedID]
	if playerKilled:IsBarbarian() then
		local domain = GameInfo.Units[killedUnitType].Domain
		if domain == 'DOMAIN_LAND' then
			local yieldGGP = math.ceil(GameInfo.Units[killedUnitType].Combat)
			player:ChangeCombatExperience(yieldGGP)
		elseif domain == 'DOMAIN_SEA' then
			local yieldGAP = math.ceil(GameInfo.Units[killedUnitType].Combat)
			player:ChangeNavalCombatExperience(yieldGAP)
		end
	end
end
if isSonghaiCivActive then
GameEvents.UnitKilledInCombat.Add(SonniAli)
end

function Songhai_WarangaEntrepot(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == songhaiID then
	for city in player:Cities() do
		if city:IsHasBuilding(GameInfoTypes.BUILDING_UC_SUGUBA) then
			if not (city:IsHasBuilding(GameInfoTypes.BUILDING_UC_SUGUBA_DUMMY)) then
			local plot = city:Plot()
			if city:IsHasBuilding(GameInfoTypes.BUILDING_MINT) or plot:IsRiver() then
				city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_SUGUBA_DUMMY, 1)
					end
				end
			end
		end
	end
end
if isSonghaiCivActive then
GameEvents.PlayerDoTurn.Add(Songhai_WarangaEntrepot)
end

local unitTriremeID	= GameInfoTypes["UNIT_TRIREME"]

function HiKoiBirth(playerID, unitID)
local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == GameInfoTypes.UNIT_UC_HI_KOI then
		local count = 0
		for city in player:Cities() do
			if not city:IsOccupied() and not city:IsCoastal() then
				count = count + 1
			end
		end
		local newUnitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_NAVALMELEE") or unitTriremeID
		local plot = unit:GetPlot()
			while (count > 0) do
				local newUnit = player:InitUnit(newUnitID, plot:GetX(), plot:GetY())
				count = count - 1
			end
			--local alertmessage = Locale.ConvertTextKey("TXT_KEY_UC_HEJAZ_UA", bonus, player:GetName())
			--Events.GameplayAlertMessage(alertmessage)
				end
			end
Events.SerialEventUnitCreated.Add(HiKoiBirth)

function IsValidForHiKoi(playerID, unit)
	local valid = false
	if unit:IsEmbarked() then
	local unitPlot = unit:GetPlot()
	if unitPlot then
		for loopPlot in PlotAreaSpiralIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		local loopUnit = loopPlot:GetUnit()
		if (loopUnit and loopUnit:GetOwner() == playerID and loopUnit:GetUnitType() == GameInfoTypes.UNIT_UC_HI_KOI) then			
			valid = true
				end
			end
		end
	end
	return valid
end

	
	

function HiKoiSiege(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if IsValidForHiKoi(playerID, unit) then
				if not unit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SONGHAI_SIEGE) then
					unit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_SONGHAI_SIEGE, true)
				end
			else 
				if unit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SONGHAI_SIEGE) then
					unit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_SONGHAI_SIEGE, false)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HiKoiSiege)

