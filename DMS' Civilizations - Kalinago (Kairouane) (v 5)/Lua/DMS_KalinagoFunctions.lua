--DMS_KalinagoFunctions
--DMS
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua")
include( "IconSupport" );
include("FLuaVector.lua")
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
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_fmod
----------------------------------------------------------------------------------------------------------------------------
function DMS_fmod(x, y)
    if (x / y) ~= 1 then
        DMS_Print("Remainder is " .. math.fmod(x, y) .. "")
        return math.fmod(x, y)
    else
        DMS_Print("Remainder is 0")
        return 0
    end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetNearestCity
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetNearestCity(player, plotX, plotY)
	local iDistance = nil
	local pTargetCity = nil
	for city in player:Cities() do
		if not(iDistance) or iDistance > Map.PlotDistance(plotX, plotY, city:GetX(), city:GetY()) then
			pTargetCity = city
			iDistance = Map.PlotDistance(plotX, plotY, city:GetX(), city:GetY())
		end
	end
	return(pTargetCity)
end
------------------------------------------------------------------------------------------------------------------------
-- Globals
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 					= Game.GetActivePlayer()
local activePlayer 						= Players[activePlayerID]
local activePlayerTeam 					= Teams[Game.GetActiveTeam()]
local civilisationKalinagoID			= GameInfoTypes["CIVILIZATION_DMS_KALINAGO"]
local isKalinagoCivActive 				= JFD_IsCivilisationActive(civilisationKalinagoID)
local isKalinagoActivePlayer 			= activePlayer:GetCivilizationType() == civilisationKalinagoID
local traitSpiritOfTheRockID			= GameInfoTypes["TRAIT_DMS_SPIRIT_OF_THE_ROCK"]
local unitBuyeisID						= GameInfoTypes["UNIT_DMS_BUYEIS"]
local buildingKarbayID					= GameInfoTypes["BUILDING_DMS_KARBAY"]
local sUnitType							= "UNIT_PROPHET"
local iProphetID						= GameInfo.Units.UNIT_PROPHET.ID
local iFakeProphetID					= GameInfo.Units.UNIT_DMS_FAKEPROPHET_KALINAGO.ID
local iProphetOverride					= GameInfo.Units.UNIT_DMS_BUYEIS.ID
local tablePromotionOuboutou			= {}
for i = 1, 25 do 
	tablePromotionOuboutou[i]			= GameInfoTypes["PROMOTION_DMS_OUBOUTOU_" .. i .. "_A"]
end
local promotionOuboutouNearbyUnitsID	= GameInfoTypes["PROMOTION_DMS_OUBOUTOU_NEARBY"]
local promotionSpiritOfTheRockID		= GameInfoTypes["PROMOTION_DMS_SPIRIT_OF_THE_ROCK"]
local combatTypeMeleeID					= GameInfoTypes["UNITCOMBAT_MELEE"]
local combatTypeReconID					= GameInfoTypes["UNITCOMBAT_RECON"]
local combatTypeGunID					= GameInfoTypes["UNITCOMBAT_GUN"]
local combatTypeMountedID				= GameInfoTypes["UNITCOMBAT_MOUNTED"]
local combatTypeSiegeID					= GameInfoTypes["UNITCOMBAT_SIEGE"]
local combatTypeArcherID				= GameInfoTypes["UNITCOMBAT_ARCHER"]
local buildingGrowthFromHappinessID		= GameInfoTypes["BUILDING_DMS_KALINAGO_GROWTH"]
local buildingDummyDamageBuildingID		= GameInfoTypes["BUILDING_DMS_KALINAGO_CITY_DAMAGE"]
local buildingDummyBuyeisHappinessID	= GameInfoTypes["BUILDING_DMS_KALINAGO_BUYEIS_HAPPINESS"]
local iDomainLand						= GameInfoTypes["DOMAIN_LAND"]
--local mathCeil							= math.ceil
local PlayerDoTurn						= GameEvents.PlayerDoTurn.Add
local CityTrained						= GameEvents.CityTrained.Add
local UnitPrekill						= GameEvents.UnitPrekill.Add
local UnitSetXY							= GameEvents.UnitSetXY.Add
local SerialEventUnitCreated			= Events.SerialEventUnitCreated.Add

if isKalinagoCivActive then
	print("Chief Kairouane of the Kalinago joins the game..")
end
--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- DMS_DwellersOfTheCaribbean_PromotionGrantRemove
----------------------------------------------------------------------------------------------------------------------------
function DMS_DwellersOfTheCaribbean_PromotionGrantRemove(playerID)
    local player = Players[playerID]
    if (not HasTrait(player, traitSpiritOfTheRockID)) then return end
    local iCurrentTurn = Game.GetGameTurn()
	DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: iCurrentTurn = " .. iCurrentTurn .. "..")
    if (DMS_fmod(iCurrentTurn, 25) == 0) then
		local experiencedUnit = nil
		DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: Iterating units to find most experienced one..")
		for unit in player:Units() do
			if unit:GetUnitCombatType() == combatTypeMeleeID or unit:GetUnitCombatType() == combatTypeReconID or unit:GetUnitCombatType() == combatTypeGunID then
				DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: unit is correct type..")
				for i = 1, #tablePromotionOuboutou do
					if unit:IsHasPromotion(tablePromotionOuboutou[i]) then
						DMS_Print("unit already had ouboutou promotion (" .. i .. ")..")
						unit:SetHasPromotion(tablePromotionOuboutou[i], false)
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: ouboutou promotion (" .. i .. ") removed..")
					end
				end
				if (not experiencedUnit) then
					DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: experiencedunit has not yet been chosen, choose first unit..")
					experiencedUnit = unit
				else--if experiencedUnit then
					DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: experience unit has already been chosen..")
					if unit:GetExperience() > experiencedUnit:GetExperience() then
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: this unit is more experienced..")
						experiencedUnit = unit
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: set this unit as new experienced unit..")
					end
				end
			end
		end
		DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: unit iteration done")
		if experiencedUnit then
			DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: most experienced unit found..")
			if (not experiencedUnit:IsHasPromotion(tablePromotionOuboutou[25])) then
				experiencedUnit:SetHasPromotion(tablePromotionOuboutou[25], true)
				DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: granted ouboutou promotion (25)..")

				if player:IsHuman() then
					local unitIDType = experiencedUnit:GetUnitType()
					local sUnitType = GameInfo.Units[unitIDType].Description
					local unitPlot = experiencedUnit:GetPlot()
					local description = Locale.ConvertTextKey("TXT_KEY_PROMOTION_DMS_OUBOUTOU_NOTIFICATION", sUnitType)
					local descriptionShort = "An Ouboutou has been chosen"
					local iX = experiencedUnit:GetX()
					local iY = experiencedUnit:GetY()
					if iX and iY then
						JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", description, descriptionShort, nil, iX, iY)
					else
						JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", description, descriptionShort)
					end
				end
			end
		end
    end                    
end
PlayerDoTurn(DMS_DwellersOfTheCaribbean_PromotionGrantRemove)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_DwellersOfTheCaribbean_PromotionCounter
----------------------------------------------------------------------------------------------------------------------------
function DMS_DwellersOfTheCaribbean_PromotionCounter(playerID)
    local player = Players[playerID]
    if (not HasTrait(player, traitSpiritOfTheRockID)) then return end
	local iCurrentTurn = Game.GetGameTurn()
	DMS_Print("DMS_DwellersOfTheCaribbean_PromotionGrantRemove: iCurrentTurn = " .. iCurrentTurn .. "..")
    DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: iterate units..")
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionOuboutouNearbyUnitsID) then
			DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: unit has promotionOuboutouNearbyUnitsID..")
			unit:SetHasPromotion(promotionOuboutouNearbyUnitsID, false)
			DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: removed promotionOuboutouNearbyUnitsID..")
		end
	end
	if (DMS_fmod(iCurrentTurn, 25) ~= 0) then
		DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: iterate units..")
		for unit in player:Units() do
			local bUnitIsOuboutou = false
			for i = 1, #tablePromotionOuboutou do
				if i == 1 then
					if unit:IsHasPromotion(tablePromotionOuboutou[1]) then
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: unit has ouboutou promotion (" .. i .. ")..")
						unit:SetHasPromotion(tablePromotionOuboutou[1], false)
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: removed promotion (" .. i .. ")..")
					end
				else
					if unit:IsHasPromotion(tablePromotionOuboutou[i]) then
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: unit has ouboutou promotion (" .. i .. ")..")
						unit:SetHasPromotion(tablePromotionOuboutou[i], false)
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: removed promotion (" .. i .. ")..")
						unit:SetHasPromotion(tablePromotionOuboutou[i - 1], true)
						DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: added promotion (" .. i - 1 .. ")..")
						bUnitIsOuboutou = true
					end
				end
			end
			if bUnitIsOuboutou == true then
				DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: check for nearby friendly units")
				local unitPlot = unit:GetPlot()
				if unitPlot then
					for nearbyPlot in PlotAreaSweepIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if nearbyPlot:IsUnit() then
							DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: nearby unit found at plot (" .. nearbyPlot:GetX() .. "," .. nearbyPlot:GetY() .. ")")
							local iNumTileUnits = nearbyPlot:GetNumUnits()
							for i = 0, iNumTileUnits do
								local nearbyUnit = nearbyPlot:GetUnit(i)
								if nearbyUnit and nearbyUnit:GetOwner() == playerID then
									DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: unit is owned by the player")
									if (nearbyUnit:GetUnitCombatType() == combatTypeMeleeID or nearbyUnit:GetUnitCombatType() == combatTypeReconID or nearbyUnit:GetUnitCombatType() == combatTypeGunID or nearbyUnit:GetUnitCombatType() == combatTypeArcherID or nearbyUnit:GetUnitCombatType() == combatTypeSiegeID or nearbyUnit:GetUnitCombatType() == combatTypeMountedID) then
										DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: unit is correct combat type")
										nearbyUnit:SetHasPromotion(promotionOuboutouNearbyUnitsID, true)
										DMS_Print("DMS_DwellersOfTheCaribbean_PromotionCounter: added promotionOuboutouNearbyUnitsID..")
									end
								end
							end
						end
					end
				end
			end
		end
    end                    
end
PlayerDoTurn(DMS_DwellersOfTheCaribbean_PromotionCounter)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_DwellersOfTheCaribbean_Growth
----------------------------------------------------------------------------------------------------------------------------
function DMS_DwellersOfTheCaribbean_Growth(playerID)
    local player = Players[playerID]
    if (not HasTrait(player, traitSpiritOfTheRockID)) then return end
    for city in player:Cities() do
        if city then
            local cityTotalHappiness = city:GetLocalHappiness() + city:GetHappiness()
			DMS_Print("DMS_DwellersOfTheCaribbean_Growth: city " .. city:GetName() .. "..")
			DMS_Print("DMS_DwellersOfTheCaribbean_Growth: local happiness = " .. city:GetLocalHappiness() .. "..")
			DMS_Print("DMS_DwellersOfTheCaribbean_Growth: happiness = " .. city:GetHappiness() .. "..")
			DMS_Print("DMS_DwellersOfTheCaribbean_Growth: cityTotalHappiness " .. cityTotalHappiness .. "..")
            if cityTotalHappiness > 25 then
                cityTotalHappiness = 25
            end
            if cityTotalHappiness > 0 then
                city:SetNumRealBuilding(buildingGrowthFromHappinessID, cityTotalHappiness)
				DMS_Print("DMS_DwellersOfTheCaribbean_Growth: set growth buildings in capital..")
            end
        end
    end
end
PlayerDoTurn(DMS_DwellersOfTheCaribbean_Growth)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Carbet_DamageTaken
----------------------------------------------------------------------------------------------------------------------------
function DMS_Carbet_DamageTaken(playerID)
    local player = Players[playerID]
    if (not HasTrait(player, traitSpiritOfTheRockID)) then return end
    for city in player:Cities() do
        if city then
            local iNumDummyDamageBuilding = city:GetNumRealBuilding(buildingDummyDamageBuildingID)
            if iNumDummyDamageBuilding >= 50 then return end
               
            if city:GetDamage() > 0 then
                local iDamage = city:GetDamage()
				local iMaxHitPoints = city:GetMaxHitPoints()
                local iHitPointsPercent = (iDamage / iMaxHitPoints) * 100
                if iHitPointsPercent >= 1 and iHitPointsPercent < 50 then
                    iNumDummyDamageBuilding = iNumDummyDamageBuilding + 1
                elseif iHitPointsPercent >= 50 and iHitPointsPercent < 95 then
                    iNumDummyDamageBuilding = iNumDummyDamageBuilding + 2
                elseif iHitPointsPercent >= 95 then
                    iNumDummyDamageBuilding = iNumDummyDamageBuilding + 3
                end
            end
            if iNumDummyDamageBuilding > 0 then
                if iNumDummyDamageBuilding > 50 then
                    iNumDummyDamageBuilding = 50
                end
                city:SetNumRealBuilding(buildingDummyDamageBuildingID, iNumDummyDamageBuilding)
            end
        end
    end                         
end
PlayerDoTurn(DMS_Carbet_DamageTaken)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Carbet_CityTrained
----------------------------------------------------------------------------------------------------------------------------
function DMS_Carbet_CityTrained(iOwner, cityID, unitID, bGold, bFaithOrCulture)
    local player = Players[iOwner]
    if (not HasTrait(player, traitSpiritOfTheRockID)) then return end
    local city = player:GetCityByID(cityID)
    if (not city) then return end
	if (not city:IsHasBuilding(buildingKarbayID)) then return end
	local iNumDummyDamageBuilding = city:GetNumRealBuilding(buildingDummyDamageBuildingID)
	if (not iNumDummyDamageBuilding > 0) then return end
	local iXPBonus = mathCeil(iNumDummyDamageBuilding / 2)
	local unit = player:GetUnitByID(unitID)
	if unit and unit:IsCombatUnit() then
		unit:ChangeExperience(iXPBonus)
		if player:IsHuman() then
			local iX = unit:GetX()
			local iY = unit:GetY()
			if iX and iY then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "+".. iXPBonus .. " Experience", 2)
			end
		end
    end
end
CityTrained(DMS_Carbet_CityTrained)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ouboutou_CitizenOnKill
----------------------------------------------------------------------------------------------------------------------------
local iFirstTimeThroughKillerData = "NONE"
local bPrintForDebug = false
function DMS_Ouboutou_CitizenOnKill(iOwner, unitID, unitIDType, iX, iY, bDelay, iKiller)
	if bPrintForDebug then 
		DMS_Print("prekillListener: Dumping data for bDelay = " .. tostring(bDelay)) 
	end
	if bDelay then
		iFirstTimeThroughKillerData = iKiller
		if bPrintForDebug then 
			DMS_Print("iOwner: " .. iOwner)
			DMS_Print("unitID: " .. unitID)
			DMS_Print("unitIDType: " .. unitIDType .. " (" .. GameInfo.Units[unitIDType].Type .. ")")
			DMS_Print("iX: " .. iX)
			DMS_Print("iY: " .. iY)
			DMS_Print("bDelay: " .. tostring(bDelay))
			-- bDelay returns true before unit is killed (before UnitKilledInCombat) and only has one unit on the plot
			-- bDelay returns false after the unit is killed (after UnitKilledInCombat) and an enemy melee unit may be on the same plot at this point
			DMS_Print("iKiller: " .. iKiller)
		end
		return
	end
	if iOwner == Game.GetActivePlayer() then
		if bPrintForDebug then 
			DMS_Print("Unit killed belonged to the active player, exiting the function") 
		end
		return
	end
	if iFirstTimeThroughKillerData == -1 then
		if bPrintForDebug then 
			DMS_Print("iFirstTimeThroughKillerData was set to -1, which means no valid iKiller data from any run-through: exiting the function") 
		end
		iFirstTimeThroughKillerData = "NONE"
		return
	end
	if iFirstTimeThroughKillerData == "NONE" then
		if bPrintForDebug then 
			DMS_Print("iFirstTimeThroughKillerData was set to NONE, which means no valid iKiller data from any run-through: exiting the function") 
		end
		return
	end
	local pOwnerPlayer = Players[iOwner]
	local unitKilled = pOwnerPlayer:GetUnitByID(unitID)
	if unitKilled:GetDomainType() ~= iDomainLand then
		if bPrintForDebug then 
			DMS_Print("Unit killed was not a land combat unit, exiting the function") 
		end
		return
	end

	local pKillerPlayer = Players[iFirstTimeThroughKillerData]
	if bPrintForDebug then 
		DMS_Print("iFirstTimeThroughKillerData was " .. tostring(iFirstTimeThroughKillerData) .. " before resetting") 
	end

	iFirstTimeThroughKillerData = "NONE"
	if bPrintForDebug then 
		DMS_Print("pKillerPlayer is set to " .. tostring(pKillerPlayer))
		DMS_Print("iFirstTimeThroughKillerData was reset to " .. iFirstTimeThroughKillerData)


		DMS_Print("iOwner: " .. iOwner)
		DMS_Print("unitID: " .. unitID)
		DMS_Print("unitIDType: " .. unitIDType .. " (" .. GameInfo.Units[unitIDType].Type .. ")")
		DMS_Print("iX: " .. iX)
		DMS_Print("iY: " .. iY)
		DMS_Print("bDelay: " .. tostring(bDelay))
		-- bDelay returns true before unit is killed (before UnitKilledInCombat) and only has one unit on the plot
		-- bDelay returns false after the unit is killed (after UnitKilledInCombat) and an enemy melee unit may be on the same plot at this point
		DMS_Print("iKiller: " .. iKiller)
	end

	if (not HasTrait(pKillerPlayer, traitSpiritOfTheRockID)) then
		if bPrintForDebug then 
			DMS_Print("pKillerPlayer was not the Required Civilization, exiting the function") 
		end
		return
	end
	local plot = Map.GetPlot(iX, iY)
	local iNumTileUnits = plot:GetNumUnits()
	if bPrintForDebug then 
		DMS_Print("numUnits: " .. iNumTileUnits) 
	end

	if iNumTileUnits > 1 then
		for i = 0, iNumTileUnits do
			local unit = plot:GetUnit(i)
			if unit then
				local iPlotUnitOwner = unit:GetOwner()
				local iPlotUnitType = unit:GetUnitType()
				if unit ~= unitKilled then
					for i = 1, #tablePromotionOuboutou do
						if unit:IsHasPromotion(tablePromotionOuboutou[i]) or unit:IsHasPromotion(promotionSpiritOfTheRockID) then
							local pTargetCity = DMS_GetNearestCity(pKillerPlayer, iX, iY)
							DMS_Print("pTargetCity is " .. pTargetCity:GetName() .. "..") 
							local iRandom = JFD_GetRandom(1,100)
							DMS_Print("iRandom = " .. iRandom .. "..") 
							if iRandom <= 25 then
								pTargetCity:ChangePopulation(1, true)
								if pKillerPlayer:IsHuman() then
									local description = "Defeating an enemy Unit with you current Ouboutou provides +1 [ICON_CITIZEN] Citizen in the City of " .. pTargetCity:GetName() .. "!"
									local descriptionShort = "Ouboutou"
									if unit:IsHasPromotion(promotionSpiritOfTheRockID) then
										local description = "Defeating an enemy Unit with a unit possessing the 'Spirit of the Rock' promotion provides +1 [ICON_CITIZEN] Citizen in the City of " .. pTargetCity:GetName() .. "!"
										local descriptionShort = "Spirit of the Rock"
									end
									JFD_SendNotification(iKiller, 'NOTIFICATION_GENERIC', description, descriptionShort, -1, iX, iY)
								end
								break
							end
						end
					end
				end
				if bPrintForDebug then
					DMS_Print("Unit's Owner is: " .. iPlotUnitOwner)
					DMS_Print("UnitType is: " .. iPlotUnitType .. " (" .. GameInfo.Units[iPlotUnitType].Type .. ")")
				end
			end
		end
	end
end

UnitPrekill(DMS_Ouboutou_CitizenOnKill)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_BuyeisHappiness_UnitSetXY
----------------------------------------------------------------------------------------------------------------------------
function DMS_BuyeisHappiness_UnitSetXY(playerID, unitID, iX, iY)
	local player = Players[playerID]
	if (not HasTrait(player, traitSpiritOfTheRockID)) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	local unitType = unit:GetUnitType()
	if unitType == unitBuyeisID then
		local plot = Map.GetPlot(iX, iY)
		DMS_Print("DMS_BuyeisHappiness_UnitSetXY: unitBuyeisID at plot (" .. iX .. "," .. iY .. ")..") 
		if plot and plot:IsCity() then
			local city = plot:GetPlotCity()
			---if (not city) then return end
			city:SetNumRealBuilding(buildingDummyBuyeisHappinessID, 1)
			DMS_Print("DMS_BuyeisHappiness_UnitSetXY: set happiness building in " .. city:GetName() .. "..")
		elseif plot and (not plot:IsCity()) then
			DMS_Print("DMS_BuyeisHappiness_UnitSetXY: iterate cities..")
			for city in player:Cities() do
				local bHasBuyeis = false
				local iNumTileUnits = plot:GetNumUnits()
				if iNumTileUnits > 0 then
					for i = 0, iNumTileUnits do
						local unitGarrisoned = plot:GetUnit(i)
						if unitGarrisoned then
							if (unitGarrisoned:GetUnitType() == unitBuyeisID) then
								DMS_Print("DMS_BuyeisHappiness_UnitSetXY: city " .. city:GetName() .. " has garrisoned unitBuyeisID..")
								bHasBuyeis = true
							end
						end
					end
				end
				if bHasBuyeis == false then
					DMS_Print("DMS_BuyeisHappiness_UnitSetXY: city " .. city:GetName() .. " does not have garrisoned unitBuyeisID..")
					city:SetNumRealBuilding(buildingDummyBuyeisHappinessID, 0)
					DMS_Print("DMS_BuyeisHappiness_UnitSetXY: remove happiness building..")
				end
			end
		end
	end
end

UnitSetXY(DMS_BuyeisHappiness_UnitSetXY)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_BuyeisHappiness_PlayerDoTurn
----------------------------------------------------------------------------------------------------------------------------
function DMS_BuyeisHappiness_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not HasTrait(player, traitSpiritOfTheRockID)) then return end
	for city in player:Cities() do
		local bHasBuyeis = false
		local plot = city:Plot()
		if plot then
			local iNumTileUnits = plot:GetNumUnits()
			if iNumTileUnits > 0 then
				for i = 0, iNumTileUnits do
					local unit = plot:GetUnit(i)
					if unit then
						if (unit:GetUnitType() == unitBuyeisID) then
							bHasBuyeis = true
						end
					end
				end
			end
			if bHasBuyeis == false then
				city:SetNumRealBuilding(buildingDummyBuyeisHappinessID, 0)
				DMS_Print("DMS_BuyeisHappiness_PlayerDoTurn: remove happiness building..")
			end
		end
	end
end

PlayerDoTurn(DMS_BuyeisHappiness_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ProphetToBuyeisConverter
----------------------------------------------------------------------------------------------------------------------------
function DMS_ProphetToBuyeisConverter(playerID, unitID)
	local player = Players[playerID]
	if HasTrait(player, traitSpiritOfTheRockID) then
		local unit = player:GetUnitByID(unitID)
		if (not unit) then return end
		local unitType = unit:GetUnitType()
		if (unitType == iProphetID) or (unitType == iFakeProphetID) then
			local pNewUnit = player:InitUnit(unitBuyeisID, unit:GetX(), unit:GetY())
			pNewUnit:Convert(unit)	
			unit:Kill(-1)
		end
	elseif (not HasTrait(player, traitSpiritOfTheRockID)) then
		local unit = player:GetUnitByID(unitID)
		if (not unit) then return end
		local unitType = unit:GetUnitType()
		if (unitType == unitBuyeisID) then
			local pNewUnit = player:InitUnit(iProphetID, unit:GetX(), unit:GetY())
			pNewUnit:Convert(unit)	
			unit:Kill(-1)
		end
	end
end

SerialEventUnitCreated(DMS_ProphetToBuyeisConverter)
--==========================================================================================================================
-- ProphetReplacer (originally script by LastSword)
--==========================================================================================================================
-- ProphetOverride
----------------------------------------------------------------------------------------------------------------------------
function BuyeisOverride(playerID, unitID)
	local player = Players[playerID]
	if HasTrait(player, traitSpiritOfTheRockID) then
		local unit = player:GetUnitByID(unitID)
		if unit and (unit:GetUnitType() == iProphetID) then
			local newUnit = player:InitUnit(iProphetOverride, unit:GetX(), unit:GetY())				
			newUnit:Convert(unit);	
        end
    end
end

SerialEventUnitCreated(BuyeisOverride)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_AI_OnCitizenForBuyeis
----------------------------------------------------------------------------------------------------------------------------
function DMS_AI_OnCitizenForBuyeis(playerID)
	local player = Players[playerID]
	local iTeam = player:GetTeam()
	local pTeam = Teams[iTeam]
	if (HasTrait(player, traitSpiritOfTheRockID) and (not player:IsHuman()) and (not player:IsBarbarian())) then
		for city in player:Cities() do
			if city then
				local cityPlot = city:Plot()
				local iNumCityPop = city:GetPopulation()
				local iCitizenCost = (4 + (2 * Game.GetUnitCreatedCount(unitBuyeisID))) 
				local bLimitReached = false
				if Game.GetUnitCreatedCount(unitBuyeisID) >= (2 + (1 * player:GetCurrentEra())) then
					bLimitReached = true
				end
				local bHasEnoughCitizens = true
				if iNumCityPop < 1 + iCitizenCost then
					bHasEnoughCitizens = false
				end
				if (not bLimitReached) and (bHasEnoughCitizens) then
					local iRandom = JFD_GetRandom(1,100)
					if player:HasCreatedReligion() then
						iRandom = iRandom + 1
					end
					if (Game.GetNumReligionsStillToFound() == 0) then
						iRandom = iRandom + 1
					end
					if iRandom <= 5 then
						city:ChangePopulation(-iCitizenCost, true)

						unitBuyeis = player:InitUnit(unitBuyeisID, city:GetX(), city:GetY())
						unitBuyeis:JumpToNearestValidPlot()
					end
				end
			end
		end
	end
end

PlayerDoTurn(DMS_AI_OnCitizenForBuyeis)
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local isCityViewOpen									= false
----------------------------------------------------------------------------------------------------------------------------
-- DMS_UpdateCitizenForBuyeisExpend
----------------------------------------------------------------------------------------------------------------------------
function DMS_UpdateCitizenForBuyeisExpend()
	Controls.ExpendCitizenBackground:SetHide(true)
	Controls.ExpendCitizenImage:SetHide(true)
	Controls.ExpendCitizenButton:SetDisabled(true)
	Controls.ExpendCitizenButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if (city and (not city:IsPuppet())) then
		Controls.ExpendCitizenBackground:SetHide(false)
		local playerID = city:GetOwner()
		local player = Players[playerID]
		local cityPlot = city:Plot()
		local iNumCityPop = city:GetPopulation()
		local pCapital = player:GetCapitalCity()
		local iCitizenCost = (4 + (2 * Game.GetUnitCreatedCount(unitBuyeisID)))  
		local bLimitReached = false
		if Game.GetUnitCreatedCount(unitBuyeisID) >= (2 + (1 * player:GetCurrentEra())) then
			bLimitReached = true
		end
		local bHasEnoughCitizens = true
		if iNumCityPop < 1 + iCitizenCost then
			bHasEnoughCitizens = false
		end
		local buttonText = Locale.ConvertTextKey("TXT_KEY_TRAIT_DMS_CITIZEN_BUYEIS")
	-- DISABLE
		if bLimitReached then
			DMS_Print("city =" .. city:GetName() .. ": bLimitReached..")
			local buttonToolTipDisabled = Locale.ConvertTextKey("TXT_KEY_TRAIT_DMS_CITIZEN_BUYEIS_DISABLED_HELP_1", iCitizenCost)
			Controls.ExpendCitizenButton:SetText(buttonText)
			Controls.ExpendCitizenButton:LocalizeAndSetToolTip(buttonToolTipDisabled)
		-- DISABLE
		elseif (not bLimitReached) and (not bHasEnoughCitizens) then
			DMS_Print("city =" .. city:GetName() .. ": (not bLimitReached) and (not bHasEnoughCitizens)..")
			local buttonToolTipDisabled = Locale.ConvertTextKey("TXT_KEY_TRAIT_DMS_CITIZEN_BUYEIS_DISABLED_HELP_2", iCitizenCost)
			Controls.ExpendCitizenButton:SetText(buttonText)
			Controls.ExpendCitizenButton:LocalizeAndSetToolTip(buttonToolTipDisabled)
	-- ENABLE
		elseif (not bLimitReached) and (bHasEnoughCitizens) then
		DMS_Print("city =" .. city:GetName() .. ": (not bLimitReached) and (bHasEnoughCitizens)..")
			local buttonToolTip = Locale.ConvertTextKey("TXT_KEY_TRAIT_DMS_CITIZEN_BUYEIS_ENABLED", iCitizenCost)
			Controls.ExpendCitizenButton:SetDisabled(false)
			Controls.ExpendCitizenButton:SetText(buttonText)
			Controls.ExpendCitizenButton:LocalizeAndSetToolTip(buttonToolTip)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_OnCitizenForBuyeisExpend
----------------------------------------------------------------------------------------------------------------------------
function DMS_OnCitizenForBuyeisExpend()
	local city = UI.GetHeadSelectedCity();
	if city then
		local playerID = city:GetOwner()
		local player = Players[playerID]
		local iTeam = player:GetTeam()
		local pTeam = Teams[iTeam]
		local cityPlot = city:Plot()
		local iNumCityPop = city:GetPopulation()
		local pCapital = player:GetCapitalCity()
		local iCitizenCost = (4 + (2 * Game.GetUnitCreatedCount(unitBuyeisID))) 

		city:ChangePopulation(-iCitizenCost, true)

		unitBuyeis = player:InitUnit(unitBuyeisID, city:GetX(), city:GetY())
		unitBuyeis:JumpToNearestValidPlot()

	end

	DMS_UpdateCitizenForBuyeisExpend()
end
Controls.ExpendCitizenButton:RegisterCallback(Mouse.eLClick, DMS_OnCitizenForBuyeisExpend)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnEnterCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnEnterCityScreen()
	isCityViewOpen = true
	DMS_UpdateCitizenForBuyeisExpend()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnExitCityScreen()
	isCityViewOpen = false
	DMS_UpdateCitizenForBuyeisExpend()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnNextCityScren
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnNextCityScren()
	if isCityViewOpen then
		DMS_UpdateCitizenForBuyeisExpend()
	end
end

if (isKalinagoCivActive and isKalinagoActivePlayer) then
	Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(JFD_OnNextCityScren)
end
--==========================================================================================================================
--==========================================================================================================================