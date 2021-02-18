-- Lordie_Norway_Functions
-- Author: Lordie_Staven, with code from WHoward, Senshidenshi, Grant, TarcisioCM and JFD
-- DateCreated: 8/30/2019 9:19:47 AM
--------------------------------------------------------------
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
--------------------------------------------------------------
-- DMS_GetMajorityReligion
--------------------------------------------------------------
function DMS_GetMajorityReligion(player)
	local ownReligion = nil
		if player:HasCreatedReligion() then
			ownReligion = player:GetReligionCreatedByPlayer()
		elseif player:GetCapitalCity() and player:GetCapitalCity():GetReligiousMajority() ~= -1 then
			ownReligion = player:GetCapitalCity():GetReligiousMajority()
		else
			ownReligion = nil
		end
	return ownReligion
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]
local civilizationID = GameInfoTypes["CIVILIZATION_LUNGNORWAY"]
local isOlafNorwayCivActive = JFD_IsCivilisationActive(civilisationID)

local improvementVanillaHolySite = GameInfoTypes["IMPROVEMENT_OCP_HOLY_SITE"]
local improvementNorwayHolySite = GameInfoTypes["IMPROVEMENT_OCP_NORWAYHOLYSITE"]

local triggerTechAstronomy = GameInfoTypes["TECH_ASTRONOMY"]
local unitDrekki = GameInfoTypes["_UNIT_LUNG_DREKKI"]
local promotionNoOcean = GameInfoTypes["PROMOTION_OCEAN_IMPASSABLE"]

local promotionDrekkiDebuff = GameInfoTypes["PROMOTION_OCP_DREKKI_DEBUFF"]

local unitMissionary = GameInfoTypes["UNIT_MISSIONARY"]
local promotionDrekkiSpeed = GameInfoTypes["PROMOTION_OCP_DREKKI_SPEED"]

local unitSkutils = GameInfoTypes["UNIT_LUNG_SKUTILSVEINR"]
local promotionSkutilsBuff = GameInfoTypes["PROMOTION_OCP_SKUTILS_BUFF"]

local domainLand = GameInfoTypes["DOMAIN_LAND"]
local domainSea = GameInfoTypes["DOMAIN_SEA"]

include("OCPOlafPlotIterators")
include("FLuaVector")

if isOlafNorwayCivActive then
	print("Olaf II of Norway is in this game.")
end
--==========================================================================================================================
-- Notes for functions
--==========================================================================================================================
-- UA1: Holy Sites damage adjacent enemy units and provide + defense equal to Citadels. 
-- UA2: City faith yield is directly converted to production when building Land and Naval units.
-- Drekki1: unable to sail deep sea until Astronomy.
-- Drekki2: reduces combat strength of adjacent enemy units.
-- Drekki3: Missionaries starting their turn on the same tile as a Drekki gain +3 embark speed.
-- Skutilsveinr1: converts cities captured
-- Skutilsveinr2: +10% Combat bonus to all Land units within 2 tiles.
--==========================================================================================================================
-- Lordie_WeaponizedHolySitesBuild; replaces holy cites with citadelesque ones
--==========================================================================================================================
function Lordie_WeaponizedHolySitesBuild(playerID, plotX, plotY, improvementID)
local player = Players[PlayerID]
	if player:IsAlive() and player:GetCivilizationType() == civilizationID and improvementID == improvementVanillaHolySite then
		print("Lordie_WeaponizedHolySitesBuild has finished.")
		local plot = Map.GetPlot(plotX, plotY)
		plot:SetImprovementType(improvementNorwayHolySite)
	print("Lordie_WeaponizedHolySitesBuild has finished.")
	end
end

if isOlafNorwayCivActive then
	GameEvents.BuildFinished.Add(Lordie_WeaponizedHolySitesBuild)
end
--==========================================================================================================================
-- Lordie_WeaponizedHolySitesInherit; for holy sites that you capture alongside a city
--==========================================================================================================================
function Lordie_WeaponizedHolySitesInherit(iOldOwner, bCapital, iPlotX, iPlotY, iNewOwner, iOldPop, bConquest)
	if iNewOwner == civilisationID then
		print("Lordie_WeaponizedHolySitesInherit has started.")
		local plot = Map.GetPlot(iPlotX, iPlotY)
		local newCity = plot:GetPlotCity()
		for pEdgePlot in PlotAreaSpiralIterator(plot, 3) do
			if pEdgePlot:GetImprovementType() == improvementVanillaHolySite then
				pEdgePlot:SetImprovementType(improvementNorwayHolySite)
			end
		end
	print("Lordie_WeaponizedHolySitesInherit has finished.")
	end
end

if isOlafNorwayCivActive then
	GameEvents.CityCaptureComplete.Add(Lordie_WeaponizedHolySitesInherit)
end
--==========================================================================================================================
-- Lordie_DrekkiCanIntoOceanResearch; as soon as you research the tech all ur active Drekkis lose the restriction
-- just make sure Drekkis by default have CannotEnterDeepOcean
-- no idea if this actually works, someone please check this; dun rly know how to get player from team
--==========================================================================================================================
function Lordie_DrekkiCanIntoOceanResearch(teamID, techType, iChange)
local team = Teams[teamID]
	for player in Players() do
		if player:GetTeam() == team then
			if team:IsAlive() and techType == triggerTechAstronomy then
				for unit in player:Units() do
					if unit:GetUnitType() == unitDrekki and unit:IsHasPromotion(promotionNoOcean) then
						unit:SetHasPromotion(promotionNoOcean, 0)
					end
				end
			end
		end
	end
end

if isOlafNorwayCivActive then
	GameEvents.TeamTechResearched.Add(Lordie_DrekkiCanIntoOceanResearch)
end
--==========================================================================================================================
-- Lordie_DrekkiCanIntoOceanBuild; is easier than i thought
-- thanks to JFD's Scotland
--==========================================================================================================================
function JFD_Scotland_Highlander(playerID, cityID, unitID)
    local player = Players[playerID]
    if player:IsAlive() then 
		local unit = player:GetUnitByID(unitID)
       	if unit:GetUnitType() == unitDrekki then
			local playerTeam = player:GetTeam()
			if playerTeam:IsHasTech(triggerTechAstronomy) then
				if unit:IsHasPromotion(promotionNoOcean) then
					unit:SetHasPromotion(promotionNoOcean, 0)
				end
			end
		end
    end
end

if isOlafNorwayCivActive then
	GameEvents.CityTrained.Add(Lordie_DrekkiCanIntoOceanBuild)
end
--==========================================================================================================================
-- Lordie_DrekkiDebuff; every turn applies the debuff to enemy units
--==========================================================================================================================
function Lordie_DrekkiDebuff(playerID)
local player = Players[playerID]
	if player:IsAlive() then
		-- removing old buffs
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionDrekkiDebuff) == true then
				unit:SetHasPromotion(promotionDrekkiDebuff, false)
			end
		end
		-- adding new buffs
		for unit in player:Units() do
			if unit:GetUnitType() == unitDrekki then
				local unitPlot = unit:GetPlot()
				for pEdgePlot in PlotRingIterator(unitPlot, 1) do
					if pEdgePlot:IsUnit() then
						local pEdgePlotUnit = pEdgePlot:GetUnit()
						if pEdgePlotUnit:GetOwner() ~= player then
							pEdgePlotUnit:SetHasPromotion(promotionDrekkiDebuff, 1)
						end
					end
				end
			end
		end
	end
end

if isOlafNorwayCivActive then
	GameEvents.PlayerDoTurn.Add(Lordie_DrekkiDebuff)
end
--==========================================================================================================================
-- Lordie_DrekkiFastPriests; every turn applies the movement buff to Missionaries
-- thanks to Senshi's Evenks code
--==========================================================================================================================
function Lordie_DrekkiFastPriests(playerID)
local player = Players[playerID]
	if player:IsAlive() then
		-- removing old buffs
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionDrekkiSpeed) == true then
				unit:SetHasPromotion(promotionDrekkiSpeed, false)
			end
		end
		-- adding buffs
		for unit in player:Units()
			if unit:GetUnitType() == unitMissionary
				local unitPlot = unit:GetPlot()
				-- this bit is shamelessly stolen from Senshi, I'm nowhere near good enough with lua to have done that lol
				local bStackedWithDrekki = false
				for i = 0, pPlot:GetNumUnits()-1 do
					if unitPlot:GetUnit(i):GetUnitType() == unitDrekki then
						stackedWithDrekki = true
						break
					end
				end
			if bStackedWithDrekki then
				pUnit:SetHasPromotion(promotionDrekkiSpeed, true)
			end
		end
	end
end


if isOlafNorwayCivActive then
	GameEvents.PlayerDoTurn.Add(Lordie_DrekkiFastPriests)
end
--==========================================================================================================================
-- Lordie_SkutilsveinrConversion; converts cities it captures
-- thanks to Grant's Burgundians + Sweden and Tar's Sicily
--==========================================================================================================================
function Lordie_SkutilsveinrConversion(iOldOwner, bCapital, iPlotX, iPlotY, iNewOwner, iOldPop, bConquest)
	local player = Players[iNewOwner]
	local plot = Map.GetPlot(iPlotX, iPlotY)
		for i = 0, plot:GetNumUnits() - 1, 1 do  
		local otherUnit = plot:GetUnit(i)
		if otherUnit and otherUnit:GetUnitType() == unitSkutils then
			local city = plot:GetPlotCity()
			local ownReligion = DMS_GetMajorityReligion(player)
			local playerTeam = Teams[player:GetTeam()]
				for religion in GameInfo.Religions("ID <> '" .. ownReligion .. "'") do
					city:ConvertPercentFollowers(ownReligion, religion.ID, 100)
				end
				city:AdoptReligionFully(ownReligion)
				city:ConvertPercentFollowers(ownReligion, -1, 100)
		end
	end
end

if isOlafNorwayCivActive then
	GameEvents.CityCaptureComplete.Add(Lordie_SkutilsveinrConversion)
end
--==========================================================================================================================
-- Lordie_SkutilsveinrBuff; combat bonus to units within two tiles
--==========================================================================================================================
function Lordie_SkutilsveinrBuff(playerID)
local player = Players[playerID]
	if player:IsAlive() then
		-- removing old buffs
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionSkutilsBuff) == true then
				unit:SetHasPromotion(promotionSkutilsBuff, false)
			end
		end
		-- adding new buffs
		for unit in player:Units() do
			if unit:GetUnitType() == unitSkutils then
				local unitPlot = unit:GetPlot()
				for pEdgePlot in PlotAreaSpiralIterator(unitPlot, 2) do
					if pEdgePlot:IsUnit() then
						local pEdgePlotUnit = pEdgePlot:GetUnit()
						if pEdgePlotUnit:GetOwner() == player then
							pEdgePlotUnit:SetHasPromotion(promotionSkutilsBuff, 1)
						end
					end
				end
			end
		end
	end
end

if isOlafNorwayCivActive then
	GameEvents.PlayerDoTurn.Add(Lordie_SkutilsveinrBuff)
end
--==========================================================================================================================
-- Lordie_FaithIntoHammers; but only when building certain units, yknow
-- no idea if this will work
--==========================================================================================================================
function Lordie_FaithIntoHammers(playerID)
local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType == CivilizationID then
		for city in player:Cities do
			local unitType = city:GetUnitProduction()
			local unitBeingBuilt = GameInfo.Units{ID=unitType}().Description
			if unitBeingBuilt:GetDomainType() == domainLand or domainSea then
				local faithCount = city:GetFaithPerTurn()
				city:ChangeProduction(faithCount)
			end
		end
	end
end

if isOlafNorwayCivActive then
	GameEvents.PlayerDoTurn.Add(Lordie_FaithIntoHammers)
end





