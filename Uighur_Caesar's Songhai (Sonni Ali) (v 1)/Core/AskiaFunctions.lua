-- AskiaFunctions
-- Author: pedro
-- DateCreated: 09/15/20 5:37:02 PM
--------------------------------------------------------------
include("PlotIterators.lua")

local askiaID = GameInfoTypes["CIVILIZATION_SONGHAI"]

--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
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

--JFD_GetNumIncomingTradeRoutes
function JFD_GetNumIncomingTradeRoutes(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutesToYou()
	local numIncomingTRs = 0
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToCity == city then
			numIncomingTRs = numIncomingTRs + 1
		end
	end
	return numIncomingTRs
end

local isSonghaiCivActive	= JFD_IsCivilisationActive(askiaID)

function Askia_TradeWorks(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == askiaID then
	for city in player:Cities() do
		local routes = JFD_GetNumIncomingTradeRoutes(playerID, city)
		if routes > 0 then
			city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_SCIENTIST, routes * 2 * 100)
		end
		local numWorks = city:GetNumGreatWorks()
		if numWorks > 0 then
			city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_ASKIA_DUMMY, numWorks)
		else
			city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_ASKIA_DUMMY, 0)
			end
		end
	end
end
if isSonghaiCivActive then
GameEvents.PlayerDoTurn.Add(Askia_TradeWorks)
end

local writingSlot = GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]

local tManuscripts = {}
for row in DB.Query("SELECT ID FROM GreatWorks WHERE GreatWorkClassType = 'GREAT_WORK_UC_MANUSCRIPT'") do
	tManuscripts[row.ID] = {iType = row.ID}
end

function UC_GetGreatWorkIndex(player)
	for i, v in pairs(tManuscripts) do
		if Game.GetGreatWorkController(v) ~= nil then
			return v
			end
		end
	end		

local tGreatWorkBuildings = {}
for row in DB.Query("SELECT ID, BuildingClass, GreatWorkCount FROM Buildings WHERE GreatWorkCount > 0 AND GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'") do
	tGreatWorkBuildings[row.ID] = {iType = row.ID, iClass = GameInfoTypes[row.BuildingClass], iSlotCount = row.GreatWorkCount}
end

--LeeS's Utilities

function ChangeTechProgressAndReturnOverflow(iValue, iTechnology, pTeamTechs, pTeam, iPlayer)
	if iValue <= pTeamTechs:GetResearchLeft(iTechnology) then
		pTeamTechs:ChangeResearchProgress(iTechnology, iValue, iPlayer)
		return 0
	else
		local iChange = iValue - pTeamTechs:GetResearchLeft(iTechnology)
		pTeam:SetHasTech(iTechnology, true)
		return iChange
	end
	return -1
end
function ChangePlayerResearchProgress(iPlayer, iValue, bOnlyCurrentTech)
	local CurrentTechOnly = ((bOnlyCurrentTech ~= nil) and bOnlyCurrentTech or false)
	local pPlayer = Players[iPlayer]
	local iCurrentResearchItem = pPlayer:GetCurrentResearch()
	local pTeam = Teams[pPlayer:GetTeam()]
	local pTeamTechs = pTeam:GetTeamTechs()
	local iChange = iValue
	if (iCurrentResearchItem ~= -1) and (iCurrentResearchItem ~= nil) then
		iChange = ChangeTechProgressAndReturnOverflow(iValue, iTechnology, pTeamTechs, pTeam, iPlayer)
		if CurrentTechOnly or (iChange <= 0) then
			return
		end
	end
	local tTechsNotResearched = {}
	local iLowestGridWithUnResearchedTech = 1000
	local iLargestTechGridX = 0
	local bUnresearchedTechExists = false
	for Tech in GameInfo.Technologies() do
		if not Tech.Disable and not pTeamTechs:HasTech(Tech.ID) then
			bUnresearchedTechExists = true
			if Tech.GridX < iLowestGridWithUnResearchedTech then
				iLowestGridWithUnResearchedTech = Tech.GridX
			end
			if not tTechsNotResearched[Tech.GridX] then
				tTechsNotResearched[Tech.GridX] = {}
			end
			table.insert(tTechsNotResearched[Tech.GridX], {TechID=Tech.ID, Progress=pTeamTechs:GetResearchProgress(Tech.ID)})
		end
		if Tech.GridX > iLargestTechGridX then
			iLargestTechGridX = Tech.GridX
		end
	end
	if bUnresearchedTechExists then
		local iSelection = JFD_GetRandom(1, #tTechsNotResearched[iLowestGridWithUnResearchedTech])
		local iSelectedTech = tTechsNotResearched[iLowestGridWithUnResearchedTech][iSelection].TechID
		ChangeTechProgressAndReturnOverflow(iChange, iSelectedTech, pTeamTechs, pTeam, iPlayer)
	end
end

function ManuscriptScience(playerID)
local player = Players[playerID]
	if player:IsAlive() and player:GetNumGreatWorks() > 0 then
	local greatWorks = player:GetGreatWorks()
	local manuscriptCount = 0
		for n in greatWorks do
			local greatWorkType = Game.GetGreatWorkType(n);
			local greatWork = GameInfo.GreatWorks[greatWorkType];
			if greatWork.GreatWorkClassType == "GREAT_WORK_UC_MANUSCRIPT" then
				manuscriptCount = manuscriptCount + 1
				end
			end
		if manuscriptCount > 1 then
			ChangePlayerResearchProgress(playerID, (2 * manuscriptCount), true))
			end
		end
	end
GameEvents.PlayerDoTurn.Add(ManuscriptScience)


function GreatScientistBirth(playerID, unitID)
local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == GameInfoTypes.UNIT_SCIENTIST then
		if player:HasAvailableGreatWorkSlot(writingSlot) then
		local plot = unit:GetPlot()
		local city = player:GetCityOfClosestGreatWorkSlot(plot:GetX(), plot:GetY(), writingSlot)
		local building = player:GetBuildingOfClosestGreatWorkSlot(plot:GetX(), plot:GetY(), writingSlot)
			for i = 0, tGreatWorkBuildings[building].iSlotCount - 1 do
				if city:GetBuildingGreatWork(tGreatWorkBuildings[building].iClass, i) < 1 then
					 city:SetBuildingGreatWork(tGreatWorkBuildings[building].iClass, i, UC_GetGreatWorkIndex(player))
				end
			end
		end
	end
end			
if isSonghaiCivActive then
Events.SerialEventUnitCreated.Add(GreatScientistBirth)
end


