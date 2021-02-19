--Yukaghir Functions by EW

include("PlotIterators.lua")

--Defines

local pYukaghir = GameInfoTypes["CIVILIZATION_EW_YUKAGHIR"]
local pShakhadibe = GameInfoTypes["BUILDING_EW_SHAKHADIBE"]
local pShoromokh = GameInfoTypes["UNIT_EW_SHOROMOKH"]
local pScientist = GameInfoTypes["SPECIALIST_SCIENTIST"]
local pWriter = GameInfoTypes["SPECIALIST_WRITER"]

local pYuka_Dummy = GameInfoTypes["BUILDING_EW_YUKAGHIR_BORDER"]
local pImprovement = GameInfoTypes["IMPROVEMENT_EW_YUKAGHIR"]
local pAcademy = GameInfoTypes["IMPROVEMENT_ACADEMY"]

local tResource = {}
for row in DB.Query("SELECT * FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_CAMP')") do
	tResource[GameInfoTypes[row.ResourceType]] = true
end


local tBuildingClasses = {}
for row in DB.Query("SELECT * FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_ThemingBonuses)") do
	print(Locale.ConvertTextKey(row.Description) .. " Loaded by Yukaghir")
	tBuildingClasses[row.ID] = GameInfoTypes[row.BuildingClass]
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

--Functions

if JFD_IsCivilisationActive(pYukaghir) then
	print("Yukaghir Loaded!")
end

--Border Expansion

function EW_Yuka_CityBoughtPlot(playerID, cityID, x, y,	bGold)
	local pPlayer = Players[playerID]
	--Purchasing a Tile grants Great Scientist points and speeds up City Growth
	if pPlayer:GetCivilizationType() == pYukaghir and (bGold) then
		local pCurrentCity = pPlayer:GetCityByID(cityID)
		
		pCurrentCity:ChangeSpecialistGreatPersonProgressTimes100(pScientist, 500)
		for pCity in pPlayer:Cities() do
			if pCity ~= pCurrentCity then
				
				pCity:ChangeJONSCultureStored(10)
			end
		end
	end
	--Border Growth attracts nearby Camp Resources
	if pPlayer:GetCivilizationType() == pYukaghir and (not bGold) then
		local pPlot = Map.GetPlot(x, y) or false
		if pPlot and (pPlot:GetResourceType() == -1) then
	
			if (not (pPlot:IsWater() or pPlot:IsMountain())) then
				
				for pAreaPlot in PlotAreaSpiralIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if (pAreaPlot:GetOwner() ~= playerID) then
						
						local pResource = pAreaPlot:GetResourceType() or false
						if pResource and tResource[pResource] then
							
							pAreaPlot:SetResourceType(-1)
							pAreaPlot:SetImprovementType(-1)
							pPlot:SetResourceType(pResource)
							return
						end
					end
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(pYukaghir) then
	GameEvents.CityBoughtPlot.Add(EW_Yuka_CityBoughtPlot)
end

--UU Academy Built

function EW_Yuka_BuildComplete(playerID, x, y, improvementType)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pYukaghir then
		if improvementType == pImprovement then
			local pPlot = Map.GetPlot(x, y)
			pPlot:SetImprovementType(pAcademy)
			print("Academy check")
			local pCity = pPlot:GetWorkingCity() or false
			if pCity then
				pCity:ChangeSpecialistGreatPersonProgressTimes100(pWriter, 1000)
				print("Writer check")
			end
		end
	end
end

if JFD_IsCivilisationActive(pYukaghir) then
	GameEvents.BuildFinished.Add(EW_Yuka_BuildComplete)
end

--UB

function EW_Yuka_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pYukaghir then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(pShakhadibe) then
				--Checks Theming bonuses
				print("Theme Check")
				local iTheme = 0
				for k, v in pairs(tBuildingClasses) do
					if pCity:IsHasBuilding(k) then
						iTheme = iTheme + pCity:GetThemingBonus(v)
					end
				end
				if iTheme > 10 then iTheme = 10 end
				pCity:SetNumRealBuilding(pYuka_Dummy, iTheme)
			end
		end
	end
end

if JFD_IsCivilisationActive(pYukaghir) then
	GameEvents.PlayerDoTurn.Add(EW_Yuka_DoTurn)
end