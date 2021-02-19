-- MC_Calusa_DecisionFunctions.lua
-- Author: Sukritact
--=======================================================================================================================

print("loaded")

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- JFD_IsCivilisationActive
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

if not(JFD_IsCivilisationActive(GameInfoTypes.CIVILIZATION_MC_CALUSA)) then return end
--------------------------------------------------------------------------------------------------------------------------
-- IsEDActive
--------------------------------------------------------------------------------------------------------------------------
iEventDecision = "1f941088-b185-4159-865c-472df81247b2"
iCommPatch = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"

bEventDecision = false
bCommPatch = false

for iVal, tMod in pairs(Modding.GetActivatedMods()) do
	if tMod.ID == iEventDecision then
		bEventDecision = true
	elseif tMod.ID == iCommPatch then
		bCommPatch = true
	end
end

if not(bEventDecision) then return end
print("E&D Active")
--if bCommPatch then return end
--print("CP Inactive")
--------------------------------------------------------------------------------------------------------------------------
-- CompilePlotID
--------------------------------------------------------------------------------------------------------------------------
function CompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end
--=======================================================================================================================
-- Initiate Canal Construction
--=======================================================================================================================
--[[
	Since it's impossible to distinguish builds without improvements sans the CP, track workers as they construct roads.
	When a road is built on a valid tile, add a marsh.
]]
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

iWorker = GameInfoTypes.UNITCLASS_WORKER

tValidPlayers = {}
------------------------
-- Store all Calusa Players
------------------------
for iPlayer, pPlayer in pairs(Players) do
	if pPlayer:IsEverAlive() then
		if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MC_CALUSA then
			tValidPlayers[iPlayer] = true
		end
	end
end

local tPlots = {}
------------------------
-- Store all plots with workers
------------------------
for iPlayer, bActive in pairs(tValidPlayers) do
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == iWorker then

			local pPlot = pUnit:GetPlot()
			local iPlot = CompilePlotID(pPlot)

			tPlots[iPlot] = pPlot:IsRoute()

		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- Initiate Canal Construction: On Worker Movement
-------------------------------------------------------------------------------------------------------------------------
function MonitorUnit(iPlayer, iUnit, iX, iY)
	if not tValidPlayers[iPlayer] then return end

	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitClassType() == iWorker then

		local pPlot = pUnit:GetPlot()
		local iPlot = CompilePlotID(pPlot)

		tPlots[iPlot] = pPlot:IsRoute()
		--print(pPlot:IsRoute())

	end
end
GameEvents.UnitSetXY.Add(MonitorUnit)
-------------------------------------------------------------------------------------------------------------------------
-- Initiate Canal Construction: On Build Complete
-------------------------------------------------------------------------------------------------------------------------
local tValidFeatures = {}
tValidFeatures[-1] = true
tValidFeatures[GameInfoTypes.FEATURE_FLOOD_PLAINS] = true

local iMarsh = GameInfoTypes.FEATURE_MARSH

function MonitorBuild(iPlayer, iX, iY, iImprovement)
	if not tValidPlayers[iPlayer] then return end
	if iImprovement ~= -1 then return end

	local pPlot = Map.GetPlot(iX, iY)
	local iPlot = CompilePlotID(pPlot)

	bIsHadRoute = tPlots[iPlot]
	if bIsHadRoute == nil then return end
	if bIsHadRoute then return end

	if pPlot:IsRoute() then
		tPlots[iPlot] = true
		if pPlot:IsOpenGround() and tValidFeatures[pPlot:GetFeatureType()] then
			if Players[iPlayer]:HasPolicy(GameInfoTypes.POLICY_DECISIONS_CALUSACANAL) then
				pPlot:SetFeatureType(iMarsh, -1)
			end
		end
	end
end
GameEvents.BuildFinished.Add(MonitorBuild)
--=======================================================================================================================
--=======================================================================================================================