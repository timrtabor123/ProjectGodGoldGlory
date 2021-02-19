-- DMS_MC_KanemBornu_Events
-- Author: DMS
--=======================================================================================================================
print("DMS's The Kanem-Bornu Empire's Events: loaded")
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
local bPrintForDebug = DMS_GetUserSetting("DMS_KANEM_BORNU_DEBUGGING_ON") == 1

function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_TableContains
----------------------------------------------------------------------------------------------------------------------------
function DMS_TableContains(table, value)
	for _, v in pairs(table) do
		if v == value then

		return true
		end
	end

	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit
----------------------------------------------------------------------------------------------------------------------------
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
    local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = -1}
    for iKey, sCombatType in pairs({...}) do
        for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
            if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
                tUnit = row
            end
        end
    end
    return tUnit.ID
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
----------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 
--========================================================================================================================
-- Civ Specific Events
--========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationKanemBornuID				= GameInfoTypes["CIVILIZATION_DMS_MC_KANEM_BORNU"]
local eraAncientID							= GameInfoTypes["ERA_ANCIENT"]
local eraClassicalID						= GameInfoTypes["ERA_CLASSICAL"]
local eraMedievalID							= GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID						= GameInfoTypes["ERA_RENAISSANCE"]
local eraIndustrialID						= GameInfoTypes["ERA_INDUSTRIAL"]
local promotionSokotoBoatmenKanemBornuID	= GameInfoTypes["PROMOTION_DMS_SOKOTO_BOATMEN_KANEM_BORNU"]
local promotionSokotoBoatmenID				= GameInfoTypes["PROMOTION_DMS_SOKOTO_BOATMEN"]
local policySokotoBoatmenDummy1ID			= GameInfoTypes["POLICY_DMS_SOKOTO_BOATMEN_DUMMY_1"]
local policySokotoBoatmenDummy2ID			= GameInfoTypes["POLICY_DMS_SOKOTO_BOATMEN_DUMMY_2"]
local buildingYerimaDummyID					= GameInfoTypes["BUILDING_DMS_YERIMA_DUMMY"]
local buildingKayghammaDummyID				= GameInfoTypes["BUILDING_DMS_KAYGHAMMA_DUMMY"]
local buildingYerimaOrKayghamma1ID			= GameInfoTypes["BUILDING_DMS_YERIMA_OR_KAYGHAMMA_1"]
local buildingYerimaOrKayghamma2ID			= GameInfoTypes["BUILDING_DMS_YERIMA_OR_KAYGHAMMA_2"]
local combatTypeReconID						= GameInfoTypes["UNITCOMBAT_RECON"]
local combatTypeMountedID					= GameInfoTypes["UNITCOMBAT_MOUNTED"]
local combatTypeMeleeID						= GameInfoTypes["UNITCOMBAT_MELEE"]
local combatTypeGunID						= GameInfoTypes["UNITCOMBAT_GUN"]
local unitWarriorID							= GameInfoTypes["UNIT_WARRIOR"]
local unitSpearmanID						= GameInfoTypes["UNIT_SPEARMAN"]
local unitPikemanID							= GameInfoTypes["UNIT_PIKEMAN"]
local unitWorkerID							= GameInfoTypes["UNIT_WORKER"]
--------------------------------------------------------------------------------------------------------------------------
-- Kanem-Bornu: Sokoto Boatmen
--------------------------------------------------------------------------------------------------------------------------
local Event_KanemBornuSokotoBoatmen = {}
	Event_KanemBornuSokotoBoatmen.Name = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN"
	Event_KanemBornuSokotoBoatmen.Desc = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_DESC"
	Event_KanemBornuSokotoBoatmen.EventImage = "Event_KotokoBoatmen.dds"
	Event_KanemBornuSokotoBoatmen.Data1 = {}	
	Event_KanemBornuSokotoBoatmen.Data2 = nil
	Event_KanemBornuSokotoBoatmen.Data3 = {}
	Event_KanemBornuSokotoBoatmen.Data4 = nil
	Event_KanemBornuSokotoBoatmen.Data5 = nil
	Event_KanemBornuSokotoBoatmen.Data6 = nil
	Event_KanemBornuSokotoBoatmen.Data7 = nil
	Event_KanemBornuSokotoBoatmen.Data8 = nil
	Event_KanemBornuSokotoBoatmen.Weight = 100
	Event_KanemBornuSokotoBoatmen.CanFunc = (
		function(pPlayer)			
			if load(pPlayer, "Event_KanemBornuSokotoBoatmen") == true then return false end

			if (pPlayer:GetCivilizationType() ~= civilisationKanemBornuID) then 
				return false 
			end
			
			if pPlayer:GetCurrentEra() > eraIndustrialID					then return false end
			DMS_Print("Event_KanemBornuSokotoBoatmen.CanFunc: era is before industrial era..")
			--if pPlayer:IsGoldenAge()										then return false end
			
			local iGoldenAgePoints = math.ceil(35 * iMod)
			local iFaith = math.ceil(35 * iMod)
			if (pPlayer:GetGoldenAgeProgressMeter() < iGoldenAgePoints)		then return false end
			DMS_Print("Event_KanemBornuSokotoBoatmen.CanFunc: player has at least " .. iGoldenAgePoints .. " Golden Age Points..")
			if (pPlayer:GetFaith() < iFaith)								then return false end
			DMS_Print("Event_KanemBornuSokotoBoatmen.CanFunc: player has at least " .. iFaith .. " Faith..")
			local iPlayer = pPlayer:GetID()
			Event_KanemBornuSokotoBoatmen.Data1 = {}
			for pCity in pPlayer:Cities() do
				if pCity and pCity:GetOriginalOwner() ~= iPlayer then
					table.insert(Event_KanemBornuSokotoBoatmen.Data1, pCity)
				end
			end
			if #Event_KanemBornuSokotoBoatmen.Data1 < 1						then return false end
			DMS_Print("Event_KanemBornuSokotoBoatmen.CanFunc: player has at least 1 conquered city..")
			Event_KanemBornuSokotoBoatmen.Data3 = {}
			for pUnit in pPlayer:Units() do
				if pUnit and pUnit:IsCombatUnit() then
					if (pUnit:GetUnitCombatType() == combatTypeReconID) or (pUnit:GetUnitCombatType() == combatTypeMeleeID) or (pUnit:GetUnitCombatType() == combatTypeMountedID) or (pUnit:GetUnitCombatType() == combatTypeGunID) then
						table.insert(Event_KanemBornuSokotoBoatmen.Data3, pUnit)
					end
				end
			end
			if #Event_KanemBornuSokotoBoatmen.Data3 < 5						then return false end
			DMS_Print("Event_KanemBornuSokotoBoatmen.CanFunc: player has at least 5 units..")
			Event_KanemBornuSokotoBoatmen.Data2 = Event_KanemBornuSokotoBoatmen.Data1[JFD_GetRandom(1, #Event_KanemBornuSokotoBoatmen.Data1)]
			DMS_Print("Event_KanemBornuSokotoBoatmen.CanFunc: city of " .. Event_KanemBornuSokotoBoatmen.Data2:GetName() .. " is chosen as random conquered city..")

			return true
		end
		)
	Event_KanemBornuSokotoBoatmen.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_KanemBornuSokotoBoatmen.Outcomes[1] = {}
	Event_KanemBornuSokotoBoatmen.Outcomes[1].Name = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_1"
	Event_KanemBornuSokotoBoatmen.Outcomes[1].Desc = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_1"
	Event_KanemBornuSokotoBoatmen.Outcomes[1].Weight = 5
	Event_KanemBornuSokotoBoatmen.Outcomes[1].CanFunc = (
		function(pPlayer)	

			return true
		end
		)
	Event_KanemBornuSokotoBoatmen.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iPlayer = pPlayer:GetID()
			
			-- determine strongest units
			DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: iterate through units in table..")
			for k, v in pairs(Event_KanemBornuSokotoBoatmen.Data3) do
				DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. "..")
				if Event_KanemBornuSokotoBoatmen.Data4 ~= nil then
					DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the strongest unit is not nil..")
					if Event_KanemBornuSokotoBoatmen.Data5 ~= nil then
						DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the second strongest unit is not nil..")
						if Event_KanemBornuSokotoBoatmen.Data6 ~= nil then
							DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the third strongest unit is not nil..")
							if Event_KanemBornuSokotoBoatmen.Data7 ~= nil then
								DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the fourth strongest unit is not nil..")
								if Event_KanemBornuSokotoBoatmen.Data8 ~= nil then
									DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the fifth strongest unit is not nil..")
									
									if v:GetLevel() >= Event_KanemBornuSokotoBoatmen.Data4:GetLevel() then
										DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level equal or higher than level of present strongest unit..")
										if v:GetLevel() > Event_KanemBornuSokotoBoatmen.Data4:GetLevel() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is higher - set new strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data4 = v
										elseif v:GetLevel() == Event_KanemBornuSokotoBoatmen.Data4:GetLevel() and v:GetExperience() > Event_KanemBornuSokotoBoatmen.Data4:GetExperience() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is equal, but has higher experience - set new strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data4 = v
										end
									elseif v:GetLevel() >= Event_KanemBornuSokotoBoatmen.Data5:GetLevel() then
										DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level equal or higher than level of present seconed strongest unit..")
										if v:GetLevel() > Event_KanemBornuSokotoBoatmen.Data5:GetLevel() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is higher - set new second strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data5 = v
										elseif v:GetLevel() == Event_KanemBornuSokotoBoatmen.Data5:GetLevel() and v:GetExperience() > Event_KanemBornuSokotoBoatmen.Data5:GetExperience() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is equal, but has higher experience - set new second strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data5 = v
										end
									elseif v:GetLevel() >= Event_KanemBornuSokotoBoatmen.Data6:GetLevel() then
										DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level equal or higher than level of present third strongest unit..")
										if v:GetLevel() > Event_KanemBornuSokotoBoatmen.Data6:GetLevel() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is higher - set new third strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data6 = v
										elseif v:GetLevel() == Event_KanemBornuSokotoBoatmen.Data6:GetLevel() and v:GetExperience() > Event_KanemBornuSokotoBoatmen.Data6:GetExperience() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is equal, but has higher experience - set new third strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data6 = v
										end
									elseif v:GetLevel() >= Event_KanemBornuSokotoBoatmen.Data7:GetLevel() then
										DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level equal or higher than level of present fouth strongest unit..")
										if v:GetLevel() > Event_KanemBornuSokotoBoatmen.Data7:GetLevel() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is higher - set new fourth strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data7 = v
										elseif v:GetLevel() == Event_KanemBornuSokotoBoatmen.Data7:GetLevel() and v:GetExperience() > Event_KanemBornuSokotoBoatmen.Data7:GetExperience() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is equal, but has higher experience - set new fourth strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data7 = v
										end
									elseif v:GetLevel() >= Event_KanemBornuSokotoBoatmen.Data8:GetLevel() then
										DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level equal or higher than level of present fifth strongest unit..")
										if v:GetLevel() > Event_KanemBornuSokotoBoatmen.Data8:GetLevel() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is higher - set new fifth strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data8 = v
										elseif v:GetLevel() == Event_KanemBornuSokotoBoatmen.Data8:GetLevel() and v:GetExperience() > Event_KanemBornuSokotoBoatmen.Data8:GetExperience() then
											DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " level is equal, but has higher experience - set new fifth strongest unit..")
											Event_KanemBornuSokotoBoatmen.Data8 = v
										end
									end

								else
									DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the strongest unit is nil - set new fifth strongest unit..")
									Event_KanemBornuSokotoBoatmen.Data8 = v
								end
							else
								DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the strongest unit is nil - set new fourth strongest unit..")
								Event_KanemBornuSokotoBoatmen.Data7 = v
							end
						else
							DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the strongest unit is nil - set new third strongest unit..")
							Event_KanemBornuSokotoBoatmen.Data6 = v
						end
					else
						DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the strongest unit is nil - set new second strongest unit..")
						Event_KanemBornuSokotoBoatmen.Data5 = v
					end
				else
					DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: " .. v:GetID().. " variable for the strongest unit is nil - set new strongest unit..")
					Event_KanemBornuSokotoBoatmen.Data4 = v
				end
			end
			-- promotions
			DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: grant promotions for the five strongest units..")
			Event_KanemBornuSokotoBoatmen.Data4:SetHasPromotion(promotionSokotoBoatmenKanemBornuID, true)
			Event_KanemBornuSokotoBoatmen.Data5:SetHasPromotion(promotionSokotoBoatmenKanemBornuID, true)
			Event_KanemBornuSokotoBoatmen.Data6:SetHasPromotion(promotionSokotoBoatmenKanemBornuID, true)
			Event_KanemBornuSokotoBoatmen.Data7:SetHasPromotion(promotionSokotoBoatmenKanemBornuID, true)
			Event_KanemBornuSokotoBoatmen.Data8:SetHasPromotion(promotionSokotoBoatmenKanemBornuID, true)
			-- barbarian sokoto boatmen units
			local pBarbarian = Players[63]
			if (pPlayer:GetCurrentEra() == eraAncientID) or (pPlayer:GetCurrentEra() == eraClassicalID) then
				DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: player is in ancient or classical era..")
				-- place dummy unit so that barb units won't auto conquer the city
				--unitKanemBornuDummy = pPlayer:InitUnit(unitWarriorID, Event_KanemBornuSokotoBoatmen.Data2:GetX(), Event_KanemBornuSokotoBoatmen.Data2:GetY())
				--DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: placed dummy warrior unit in city to avoid barb auto capture..")
				-- place barb units
				local pCityPlot = Map.GetPlot(Event_KanemBornuSokotoBoatmen.Data2:GetX(), Event_KanemBornuSokotoBoatmen.Data2:GetY())
				local bUnitsPlaced = false
				for pAdjCityPlot in PlotAreaSweepIterator(pCityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if bUnitsPlaced == false then
						if pAdjCityPlot and (not pAdjCityPlot:IsWater()) and (pAdjCityPlot:GetOwner() == iPlayer or pAdjCityPlot:GetOwner() == -1) then
							unitSokotoBoatMan1 = pBarbarian:InitUnit(unitWarriorID, pAdjCityPlot:GetX(), pAdjCityPlot:GetY())
							unitSokotoBoatMan2 = pBarbarian:InitUnit(unitSpearmanID, pAdjCityPlot:GetX(), pAdjCityPlot:GetY())
							unitSokotoBoatMan3 = pBarbarian:InitUnit(unitWarriorID, pAdjCityPlot:GetX(), pAdjCityPlot:GetY())
							DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: set up barb units to 2 x warrior and 1 spearman..")
							unitSokotoBoatMan1:JumpToNearestValidPlot()
							unitSokotoBoatMan2:JumpToNearestValidPlot()
							unitSokotoBoatMan3:JumpToNearestValidPlot()
							unitSokotoBoatMan1:SetName("Kotoko Boatman")
							unitSokotoBoatMan2:SetName("Kotoko Boatman")
							unitSokotoBoatMan3:SetName("Kotoko Boatman")
							DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: set up names for barb units..")
							bUnitsPlaced = true
							-- remove dummy unit
							--unitKanemBornuDummy:Kill(true, -1)
							--DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: killed dummy warrior unit after barb units have been placed..")
							end
						end
					end
			else 
				-- place dummy unit so that barb units won't auto conquer the city
				--local unitKanemBornuDummy = pPlayer:InitUnit(unitWarriorID, Event_KanemBornuSokotoBoatmen.Data2:GetX(), Event_KanemBornuSokotoBoatmen.Data2:GetY())
				--DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: placed dummy warrior unit in city to avoid barb auto capture..")
				-- place barb units
				local pCityPlot = Map.GetPlot(Event_KanemBornuSokotoBoatmen.Data2:GetX(), Event_KanemBornuSokotoBoatmen.Data2:GetY())
				local bUnitsPlaced = false
				for pAdjCityPlot in PlotAreaSweepIterator(pCityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if bUnitsPlaced == false then
						if pAdjCityPlot and (not pAdjCityPlot:IsWater()) and (pAdjCityPlot:GetOwner() == iPlayer or pAdjCityPlot:GetOwner() == -1) then
							DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: player is in medieval or renaissance (or enlightenment) era..")
							unitSokotoBoatMan1 = pBarbarian:InitUnit(unitPikemanID, pAdjCityPlot:GetX(), pAdjCityPlot:GetY())
							unitSokotoBoatMan2 = pBarbarian:InitUnit(unitSpearmanID, pAdjCityPlot:GetX(), pAdjCityPlot:GetY())
							unitSokotoBoatMan3 = pBarbarian:InitUnit(unitPikemanID, pAdjCityPlot:GetX(), pAdjCityPlot:GetY())
							DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: set up barb units to 2 x pikemen and 1 spearman..")
							unitSokotoBoatMan1:JumpToNearestValidPlot()
							unitSokotoBoatMan2:JumpToNearestValidPlot()
							unitSokotoBoatMan3:JumpToNearestValidPlot()
							unitSokotoBoatMan1:SetName("Kotoko Boatman")
							unitSokotoBoatMan2:SetName("Kotoko Boatman")
							unitSokotoBoatMan3:SetName("Kotoko Boatman")
							DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: set up names for barb units..")
							bUnitsPlaced = true
							-- remove dummy unit
							--unitKanemBornuDummy:Kill(true, -1)
							--DMS_Print("Event_KanemBornuSokotoBoatmen outcome 1: killed dummy warrior unit after barb units have been placed..")
						end
					end
				end
			end
						
			JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_1_NOTIFICATION", Event_KanemBornuSokotoBoatmen.Data2:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN"))
			JFD_SendWorldEvent(iPlayer, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_DMS_SOKOTO_BOATMEN_1"))

			save(pPlayer, "Event_KanemBornuSokotoBoatmen", true)
		end)

	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_KanemBornuSokotoBoatmen.Outcomes[2] = {}
	Event_KanemBornuSokotoBoatmen.Outcomes[2].Name = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_2"
	Event_KanemBornuSokotoBoatmen.Outcomes[2].Desc = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_2"
	Event_KanemBornuSokotoBoatmen.Outcomes[2].Weight = 2
	Event_KanemBornuSokotoBoatmen.Outcomes[2].CanFunc = (
		function(pPlayer)			
			local iGoldenAgePoints = math.ceil(50 * iMod)
			Event_KanemBornuSokotoBoatmen.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_2", iGoldenAgePoints)
			return true
		end
		)
	Event_KanemBornuSokotoBoatmen.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iPlayer = pPlayer:GetID()
			local iGoldenAgePoints = math.ceil(50 * iMod)
			pPlayer:ChangeGoldenAgeProgressMeter(-iGoldenAgePoints)
			-- find most advanced melee unit
			local iUnitMostCurrent = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			DMS_Print("Event_KanemBornuSokotoBoatmen outcome 2: found strongest military melee unit, iUnitMostCurrent = " .. iUnitMostCurrent .. "..")
			DMS_Print("Event_KanemBornuSokotoBoatmen outcome 2: local variable..")
			pUnitToSpawn = pPlayer:InitUnit(iUnitMostCurrent, pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
			pUnitToSpawn:JumpToNearestValidPlot()
			DMS_Print("Event_KanemBornuSokotoBoatmen outcome 2: localized ..")
			pUnitToSpawn:SetHasPromotion(promotionSokotoBoatmenID, true)
			DMS_Print("Event_KanemBornuSokotoBoatmen outcome 2: added promotion..")
			JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN"))
			JFD_SendWorldEvent(iPlayer, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_DMS_SOKOTO_BOATMEN_1"))

			save(pPlayer, "Event_KanemBornuSokotoBoatmen", true)
		end)

	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_KanemBornuSokotoBoatmen.Outcomes[3] = {}
	Event_KanemBornuSokotoBoatmen.Outcomes[3].Name = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_3"
	Event_KanemBornuSokotoBoatmen.Outcomes[3].Desc = "TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_3"
	Event_KanemBornuSokotoBoatmen.Outcomes[3].Weight = 3
	Event_KanemBornuSokotoBoatmen.Outcomes[3].CanFunc = (
		function(pPlayer)			
			local iGoldenAgePoints = math.ceil(50 * iMod)
			local iFaith = math.ceil(50 * iMod)
			Event_KanemBornuSokotoBoatmen.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_3", iGoldenAgePoints, iFaith)
			return true
		end
		)
	Event_KanemBornuSokotoBoatmen.Outcomes[3].DoFunc = (
		function(pPlayer) 
			local iPlayer = pPlayer:GetID()
			local iGoldenAgePoints = math.ceil(50 * iMod)
			local iFaith = math.ceil(50 * iMod)
			pPlayer:ChangeGoldenAgeProgressMeter(iGoldenAgePoints)
			pPlayer:ChangeFaith(-iFaith)
						
			JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_SOKOTO_BOATMEN"))
			JFD_SendWorldEvent(iPlayer, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_DMS_SOKOTO_BOATMEN_1"))

			save(pPlayer, "Event_KanemBornuSokotoBoatmen", true)
		end)


Events_AddCivilisationSpecific(civilisationKanemBornuID, "Event_KanemBornuSokotoBoatmen", Event_KanemBornuSokotoBoatmen)
--------------------------------------------------------------------------------------------------------------------------
-- Kanem-Bornu: Support the Yerima or Kayghamma at Court
--------------------------------------------------------------------------------------------------------------------------
local Event_KanemBornuYerimaOrKayghamma = {}
	Event_KanemBornuYerimaOrKayghamma.Name = "TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA"
	Event_KanemBornuYerimaOrKayghamma.Desc = "TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_DESC"
	Event_KanemBornuYerimaOrKayghamma.EventImage = "Event_YerimaOrKayghamma.dds"
	Event_KanemBornuYerimaOrKayghamma.Weight = 20
	Event_KanemBornuYerimaOrKayghamma.CanFunc = (
		function(pPlayer)			
			if load(pPlayer, "Event_KanemBornuYerimaOrKayghamma") == true then return false end
			if pPlayer:GetCivilizationType() ~= civilisationKanemBornuID then return false end

			local iEra = load(pPlayer, "Event_KanemBornuYerimaOrKayghamma")
			local iCurrentEra = pPlayer:GetCurrentEra()
			if iEra ~= nil then
				if iEra < iCurrentEra then
					save(pPlayer, "Event_KanemBornuYerimaOrKayghamma", nil)
				else
					return false
				end
			end
			
			local iPlayer = pPlayer:GetID()
			local iGold = math.ceil(70 * iMod)
			local iCulture = math.ceil(35 * iMod)

			if pPlayer:GetGold() < iGold				then return false end
			if pPlayer:GetJONSCulture() < iCulture		then return false end
			
			return true
		end
		)
	Event_KanemBornuYerimaOrKayghamma.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_KanemBornuYerimaOrKayghamma.Outcomes[1] = {}
	Event_KanemBornuYerimaOrKayghamma.Outcomes[1].Name = "TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_1"
	Event_KanemBornuYerimaOrKayghamma.Outcomes[1].Desc = "TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_RESULT_1"
	Event_KanemBornuYerimaOrKayghamma.Outcomes[1].Weight = 5
	Event_KanemBornuYerimaOrKayghamma.Outcomes[1].CanFunc = (
		function(pPlayer)	
			local iPlayer = pPlayer:GetID()
			local iGold = math.ceil(70 * iMod)
			local iCulture = math.ceil(35 * iMod)

			Event_KanemBornuYerimaOrKayghamma.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_RESULT_1", iGold, iCulture)

			return true
		end
		)
	Event_KanemBornuYerimaOrKayghamma.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iPlayer = pPlayer:GetID()
			local iGold = math.ceil(70 * iMod)
			local iCulture = math.ceil(35 * iMod)
			pPlayer:ChangeGold(-iGold)
			pPlayer:ChangeJONSCulture(-iCulture)
			local pTeam = Teams[pPlayer:GetTeam()]
			local pCapital = pPlayer:GetCapitalCity()
			if pTeam:GetAtWarCount(true) == 0 then
				if pCapital:IsHasBuilding(buildingYerimaOrKayghamma2ID) then
					pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma2ID, 0)
				end
				pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma1ID, 1)
				DMS_Print("Event_KanemBornuYerimaOrKayghamma outcome 1: Kanem-Bornu not at war - set dummy building in capital..")
			end
			--dummy building
			pCapital:SetNumRealBuilding(buildingYerimaDummyID, 1)
			-- remove potential dummy building from last time event was enacted
			if pCapital:IsHasBuilding(buildingKayghammaDummyID) then
				pCapital:SetNumRealBuilding(buildingKayghammaDummyID, 0)
			end

			JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA"))
			JFD_SendWorldEvent(iPlayer, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_DMS_YERIMA_OR_KAYGHAMMA_1"))

			save(pPlayer, "Event_KanemBornuYerimaOrKayghamma", pPlayer:GetCurrentEra())
		end)

	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_KanemBornuYerimaOrKayghamma.Outcomes[2] = {}
	Event_KanemBornuYerimaOrKayghamma.Outcomes[2].Name = "TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_2"
	Event_KanemBornuYerimaOrKayghamma.Outcomes[2].Desc = "TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_RESULT_2"
	Event_KanemBornuYerimaOrKayghamma.Outcomes[2].Weight = 10
	Event_KanemBornuYerimaOrKayghamma.Outcomes[2].CanFunc = (
		function(pPlayer)			

			local iPlayer = pPlayer:GetID()
			local iGold = math.ceil(70 * iMod)
			local iCulture = math.ceil(35 * iMod)

			Event_KanemBornuYerimaOrKayghamma.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_RESULT_2", iGold, iCulture)

			return true
		end
		)
	Event_KanemBornuYerimaOrKayghamma.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iPlayer = pPlayer:GetID()
			local iGold = math.ceil(70 * iMod)
			local iCulture = math.ceil(35 * iMod)
			pPlayer:ChangeGold(-iGold)
			pPlayer:ChangeJONSCulture(-iCulture)
			local pTeam = Teams[pPlayer:GetTeam()]
			local pCapital = pPlayer:GetCapitalCity()
			if pTeam:GetAtWarCount(true) > 0 then
				if pCapital:IsHasBuilding(buildingYerimaOrKayghamma1ID) then
					pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma1ID, 0)
				end
				pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma2ID, 1)
				DMS_Print("Event_KanemBornuYerimaOrKayghamma outcome 2: Kanem-Bornu is at war - set dummy building in capital..")
			end
			--dummy building
			pCapital:SetNumRealBuilding(buildingKayghammaDummyID, 1)
			-- remove potential dummy building from last time event was enacted
			if pCapital:IsHasBuilding(buildingYerimaDummyID) then
				pCapital:SetNumRealBuilding(buildingYerimaDummyID, 0)
			end

			JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_YERIMA_OR_KAYGHAMMA"))
			JFD_SendWorldEvent(iPlayer, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_DMS_YERIMA_OR_KAYGHAMMA_2"))

			save(pPlayer, "Event_KanemBornuYerimaOrKayghamma", pPlayer:GetCurrentEra())
		end)
		
		-- MONITOR FOR BOTH OUTCOMES
		Event_KanemBornuYerimaOrKayghamma.Monitors = {}
		Event_KanemBornuYerimaOrKayghamma.Monitors[Events.WarStateChanged] = (
		function(iTeam1, iTeam2, bWar)
			for iKanemBornu = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
				DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor war state changed..")
				local pKanemBornu = Players[iKanemBornu]
				if pKanemBornu:GetCivilizationType() == civilisationKanemBornuID then
					DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: found Kanem-Bornu..")
					local pTeam = Teams[pKanemBornu:GetTeam()]
					
				-- NOT AT WAR
					if pTeam:GetAtWarCount(true) == 0 then
						local pCapital = pKanemBornu:GetCapitalCity()
						DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu is not at war..")
						-- YERIMA
						if pCapital:IsHasBuilding(buildingYerimaDummyID) then
							DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu is currently supporting the peaceful Yerima fraction of their government..")
							if (not pCapital:IsHasBuilding(buildingYerimaOrKayghamma1ID)) then
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital does not have the dummy building..")
								pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma1ID, 1)
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: added dummy building to capital..")
							else
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital already has the dummy building - do nothing..")
							end
						-- KAYGHAMMA
						elseif pCapital:IsHasBuilding(buildingKayghammaDummyID) then
							DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu is currently supporting the war-loving Kayghamma fraction of their government..")
							if pCapital:IsHasBuilding(buildingYerimaOrKayghamma2ID) then
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital has the dummy building..")
								pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma2ID, 0)
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: removed dummy building from capital..")
							else
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital does not have the dummy building - do nothing..")
							end
						end
				-- AT WAR
					elseif pTeam:GetAtWarCount(true) > 0 then
						DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu is at war..")
						-- YERIMA
						if pCapital:IsHasBuilding(buildingYerimaDummyID) then
							DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu is currently supporting the peaceful Yerima fraction of their government..")
							if pCapital:IsHasBuilding(buildingYerimaOrKayghamma1ID) then
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital has the dummy building..")
								pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma1ID, 0)
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: removed dummy building from capital..")
							else
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital does not have the dummy building - do nothing..")
							end
						-- KAYGHAMMA
						elseif pCapital:IsHasBuilding(buildingKayghammaDummyID) then
							DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu is currently supporting the war-loving Kayghamma fraction of their government..")
							if (not pCapital:IsHasBuilding(buildingYerimaOrKayghamma2ID)) then
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital does not have the dummy building..")
								pCapital:SetNumRealBuilding(buildingYerimaOrKayghamma2ID, 1)
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: added dummy building to capital..")
							else
								DMS_Print("Event_KanemBornuYerimaOrKayghamma monitor: Kanem-Bornu capital already has the dummy building - do nothing..")
							end
						end
					end
				end
			end
		end
		)

Events_AddCivilisationSpecific(civilisationKanemBornuID, "Event_KanemBornuYerimaOrKayghamma", Event_KanemBornuYerimaOrKayghamma)
--========================================================================================================================
--========================================================================================================================