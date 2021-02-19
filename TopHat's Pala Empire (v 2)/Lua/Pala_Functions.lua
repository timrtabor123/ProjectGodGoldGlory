-- ======== --
-- INCLUDES --
-- ======== --

include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")

-- ========= --
-- UTILITIES --
-- ========= --

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

function IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = IsCPActive()

function Neirai_GetNearestCity(pPlayer, pPlot)
	local distance = 9999
	local cNearestCity = nil
	for cCity in pPlayer:Cities() do
		local pCityPlot = cCity:Plot()
		local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
		if between < distance then
			distance = between
			cNearestCity = cCity
		end
	end
	return cNearestCity
end

function JFDGame_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = JFDGame_IsAAActive()

-- ======= --
-- DEFINES --
-- ======= --

local pCiv = GameInfoTypes.CIVILIZATION_THP_PALA
local bIsActive = JFD_IsCivilisationActive(pCiv)

-- ================= --
-- GENERAL FUNCTIONS --
-- ================= --

local bPalace = GameInfoTypes.BUILDING_PALACE

function DoesCityHaveWonder(cCity)
	local bWonder = false
	if cCity:GetNumWorldWonders() > 0 then
		bWonder = true
	elseif cCity:GetNumNationalWonders() > 0 then
		if cCity:IsHasBuilding(bPalace) then
			if cCity:GetNumNationalWonders() > 1 then
				bWonder = true
			end
		else
			bWonder = true
		end
	elseif cCity:GetNumTeamWonders() > 0 then
		bWonder = true
	end
	return bWonder
end

local eAncient = GameInfoTypes.ERA_ANCIENT

function PalaGetEraModifier(pPlayer, iBaseAmount)
	local eEra = pPlayer:GetCurrentEra()
	local iMultiplier = 0
	if eEra > eAncient then
		iMultiplier = eEra
	else
		iMultiplier = 1
	end
	return (iBaseAmount * iMultiplier)
end

-- ====================== --
-- UA: FAITH FROM WONDERS --
-- ====================== --

local bTourismDummy = GameInfoTypes.BUILDING_THP_PALA_TOURISM

function UAWonderCheck(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	if pPlayer:GetCivilizationType() == pCiv then
		for cCity in pPlayer:Cities() do
			local bHasWonder = DoesCityHaveWonder(cCity)
			if bHasWonder then
				if not cCity:IsHasBuilding(bTourismDummy) then
					cCity:SetNumRealBuilding(bTourismDummy, 1)
				end
			else
				if cCity:IsHasBuilding(bTourismDummy) then
					cCity:SetNumRealBuilding(bTourismDummy, 0)
				end
			end
		end
	else
		if pPlayer:CountNumBuildings(bTourismDummy) > 0 then
			for cCity in pPlayer:Cities() do
				if cCity:IsHasBuilding(bTourismDummy) then
					cCity:SetNumRealBuilding(bTourismDummy, 0)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(UAWonderCheck)
end

-- ================================ --
-- UA: PRODUCTION FROM EXPENDING GP --
-- ================================ --

local iBaseProduction = 30

local gsQuick = GameInfoTypes.GAMESPEED_QUICK
local gsEpic = GameInfoTypes.GAMESPEED_EPIC
local gsMarathon = GameInfoTypes.GAMESPEED_MARATHON

function Pala_MultiplyByGamespeed(iNum)
	if Game.GetGameSpeedType() == gsQuick then
		iNum = (2 * iNum) / 3
	elseif Game.GetGameSpeedType() == gsEpic then
		iNum = 1.5 * iNum
	elseif Game.GetGameSpeedType() == gsMarathon then
		iNum = 3 * iNum
	end
	return iNum
end

-- This function works because the Community Patch DLL adds extra arguments to GreatPersonExpended
function PalaProductionTrigger_CP(playerID, unitID, uUnitType, iX, iY)
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	if pPlayer:GetCivilizationType() == pCiv then
		local pUnitPlot = Map.GetPlot(iX, iY)
		local cNearestCity = Neirai_GetNearestCity(pPlayer, pUnitPlot)
		if cNearestCity then
			local iChangeAmountGeneric = PalaGetEraModifier(pPlayer, iBaseProduction)
			local iChangeAmount = Pala_MultiplyByGamespeed(iChangeAmountGeneric)
			cNearestCity:ChangeProduction(iChangeAmount)
			if pPlayer:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_YIELD_PRODUCTION]+" .. iChangeAmount .. " [ICON_PRODUCTION] Production[ENDCOLOR]", 0)
			end
		end
	end
end

function PalaProductionTrigger_Normal(playerID, unitID, uUnitType, iX, iY, bDelay, otherPlayerID)
	if bDelay then return end
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	local uUnit = pPlayer:GetUnitByID(unitID)
	if not uUnit:IsGreatPerson() then return end
	if otherPlayerID ~= -1 then return end
	if pPlayer:GetCivilizationType() == pCiv then
		local pUnitPlot = Map.GetPlot(iX, iY)
		local cNearestCity = Neirai_GetNearestCity(pPlayer, pUnitPlot)
		if cNearestCity then
			local iChangeAmountGeneric = PalaGetEraModifier(pPlayer, iBaseProduction)
			local iChangeAmount = Pala_MultiplyByGamespeed(iChangeAmountGeneric)
			cNearestCity:ChangeProduction(iChangeAmount)
			if pPlayer:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_YIELD_PRODUCTION]+" .. iChangeAmount .. " [ICON_PRODUCTION] Production[ENDCOLOR]", 0)
			end
		end
	end
end

if bIsActive then
	if isCPActive then
		GameEvents.GreatPersonExpended.Add(PalaProductionTrigger_CP)
	else
		GameEvents.UnitPrekill.Add(PalaProductionTrigger_Normal)
	end
end

-- ========================= --
-- UB: STRONGER WITH WONDERS --
-- ========================= --

local bVihara = GameInfoTypes.BUILDING_THP_MAHAVIHARA
local bFakeVihara = GameInfoTypes.BUILDING_THP_PALA_UB_DUMMY

function CheckViharaForWonders(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	if pPlayer:GetCivilizationType() == pCiv then
		for cCity in pPlayer:Cities() do
			local bHasWonder = DoesCityHaveWonder(cCity)
			if cCity:IsHasBuilding(bVihara) then
				if (bHasWonder) and (not cCity:IsHasBuilding(bFakeVihara)) then
					cCity:SetNumRealBuilding(bFakeVihara, 1)
				elseif (not bHasWonder) and (cCity:IsHasBuilding(bFakeVihara)) then
					cCity:SetNumRealBuilding(bFakeVihara, 0)
				end
			else
				if cCity:IsHasBuilding(bFakeVihara) then
					cCity:SetNumRealBuilding(bFakeVihara, 0)
				end
			end
		end
	else
		if pPlayer:CountNumBuildings(bFakeVihara) > 0 then
			for cCity in pPlayer:Cities() do
				if cCity:IsHasBuilding(bFakeVihara) then
					cCity:SetNumRealBuilding(bFakeVihara, 0)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(CheckViharaForWonders)
end

-- ======================== --
-- UU: FAITH & AUTO-PILLAGE --
-- ======================== --

local uPalaElephant = GameInfoTypes.UNIT_THP_PALA_ELEPHANT

function ExecuteElephantEffect(pPlayer, pPlot, iBaseFaith)
	local pPlotOwner = Players[pPlot:GetOwner()]
	if not pPlotOwner then return end
	local tUnitTeam = Teams[pPlayer:GetTeam()]
	local iPlotTeam = pPlotOwner:GetTeam()
	if tUnitTeam:IsAtWar(iPlotTeam) then
		if pPlot:GetImprovementType() > -1 then
			pPlot:SetImprovementPillaged(true)
		end
		local iChangeAmount = PalaGetEraModifier(pPlayer, iBaseFaith)
		pPlayer:ChangeFaith(iChangeAmount)
		if pPlayer:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_WHITE]+" .. iChangeAmount .. " [ICON_PEACE] Faith[ENDCOLOR]", 0)
		end
	end
end

function PalaPromoteElephant(playerID, unitID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	local uUnit = pPlayer:GetUnitByID(unitID)
	if uUnit:GetUnitType() == uPalaElephant then
		local pPlot = uUnit:GetPlot()
		ExecuteElephantEffect(pPlayer, pPlot, 10)
	end
end

function PalaKillElephant(playerID, unitID, uUnitType, iX, iY, bDelay)
	if bDelay then return end
	if uUnitType == uPalaElephant then
		local pPlayer = Players[playerID]
		if not pPlayer:IsEverAlive() then return end
		local pPlot = Map.GetPlot(iX, iY)
		ExecuteElephantEffect(pPlayer, pPlot, 10)
	end
end

if bIsActive then
	GameEvents.UnitPromoted.Add(PalaPromoteElephant)
	GameEvents.UnitPrekill.Add(PalaKillElephant)
end

-- ======================= --
-- ADDITIONAL ACHIEVEMENTS --
-- ======================= --

function PalaAAWonderCheck(playerID)
	if IsAAUnlocked('AA_THP_PALA_SPECIAL') then return end
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	local iWonderCities = 0
	local bEarned = false
	if pPlayer:GetCivilizationType() == pCiv then
		for cCity in pPlayer:Cities() do
			if DoesCityHaveWonder(cCity) then
				iWonderCities = iWonderCities + 1
			end
			if iWonderCities > 5 then
				bEarned = true
				break
			end
		end
		if bEarned then
			UnlockAA('AA_THP_PALA_SPECIAL');
		end
	end
end

if isAAActive then
	GameEvents.PlayerDoTurn.Add(PalaAAWonderCheck)
end

--
--
