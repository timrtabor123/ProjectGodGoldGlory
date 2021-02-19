-- ========= --
-- UTILITIES --
-- ========= --

function IsCivilizationActive(civilizationID)
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

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function Neirai_GetNearestCity(pPlayer, pPlot)
	local distance = 9999
	local cNearestCity = nil
	for cCity in pPlayer:Cities() do
		local pCityPlot = cCity:Plot()
		local between = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pCityPlot:GetX(), pCityPlot:GetY())
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

include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")
include("PlotIterators.lua")

local pCiv = GameInfoTypes.CIVILIZATION_THP_RASHTRAKUTA
local bIsActive = IsCivilizationActive(pCiv)
local impBasadi = GameInfoTypes.IMPROVEMENT_THP_BASADI

-- ================== --
-- UA: GPP FROM FAITH --
-- ================== --

local sWriter = GameInfo.Specialists.SPECIALIST_WRITER.ID
local sArtist = GameInfo.Specialists.SPECIALIST_ARTIST.ID
local sMusician = GameInfo.Specialists.SPECIALIST_MUSICIAN.ID

-- This function lets you factor in Faith from a Basadi
function IsCityGettingEnoughFaith(cCity, pPlayer)
	local iAmountFaith = cCity:GetFaithPerTurn()
	if iAmountFaith >= 4 then return true end
	if pPlayer:IsGoldenAge() then
		if pPlayer:GetImprovementCount(impBasadi) > 0 then
			local pCityPlot = cCity:Plot()
			for pPlot in PlotAreaSpiralIterator(pCityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pPlot:GetImprovementType() == impBasadi then
					if not pPlot:IsImprovementPillaged() then
						if pPlot:GetOwner() == pPlayer:GetID() then
							iAmountFaith = iAmountFaith + 1
							if iAmountFaith >= 4 then return true end
						end
					end
				end
			end
		end
	end
	return false
end

function DisplayGPPMessage(sRand, cityname, pPlayer)
	if pPlayer:IsHuman() then
		local sText = "Great Artist!"
		if sRand == sWriter then
			sText = "Great Writer!"
		elseif sRand == sMusician then
			sText = "Great Musician!"
		end
		Events.GameplayAlertMessage("The faithful of " .. cityname .. " have produced points toward a " .. sText)
	end
end

function GiveGPPForFaithfulCities(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pCiv then
		for cCity in pPlayer:Cities() do
			if IsCityGettingEnoughFaith(cCity, pPlayer) then
				local cityname = cCity:GetName()
				local sRand = nil
				local iGPSelector = JFD_GetRandom(1, 4)
				if iGPSelector == 1 then
					sRand = sWriter
					DisplayGPPMessage(sRand, cityname, pPlayer)
				elseif iGPSelector == 4 then
					sRand = sMusician
					DisplayGPPMessage(sRand, cityname, pPlayer)
				else
					-- Artist points are more common b/c that's the kind of slot that the UA gives you
					sRand = sArtist
					DisplayGPPMessage(sRand, cityname, pPlayer)
				end
				cCity:ChangeSpecialistGreatPersonProgressTimes100(sRand, 300)
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(GiveGPPForFaithfulCities)
end

-- =================================== --
-- UA: GW SLOTS IN HAPPINESS BUILDINGS --
-- =================================== --

local tHappinessBuildings = {}
for row in GameInfo.TopHat_Rashtrakuta_Dummies() do
	tHappinessBuildings[GameInfoTypes[row.BuildingType]] = GameInfoTypes[row.DummyType]
end

function AddCorrectDummy(playerID, cityID, bgBuildingType)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pCiv then
		for k, v in pairs(tHappinessBuildings) do
			if k == bgBuildingType then
				local cCity = pPlayer:GetCityByID(cityID)
				if not cCity:IsHasBuilding(v) then
					cCity:SetNumRealBuilding(v, 1)
				end
				return
			end
		end
	end
end

function CheckNumDummies(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pCiv then
		if not pPlayer:GetCapitalCity() then return end
		for k, v in pairs(tHappinessBuildings) do
			local iNumAllReals = pPlayer:CountNumBuildings(k)
			local iNumAllDummies = pPlayer:CountNumBuildings(v)
			if iNumAllReals ~= iNumAllDummies then
				for cCheckedCity in pPlayer:Cities() do
					local iNumCityReals = cCheckedCity:GetNumRealBuilding(k)
					local iNumCityDummies = cCheckedCity:GetNumRealBuilding(v)
					if iNumCityReals ~= iNumCityDummies then
						cCheckedCity:SetNumRealBuilding(v, iNumCityReals)
					end
				end
			end
		end
	end
end

function UpdateDummiesOnCityCapture(oldPlayerID, bCap, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	local cCity = pPlot:GetPlotCity()
	local pNewPlayer = Players[cCity:GetOwner()]
	if pNewPlayer:GetCivilizationType() == pCiv then
		for k, v in pairs(tHappinessBuildings) do
			if cCity:IsHasBuilding(k) then
				cCity:SetNumRealBuilding(v, 1)
			end
		end
	else
		for k, v in pairs(tHappinessBuildings) do
			if pNewPlayer:CountNumBuildings(v) > 0 then
				cCity:SetNumRealBuilding(v, 0)
			end
		end
	end
end

if bIsActive then
	GameEvents.CityConstructed.Add(AddCorrectDummy)
	GameEvents.PlayerDoTurn.Add(CheckNumDummies)
	GameEvents.CityCaptureComplete.Add(UpdateDummiesOnCityCapture)
end

-- ================================= --
-- UU: STRENGTH BOOST PER GREAT WORK --
-- ================================= --

local uRashPikeman = GameInfoTypes.UNIT_THP_STHIRABHUTA

local uPromo1 = GameInfoTypes.PROMOTION_THP_RASH_ONE_GW
local uPromo2 = GameInfoTypes.PROMOTION_THP_RASH_TWO_GW
local uPromo3 = GameInfoTypes.PROMOTION_THP_RASH_THREE_GW
local uPromo4 = GameInfoTypes.PROMOTION_THP_RASH_MANY_GW

function GrantGWStrength(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	local uUnit = pPlayer:GetUnitByID(unitID)
	if uUnit:GetUnitType() == uRashPikeman then
		local cCity = pPlayer:GetCityByID(cityID)
		local iGW = cCity:GetNumGreatWorks()
		if iGW > 3 then
			uUnit:SetHasPromotion(uPromo4, true)
		elseif iGW == 3 then
			uUnit:SetHasPromotion(uPromo3, true)
		elseif iGW == 2 then
			uUnit:SetHasPromotion(uPromo2, true)
		elseif iGW == 1 then
			uUnit:SetHasPromotion(uPromo1, true)
		end
	end
end

if bIsActive then
	GameEvents.CityTrained.Add(GrantGWStrength)
end

-- ====================== --
-- UTI: GENERAL FUNCTIONS --
-- ====================== --

local tBasadiCount = {}

-- I stole this function from LastSword's Benin (Set XVIII)
function CheckBasadiAtGameStart()
	for i = 0, Map:GetNumPlots() - 1, 1 do
		local fPlot = Map.GetPlotByIndex(i)
		if (fPlot:GetImprovementType() == impBasadi) then
            tBasadiCount[fPlot] = 1
        end
	end
end

function AddNewBasadi(playerID, iX, iY, impType)
	if impType == impBasadi then
		local pPlot = Map.GetPlot(iX, iY)
		tBasadiCount[pPlot] = 1
	end
end

function EnsureValidBasadi(pPlot, playerID)
	if pPlot:GetOwner() == playerID then
		if pPlot:GetImprovementType() == impBasadi then
			if pPlot:IsBeingWorked() and not pPlot:IsImprovementPillaged() then
				return true
			end
		else
			tBasadiCount[pPlot] = nil
		end
	end
	return false
end

-- ====================== --
-- UTI: GOLDEN AGE POINTS --
-- ====================== --

function BasadiGAP(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetImprovementCount(impBasadi) > 0 then
		for k, v in pairs(tBasadiCount) do
			if EnsureValidBasadi(k, playerID) then
				pPlayer:ChangeGoldenAgeProgressMeter(2)
				if (pPlayer:IsHuman()) and (not pPlayer:IsGoldenAge()) then
					-- if you *are* in a Golden Age, BasadiFaithDuringGoldenAge sends the popup
					local iX = k:GetX()
					local iY = k:GetY()
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_POPUP_TEXT]+2 [ICON_GOLDEN_AGE] Golden Age points[ENDCOLOR]", 0)
				end
			end
		end
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(CheckBasadiAtGameStart)
	GameEvents.BuildFinished.Add(AddNewBasadi)
	GameEvents.PlayerDoTurn.Add(BasadiGAP)
end

-- =================================== --
-- UTI: FAITH PER GW DURING GOLDEN AGE --
-- =================================== --

function BasadiFaithDuringGoldenAge(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetImprovementCount(impBasadi) > 0 then
		if pPlayer:IsGoldenAge() then
			for k, v in pairs(tBasadiCount) do
				if EnsureValidBasadi(k, playerID) then
					local cNearCity = Neirai_GetNearestCity(pPlayer, k)
					local iNumGW = cNearCity:GetNumGreatWorks()
					pPlayer:ChangeFaith(iNumGW)
					if pPlayer:IsHuman() then
						local iX = k:GetX()
						local iY = k:GetY()
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_POPUP_TEXT]+2 [ICON_GOLDEN_AGE] Golden Age points[ENDCOLOR][NEWLINE][COLOR_WHITE]+1 [ICON_PEACE] Faith[ENDCOLOR]", 0)
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(BasadiFaithDuringGoldenAge)
end

-- ======================= --
-- ADDITIONAL ACHIEVEMENTS --
-- ======================= --

if isAAActive then
	local tWritingClasses = DB.Query("SELECT Type FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE GreatWorkSlotType = GREAT_WORK_SLOT_WRITING)")
end

function CheckGWForAchievement(playerID)
	if IsAAUnlocked('AA_THP_RASHTRAKUTA_SPECIAL') then return end
	local pPlayer = Players[playerID]
	if not pPlayer:IsHuman() then return end
	local iNumWritings = 0
	if pPlayer:GetCivilizationType() == pCiv then
		local cCap = pPlayer:GetCapitalCity()
		if cCap then
			for k, v in pairs(tWritingClasses) do
				-- boy i hope this works
				local iWorksInHere = cCap:GetNumGreatWorksInBuilding(v)
				iNumWritings = iNumWritings + iWorksInHere
				if iNumWritings > 4 then
					UnlockAA('AA_THP_RASHTRAKUTA_SPECIAL');
				end
			end
		end
	end
end

if isAAActive then
	GameEvents.PlayerDoTurn.Add(CheckGWForAchievement)
end
