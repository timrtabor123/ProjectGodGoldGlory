--This Lua was written for EmeraldRange by ExplosiveWatermelon, because EW is a very nice lad and deserves headpats.

include("FLuaVector.lua")
include("IconSupport.lua")

--Defines

local pKaren = GameInfoTypes["CIVILIZATION_ER_KAREN"]
local pBuphaw = GameInfoTypes["BUILDING_EW_BUPHAW"]
local pThukay = GameInfoTypes["UNIT_ER_THUKAY"]

local pActivePlayer = Players[Game.GetActivePlayer()]

-----

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

if JFD_IsCivilisationActive(pKaren) then
	print("Karen active!")
end

-----

local tPlayers = {}
function EW_Karen_CheckPlayers()
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer and pPlayer:IsAlive() and (not pPlayer:IsBarbarian()) then
			tPlayers[iPlayer] = pPlayer
			
		end
	end
end

if JFD_IsCivilisationActive(pKaren) then
	Events.SequenceGameInitComplete.Add(EW_Karen_CheckPlayers)
end

-----

function GetNearestCity(pPlayer, pPlot)
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

--Functions

--UA

local pDummy = GameInfoTypes["BUILDING_EW_KAREN_DUMMY"]


function EW_Karen_UA(playerID)
	local pPlayer = Players[playerID]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pPlayer:GetCivilizationType() ~= pKaren then return end
	--Checks enemy Players
	local tWar = {}
	for k, v in pairs(tPlayers) do
		local pEnemy = v:GetTeam()
		if pTeam:IsAtWar(pEnemy) then
			tWar[k] = v
			
		
		end
	end
	--Checks for nearby cities
	for pCity in pPlayer:Cities() do
		local bAdd = true
		while bAdd do
			local iNum = 0
			for k, v in pairs(tWar) do
				local pNearest = GetNearestCity(v, pCity:Plot())
				local iDistance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pNearest:GetX(), pNearest:GetY())
				if iDistance <= 6 then
					iNum = pCity:GetNumBuilding(pDummy) + 1
					
					
					
					break
				end
			end
			pCity:SetNumRealBuilding(pDummy, iNum)
			bAdd = false
		end
	end
end

if JFD_IsCivilisationActive(pKaren) then
	GameEvents.PlayerDoTurn.Add(EW_Karen_UA)
end

--EW stole code from TopHat. No Dignity.
--Thukay pillage code

local iPillageMission = GameInfoTypes["MISSION_PILLAGE"]
local iPillager = GameInfoTypes["UNIT_ER_THUKAY"]
local iPillagerClass = GameInfoTypes["UNITCLASS_ANTI_AIRCRAFT_GUN"]


function IsButtonPossible(pUnit)
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

function Thukay_DoButtonEffect(pPlayer, pUnit)
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

	local iPoints = 1
	if pPlot:GetResourceType() > -1 then
		iPoints = 2
	end
	EW_Karen_PillageSuccess(pPlayer, pUnit, pPlot)
end

function Thukay_UnitActionButton()
	local pUnit = UI.GetHeadSelectedUnit();
	Thukay_DoButtonEffect(pActivePlayer, pUnit)
end

function Thukay_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if IsButtonPossible(pUnit) then
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

local function Thukay_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_EW_THUKAY_PILLAGE_HELP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function Thukay_CheckIfCanPillage(playerID, unitID, missionID)
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

function Thukay_AI_Pillage(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:GetCivilizationType() == iCiv) and pPlayer:HasUnitOfClassType(iPillagerClass) then
		if not pPlayer:IsHuman() then
			for pUnit in pPlayer:Units() do
				if IsButtonPossible(pUnit) then
					local iRandomSeed = JFD_GetRandom(1, 3)
					local iCheckAgainst = 3

					local pPlot = pUnit:GetPlot()
					if pPlot:GetResourceType() > -1 then
						iCheckAgainst = iCheckAgainst - 1
					end
					if pUnit:GetDamage() >= 50 then
						iCheckAgainst = iCheckAgainst - 1
					end

					if iRandomSeed >= iCheckAgainst then
						Thukay_DoButtonEffect(pPlayer, pUnit)
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(Thukay_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Thukay_SerialEventUnitInfoDirty);
end

if JFD_IsCivilisationActive(pKaren) then
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, Thukay_UnitActionButton);
	IconHookup(37, 45, "UNIT_ACTION_ATLAS", Controls.UnitActionIcon)
	GameEvents.CanStartMission.Add(Thukay_CheckIfCanPillage)
	GameEvents.PlayerDoTurn.Add(Thukay_AI_Pillage)
	Initialize();
end

--All that for this effect

function EW_Karen_PillageSuccess(pPlayer, pUnit, pPlot)
	local pCity = GetNearestCity(pPlayer, pPlot)
	if pCity then
		pCity:ChangeProduction(25)
		pPlayer:ChangeFaith(25)
	end
end

--Also this for UU

local pPromoFalse = GameInfoTypes["PROMOTION_EW_THUKAY"]
local pPromoTrue = GameInfoTypes["PROMOTION_EW_THUKAY_II"]

function EW_Karen_SetDamage(playerID, unitID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	--if pPlayer:IsTurnActive() then return end
	if pUnit and pUnit:GetUnitType() == pThukay then
		if pUnit:IsHasPromotion(pPromoTrue) and (pUnit:GetBaseCombatStrength() < 99) then
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 2)
			pUnit:SetHasPromotion(pPromoTrue, false)
			pUnit:SetHasPromotion(pPromoFalse, true)
		end
	end
end

if JFD_IsCivilisationActive(pKaren) then
	Events.SerialEventUnitSetDamage.Add(EW_Karen_SetDamage)
end