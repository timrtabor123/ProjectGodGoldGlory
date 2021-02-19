WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "TarcisioCMIlkhanateFunctions";
-- YE WHO READS THIS CODE BE WARNED
-- BEYOND THESE LINES LIES A LAND OF MADNESS WITH NO RETURN
-- PROCEED WITH CAUTION AND YE MIGHT STILL SURVIVE
-- DRIFT AWAY FROM THE RIGHTEOUS CODE AND YE SHALL FALL TO MADNESS AND DESPAIR
-- YE HAS BEEN WARNED

function tcmIlkhanatePlayerDoTurn(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ILKHANATE"] then
			if not(city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_CITYCAPTURED"])) then	
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_CITYCAPTURED"], 1)
			end
		end
		local plot = city:Plot()
		local population = city:GetPopulation()
		local originalPopulation = load(plot, "tcmCityCurrentPopulation")
		if originalPopulation == nil then
			originalPopulation = city:GetPopulation()
		elseif population > originalPopulation then
			originalPopulation = population
		end
		save(plot, "tcmCityCurrentPopulation", originalPopulation)
		if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_RUZNAMCE"]) then
			local bonusYields = originalPopulation - population
			if bonusYields < 0 then
				bonusYields = 0
			end
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_PROD"], bonusYields)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_FOOD"], bonusYields)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_GOLD"], bonusYields)
		else
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_PROD"], 0)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_FOOD"], 0)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_GOLD"], 0)
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcmIlkhanatePlayerDoTurn)

function tcmIlkhanateCityBuiltSomething(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	local city = player:GetCityByID(cityId)
	local plot = city:Plot()
	if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_ILKHANATE"] then
		save(plot, "tcmCityIsHadBuilding" .. buildingType, true)
	end
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ILKHANATE"] then
		if load(plot, "tcmCityIsHadBuilding" .. buildingType) == true then
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_RUZNAMCE"]) then
				local culturePerTurn = player:GetJONSCulture() / 8
				local cultureForPolicy = player:GetNextPolicyCost() / 45
				local culture = math.ceil(culturePerTurn + cultureForPolicy)
				player:ChangeJONSCulture(culture)
				--Notification
				if player:IsHuman() then
					title = Locale.ConvertTextKey("TXT_KEY_TCM_RUZNAMCE_NOTIFICATION_TITLE", GameInfo.Buildings[buildingType].Description);
					descr = Locale.ConvertTextKey("TXT_KEY_TCM_RUZNAMCE_NOTIFICATION", city:GetName(), culture, GameInfo.Buildings[buildingType].Description); 
					player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, city:GetX(), city:GetY());
				end
			end
			save(plot, "tcmCityIsHadBuilding" .. buildingType, false)
		end
		if city:IsCapital() and load(player, "Decisions_IlkhanateBuildCapital") == true then
			local culturePerTurn = player:GetJONSCulture() / 8
			local cultureForPolicy = player:GetNextPolicyCost() / 45
			local culture = math.ceil(culturePerTurn + cultureForPolicy)
			player:ChangeJONSCulture(culture)
		end
	end
end
GameEvents.CityConstructed.Add(tcmIlkhanateCityBuiltSomething)

--Had to use UnitSetXY for this because other events weren't working as intended
function tcmIlkhanateCaptureCity(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ILKHANATE"] then
		if unit then
			local plot = unit:GetPlot()
			if plot then
				local city = plot:GetPlotCity()
				if city and city:GetOwner() == playerID then
					if not(city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_CITYCAPTURED"])) then	
						-- Unique Ability
						if city:IsOriginalCapital() then
							local originalPopulation = load(plot, "tcmCityCurrentPopulation")
							if originalPopulation == nil then
								originalPopulation = city:GetPopulation()
							end
							local specialistNum = 0
							for row in GameInfo.Specialists() do
								local specialist = row.Type
								if specialist ~= "SPECIALIST_CITIZEN" then
									specialistNum = city:GetSpecialistCount(GameInfoTypes[specialist]) + specialistNum
								end
							end
							originalPopulation = originalPopulation - specialistNum
							local buildingNum = 0
							local wonderNum = 0
							for row in GameInfo.Buildings() do
								local building = row.Type
								if (city:IsHasBuilding(GameInfoTypes[building])) then
									if row.Cost ~= nil or row.FaithCost ~= nil then
										local plot = city:Plot()
										save(plot, "tcmCityIsHadBuilding" .. building, true);
										if row.WonderSplashImage == nil then
											city:SetNumRealBuilding(GameInfoTypes[building], 0)
										end
									end
								end
								if load(plot, "tcmCityIsHadBuilding" .. building) == true then
									if row.WonderSplashImage ~= nil then
										wonderNum = wonderNum + 1
									else
										buildingNum = buildingNum + 1
									end
								end
							end
							print("NumBuildings" .. buildingNum)
							local greatPersonNum = city:GetNumGreatPeople()
							city:SetPopulation(0, true)
							local gold = (originalPopulation * 60) + (specialistNum * 110) + (buildingNum * 35) + (wonderNum * 200) + (greatPersonNum * 100)
							player:ChangeGold(gold)
							local resistance = city:GetResistanceTurns()
							city:ChangeResistanceTurns(-resistance)
							--Notification
							if player:IsHuman() then
								title = Locale.ConvertTextKey("TXT_KEY_TCM_SIEGE_NOTIFICATION_TITLE", city:GetName());
								descr = Locale.ConvertTextKey("TXT_KEY_TCM_SIEGE_NOTIFICATION", city:GetName(), gold);
								player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, city:GetX(), city:GetY());
							end
						end
						-- For the Ilduchi
						if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_ILDUCHI"] then
							--Religion Part
							local capital = player:GetCapitalCity()
							local capitalReligion = capital:GetReligiousMajority()
							local religionList = {}
							local numReligions = 0
							if capitalReligion and capitalReligion ~= GameInfoTypes["RELIGION_PANTHEON"] then
								numReligions = 1
								table.insert(religionList, capitalReligion)
							end
							for religion in GameInfo.Religions() do
								if city:GetNumFollowers(religion.ID) > 0 and religion.ID ~= capitalReligion then
									numReligions = numReligions + 1
									table.insert(religionList, religion.ID)
									city:ConvertPercentFollowers(GameInfoTypes["RELIGION_PANTHEON"], religion.ID, 100)
									city:ConvertPercentFollowers(0, religion.ID, 100)
								end
							end
							city:ConvertPercentFollowers(0, -1, 100)
							city:ConvertPercentFollowers(GameInfoTypes["RELIGION_PANTHEON"], -1, 100)
							local numUsedReligions = 1
							for key,newReligions in pairs(religionList) do 
								local ConversionPercent = (100 / numReligions) * numUsedReligions
								numUsedReligions = numUsedReligions + 1
								city:ConvertPercentFollowers(newReligions, GameInfoTypes["RELIGION_PANTHEON"], ConversionPercent)
							end
							-- Combat Strength part
							if load(plot, "tcmCityHasBeenCapturedAlready") ~= true then
								local bonusCombatStrength = unit:GetBaseCombatStrength() + 1
								unit:SetBaseCombatStrength(bonusCombatStrength)
							end
							--
							save(plot, "tcmCityHasBeenCapturedAlready", true)
						end
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_CITYCAPTURED"], 1)
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(tcmIlkhanateCaptureCity)

function tcmIlkhanateFoundedCity(playerID, cityX, cityY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ILKHANATE"]) then 
		local plot = Map.GetPlot(cityX, cityY)
		local city = plot:GetPlotCity()
		city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ILKHANATE_CITYCAPTURED"], 1)
	end
end
GameEvents.PlayerCityFounded.Add(tcmIlkhanateFoundedCity)  