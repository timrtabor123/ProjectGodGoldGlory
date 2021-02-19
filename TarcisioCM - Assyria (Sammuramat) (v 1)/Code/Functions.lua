--=====================================================================================================================================================================
--=====================================================================================================================================================================
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "tcmSammuramat";
include("PlotIterators")
--=====================================================================================================================================================================
local civilizationID 	= GameInfoTypes["CIVILIZATION_TCM_ASSYRIA"]
local sapper  			= GameInfoTypes["UNIT_TCM_SAPPER_UNIT"]
local ekallu  			= GameInfoTypes["BUILDING_TCM_EKALLU"]
--=====================================================================================================================================================================
--Trait
--=====================================================================================================================================================================
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
--=====================================================================================================================================================================
function retriggerWorldWonder(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if player:GetCivilizationType() == civilizationID then
		local plot = Map.GetPlot(iX, iY)
		local city = plot:GetPlotCity()
		for row in GameInfo.Buildings() do
			local building = row.Type
			if city:IsHasBuilding(GameInfoTypes[building]) and not(load(plot, "tcmAssyria.CityHasWonder" .. building)) then
				if row.Cost ~= nil or row.FaithCost ~= nil then
					if row.WonderSplashImage ~= nil then	
						city:SetNumRealBuilding(GameInfoTypes[building], 0)
						city:SetNumRealBuilding(GameInfoTypes[building], 1)
						save(plot, "tcmAssyria.CityHasWonder" .. building, true)
					end
				end
			end
		end
	end
end
if IsCivilizationActive(civilizationID) then
	GameEvents.CityCaptureComplete.Add(retriggerWorldWonder)
end
--=====================================================================================================================================================================
function WonderBuiltFaraway(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	if player:GetCivilizationType() ~= civilizationID then
		if GameInfo.Buildings[buildingType].WonderSplashImage ~= nil then
			local numPlayers = 0
			local numEmbassies = 0
			local assyria
			local team = Teams[player:GetTeam()]
			for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local otherPlayer = Players[iPlayer]
				if otherPlayer ~= nil and otherPlayer:IsAlive() then
					numPlayers = numPlayers + 1
					local otherTeam = Teams[otherPlayer:GetTeam()]
					if team:HasEmbassyAtTeam(otherPlayer:GetTeam()) or otherTeam:HasEmbassyAtTeam(player:GetTeam()) then
						if otherPlayer:GetCivilizationType() == civilizationID then
							assyria = otherPlayer
						else
							numEmbassies = numEmbassies + 1
						end
					end
				end
			end
			if assyria then
				for city in assyria:Cities() do
					local production = math.ceil(((city:GetYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) * 6) / numPlayers) * (numPlayers - numEmbassies))
					city:ChangeProduction(production)
				end
			end
		end
	end
end
if IsCivilizationActive(civilizationID) then
	GameEvents.CityConstructed.Add(WonderBuiltFaraway)
end
--=====================================================================================================================================================================
--Sapper
--=====================================================================================================================================================================
function XPandPromotion(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID then
		for unit in player:Units() do
			if unit:GetUnitType() == sapper then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SAPPING"], false)
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_BATTLE_ENGINEER"], false)
				local plot = unit:GetPlot()
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if loopPlot:IsCity() then
						local city = loopPlot:GetPlotCity()
						local ownerTeam = Teams[city:GetOwner()]
						if ownerTeam:IsAtWar(player:GetTeam()) then
							if unit:GetFortifyTurns() > 0 then
								unit:ChangeExperience(2)
							elseif not(player:IsHuman()) then
								unit:ChangeExperience(2)
							end
							unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SAPPING"], true)
							break
						end
					end
				end
				for i = 0, plot:GetNumUnits() - 1, 1 do  
					local otherUnit = plot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:GetUnitType() == GameInfoTypes["UNIT_ENGINEER"] then
						unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_BATTLE_ENGINEER"], true)
						break
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(XPandPromotion)

function promotionBomb(ownerId, unitId, ePromotion)
	local player = Players[ownerId]
	local unit = player:GetUnitByID(unitId)
	if unit:GetUnitType() == sapper and ePromotion == GameInfoTypes["PROMOTION_TCM_SAPPING_2"] then
		local plot = unit:GetPlot()
		for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:IsCity() then
				local city = loopPlot:GetPlotCity()
				local ownerTeam = Teams[city:GetOwner()]
				if ownerTeam:IsAtWar(player:GetTeam()) then
					local damage = city:GetMaxHitPoints() * 0.40
					city:ChangeDamage(damage)
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SAPPING_2"], false)
				end
			end
		end
	end
end
GameEvents.UnitPromoted.Add(promotionBomb)
--=====================================================================================================================================================================
--Ekallu
--=====================================================================================================================================================================
function EkalluHappiness(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == ekallu then
		local player = Players[ownerId]
		local city = player:GetCityByID(cityId)
		local plot = city:Plot()
		if load(plot,"tcmCityWasRushedByEngineer") == true then
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ASSYRIA_HAPPINESS"], 1)
			save(plot,"tcmCityWasRushedByEngineer", false)
		end
	end
end
GameEvents.CityConstructed.Add(EkalluHappiness)

function expendedGE(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	local player = Players[unitOwnerId]
	if eKillingPlayer == -1 then
		local unit = player:GetUnitByID(unitId)
		if unit:GetUnitType() == GameInfoTypes["UNIT_ENGINEER"] then
			local plot = unit:GetPlot()
			local city = plot:GetPlotCity()
			if city and city:GetProductionBuilding() == ekallu then
				save(plot,"tcmCityWasRushedByEngineer", true)
			end
		end
	end
end
GameEvents.UnitPrekill.Add(expendedGE)

function razingGEpoints(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID and player:CountNumBuildings(ekallu) > 0 then
		local ekalluList = {}
		local razingNum = 0
		for city in player:Cities() do 
			if city:IsRazing() then
				razingNum = razingNum + 1
			end
			if city:IsHasBuilding(ekallu) then
				table.insert(ekalluList, city)
			end
		end
		if razingNum > 0 then
			for key,city in pairs(ekalluList) do
				local bonus = 300 * razingNum
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_ENGINEER"], bonus)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(razingGEpoints)
--=====================================================================================================================================================================
--E&D
--=====================================================================================================================================================================
function foodED(vHexPos, iPlayer, iCity, artStyleType, eraType, continent, populationSize, size, fogState)
	local player = Players[iPlayer]
	if player:GetCivilizationType() == civilizationID and player:HasPolicy(GameInfoTypes["POLICY_TCM_ASSYRIA_BANKS_BABYLON"]) then
		local city = player:GetCityByID(iCity)
		if city:CountNumRiverPlots() > 1 then
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ASSYRIA_FOOD"], 1)
		end
	end
end
Events.SerialEventCityCreated.Add(foodED) 
--=====================================================================================================================================================================

