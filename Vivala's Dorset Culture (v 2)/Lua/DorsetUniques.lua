local iDorset = GameInfoTypes.CIVILIZATION_VIVALA_DORSET
local iFood1 = GameInfoTypes.BUILDING_VIVALA_DORSET_FOOD_1
local iFood2 = GameInfoTypes.BUILDING_VIVALA_DORSET_FOOD_2
local iFood3 = GameInfoTypes.BUILDING_VIVALA_DORSET_FOOD_3
local iIvory = GameInfoTypes.BUILDING_VIVALA_IVORY_CARVER
local iCulture = GameInfoTypes.BUILDING_VIVALA_DORSET_CULTURE
local iProduction = GameInfoTypes.BUILDING_VIVALA_DORSET_PRODUCTION
local iPromo = GameInfoTypes.PROMOTION_VIVALA_DORSET_UA

--=======================================================================================================================================================
-- **Mark Units that Attacked
---------------------------------------------------------------------------------------------------------------------------------------------------------
--		This triggers on the player's turn, right as the flag dims.
--=======================================================================================================================================================
function VivaGentleGiantsHunt(iPlayer, iUnit, iDim)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pPlayer:GetCivilizationType() == iDorset and (not pUnit:IsDead()) and pUnit:IsOutOfAttacks() then  --Only runs for the Dorset and marks any unit that attacked. Also checks if it's dead, in case that would throw errors over promotions and such.
		pUnit:SetHasPromotion(iPromo, true)                                                               -- Gives the unit a dummy promotion so the script can verify it attacked at a later point when pUnit:IsOutOfAttacks() doesn't work.
	end
end

function VivaGentleGiantsDistribute(iPlayer)
--=======================================================================================================================================================
-- **Find the last living player who took their turn.
---------------------------------------------------------------------------------------------------------------------------------------------------------
--		Dorset's UA should trigger right after the end of its turn. The closest I can manage is the start of the next player's turn.
-- However, since GameEvents.PlayerDoTurn() doesn't trigger for dead players, I need to iterate back through each player until I find the most recent
-- living one.
--=======================================================================================================================================================
	local pPlayer = Players[iPlayer]                  --Defining pPlayer so it can be used in and out of the while loop.
	local bPrevious = true			                  --Will be changed to false once we find a living player.
	while bPrevious do                                --While loop that runs until we find a living player. This is guaranteed to terminate since there will always be at least two players.
		if iPlayer == 0 then			              --If/then that makes sure player 0 looks for the last player, not player -1.
			iPlayer = GameDefines.MAX_MAJOR_CIVS 
		end
		iPlayer = iPlayer - 1                         --Goes to the previous player.
		pPlayer = Players[iPlayer]                    --Sets the player object both so we can check if they're alive, and so it can be passed out of the loop if alive.
		if pPlayer and pPlayer:IsAlive() then         --Want to avoid null errors and see if the player is alive.
			bPrevious = false                         --If we've found a living player then we can end the loop!
		end
	end
	if pPlayer:GetCivilizationType() == iDorset then  --The hunting/distribution code only needs to be run once, so only run it if the player who took their turn before this one is the Dorset.
--=======================================================================================================================================================
-- **Determine how much food the Dorset receive
---------------------------------------------------------------------------------------------------------------------------------------------------------
--		Iterate through all units and increase the food count if a unit is military, land/sea, and didn't attack.
--=======================================================================================================================================================
		local iHunters = 0                                          --Food count. Outside of the for loop because it will be passed into the cities loop later.
		for pUnit in pPlayer:Units() do                             --Iterate through all units.
			local iUnitType = pUnit:GetUnitType()                   --Get the unit's type so we can get its XML data. 
			local pUnitData = GameInfo.Units{ID=iUnitType}()        --Creates an object that references the unit's XML data.
			local military = pUnit:IsCombatUnit()                   --If the unit's combat strength isn't 0, it's presumably not a civilian unit. (This does mean that in the rare event Inukpak somehow gains control of a unique settler/worker with combat strength that it would be counted as military, but I'm willing to accept that very rare edge case
			local land = (pUnitData.Domain == "DOMAIN_LAND")        --The unit is a land unit if it's domain is DOMAIN_LAND. Shocking.
			local sea = (pUnitData.Domain == "DOMAIN_SEA")          --The unit is a sea unit if it's domain is DOMAIN_SEA.
			local attacked = pUnit:IsHasPromotion(iPromo)           --Checks if the unit has attacked, using the dummy promotion set in VivaGentleGiantsDistribute.
			local terrain = VivaDorsetTerrain(pUnit, land, sea)     --Checks to see if the unit is on/adjacent to the right terrain.
			pUnit:SetHasPromotion(iPromo, false)                    --Now that we know whether or not the unit is attacked, the promotion can be cleared. It will be re-given next turn if the unit attacks again.
			if military and (land or sea) and (not attacked) and terrain then   --Increase the food count only if the unit is military, is a land or sea unit, and it didn't attack. Could have done this without the variables, but it's easier to read this way.
				iHunters = iHunters + 1                             --If all that stuff, increment the food counter.
			end
		end
--=======================================================================================================================================================
-- **Preparation to Distribute Food: Order Cities by Net Food
---------------------------------------------------------------------------------------------------------------------------------------------------------
--		Food gets distributed to the hungriest cities first, so the cities need to be ordered by net food.
--=======================================================================================================================================================
		local aCities = {}                                      --The array of cities. Cities will be inserted into here one at a time.
		for pCity in pPlayer:Cities() do                        --Iterate through every city.
			pCity:SetNumRealBuilding(iFood1, 0)                 --Clear the three types of food-granting buildings (Walrus, Narwhal, and Seal).
			pCity:SetNumRealBuilding(iFood2, 0)
			pCity:SetNumRealBuilding(iFood3, 0)
			local iApple = pCity:FoodDifference()                --FoodDifference() is the food left after consumption. Essentially the city's growth per turn.
			if #aCities == 0 then	                            --If the length of the array is 0 then no cities have been examined yet, so we can just insert it.
				table.insert(aCities, 1, pCity)
			else
				local iPlace = 1                                --This is the index of the array where the city will be placed. 1 being the worst growth.
				for i = 1, #aCities, 1 do                       --Check every single city until a city with better growth is found.
					local iApple2 = aCities[i]:FoodDifference()  --Get the growth of the city being compared.
					if iApple2 >= iApple then                     --If the city being compared has better (or equal) growth than pCity.
						break                                   --End the loop.
					end
					iPlace = iPlace + 1                         --If city i had worse growth then pCity should go at least at i+1. I do this instead of iPlace = i earlier in the function because otherwise if pCity has the best growth so far then it still gets placed before the last city in the array.
				end
				table.insert(aCities, iPlace, pCity)
			end
		end
print("Cities before hunting bonuses")                          --This line until the next section is for testing purposes only.
		if not (#aCities == 0) then
			for i = 1, #aCities, 1 do
				print(aCities[i]:GetName(), aCities[i]:FoodDifference())
			end
		end
--=======================================================================================================================================================
-- **Distribute the Food
---------------------------------------------------------------------------------------------------------------------------------------------------------
--		Food gets distributed to the hungriest cities first, with the goal of making cities equal from the bottom up.
-- Example: if Alargnak has +3, Cape Dorset has +0, and Disko Bay has -1, and there's 10 Food to distribute:
-- First bit of food goes to Disko Bay (DB 0, CD 0, A 3)
-- Since DB = CD it doesn't really matter which one gets it, so it'll go to the earlier one in the initial array: Disko Bay (DB 1, CD 0, A 3)
-- Third goes to Cape Dorset, so the function has to check if aCities[2] >= aCities[1] first. Since it's not in this case, it'll go to CD. (DB 1, CD 1, A 3)
-- Repeat with the next 4. (DB 2, CD 1, A 3), (DB 2, CD 2, A3), (DB 3, CD 2, A 3), and (DB 3, CD 3, A 3)
-- Now all three are equal, so once again it'll default to the original hungriest, Disko Bay. (DB 4, CD 3, A3)
-- Now DB > CD, so it goes to CD. (DB 4, CD 4, A 3).
-- Finally, DB is <= CD, but giving it to either would leave Alargnak behind, so the function actually needs to keep checking down the line until it
--		concludes that either all of the cities are equal (goes to the first city), a less hungry city is found (goes to the first city), or a hungrier
--		city is found (it goes to that city).
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- More simply:
-- Iterate through all of the cities, until you find a situation where city(i+1)'s food is greater than city(i)'s, or you've checked all of them.
-- While doing so, keep track of the lowest food value up until that point.
-- Give one food building to the city with the lowest index that has that food value.
-- Repeat until out of food to give
--=======================================================================================================================================================
		if not (#aCities == 0) then                                --Don't try to distribute food if there aren't cities to distribute to.	
			while iHunters > 0 do								   --Keep giving food until you're out of food to give.
				local iHungry = aCities[1]:FoodDifference()		   --City 1's food value is the default. If no city is hungrier then it, then it gets the food.
				for i = 1, #aCities, 1 do                          --Start looking through the list of cities.
					if aCities[i]:FoodDifference() > iHungry then  --If it hits a city that's less hungry then, based on how this function distributes food, it's seen the hungriest city already.
						break
					end
					iHungry = aCities[i]:FoodDifference()          --If this city's food value isn't greater than the previous hungriest then it's either equal (in which case this does nothing), or it's smaller, in which case that needs to be noted.
				end
				for i = 1, #aCities, 1 do						   --Loop through the cities again, this time until a city with FoodDifference of iHungry is found.
					if aCities[i]:FoodDifference() == iHungry then
						local pHungry = aCities[i]
						local iFoodType = math.random(1, 3)        --Randomly determine which food building (Walrus, Narwhal, or Seal) to give the city. They're all functionally the same, I just like mixing it up for flavor.
						if iFoodType == 1 then                     --Increase the number of food buildings of that type by 1.
							pHungry:SetNumRealBuilding(iFood1, pHungry:GetNumRealBuilding(iFood1) + 1)
						elseif iFoodType == 2 then
							pHungry:SetNumRealBuilding(iFood2, pHungry:GetNumRealBuilding(iFood2) + 1)
						else
							pHungry:SetNumRealBuilding(iFood3, pHungry:GetNumRealBuilding(iFood3) + 1)
						end
						break
					end
				end
				iHunters = iHunters - 1                             --One bit of food has been allocated, so decrease the amount of food left to allocate. The loop then runs again, unless iHunters is now 0.
			end
			print("Cities after hunting bonuses")                          
			if not (#aCities == 0) then
				for i = 1, #aCities, 1 do
				print(aCities[i]:GetName(), aCities[i]:FoodDifference())
				end
			end
		end
	end
end

--=======================================================================================================================================================
-- **Check to see if units are at the right terrain.
---------------------------------------------------------------------------------------------------------------------------------------------------------
--		This is part of a tweak to the UA. Units now only generate food if:
-- Land units: are on tundra, snow, or forest tiles.
-- Sea units: are adjacent to tundra, snow, or ice tiles.
-- Not as heavily annotated because this was written at like 1 in the morning and I wasn't really feeling it.
--=======================================================================================================================================================
function VivaDorsetTerrain(pUnit, land, sea)
	local bTerrain = false
	local pPlot = pUnit:GetPlot()
	local iForest = GameInfoTypes.FEATURE_FOREST
	local iIce = GameInfoTypes.FEATURE_ICE
	local iTundra = GameInfoTypes.TERRAIN_TUNDRA
	local iSnow = GameInfoTypes.TERRAIN_SNOW
	if land then
		bTerrain = bTerrain or pPlot:GetFeatureType() == iForest
		bTerrain = bTerrain or pPlot:GetTerrainType() == iTundra
		bTerrain = bTerrain or pPlot:GetTerrainType() == iSnow
	elseif sea then
		local iX = pPlot:GetX()
		local iY = pPlot:GetY()
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
			if pAdjacentPlot then
				bTerrain = bTerrain or pAdjacentPlot:GetTerrainType() == iTundra
				bTerrain = bTerrain or pAdjacentPlot:GetTerrainType() == iSnow
				bTerrain = bTerrain or pAdjacentPlot:GetFeatureType() == iIce
			end
		end
	end
	return bTerrain
end

--=======================================================================================================================================================
-- **Code for the Dorset's UB: the Ivory-Carver's House
---------------------------------------------------------------------------------------------------------------------------------------------------------
--		Should increase the city's culture output by 10% of its gross food production (as in, 10% of the food it produces each turn, including food
-- consumed by citizens.
-- Also added the unit production part of the UA for v2 because it's compact (read: I'm lazy)
--=======================================================================================================================================================
function VivaIvoryCarver(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then                                                                         --The PlayerDoTurn() function shouldn't run on dead players, but might as well be safe.
		for pCity in pPlayer:Cities() do                                                              --Iterate through all of the player's cities.
			if pPlayer:GetCivilizationType() == iDorset then
				pCity:SetNumRealBuilding(iProduction, 0)
				local iIce = GameInfoTypes.FEATURE_ICE
				local iTundra = GameInfoTypes.TERRAIN_TUNDRA
				local iSnow = GameInfoTypes.TERRAIN_SNOW
				local pPlot = pCity:Plot()
				local iX = pPlot:GetX()
				local iY = pPlot:GetY()
				local iUnitPro = 0
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
					local bTerrain = false
					if pAdjacentPlot then
						bTerrain = bTerrain or pAdjacentPlot:GetTerrainType() == iTundra
						bTerrain = bTerrain or pAdjacentPlot:GetTerrainType() == iSnow
						bTerrain = bTerrain or pAdjacentPlot:GetFeatureType() == iIce
					end
					if bTerrain then
						iUnitPro = iUnitPro + 1
					end
				end
				print("Unitpro", pCity:GetName(), iUnitPro)
				pCity:SetNumRealBuilding(iProduction, iUnitPro)
			end
			if pCity:IsHasBuilding(iIvory) then                                                       --Obviously only grant the culture if the city has an Ivory-Carver's House.
				pCity:SetNumRealBuilding(iCulture, (pCity:GetYieldRate(YieldTypes.YIELD_FOOD) / 10))  --Give the city multiple iCulture buildings (each provides +1 culture) equal to 10% of the city's food yield. The function automatically rounds floats (.0-.5 is down, .6-.9 is up).
			else
				pCity:SetNumRealBuilding(iCulture, 0)                                                 --This else is in case the city had an Ivory-Carver's House, but then sold it. This makes sure those iCulture buildings don't stick around.
			end
		end
	end
end

Events.UnitShouldDimFlag.Add(VivaGentleGiantsHunt)      --Unit:IsOutOfAttacks() only works on a player's turn, so the best time to run it is when the flag dims. This works for units not on screen and for strategic view.
GameEvents.PlayerDoTurn.Add(VivaGentleGiantsDistribute)
GameEvents.PlayerDoTurn.Add(VivaIvoryCarver)            --Has to run after VivaGentleGiants so the hunters' food is taken into account when giving culture.