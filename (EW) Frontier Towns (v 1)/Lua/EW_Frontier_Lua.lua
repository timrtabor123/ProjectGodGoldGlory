function EW_Frontier_CitySettle(playerID, x, y)
	local pPlayer = Players[playerID]
	local pPlot = Map.GetPlot(x, y)

	if pPlot and pPlot:IsCity() then
		print("Check CitySettle")
		local pCity = pPlot:GetPlotCity()
		if not pCity:IsCapital() then
			--No Population
			pCity:SetPopulation(0)
			--Occupied
			pCity:SetOccupied(true)
			--No Tiles
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pAdjPlot = pCity:GetCityIndexPlot(i)
				if not pAdjPlot:IsCity() then
					if pAdjPlot:GetWorkingCity() == pCity then
						pAdjPlot:SetOwner(-1)
					end
				end
			end
		end
	end
end

GameEvents.PlayerCityFounded.Add(EW_Frontier_CitySettle)

function EW_Frontier_CanConstruct(playerID, cityID, building)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	if pCity:IsOccupied() then
		if Players[pCity:GetOriginalOwner()] == pPlayer then
			if building == GameInfoTypes["BUILDING_EW_HOMESTEAD"] then
				return true
			end
			return false
		elseif building == GameInfoTypes["BUILDING_COURTHOUSE"] then
			return true
		end
		return false
	elseif building == GameInfoTypes["BUILDING_EW_HOMESTEAD"] then
		return false
	end
	return true
end

GameEvents.CityCanConstruct.Add(EW_Frontier_CanConstruct)

function EW_Frontier_CanTrain(playerID, cityID, unit)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID()
	if pCity:IsOccupied() then
		if unit == GameInfoTypes["UNIT_SETTLER"] then
			return false 
		end
		return true
	end
	return true
end

GameEvents.CityCanTrain.Add(EW_Frontier_CanTrain)

function EW_Frontier_Constructed(playerID, cityID, building)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)

	if building == GameInfoTypes["BUILDING_EW_HOMESTEAD"] then
		pCity:SetOccupied(false)
	end
end

GameEvents.CityConstructed.Add(EW_Frontier_Constructed)

function EW_Frontier_Capture(oldPlayerID, bCapital, x, y, newPlayerID, iPop, bConquest)
	local pPlayer = Players[newPlayerID]
	if not pPlayer:IsHuman() then
		print("Check 1")
		local pPlot = Map.GetPlot(x, y)
		if pPlot and pPlot:IsCity() then
			print("Check 2")
			local pCity = pPlot:GetPlotCity()
			pCity:SetOccupied(true)
			pCity:SetPuppet(false)
		end
	end
end

GameEvents.CityCaptureComplete.Add(EW_Frontier_Capture)