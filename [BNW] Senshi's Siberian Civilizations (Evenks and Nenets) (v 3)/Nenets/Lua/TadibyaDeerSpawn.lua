local iTadibya = GameInfoTypes.UNIT_SENSHI_TADIBYA
local iSpawnDeer = GameInfoTypes.IMPROVEMENT_SENSHI_SPAWNDEER
local iDeer = GameInfoTypes.RESOURCE_DEER
local bTadibya = false

GameEvents.GreatPersonExpended.Add(function(iPlayer, iUnitType)
	if iUnitType == iTadibya then
		bTadibya = true
	end
end)

GameEvents.UnitPrekill.Add(function(iPlayer, iUnitID, iUnitType, iX, iY, bDelay, iByPlayer)
	if bTadibya then
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot:GetImprovementType() == iSpawnDeer then
			pPlot:SetImprovementType(-1)
			pPlot:SetResourceType(iDeer)
			pPlot:SetNumResource(1)
		end
		bTadibya = false
	end
end)