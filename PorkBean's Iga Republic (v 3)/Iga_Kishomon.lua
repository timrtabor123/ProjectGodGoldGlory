--------------------
--PorkBean's Iga Republic
--Co-authored by Homusubi
--Trait: Kishomon
--------------------

local iIgaCiv = GameInfoTypes.CIVILIZATION_IGA;
local iStealthPromotion = GameInfoTypes["PROMOTION_CONCEALED"];
local iHillsTerrain = TerrainTypes["TERRAIN_HILL"];
local iForestFeature = FeatureTypes["FEATURE_FOREST"];
local iJungleFeature = FeatureTypes["FEATURE_JUNGLE"]

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

function StealthInRough(playerID, unitID, unitX, unitY)
    local player = Players[playerID]
    if (not player:IsAlive()) then return end
    if player:GetCivilizationType() ~= iIgaCiv then return end
    local unit = player:GetUnitByID(unitID)
	if not unit:IsRanged() then return end
    local unitPlot = Map.GetPlot(unitX, unitY);
    if (not unitPlot) then return end
    if unitPlot:GetFeatureType() == iForestFeature then
        unit:SetHasPromotion(iStealthPromotion,true)
    elseif unitPlot:IsHills() then
        unit:SetHasPromotion(iStealthPromotion,true)
    elseif unitPlot:GetFeatureType() == iJungleFeature then
        unit:SetHasPromotion(iStealthPromotion,true)
    else
        unit:SetHasPromotion(iStealthPromotion,false)
    end
end


if isIgaCivActive then
	GameEvents.UnitSetXY.Add(StealthInRough);
end