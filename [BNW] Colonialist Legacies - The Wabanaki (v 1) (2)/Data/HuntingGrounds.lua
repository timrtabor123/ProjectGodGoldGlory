--HuntingGrounds.lua

-- this function added by TopHat to allocate the new plot to a city
function Neirai_GetNearestCity(pPlayer, pPlot)
	local distance = 9999
	local cNearestCity = nil
	for cCity in pPlayer:Cities() do
		local pCityPlot = cCity:Plot()
		local between = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pCityPlot:GetX(), pCityPlot:GetY())
		if between < distance then
			distance = between
			cNearestCity = cCity
		end
	end
	return cNearestCity
end

function HuntingGroundsCapture(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLWABANAKI then
		for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
			local pPlot = Map.GetPlotByIndex(plotLoop)
			if pPlot:GetOwner() == player then
				if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CLWABHUNTING then
					if not pPlot:IsImprovementPillaged() then
						for i = 0, 5 do
							local pAdj = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
							if pAdj:GetOwner() == -1 then
								if pAdj:IsCoastalLand() or pAdj:GetTerrainType() == TerrainTypes.TERRAIN_COAST then
									local cityID = Neirai_GetNearestCity(pPlayer, pAdj):GetID()
									pAdj:SetOwner(player, cityID)
								end
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HuntingGroundsCapture)