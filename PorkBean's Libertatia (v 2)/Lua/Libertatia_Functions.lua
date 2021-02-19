--=======================================================================================================================
-- PorkBean's Colony of Libertatia
--=======================================================================================================================

include("FLuaVector.lua")
include("PlotIterators")

local iLiberiCiv = GameInfoTypes.CIVILIZATION_PB_LIBERTATIA;

local unitPlunder = GameInfoTypes.UNIT_PB_PLUNDER;

local domSea = DomainTypes["DOMAIN_SEA"]

local mathCeil = math.ceil

local gameSpeedID = Game.GetGameSpeedType()
local gameSpeed = GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod = (gameSpeed.GoldPercent/100)

local buildLibAdmiralDummy = GameInfoTypes["BUILDING_PB_LIB_ADMIRAL_POINTS_DUMMY"];
local buildClassLibAdmiralDummy = GameInfoTypes["BUILDINGCLASS_PB_LIB_ADMIRAL_POINTS_DUMMY"];

local eraClassical = GameInfoTypes["ERA_CLASSICAL"];
local eraMedieval = GameInfoTypes["ERA_MEDIEVAL"];
local eraRenaissance = GameInfoTypes["ERA_RENAISSANCE"];
local eraIndustrial = GameInfoTypes["ERA_INDUSTRIAL"];
local eraModern = GameInfoTypes["ERA_MODERN"];
local eraAtomic = GameInfoTypes["ERA_POSTMODERN"];

local direction_types = {
	DirectionTypes["DIRECTION_NORTHEAST"],
	DirectionTypes["DIRECTION_NORTHWEST"],
	DirectionTypes["DIRECTION_EAST"],
	DirectionTypes["DIRECTION_SOUTHEAST"],
	DirectionTypes["DIRECTION_SOUTHWEST"],
	DirectionTypes["DIRECTION_WEST"],}

--The following is for compatibility with Enlightenment Era
local eraEnlightenment = GameInfoTypes["ERA_ENLIGHTENMENT"];
local eraInformation = GameInfoTypes["ERA_FUTURE"];
local eraFuture = GameInfoTypes["ERA_FW_FUTURE"];

local bEnlightenmentEraIsActive = false
local bFutureWorldsIsActive = false
for _,v in ipairs(Modding.GetActivatedMods()) do
	if (v.ID == "ce8aa614-7ef7-4a45-a179-5329869e8d6d") then
		bEnlightenmentEraIsActive = true
	elseif (v.ID == "d9ece224-6cd8-4519-a27a-c417b59cdf35") then
		bFutureWorldsIsActive = true
	end
end
--

------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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

local isLiberiCivActive = JFD_IsCivilisationActive(iLiberiCiv);

------------------------------------------------------------------------------------------------------------------------
-- GetPlayerByCivilization
------------------------------------------------------------------------------------------------------------------------
function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end

--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--=======================================================================================================================
-- UA: The Pirate Round
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- SpawnPlunders
------------------------------------------------------------------------------------------------------------------------
function SpawnPlunders(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)

	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	local liberiPlayer = GetPlayerByCivilization(iLiberiCiv)
    local liberiID = liberiPlayer:GetID()

	--print(iByPlayer)

	-- Must have been killed by another Player
	if iPlayer == iByPlayer then return end
	if iByPlayer == -1 then return end
	
	-- Must be combat & naval unit
	if not (pUnit:GetDomainType() == domSea) then return end
	if not (pUnit:IsCombatUnit()) then return end
	
	local pPlot = pUnit:GetPlot()
	
	if iByPlayer == liberiID then
		if JFD_GetRandom(1,5) == 1 then
			--print("plunder ship created")
			local pNewUnit = liberiPlayer:InitUnit(unitPlunder, iX, iY);
			local hex = HexToWorld(ToHexFromGrid(Vector2(iX, iY)))
			Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[ICON_PIRATE] Plunder seized!"))
			pNewUnit:SetMoves(0);
		end
	end	
end

------------------------------------------------------------------------------------------------------------------------
-- CashPlunders
------------------------------------------------------------------------------------------------------------------------
function CashPlunders(playerID, unitID, unitX, unitY)
    local player = Players[playerID]
    if (not player:IsAlive()) then return end
    local unit = player:GetUnitByID(unitID)
    if unit:GetUnitType() ~= unitPlunder then return end
    local unitPlot = Map.GetPlot(unitX, unitY);	
    if (not unitPlot) then return end
	if unitPlot:IsCity() then
		local owner = unitPlot:GetOwner()
		if owner == playerID then
			local goldPayout = CalculatePlunderPayout(player);
			local culturePayout = mathCeil(player:GetNextPolicyCost()/8);
			--print(player:GetName(), "returned plunder. Gold payout is total", goldPayout, "Culture payout is total", culturePayout)
			player:ChangeGold(goldPayout)
			player:ChangeJONSCulture(culturePayout)
			if player:IsHuman() then
				local hex = HexToWorld(ToHexFromGrid(Vector2(unitX, unitY)))
				Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("+{1_Num} [ICON_GOLD] and +{2_Num} [ICON_CULTURE] from Plunder!", goldPayout, culturePayout))
			end
			unit:Kill(true, -1);
		end
	end	
end

------------------------------------------------------------------------------------------------------------------------
-- CalculatePlunderPayout
------------------------------------------------------------------------------------------------------------------------
function CalculatePlunderPayout(iPlayer)
	local playerEra = iPlayer:GetCurrentEra()
	local eraModifier = 0;
	local goldCalc = 0;
	if (bFutureWorldsIsActive == true and playerEra >= eraFuture) then
		eraModifier = 1450 --price of battlesuit
	elseif (bFutureWorldsIsActive == true and playerEra >= eraInformation) then
		eraModifier = 1250 --price of power armor infantry
	elseif playerEra >= eraAtomic then
		eraModifier = 1090 --price of mech/infantry
	elseif playerEra >= eraModern then
		eraModifier = 960 --price of GW infantry
	elseif playerEra >= eraIndustrial then
		eraModifier = 740 --price of rifleman
	elseif (bEnlightenmentEraIsActive == true and playerEra >= eraEnlightenment) then
		eraModifier = 640 --price of line infantry
	elseif playerEra >= eraRenaissance then
		eraModifier = 540 --price of musketman
	elseif playerEra >= eraMedieval then
		eraModifier = 460 --price of longswordsman
	elseif playerEra >= eraClassical then
		eraModifier = 390 --price of swordsman
	else
		eraModifier = 200 --price of warrior
	end
	goldCalc = mathCeil((eraModifier*gameSpeedMod)/2)
	return goldCalc
end

------------------------------------------------------------------------------------------------------------------------
-- CalculateFarmAdjacency
------------------------------------------------------------------------------------------------------------------------
function CalculateFarmAdjacency(iPlayer)
	local pPlayer = Players[iPlayer];
	local impFarm = GameInfoTypes["IMPROVEMENT_FARM"];
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iLiberiCiv then
		local totalAdmiralPoints = 0
		for cCity in pPlayer:Cities() do
			local admiralFromFarms = 0
			for i = 0, cCity:GetNumCityPlots()-1, 1 do
				local pPlot = cCity:GetCityIndexPlot(i)
				if pPlot:GetImprovementType() == impFarm then
					if pPlot:IsBeingWorked() then
						if pPlot:GetOwner() == cCity:GetOwner() then
							if pPlot:GetWorkingCity() == cCity then
								for adjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
									if adjacentPlot:GetImprovementType() == impFarm then
										if adjacentPlot:GetOwner() == cCity:GetOwner() then
											--print(cCity, "found a farm with adjacency")
											admiralFromFarms = admiralFromFarms+1
											break
										end
									end
								end
							end
						end
					end
				end
			end
			--print(cCity, "is producing", admiralFromFarms, "admiral points from Farm adjacency")
			cCity:SetNumRealBuilding(buildLibAdmiralDummy, admiralFromFarms);
		end
		totalAdmiralPoints = pPlayer:GetBuildingClassCount(buildClassLibAdmiralDummy);
		pPlayer:ChangeNavalCombatExperience(totalAdmiralPoints);
		--print("cities are generating total", totalAdmiralPoints, "admiral points from Farm adjacency")
		if (pPlayer:IsHuman() and totalAdmiralPoints > 0) then
			local libAlertMessage = Locale.ConvertTextKey("TXT_KEY_TRAIT_PB_PIRATE_ROUND_NOTIFICATION", totalAdmiralPoints)
			Events.GameplayAlertMessage(libAlertMessage)
		end
	end
end

if isLiberiCivActive then
	GameEvents.PlayerDoTurn.Add(CalculateFarmAdjacency);
	GameEvents.UnitSetXY.Add(CashPlunders);
	GameEvents.UnitPrekill.Add(SpawnPlunders);
end

--=======================================================================================================================
-- UU: Man-of-war
--=======================================================================================================================

local iOceanPromotion = GameInfoTypes.PROMOTION_PB_MOW_OCEAN_COMBAT
local iMOWGivePromotion = GameInfoTypes.PROMOTION_PB_MOW_GIVES_MOVEMENT
local iMOW = GameInfoTypes.UNIT_PB_MANOFWAR
local iOcean = TerrainTypes["TERRAIN_OCEAN"];

------------------------------------------------------------------------------------------------------------------------
-- ManofwarGiveMovement
------------------------------------------------------------------------------------------------------------------------
function ManofwarGiveMovement(iPlayer)
	local pPlayer = Players[iPlayer]	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iMOWGivePromotion) then
			local pPlot = pUnit:GetPlot()
			local iNumUnits = pPlot:GetNumUnits()
			for iVal = 0,(iNumUnits - 1) do
				local pUnit = pPlot:GetUnit(iVal)
				local iMovement = pUnit:GetMoves()
				if (not pUnit:IsCombatUnit()) then
					pUnit:SetMoves(iMovement*2)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ManofwarGiveMovement)

------------------------------------------------------------------------------------------------------------------------
-- GiveMOWOceanCombat
------------------------------------------------------------------------------------------------------------------------
function GiveMOWOceanCombat(playerID, unitID, unitX, unitY)
    local player = Players[playerID]
    if (not player:IsAlive()) then return end
    local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == iMOW then
		local unitPlot = Map.GetPlot(unitX, unitY);	
		if (not unitPlot) then return end
		if (unitPlot:GetTerrainType() == iOcean) and (not unitPlot:IsOwned()) then
			unit:SetHasPromotion(iOceanPromotion,true)
		else
			unit:SetHasPromotion(iOceanPromotion,false)
		end
	end
end

GameEvents.UnitSetXY.Add(GiveMOWOceanCombat);

--=======================================================================================================================
-- UU: Session House
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- NavalProdFromSessionHouse
------------------------------------------------------------------------------------------------------------------------
local buildSessionHouse = GameInfoTypes["BUILDING_PB_SESSION_HOUSE"];
local buildNavalProdDummy = GameInfoTypes["BUILDING_PB_LIB_SH_PROD_DUMMY"];

function NavalProdFromSessionHouse(iPlayer)
	local pPlayer = Players[iPlayer];
	local policyCount = pPlayer:GetNumPolicies()
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PB_LIBERTATIA"] then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(buildSessionHouse) then
				--print(pCity, " has Session House", policyCount)
				if policyCount >= 20 then
					pCity:SetNumRealBuilding(buildNavalProdDummy, 20);
				else
					pCity:SetNumRealBuilding(buildNavalProdDummy, policyCount);
				end
			else
				--print(pCity, " has no Session House")
				pCity:SetNumRealBuilding(buildNavalProdDummy, 0);
			end
		end
	end
end

if isLiberiCivActive then
	GameEvents.PlayerDoTurn.Add(NavalProdFromSessionHouse);
end