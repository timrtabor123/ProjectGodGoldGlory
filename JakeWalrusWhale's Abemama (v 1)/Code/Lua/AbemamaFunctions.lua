--==========================================================
-- GLOBALS
--==========================================================
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")
include("PlotIterators")

local iAbemama = GameInfoTypes["CIVILIZATION_JWW_ABEMAMA"]
local iShark = GameInfoTypes["UNIT_JWW_SHARK_TOOTH_SWORDSMAN"]
local iCopra = GameInfoTypes["BUILDING_JWW_COPRA_SMALLHOLDING"]
local iUBDummy = GameInfoTypes["BUILDING_JWW_ABEMAMA_COPRA_DUMMY"]

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

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
local bIsActive = JFD_IsCivilisationActive(iAbemama)
--==========================================================
-- UA
--==========================================================
function JWW_ForeignUnitsGibGold(iPlayer) --Foreign Units give gold every turn in your territory
	local iNumGold = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAbemama then
		for pCity in pPlayer:Cities() do
			for i = 0, pCity:GetNumCityPlots(), 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot:GetWorkingCity() == pCity then
					if pPlot:IsUnit() then
						local pUnit = pPlot:GetUnit()
						if pUnit:GetOwner() ~= iPlayer then
							local iGold = JFD_GetRandom(10, 30)
							iNumGold = iNumGold + iGold
							if pPlayer:IsHuman() then
								Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_YIELD_GOLD]+" .. iGold .. " Gold[ICON_GOLD][ENDCOLOR]", 0)
							end
						end
					end
				end
			end
		end
	end
	pPlayer:ChangeGold(iNumGold)
end

function JWW_GiveMeYourCultureDude(iPlayer, iUnit, unitType, iPlotX, iPlotY, bDelay, iByPlayer) --Foreign Units give culture in your territory upon death
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pPlot = pUnit:GetPlot()
	if pPlot:IsOwned() then
		if pUnit:GetOwner() ~= pPlot:GetOwner() then
			local pOwner = Players[pPlot:GetOwner()]
			if pOwner:GetCivilizationType() == iAbemama then
				local iCulture = JFD_GetRandom(20,50)
				pOwner:ChangeJONSCulture(iCulture)
				if pOwner:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_CULTURE_STORED]+" .. iCulture .. " Culture[ICON_CULTURE][ENDCOLOR]", 0)
				end
			end
		end
	end
end

function JWW_CultureFromGoldFromTradeFromBuildingTradeUnitsFromPlayingCivVFromAComputer(iPlayer) --Gain Culture = to Gold from Outgoing Trade Routes
	local iCulture = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAbemama then
		for pCity in pPlayer:Cities() do
			iCulture = iCulture + JWW_GoldFromTradeRoutes(pPlayer, pCity)
		end
	end
	pPlayer:ChangeJONSCulture(iCulture)
end
					

if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_ForeignUnitsGibGold)
	GameEvents.UnitPrekill.Add(JWW_GiveMeYourCultureDude)
	GameEvents.PlayerDoTurn.Add(JWW_CultureFromGoldFromTradeFromBuildingTradeUnitsFromPlayingCivVFromAComputer)
end
--==========================================================
-- UU (Shark-Tooth Swordsman)
--==========================================================
function JWW_GoldFromTradeRoutes(pPlayer, pCity) --Calculates Gold Per Outgoing Trade Route per City
	local iGold = 0
	for k, v in ipairs(pPlayer:GetTradeRoutes()) do
		if v.FromCity == pCity then
			iGold = iGold + (math.floor(v.FromGPT / 100))
		end
	end
	return iGold
end

function JWW_TrainWithMoreStrength(iPlayer, iCity, iUnit) --UU is trained with more strength depending on culture and era
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAbemama then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:GetUnitType() == iShark then
			local pCity = pPlayer:GetCityByID(iCity)
			local iCulture = (pCity:GetBaseJONSCulturePerTurn() + JWW_GoldFromTradeRoutes(pPlayer, pCity))
			local iEra = pPlayer:GetCurrentEra()
			local iStrengthGiven = (math.floor(iCulture / 4) + (iEra * 4))
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + iStrengthGiven)
		end
	end
end

function JWW_HiGiveMeExp(iPlayer) --UU gets exp every turn
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAbemama then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iShark then
				pUnit:ChangeExperience(JFD_GetRandom(1,5))
			end
		end
	end
end

if bIsActive then
	GameEvents.CityTrained.Add(JWW_TrainWithMoreStrength)
	GameEvents.PlayerDoTurn.Add(JWW_HiGiveMeExp)
end
--==========================================================
-- UB (Copra Smallholding)
--==========================================================
function JWW_GibMasCoprasIfTrade(iPlayer) --Outgoing trade routes produce more copras if UB
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAbemama then
		for pCity in pPlayer:Cities() do
			local iTR = 0
			for k, v in ipairs(pPlayer:GetTradeRoutes()) do
				if v.FromCity == pCity then
					if v.FromCity:IsHasBuilding(iCopra) then
						iTR = iTR + 1
					end
				end
			end
			if iTR == 0 then
				pCity:SetNumRealBuilding(iUBDummy, 0)
			elseif iTR == 1 then
				pCity:SetNumRealBuilding(iUBDummy, 1)
			elseif iTR >= 2 then
				pCity:SetNumRealBuilding(iUBDummy, 2)
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_GibMasCoprasIfTrade)
end