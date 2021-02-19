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

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

--[[
function JFDGame_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = JFDGame_IsAAActive()
--]]

-- ======= --
-- DEFINES --
-- ======= --

include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")
include("PlotIterators.lua")

local iCiv = GameInfoTypes["CIVILIZATION_MC_MAYA"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ========================================= --
-- UA: AUTOMATIC FRESHWATER IN JUNGLE CITIES --
-- ========================================= --

local iJungle = GameInfoTypes["FEATURE_JUNGLE"]
local iFakeJungle = GameInfoTypes["FEATURE_MC_MAYA_JUNGLE"]

function Xoc_SettleJungleCity(playerID, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	if pPlot:GetFeatureType() == iJungle then
		local pPlayer = Players[playerID]
		if pPlayer:GetCivilizationType() == iCiv then
			pPlot:SetFeatureType(iFakeJungle)
		end
	end
end

function Xoc_CaptureJungleCity(oldPlayerID, bCapital, iX, iY, newPlayerID)
	local pPlot = Map.GetPlot(iX, iY)
	local pNewPlayer = Players[newPlayerID]
	if pPlot:GetFeatureType() == iFakeJungle then
		if pNewPlayer:GetCivilizationType() ~= iCiv then
			pPlot:SetFeatureType(iJungle)
		end
	elseif pNewPlayer:GetCivilizationType() == iCiv then
			if pPlot:GetFeatureType() == iJungle then
				-- if you stop razing a jungle city halfway through...
				-- ...then the resulting bug is your own fault...
				-- ...for making my life harder :b
				if not pPlot:GetPlotCity():IsRazing() then
					pPlot:SetFeatureType(iFakeJungle)
				end
			end
	end
end

if bIsActive then
	GameEvents.PlayerCityFounded.Add(Xoc_SettleJungleCity)
	GameEvents.CityCaptureComplete.Add(Xoc_CaptureJungleCity)
end

-- ============================================== --
-- UA: SACRIFICE UNITS FOR WLTKD IN RELIG. CITIES --
-- ============================================== --

local iWLTKDLength = GameDefines.CITY_RESOURCE_WLTKD_TURNS

function GetPlayerMainReligion(pPlayer)
	if pPlayer:HasCreatedReligion() then
		return pPlayer:GetReligionCreatedByPlayer()
	elseif pPlayer:GetCapitalCity() then
		return pPlayer:GetCapitalCity():GetReligiousMajority()
	end
	return -1
end

-- Checks if the unit is eligible to trigger the button
function Xoc_IsButtonPossible(pUnit)
	if pUnit:IsCombatUnit() then
		local pPlot = pUnit:GetPlot()
		if pPlot:IsCity() then
			local iReligion = pPlot:GetPlotCity():GetReligiousMajority()
			if (iReligion <= 0) then return false end
			if GetPlayerMainReligion(Players[pUnit:GetOwner()]) == iReligion then
				return true
			end
		end
	end
	return false
end

-- Executes the effect of the button
function Xoc_ProcessButtonEffect(pPlayer, pUnit)
	local pCity = pUnit:GetPlot():GetPlotCity()
	if pCity then
		pCity:SetWeLoveTheKingDayCounter(iWLTKDLength)
	end
	
	if pPlayer:IsHuman() then
		local sMessage = "Sacrifice! WLTKD begins"
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
	end
	pUnit:Kill()
end

-- This intermediary function allows us to generate arguments to input into Xoc_ProcessButtonEffect
function Xoc_DoButtonEffect()
	local pUnit = UI.GetHeadSelectedUnit();
	local pPlayer = Players[Game.GetActivePlayer()]
	Xoc_ProcessButtonEffect(pPlayer, pUnit)
end

function Xoc_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if Xoc_IsButtonPossible(pUnit) then
		Controls.XocButton:SetHide(false)
	else
		Controls.XocButton:SetHide(true)
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

local function Xoc_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.XocButton:SetSizeVal(50,50)
		Controls.XocButtonImage:SetSizeVal(64,64)
		Controls.XocButtonImage:SetTexture("UnitActions360.dds")
	else
		Controls.XocButton:SetSizeVal(36,36)
		Controls.XocButtonImage:SetSizeVal(45,45)
		Controls.XocButtonImage:SetTexture("UnitActions360.dds")
	end
	Controls.XocButtonImage:LocalizeAndSetToolTip("TXT_KEY_MC_MAYA_SACRIFICE_BUTTON_TOOLTIP")
	Controls.XocButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end


function Xoc_ButtonDoTurn(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:GetCivilizationType() == iCiv) and (not pPlayer:IsHuman()) then
		-- if player is AI, determine if it wants to use the ability
		if not pPlayer:GetCapitalCity() then return end
		if Teams[pPlayer:GetTeam()]:GetAtWarCount(false) > 0 then return end
		
		for pUnit in pPlayer:Units() do
			if Xoc_IsButtonPossible(pUnit) then
				if pUnit:GetPlot():GetPlotCity():GetWeLoveTheKingDayCounter() == 0 then
					local iRand = JFD_GetRandom(1, 3)
					if (iRand == 1) then
						Xoc_ProcessButtonEffect(pPlayer, pUnit)
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(Xoc_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Xoc_SerialEventUnitInfoDirty);
end

if bIsActive then
	Controls.XocButton:RegisterCallback(Mouse.eLClick, Xoc_DoButtonEffect)
	GameEvents.PlayerDoTurn.Add(Xoc_ButtonDoTurn)
	IconHookup(51, 45, "UNIT_ACTION_ATLAS", Controls.XocButtonImage)
	Initialize();
end

-- ======================================= --
-- UU: REMOVES NEARBY HERESY WHEN PROMOTED --
-- ======================================= --

local iHadzab = GameInfoTypes["UNIT_MC_HADZAB"]
local iInquisitor = GameInfoTypes["UNIT_INQUISITOR"]
local iRemoveHeresy = GameInfoTypes["MISSION_REMOVE_HERESY"]

function Xoc_HadzabPromoted(playerID, unitID, promotionType)
	local pPlayer = Players[playerID]
	if (not pPlayer:HasCreatedReligion()) then return end
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit:GetUnitType() == iHadzab then
		for pPlot in PlotAreaSweepIterator(pUnit:GetPlot(), 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if pPlot:IsCity() then
				local pCity = pPlot:GetPlotCity()
				if pCity:GetOwner() == playerID then
					local pTempUnit = pPlayer:InitUnit(iInquisitor, pCity:GetX(), pCity:GetY())
					pTempUnit:PushMission(iRemoveHeresy)
				end
			end
		end
		if pPlayer:IsHuman() then
			Events.GameplayAlertMessage("Removed Heresy in cities near your newly promoted Hadzab!")
		end
	end
end

if bIsActive then
	GameEvents.UnitPromoted.Add(Xoc_HadzabPromoted)
end

-- ========================== --
-- UB: SCI BOOST DURING WLTKD --
-- ========================== --

local iEknah = GameInfoTypes["BUILDING_MC_MAYAN_DZIB_ACTUN"]
local iSciDummy = GameInfoTypes["BUILDING_MC_EKNAH_BONUS_SCI"]

function Xoc_ScientificWLTKD(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:CountNumBuildings(iEknah) > 0 then
		for pCity in pPlayer:Cities() do
			local iNumToSet = 0
			if pCity:IsHasBuilding(iEknah) and pCity:GetWeLoveTheKingDayCounter() > 0 then
				iNumToSet = 1
			end
			pCity:SetNumRealBuilding(iSciDummy, iNumToSet)
		end
	elseif pPlayer:CountNumBuildings(iSciDummy) > 0 then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iSciDummy, 0)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Xoc_ScientificWLTKD)
end

