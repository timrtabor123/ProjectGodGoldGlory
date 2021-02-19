-- ========= --
-- UTILITIES --
-- ========= --

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
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

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
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
include("IconSupport.lua")
include("PlotIterators.lua")

local iCiv = GameInfoTypes["CIVILIZATION_THP_CHEYENNE"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ================================= --
-- UA: STARTING XP FROM TRADE ROUTES --
-- ================================= --

local iPerRouteVal = 5

function Cheyenne_StartingXP(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pCity = pPlayer:GetCityByID(cityID)
		local pUnit = pPlayer:GetUnitByID(unitID)
		local iXPGain = 0
		for k, v in pairs(pPlayer:GetTradeRoutes()) do
			if v.FromCity == pCity then
				iXPGain = iXPGain + iPerRouteVal
			end
		end
		pUnit:ChangeExperience(iXPGain)
	end
end

if bIsActive then
	GameEvents.CityTrained.Add(Cheyenne_StartingXP)
end

-- =================================== --
-- UA: BORDER EXPANSION UPON PROMOTION --
-- =================================== --

function Cheyenne_PromoBorders(playerID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pUnit = pPlayer:GetUnitByID(unitID)
		local pPlot = pUnit:GetPlot()
		if pPlot:GetOwner() ~= playerID then
			local pCity = Neirai_GetNearestCity(pPlayer, pPlot)
			for pAdjPlot in PlotAreaSpiralIterator(pCity:Plot(), 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pAdjPlot:GetOwner() == -1 then
					pAdjPlot:SetOwner(playerID, pCity:GetID())
					if pPlayer:IsHuman() then
						Events.GameplayAlertMessage("Promoting a unit caused border expansion in " .. pCity:GetName() .. "!")
					end
					return
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPromoted.Add(Cheyenne_PromoBorders)
end

-- ============================= --
-- UU: EXPERIENCE FROM PILLAGING --
-- ============================= --

local iPillageMission = GameInfoTypes["MISSION_PILLAGE"]
local iPillager = GameInfoTypes["UNIT_THP_DOG_SOLDIER"]
local iPillagerClass = GameInfoTypes["UNITCLASS_LANCER"]
local pActivePlayer = Players[Game.GetActivePlayer()]

function Cheyenne_IsButtonPossible(pUnit)
	if pUnit:GetUnitType() == iPillager then
		local pPlot = pUnit:GetPlot()
		local pPlotOwner = -1
		local pUnitOwner = Players[pUnit:GetOwner()]
		if pPlot:IsOwned() then
			pPlotOwner = Players[pPlot:GetOwner()]
		end
		if pUnitOwner ~= pPlotOwner then
			if pPlot:GetImprovementType() > -1 and not pPlot:IsImprovementPillaged() then
				if pPlot:IsOwned() then
					local pUnitTeam = Teams[pUnitOwner:GetTeam()]
					local iOtherTeam = pPlotOwner:GetTeam()
					if pUnitTeam:IsAtWar(iOtherTeam) then
						return true
					end
				else
					return true
				end
			end
		end
	end
	return false
end

function Cheyenne_DoButtonEffect(pPlayer, pUnit)
	local pPlot = pUnit:GetPlot()
	pPlot:SetImprovementPillaged(true)
	pUnit:ChangeMoves(-120)
	if pUnit:MovesLeft() < 0 then pUnit:SetMoves(0) end
	pUnit:ChangeDamage(-25)
	pPlayer:ChangeGold(20)
	if pPlayer:IsHuman() then
		local iX = pUnit:GetX()
		local iY = pUnit:GetY()
		local sMessage = "[COLOR_YIELD_GOLD]+20 [ICON_GOLD][ENDCOLOR]"
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
	end
	
	-- Additional effects go here!
	pUnit:ChangeExperience(3)
end

function DogSoldier_UnitActionButton()
	local pUnit = UI.GetHeadSelectedUnit();
	Cheyenne_DoButtonEffect(pActivePlayer, pUnit)
end

function DogSoldier_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if Cheyenne_IsButtonPossible(pUnit) then
		Controls.UnitActionButton:SetHide(false)
	else
		Controls.UnitActionButton:SetHide(true)
	end
	
	local buildCityButtonActive = pUnit:IsFound();
				
	local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack")
	local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
	primaryStack:CalculateSize();
	primaryStack:ReprocessAnchoring();

	local stackSize = primaryStack:GetSize();
	local stretchySize = primaryStretchy:GetSize();
	local buildCityButtonSize = 0
	if buildCityButtonActive then
		if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
			buildCityButtonSize = 36;
		else
			buildCityButtonSize = 60;
		end
	end
	primaryStretchy:SetSizeVal( stretchySize.x, stackSize.y + buildCityButtonSize + 348 );
end

local function DogSoldier_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_THP_DOG_SOLDIER_PILLAGE_TOOLTIP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function CheckIfCanPillage(playerID, unitID, missionID)
	-- thanks to chrisy for reminding me that CanStartMission exists
	if missionID == iPillageMission then
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit:GetUnitType() == iPillager then
			return false
		end
	end
	return true
end

function Cheyenne_AI_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(iPillagerClass) then
		if (pPlayer:GetCivilizationType() == iCiv) and (not pPlayer:IsHuman()) then
			for pUnit in pPlayer:Units() do
				if Cheyenne_IsButtonPossible(pUnit) then
					if pUnit:GetPlot():IsOwned() then
						local iRand = JFD_GetRandom(1, 2)
						if iRand == 2 then	
							Cheyenne_DoButtonEffect(pPlayer, pUnit)
						end
					else
						Cheyenne_DoButtonEffect(pPlayer, pUnit)
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(DogSoldier_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(DogSoldier_SerialEventUnitInfoDirty);
end

Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, DogSoldier_UnitActionButton);
IconHookup(37, 45, "UNIT_ACTION_ATLAS", Controls.UnitActionIcon)
GameEvents.CanStartMission.Add(CheckIfCanPillage)
GameEvents.PlayerDoTurn.Add(Cheyenne_AI_DoTurn)
Initialize();

-- ========================= --
-- UB: TRADE RANGE & HEALING --
-- ========================= --

-- This can all be done with SQL

-- ========== --
-- AA SUPPORT --
-- ========== --

if isAAActive then
	local iSunDance = GameInfoTypes["BUILDING_THP_SUN_DANCE"]
	local iBroadway = GameInfoTypes["BUILDING_BROADWAY"]
	
	function Cheyenne_SpecialAA(playerID, cityID, buildingType)
		if IsAAUnlocked('AA_THP_CHEYENNE_SPECIAL') then return end
		local pPlayer = Players[playerID]
		if not pPlayer:IsHuman() then return end
		if (buildingType == iSunDance) then
			local pCity = pPlayer:GetCityByID(cityID)
			if pCity:IsHasBuilding(iBroadway) then
				UnlockAA('AA_THP_CHEYENNE_SPECIAL')
			end
		elseif (buildingType == iBroadway) then
			local pCity = pPlayer:GetCityByID(cityID)
			if pCity:IsHasBuilding(iSunDance) then
				UnlockAA('AA_THP_CHEYENNE_SPECIAL')
			end
		end
	end
	GameEvents.CityConstructed.Add(Cheyenne_SpecialAA)
end
