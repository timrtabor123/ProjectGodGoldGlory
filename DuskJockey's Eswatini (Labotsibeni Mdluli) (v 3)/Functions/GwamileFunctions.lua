-- GwamileFunctions
-- Author: DuskJockey
-- DateCreated: 3/15/2019 11:08:30 AM
--------------------------------------------------------------
-- Globals
--------------------------------------------------------------
include("FLuaVector.lua")
include("C15_IteratorPack_v1.lua")
--------------------------------------------------------------
function JFD_IsCivilizationActive(civilizationID)
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

function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()

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
end

local civilizationID  = GameInfoTypes["CIVILIZATION_DJ_ESWATINI"]
local isCivActive	  = JFD_IsCivilizationActive(civilizationID)
if isCivActive then
	print("Labotsibeni Mdluli is in this game.")
end
--------------------------------------------------------------
-- Fortress of Africa
--------------------------------------------------------------
local traitGwamileID = GameInfoTypes["TRAIT_DJ_SIYINQABA"]
local buildingTrainMarkerID = GameInfoTypes["BUILDING_DJ_ESWATINI_MARKER"]
local buildingTrainBonusID = GameInfoTypes["BUILDING_DJ_ESWATINI_BORDERS"]
--------------------------------------------------------------
function DJ_GwamileUnitTrained(playerID, cityID, unitID, isGold, isFaithOrCulture)
	local player = Players[playerID]
	if HasTrait(player, traitGwamileID) then
		print("Player has the Swazi trait")
		if not isGold and not isFaithOrCulture then
			print("Unit was trained with production")
			local city = player:GetCityByID(cityID)
			local numMarkers = city:GetNumRealBuilding(buildingTrainMarkerID)
			print("City has " .. numMarkers .. " dummy buildings")
			city:SetNumRealBuilding(buildingTrainMarkerID, numMarkers+1)
			print("City has trained a unit; marker dummy added")
		end
	end
end

if isCivActive then
	GameEvents.CityTrained.Add(DJ_GwamileUnitTrained)
end
--------------------------------------------------------------
function DJ_GwamileWLtKDBonuses(playerID)
	local player = Players[playerID]
	if (HasTrait(player, traitGwamileID) and player:IsAlive()) then
		for city in player:Cities() do
			local WLtKDTurns = city:GetWeLoveTheKingDayCounter()
			if WLtKDTurns > 0 then
				local bonus = city:GetNumRealBuilding(buildingTrainMarkerID)
				if bonus > 30 then
					city:SetNumRealBuilding(buildingTrainBonusID, 30)
					print("" .. city:GetName() .. " has trained the max number of units")
				else
					city:SetNumRealBuilding(buildingTrainBonusID, bonus)
					print("" .. city:GetName() .. " has trained " .. bonus .. " units")
				end
			else
				city:SetNumRealBuilding(buildingTrainBonusID, 0)
			end
		end
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(DJ_GwamileWLtKDBonuses)
end
--------------------------------------------------------------
function DJ_GwamileGGFromTileClaiming(playerID, cityID, X, Y, isGold, isFaithOrCulture)
local player = Players[playerID]
	if (HasTrait(player, traitGwamileID) and player:IsAlive()) then
		local city = player:GetCityByID(cityID)
		local rawBonus = city:GetNumCityPlots()
		local finalBonus = math.ceil(rawBonus * 0.1)
		player:ChangeCombatExperience(finalBonus)
		print("Gained " .. finalBonus .. " Great General points from expansion")
		if player:IsHuman() and finalBonus > 0 then
			local hex = HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY())))
			Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GREAT_GENERAL]", finalBonus))
		end
	end
end
if isCivActive then
	GameEvents.CityBoughtPlot.Add(DJ_GwamileGGFromTileClaiming)
end
--------------------------------------------------------------
-- Ngwenyama
--------------------------------------------------------------
local promotionParamountChiefID = GameInfoTypes["PROMOTION_DJ_NGWENYAMA"]
local promotionIncwalaID = GameInfoTypes["PROMOTION_DJ_INCWALA"]
local promotionLionSpiritID = GameInfoTypes["PROMOTION_DJ_LION_SPIRIT"]
local unitCombatMeleeID = GameInfoTypes["UNITCOMBAT_MELEE"]
local unitNgwenyamaID = GameInfoTypes["UNIT_DJ_NGWENYAMA"]
--------------------------------------------------------------
function DJ_NgwenyamaCreated(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitNgwenyamaID and not unit:IsHasPromotion(promotionIncwalaID) then
		print("Ngwenyama born")
		local capital = player:GetCapitalCity()
		capital:ChangeWeLoveTheKingDayCounter(10)
		unit:SetHasPromotion(promotionIncwalaID, true)
		if player:IsHuman() then
			local alertmessage = Locale.ConvertTextKey("TXT_KEY_ALERT_DJ_ESWATINI_WLTKD_BEGUN", capital:GetName())
			Events.GameplayAlertMessage(alertmessage)
		end
	end
end

Events.SerialEventUnitCreated.Add(DJ_NgwenyamaCreated)
--------------------------------------------------------------
function DJ_NgwenyamaSpearThrow(playerID, unitID, iX, iY)
    local player = Players[playerID]
    local unit = player:GetUnitByID(unitID)
    local plot = Map.GetPlot(iX, iY)
    if plot then
        if unit:GetUnitType() == unitNgwenyamaID then
            for iterUnit in player:Units() do
                if iterUnit:GetUnitCombatType() == unitCombatMeleeID then
                    iterUnit:SetHasPromotion(promotionLionSpiritID, Map.PlotDistance(iX, iY, iterUnit:GetX(), iterUnit:GetY()) <= 1)
                end
            end
        else
            local UUNearby = false
            for iterUnit in C15_NearbyUnitIterator(plot) do
                if iterUnit and iterUnit:GetOwner() == playerID and iterUnit:GetUnitType() == unitNgwenyamaID then
                    UUNearby = true
                    break
                end
            end
            unit:SetHasPromotion(promotionLionSpiritID, UUNearby)
        end
    end
end

GameEvents.UnitSetXY.Add(DJ_NgwenyamaSpearThrow)
--------------------------------------------------------------
-- Royal Kraal
--------------------------------------------------------------
local buildingRoyalKraalID = GameInfoTypes["BUILDING_DJ_ROYAL_KRAAL"]
local buildingKraalCultureID = GameInfoTypes["BUILDING_DJ_KRAAL_CULTURE"]
--------------------------------------------------------------
function DJ_KraalExtraCulture(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if city:GetNumRealBuilding(buildingRoyalKraalID) > 0 then
			if city:IsProductionUnit() then
				city:SetNumRealBuilding(buildingKraalCultureID, 1)
				print("Extra Culture from animals working")
			else
				city:SetNumRealBuilding(buildingKraalCultureID, 0)
			end
		end
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(DJ_KraalExtraCulture)
end
print("GwamileFunctions.lua loaded successfully!")