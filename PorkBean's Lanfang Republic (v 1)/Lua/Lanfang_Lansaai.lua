--------------------
--PorkBean's Lanfang Republic
--Unique Unit: Lansaai
--------------------

--Include PlotIterators.lua
include("PlotIterators")
include("FLuaVector.lua");

local iTradePromotion = GameInfoTypes["PROMOTION_LF_PROTECT_TRADE"];
local iMinePromotion = GameInfoTypes["PROMOTION_LF_MINER"];
local iLanfangLansaai = GameInfoTypes["UNIT_LF_LANSAAI"];

local impMine = GameInfoTypes["IMPROVEMENT_MINE"];

local resGold = GameInfoTypes["RESOURCE_GOLD"];
local resSilver = GameInfoTypes["RESOURCE_SILVER"];
local resGems = GameInfoTypes["RESOURCE_GEMS"];
local resIron = GameInfoTypes["RESOURCE_IRON"];
local resCoal = GameInfoTypes["RESOURCE_COAL"];
local resUranium = GameInfoTypes["RESOURCE_URANIUM"];
local resCopper = GameInfoTypes["RESOURCE_COPPER"];
local resSalt = GameInfoTypes["RESOURCE_SALT"];
local resAluminum = GameInfoTypes["RESOURCE_ALUMINUM"];

local techBronzeWorking = GameInfoTypes["TECH_BRONZE_WORKING"];
local techIndustrialization = GameInfoTypes["TECH_INDUSTRIALIZATION"];
local techElectricity = GameInfoTypes["TECH_ELECTRICITY"];
local techAtomicTheory = GameInfoTypes["TECH_ATOMIC_THEORY"];

local direction_types = {
	DirectionTypes["DIRECTION_NORTHEAST"],
	DirectionTypes["DIRECTION_NORTHWEST"],
	DirectionTypes["DIRECTION_EAST"],
	DirectionTypes["DIRECTION_SOUTHEAST"],
	DirectionTypes["DIRECTION_SOUTHWEST"],
	DirectionTypes["DIRECTION_WEST"],}

--function to check if a tile is a trade route or not
function HasTradeRoute(pPlot, pPlayer)
	return (#pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot) > 0)
end

--gets nearest city (credit bane_)
function GetNearestCity(pPlot, pPlayer)
	local iShortestDistance = 99999
	local pNearestCity = nil

	local iUnitX, iUnitY = pPlot:GetX(), pPlot:GetY()

	for pCity in pPlayer:Cities() do
		local iDist = Map.PlotDistance(pCity:GetX(), pCity:GetY(), iUnitX, iUnitY)
		if (iDist < iShortestDistance) then
			iShortestDistance = iDist
			pNearestCity = pCity
		end
	end
	return pNearestCity
end

function DayakInsurgent(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local unit = player:GetUnitByID(unitID)
	local unitPlot = unit:GetPlot()
	if (not unitPlot) then return end
	if unit:GetUnitType() == iLanfangLansaai then
		for rangePlot in PlotAreaSweepIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if HasTradeRoute(rangePlot, player) then
				print(unit, "is near trade route", rangePlot, "granting buff") 
				unit:SetHasPromotion(iTradePromotion,true)
				do return end
			else
			print(unit, "is not near trade route, removing buff") 
				unit:SetHasPromotion(iTradePromotion,false)
			end
		end
	end
end

function MineResources(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local unit = player:GetUnitByID(unitID)	
	local playerTeam = Teams[player:GetTeam()]
	local playerTeamTechs = playerTeam:GetTeamTechs();
	for unit in player:Units() do
		if unit:IsHasPromotion(iMinePromotion) then
			local unitPlot = unit:GetPlot()
			if (unitPlot:GetImprovementType() == impMine) and (not unitPlot:IsImprovementPillaged()) then
				local nearestCity = GetNearestCity(unitPlot, player)
				local currentResearch = player:GetCurrentResearch()
				local hex = HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY())))
				if unitPlot:GetResourceType() == resGold then
					player:ChangeGold(2);
					Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_GOLD]"))
				elseif unitPlot:GetResourceType() == resSilver then
					player:ChangeGold(1);
					player:ChangeFaith(1);
					Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_GOLD] [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_PEACE]"))
				elseif unitPlot:GetResourceType() == resGems then
					player:ChangeGold(1);
					player:ChangeJONSCulture(1);
					Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_GOLD] [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_CULTURE]"))
				elseif unitPlot:GetResourceType() == resSalt then
					nearestCity:ChangeFood(1);
					nearestCity:ChangeProduction(1);
					Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_FOOD] [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_PRODUCTION]"))
				elseif unitPlot:GetResourceType() == resCopper then
					nearestCity:ChangeProduction(1);
					playerTeamTechs:ChangeResearchProgress(currentResearch, 1, player)
					Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_PRODUCTION] [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_RESEARCH]"))
				elseif unitPlot:GetResourceType() == resIron then
					if playerTeam:IsHasTech(techBronzeWorking) then
						nearestCity:ChangeProduction(2);
						Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_PRODUCTION]"))
					end
				elseif unitPlot:GetResourceType() == resCoal then
					if playerTeam:IsHasTech(techIndustrialization) then
						nearestCity:ChangeProduction(2);
						player:ChangeGoldenAgeProgressMeter(1);
						Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_PRODUCTION] [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_GOLDEN_AGE]"))
					end
				elseif unitPlot:GetResourceType() == resAluminum then
					if playerTeam:IsHasTech(techElectricity) then
						nearestCity:ChangeProduction(3);
						Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+3[ENDCOLOR] [ICON_PRODUCTION]"))
					end
				elseif unitPlot:GetResourceType() == resUranium then
					if playerTeam:IsHasTech(techAtomicTheory) then
						playerTeamTechs:ChangeResearchProgress(currentResearch, 4, player)
						Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+4[ENDCOLOR] [ICON_RESEARCH]"))
					end
				end
			end
		end				
	end
end

GameEvents.UnitSetXY.Add(DayakInsurgent);
GameEvents.PlayerDoTurn.Add(MineResources);