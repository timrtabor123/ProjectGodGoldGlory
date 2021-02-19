-- Mayor S
-- Comanche Moon
print("Comanche Moon Loaded")

function ComancheMoon(player)
	local pPlayer = Players[player]
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_COMANCHEMOON) then
			local pPlot = pUnit:GetPlot()
			print("Got Plot")
			if pPlot then
				if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_STEALHORSE then
				print("Stealing Horses")
					numHorse = (pPlot:GetNumResource())
					print("Number of Horses on Plot = ".. numHorse)
					if numHorse == 2 then
						print("Spawn Horse2")
						local face = pUnit:GetFacingDirection()
						local nUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_HORSE2, pPlot:GetX(), pPlot:GetY(), UNITAI_WORKER, face)
					end
					if numHorse == 4 then
						print("Spawn Horse4")
						local face = pUnit:GetFacingDirection()
						local nUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_HORSE4, pPlot:GetX(), pPlot:GetY(), UNITAI_WORKER, face)
					end
					pPlot:SetImprovementType(-1)
					pPlot:SetResourceType(-1)
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COMANCHEMOON, false)
					pUnit:CanBuild(pPlot, GameInfoTypes.BUILD_STEALHORSE, false, false)
					print("No more Horses")
					local pHurt = Players[pPlot:GetOwner()]
					if pHurt ~= pPlayer then
						if pHurt:IsMinorCiv() then
							print("CityState")
							pHurt:ChangeMinorCivFriendshipWithMajor(pPlayer, -30)
							print("Ouch!")
						elseif not pHurt:IsHuman() then
							print("Major Civ")
							if not pHurt:IsDenouncingPlayer(pPlayer) then
								pHurt:DoForceDenounce(pPlayer)
								print("Ouch!")
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ComancheMoon)

function PlantingHorses2(player)
	local pPlayer = Players[player]
		for pCity in pPlayer:Cities() do
			for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(pCityPlot)
				if pPlot ~= nil then
					if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_PLANT_HORSES2 then
						if pPlot:GetResourceType(-1) == (-1) then
							print("Planting Horses")
							pPlot:SetResourceType(GameInfoTypes.RESOURCE_HORSE, 2)
							print("Horses Planted")
							for pUnit in pPlayer:Units() do
								if pUnit:GetUnitType() == GameInfoTypes.UNIT_HORSE2 then
									pUnit:Kill(true, -1)
									print("Goodbye Horse2")
								end
							end
						end
					pPlot:SetImprovementType(-1)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(PlantingHorses2)

function PlantingHorses4(player)
	local pPlayer = Players[player]
		for pCity in pPlayer:Cities() do
			for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(pCityPlot)
				if pPlot ~= nil then
					if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_PLANT_HORSES4 then
						if pPlot:GetResourceType(-1) == (-1) then
							print("Planting Horses")
							pPlot:SetResourceType(GameInfoTypes.RESOURCE_HORSE, 4)
							print("Horses Planted")
							for pUnit in pPlayer:Units() do
								if pUnit:GetUnitType() == GameInfoTypes.UNIT_HORSE4 then
									pUnit:Kill(true, -1)
									print("Goodbye Horse4")
								end
							end
						end
					pPlot:SetImprovementType(-1)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(PlantingHorses4)

function GoldAgeFromHorse(player)
	local pPlayer = Players[player]
	local totalNumHorse = 0;
	local goldenAgeNum = pPlayer:GetGoldenAgeProgressMeter()
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_S_COMANCHE then
		for pCity in pPlayer:Cities() do
			for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(pCityPlot)
				if pPlot ~= nil then
					if pPlot:GetResourceType() == GameInfoTypes.RESOURCE_HORSE then
						numHorse = (pPlot:GetNumResource())
						totalNumHorse = numHorse + totalNumHorse
					end		
				end
			end
		end
		print("Number of Horses Within City = ".. totalNumHorse)
		print("Golden Age Progress Number = ".. goldenAgeNum)
		pPlayer:SetGoldenAgeProgressMeter(totalNumHorse + goldenAgeNum)
	end
end

GameEvents.PlayerDoTurn.Add(GoldAgeFromHorse)

