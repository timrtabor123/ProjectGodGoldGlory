--========================================================================================================================
-- PorkBean's Iga Sokoku Ikki (Iga Republic)
-- v4 functions
--========================================================================================================================
include("PlotIterators")

local iIgaCiv = GameInfoTypes.CIVILIZATION_PB_IGA;

local impKakurezato = GameInfoTypes.IMPROVEMENT_PB_KAKUREZATO;

local promKakurezato = GameInfoTypes.PROMOTION_PB_KAKUREZATO;
local promKakurezatoSpent = GameInfoTypes.PROMOTION_PB_SNEAK_ATTACK;
local promZoC = GameInfoTypes.PROMOTION_PB_RECONNAISSANCE;

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

local isIgaCivActive = JFD_IsCivilisationActive(iIgaCiv);

--========================================================================================================================
-- UNIQUE IMPROVEMENT: Kakurezato
--========================================================================================================================
function KakurezatoPromotion(iPlayer)
	local pPlayer = Players[iPlayer]	
	if pPlayer:IsAlive() then
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then
				if not pUnit:IsHasPromotion(promKakurezato) then
					local pPlot = pUnit:GetPlot()
					if pPlot:GetImprovementType() == impKakurezato and not pPlot:IsImprovementPillaged() then
						local pPlotOwner = -1
						local pUnitOwner = Players[pUnit:GetOwner()]		
						if pPlot:IsOwned() then
							pPlotOwner = Players[pPlot:GetOwner()]
						end
						if pUnitOwner == pPlotOwner then
							pUnit:SetHasPromotion(promKakurezato,true);
							pUnit:ChangeMoves(60);
							pUnit:SetHasPromotion(promKakurezatoSpent,false);
						end
					end
				end
			end
		end
	end
end

function RemoveSpentKakurezatoPromotion(iPlayer)
	local pPlayer = Players[iPlayer]	
	if pPlayer:IsAlive() then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(promKakurezatoSpent) then
				pUnit:SetHasPromotion(promKakurezatoSpent,false);
			end
		end
	end
end

--========================================================================================================================
-- UNIQUE ABILITY: Kishomon
--========================================================================================================================
function SpiesPromotion(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iIgaCiv then
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(promZoC) then
				pUnit:SetHasPromotion(promZoC,false);
			end
		end
		local spyCities = {}
		for i,v in pairs(Players[iPlayer]:GetEspionageSpies()) do
			local iCityPlot = Map.GetPlot(v.CityX, v.CityY);
			table.insert(spyCities, iCityPlot);
		end
		--print(#spyCities, "cities with an iga spy");
		for i, v in pairs(spyCities) do
			for adjacentPlot in PlotAreaSweepIterator(v, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				--print("iterating plots around", v);
				local adjacentUnit = adjacentPlot:GetUnit()
				if adjacentUnit then
					if adjacentUnit:GetOwner() == iPlayer then
						adjacentUnit:SetHasPromotion(promZoC, true);
						--print("added ZoC promotion to iga unit near", v);
					end
				end
			end
		end
	end
end

if isIgaCivActive then
	GameEvents.PlayerDoTurn.Add(KakurezatoPromotion);
	GameEvents.PlayerDoTurn.Add(RemoveSpentKakurezatoPromotion);
	GameEvents.PlayerDoTurn.Add(SpiesPromotion);
end