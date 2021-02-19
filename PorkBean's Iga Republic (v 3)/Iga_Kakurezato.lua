--------------------
--PorkBean's Iga Republic
--Co-authored by Homusubi
--Unique Improvement: Kakurezato
--------------------

local iIgaCiv = GameInfoTypes.CIVILIZATION_IGA;
local iKakurezatoPromotion = GameInfoTypes["PROMOTION_KAKUREZATO_BOOST"]
local iCombatArcher = GameInfoTypes["UNITCOMBAT_ARCHER"];
local iCombatSiege = GameInfoTypes["UNITCOMBAT_SIEGE"];
local iCombatHeli = GameInfoTypes["UNITCOMBAT_HELICOPTER"]

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

function KakurezatoBoost(playerID, unitID, unitX, unitY)
    local player = Players[playerID]
    if (not player:IsAlive()) then return end
    if player:GetCivilizationType() ~= iIgaCiv then return end
    local unit = player:GetUnitByID(unitID)
    if unit:IsHasPromotion(iKakurezatoPromotion) then return end --checks the unit does not already have the boost
    if unit:GetUnitCombatType() == iCombatArcher then return end
    if unit:GetUnitCombatType() == iCombatSiege then return end
    if unit:GetUnitCombatType() == iCombatHeli then return end
	if unit:IsCanAttackRanged() then return end
	if unit:IsHurt() then return end
    local unitPlot = Map.GetPlot(unitX, unitY);	
    if (not unitPlot) then return end
    local owner = unitPlot:GetOwner()
    if owner == playerID then --check the plot owner is the same as the unit owner
        if unit:IsCombatUnit() then
            if unitPlot:GetImprovementType(-1) == GameInfoTypes.IMPROVEMENT_KAKUREZATO then --check if the plot improvement is a Kakurezato
                if not unitPlot:IsImprovementPillaged() then
                    unit:SetHasPromotion(iKakurezatoPromotion,true)
				end
            end
		end
    end
end

function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end


function RemoveBuffIfHurt(playerID)
	local igaCivilizationType = GameInfo.Civilizations.CIVILIZATION_IGA.ID
	local igaPlayer = GetPlayerByCivilization(igaCivilizationType)
    local pPlayer = igaPlayer
    for pUnit in pPlayer:Units() do
        if pUnit:IsHasPromotion(iKakurezatoPromotion) then
            if pUnit:IsHurt() then
                pUnit:SetHasPromotion(iKakurezatoPromotion,false)
            end
        end
    end
end


if isIgaCivActive then
	GameEvents.PlayerDoTurn.Add(RemoveBuffIfHurt);
	GameEvents.UnitSetXY.Add(KakurezatoBoost);
end