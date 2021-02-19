-- FionaDanger's Dai Viet Functions
-- Author: Jarcast
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsUsingMod
local CBPmodID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
local CBOmodID = "8411a7a8-dad3-4622-a18e-fcc18324c799"
local CSDmodID = "eead0050-1e3f-4178-a91f-26cf1881ac39"
local EEraModID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
local EECBPmodID  = "87b2deae-83cb-9b88-9017-79e741d3739c"

function Game_IsUsingMod(modID)
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == modID then
			return true
		end
	end
	return false
end

local isUsingEEra = Game_IsUsingMod(EEraModID) or Game_IsUsingMod(EECBPmodID)
local isUsingCBP  = Game_IsUsingMod(CBPmodID)
local isUsingCBO  = Game_IsUsingMod(CBOmodID)

-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
if Game then
	--Game.GetUserSetting
	function Game.GetUserSetting(type)
		for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
			return row.Value
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- Thanks Machiavelli for this
function CallSerialEventUnitCreatedGood(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	if(Players[playerID] == nil or
		Players[playerID]:GetUnitByID(unitID) == nil or
		Players[playerID]:GetUnitByID(unitID):IsDead() or
		Players[playerID]:GetUnitByID(unitID):IsHasPromotion(GameInfoTypes["PROMOTION_CREATED"])) then
		return;
	end

	local unit = Players[playerID]:GetUnitByID(unitID);

	-- Always mark the unit with the created promotion
	unit:SetHasPromotion(GameInfoTypes["PROMOTION_CREATED"], true);

	-- Call the good event
	LuaEvents.SerialEventUnitCreatedGood(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible);

	-- Kill the unit if some code hooked into the event has indicated the unit should be deleted
	if(unit:IsHasPromotion(GameInfoTypes["PROMOTION_MARKED_FOR_DEATH"])) then
		unit:Kill();
	end
end

local retVal = {};
LuaEvents.SerialEventUnitCreatedGood_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.SerialEventUnitCreatedGood_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	Events.SerialEventUnitCreated.Add(CallSerialEventUnitCreatedGood);
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local DaiVietID =  GameInfoTypes["CIVILIZATION_LUNG_DAI_VIET"]
local VoMieuID =  GameInfoTypes["BUILDING_LUNG_VOMIEU"]
local CamQuanID = GameInfoTypes["UNIT_LUNG_CAMQUAN"]
local CQAttackPromoID = GameInfoTypes["PROMOTION_CQATTACK"]
local NoDefBonusPromoID = GameInfoTypes["PROMOTION_NO_DEFENSIVE_BONUSES"]

local tBuildingCulture = {}
for row in DB.Query("SELECT a.ID BuildingID, b.BuildingType FROM Buildings a, Building_YieldChanges b WHERE a.Cost>0 AND a.Type = b.BuildingType AND (b.YieldType = 'YIELD_CULTURE' or a.CultureRateModifier>0) UNION ALL SELECT a.ID BuildingID, b.BuildingType FROM Buildings a, Building_YieldChangesPerPop b WHERE a.Cost>0 AND a.Type = b.BuildingType AND (b.YieldType = 'YIELD_CULTURE')") do
	tBuildingCulture[row.BuildingID] = false
end

local tBuildingScience = {}
for row in DB.Query("SELECT a.ID BuildingID, b.BuildingType FROM Buildings a, Building_YieldChanges b WHERE a.Cost>0 AND a.Type = b.BuildingType AND b.YieldType = 'YIELD_SCIENCE' UNION ALL SELECT a.ID BuildingID, b.BuildingType FROM Buildings a, Building_YieldChangesPerPop b WHERE a.Cost>0 AND a.Type = b.BuildingType AND (b.YieldType = 'YIELD_SCIENCE') UNION ALL SELECT a.ID BuildingID, b.BuildingType FROM Buildings a, Building_YieldModifiers b WHERE a.Cost>0 AND a.Type = b.BuildingType AND (b.YieldType = 'YIELD_SCIENCE')") do
	tBuildingScience[row.BuildingID] = false
end
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
-- UA: Dance of Flowers
--========================================================================================================================
-- Trained mounted units get Terrain defensive bonuses
function Jar_MountedGetDefenseBonus(iPlayer,iCity,iUnit,bGold,bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit) 
	local pCity = pPlayer:GetCityByID(iCity)    
	if (pPlayer:GetCivilizationType() == DaiVietID and pPlayer:IsAlive()) then
		if pUnit:IsHasPromotion(NoDefBonusPromoID) and pUnit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] then
			pUnit:SetHasPromotion(NoDefBonusPromoID, false);
		end
	end
end

if JFD_IsCivilisationActive(DaiVietID) then
GameEvents.CityTrained.Add(Jar_MountedGetDefenseBonus)
end

-- Constructing culture (science) buildings give science (culture) bonus
function Jar_BonusFromBuildings(iPlayer, iCity, iBuildingType )
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	local pPlot = pCity:Plot()
	local popfactor = math.min(10, 2+ pPlayer:GetCurrentEra())*math.min(50, pCity:GetPopulation())
	if (pPlayer:GetCivilizationType() == DaiVietID and pPlayer:IsAlive() ) then
		-- buildings yielding culture provide science
		for label, value in pairs(tBuildingCulture) do
			if label == iBuildingType then
				local bonus = ( math.max(10*(1+ pPlayer:GetCurrentEra()), 0.05*pPlayer:GetResearchCost(pPlayer:GetCurrentResearch()) )+ popfactor)
				local fTeamID = pPlayer:GetTeam();
				local fTeam = Teams[fTeamID];
				local fTeamTechs = fTeam:GetTeamTechs();
				fTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), bonus, iPlayer)
				tBuildingCulture[label] = true
				if pPlayer:IsHuman() then
					local stringtext = "[COLOR_RESEARCH_STORED]+" .. bonus .. "[ICON_RESEARCH][ENDCOLOR]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), stringtext, 4)
				end
			end
		end
		-- buildings yielding science provide culture
		for label, value in pairs(tBuildingScience) do
			if label == iBuildingType then
				local bonus = ( math.max(10*(1+ pPlayer:GetCurrentEra()), 0.05*pPlayer:GetNextPolicyCost() )+ popfactor)
				pPlayer:ChangeJONSCulture(bonus)
				tBuildingScience[label] = true
				if pPlayer:IsHuman() then
					local stringtext = "[COLOR_CULTURE_STORED]+" .. bonus .. "[ICON_CULTURE][ENDCOLOR]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), stringtext, 4)
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(DaiVietID) then
GameEvents.CityConstructed.Add(Jar_BonusFromBuildings)
end;

-- Adjustments for UA and UU
function Jar_DaiVietAdjustmentsUAUU(iPlayer)
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == DaiVietID and pPlayer:IsAlive()) then
        for pUnit in pPlayer:Units() do
            if pUnit:IsHasPromotion(CQAttackPromoID) then
                pUnit:SetHasPromotion(CQAttackPromoID, false);
            end
            if pUnit:IsHasPromotion(NoDefBonusPromoID) and pUnit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] then
                pUnit:SetHasPromotion(NoDefBonusPromoID, false);
            end
        end
		if isUsingCBO then
			for pCity in pPlayer:Cities() do
				if Game.GetElapsedGameTurns() == 1+ pCity:GetGameTurnFounded() then
					local sciencebonus = 0
					local culturebonus = 0
					local formula = 10 + 2*pCity:GetPopulation()
					for label, value in pairs(tBuildingCulture) do
						if pCity:IsHasBuilding(label) and not value then
							sciencebonus = sciencebonus + formula
							tBuildingCulture[label] = true
						end
					end
					for label, value in pairs(tBuildingScience) do
						if pCity:IsHasBuilding(label) and not value then
							culturebonus = culturebonus + formula
							tBuildingScience[label] = true
						end
					end
					pPlayer:ChangeJONSCulture(culturebonus)
					local fTeamID = pPlayer:GetTeam();
					local fTeam = Teams[fTeamID];
					local fTeamTechs = fTeam:GetTeamTechs();
					fTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), sciencebonus, iPlayer)				
					if pPlayer:IsHuman() then
						local stringtext = "[COLOR_CULTURE_STORED]+" .. culturebonus .. "[ICON_CULTURE][ENDCOLOR] [COLOR_RESEARCH_STORED]+" .. sciencebonus .. "[ICON_RESEARCH][ENDCOLOR]"
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), stringtext, 4)
					end
				end
			end
		end
    end
end

if JFD_IsCivilisationActive(DaiVietID) then
GameEvents.PlayerDoTurn.Add(Jar_DaiVietAdjustmentsUAUU);
end
--========================================================================================================================
-- UU: Cam Quan
--========================================================================================================================
function Jar_CamQuanBuffFromKilling(iOwner, iUnitID, iUnitType, iX, iY, bDelay, iKiller)
    local pOwner = Players[iOwner]
    local pUnit = pOwner:GetUnitByID(iUnitID)
    local unitplot = pUnit:GetPlot()
    if pUnit then
		local pKiller = Players[iKiller]
		local pTeam = Teams[pOwner:GetTeam()]
		local iKillerTeam = pKiller:GetTeam() -- Dai Viet
		if pTeam:IsAtWar(iKillerTeam) or pOwner:IsBarbarian() then
			if pUnit:IsTrade() or pUnit:GetBaseCombatStrength() > 0 then -- trade units or combat units
				for iPlotUnit = 0, unitplot:GetNumUnits() -1, 1 do
					local zUnit = unitplot:GetUnit(iPlotUnit)
					if zUnit:GetUnitType() == CamQuanID and not zUnit:IsHasPromotion(CQAttackPromoID) then
						zUnit:SetMadeAttack(false)          -- if the unit already attacked it 'recharges' the attack
						zUnit:SetMoves( zUnit:GetMoves() )  -- recharges moves    
						zUnit:SetHasPromotion(CQAttackPromoID, true); -- dummy promotion to limit one buff per turn
					end
                end
            end
        end
    end
end

if JFD_IsCivilisationActive(DaiVietID) then
GameEvents.UnitPrekill.Add(Jar_CamQuanBuffFromKilling)
end
--========================================================================================================================
-- UB: Vo Mieu
--========================================================================================================================
-- +1 Great General point per turn
function Jar_DaiVietVoMieuGeneral(iPlayer)
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == DaiVietID and pPlayer:IsAlive()) then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(VoMieuID) then
				local GGpoints = 1	-- here you can change if you want
				pPlayer:ChangeCombatExperience(GGpoints)				
				if pPlayer:IsHuman() then
					local stringtext = "Vo Mieu: +" .. GGpoints .. " [ICON_GREAT_GENERAL]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:Plot():GetX(), pCity:Plot():GetY()))), stringtext, 4)
				end
			end
		end
    end
end

if JFD_IsCivilisationActive(DaiVietID) and not isUsingCBP then
GameEvents.PlayerDoTurn.Add(Jar_DaiVietVoMieuGeneral);
end

-- +1 Culture and +1 Science from Forts and Citadels
-- When a Vo Mieu is constructed check Forts and Citadels
function Jar_VoMieuFortCitadels1(iPlayer, iCity, iBuildingType )
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	local cityPlot = pCity:Plot()
	if (pPlayer:GetCivilizationType() == DaiVietID and pPlayer:IsAlive() ) then
		if iBuildingType  == VoMieuID then
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot:GetOwner() == iPlayer then
					if pPlot:GetImprovementType() == GameInfo.Improvements["IMPROVEMENT_FORT"].ID or pPlot:GetImprovementType() == GameInfo.Improvements["IMPROVEMENT_CITADEL"].ID then
						Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfo.Yields.YIELD_CULTURE.ID, 1 )
						Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfo.Yields.YIELD_SCIENCE.ID, 1 )
					end
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(DaiVietID) and not isUsingCBP then
GameEvents.CityConstructed.Add(Jar_VoMieuFortCitadels1)
end;


-- When a Fort or Citadel is constructed check for Vo Mieu
DaiVietUB_BuildFinished_PlayerID = 0
DaiVietUB_BuildFinished_X = 0
DaiVietUB_BuildFinished_Y = 0
DaiVietUB_Improvement = 0

function Jar_VoMieuFortCitadels2(playerID, iX, iY, eImprovement) -- Thanks DMS
	-- Don't continue if this is a duplicate call
	if(DaiVietUB_BuildFinished_PlayerID == playerID and DaiVietUB_BuildFinished_X == iX and DaiVietUB_BuildFinished_Y == iY and DaiVietUB_BuildFinished_Improvement == eImprovement) then
		return;
	end
	-- Store inputs for duplication check
	DaiVietUB_BuildFinished_PlayerID = playerID;
	DaiVietUB_BuildFinished_X = iX;		
	DaiVietUB_BuildFinished_Y = iY;		
	DaiVietUB_BuildFinished_Improvement = eImprovement;
	--
	local pPlayer = Players[playerID];
	local pPlot = Map.GetPlot(iX, iY);
	local pCity = pPlot:GetWorkingCity()
	
	if pPlayer:GetCivilizationType() == DaiVietID and pPlayer:IsAlive() and pCity:IsHasBuilding(VoMieuID) then
		if eImprovement == GameInfo.Improvements["IMPROVEMENT_FORT"].ID or eImprovement == GameInfo.Improvements["IMPROVEMENT_CITADEL"].ID then
			Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfo.Yields.YIELD_CULTURE.ID, 1 )
			Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfo.Yields.YIELD_SCIENCE.ID, 1 )
		end
	end
end

if JFD_IsCivilisationActive(DaiVietID) and not isUsingCBP then
GameEvents.BuildFinished.Add(Jar_VoMieuFortCitadels2)
end

--========================================================================================================================
DaiViet_GG_Tran_Hung_Dao = true
function Jar_DaiVietFirstGeneral(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local pPlayer = Players[playerID];
	local pOldUnit = pPlayer:GetUnitByID(unitID);
	if pPlayer:GetCivilizationType() == DaiVietID and pPlayer:IsAlive() then
		local iUnitType = pOldUnit:GetUnitType()
		if iUnitType == GameInfoTypes["UNIT_GREAT_GENERAL"] and DaiViet_GG_Tran_Hung_Dao then
			DaiViet_GG_Tran_Hung_Dao = false
			local pNewUnit = pPlayer:InitUnit(iUnitType, pOldUnit:GetX(), pOldUnit:GetY())
			pNewUnit:SetName("Tran Hung Dao")
			--pNewUnit:Convert(pOldUnit)
			pOldUnit:Kill()
		end
	end	
end
if JFD_IsCivilisationActive(DaiVietID) then
LuaEvents.SerialEventUnitCreatedGood.Add(Jar_DaiVietFirstGeneral);
end

print("Dai Viet functions loaded")
--==========================================================================================================================
--==========================================================================================================================