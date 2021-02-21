------------------------------------------------------------------------------------------------------------------------------------------------
--Senshi Deer and Music Slots
------------------------------------------------------------------------------------------------------------------------------------------------

include("CityNearbyMapDatas.lua")

local bPrintPerTurnData = false
local tBuildingsWithGreatWorkSlotsOfType = {}
local sMusicType = "GREAT_WORK_SLOT_MUSIC"
local sLitType = "GREAT_WORK_SLOT_LITERATURE"
local sArtType = "GREAT_WORK_SLOT_ART_ARTIFACT"
local iCulturePerGreatWork = GameDefines.BASE_CULTURE_PER_GREAT_WORK
local iTourismPerGreatWork = GameDefines.BASE_TOURISM_PER_GREAT_WORK

----------------------------------------------------------------------------------------------------------------------------
--You need to make the buildings listed here in your xml
--Change the names as desired in the xml but make sure you update these names
--All of the Tourism Dummies Must belong to their own building-class and must be the default building within the class
----------------------------------------------------------------------------------------------------------------------------

local iRequiredCivilization = GameInfoTypes.CIVILIZATION_SENSHI_NENETS
local iCultureDummy = GameInfoTypes.BUILDING_SENSHI_NENETS_CULTURE
local tTourismMakerDummies = { [1] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_1,
	[2] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_2,
	[4] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_4,
	[8] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_8,
	[16] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_16,
	[32] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_32,
	[64] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_64,
	[128] = GameInfoTypes.BUILDING_SENSHI_DUMMY_TOURISM_128 }

--==============================================================================================================================================
--You should not really need to make changes below this line
--==============================================================================================================================================

for Building in DB.Query("SELECT ID, BuildingClass, GreatWorkSlotType, GreatWorkCount FROM Buildings WHERE GreatWorkCount > 0") do
	if not tBuildingsWithGreatWorkSlotsOfType[Building.GreatWorkSlotType] then
		tBuildingsWithGreatWorkSlotsOfType[Building.GreatWorkSlotType] = {}
	end
	tBuildingsWithGreatWorkSlotsOfType[Building.GreatWorkSlotType][Building.ID] = {BuildingClass = GameInfoTypes[Building.BuildingClass], GreatWorkCount = Building.GreatWorkCount}
end
function ReturnNumberGreatWorksOfTypeInCity(pCity, sGreatWorkType)
	local iNumberGreatWorksOfType, iNumberEmptySlots = 0, 0
	for Building,DataTable in pairs(tBuildingsWithGreatWorkSlotsOfType[sGreatWorkType]) do
		if pCity:IsHasBuilding(Building) then
			iNumberGreatWorksOfType = iNumberGreatWorksOfType + pCity:GetNumGreatWorksInBuilding(DataTable.BuildingClass)
			iNumberEmptySlots = iNumberEmptySlots + (DataTable.GreatWorkCount - pCity:GetNumGreatWorksInBuilding(DataTable.BuildingClass))
		end
	end
	return iNumberGreatWorksOfType, iNumberEmptySlots
end
function SetUnFilledCityMusicSlotsEffects(iPlayer, pPlayer, pCity, iNumberEmptySlots, iNumberDeer)
	local iEffectAmount = 0
	if iNumberEmptySlots > 0 then
		if iNumberEmptySlots > iNumberDeer then
			iEffectAmount = iNumberDeer
		else
			iEffectAmount = iNumberEmptySlots
		end
	end
	pCity:SetNumRealBuilding(iCultureDummy, (iEffectAmount * iCulturePerGreatWork))
	local iTourismValue = iEffectAmount * iTourismPerGreatWork
	--print("tTourismMakerDummies cancel")
	for k,v in pairs(tTourismMakerDummies) do
		pCity:SetNumRealBuilding(v, 0)
	end
	if iTourismValue > 0 then
		if iTourismValue > 255 then
			iTourismValue = 255
		end
		local iPow = 1
		while (iTourismValue > 0) do
			if (iTourismValue % 2 == 1) then
				pCity:SetNumRealBuilding(tTourismMakerDummies[iPow], 1)
			end
			iPow = iPow * 2
			iTourismValue = math.floor(iTourismValue / 2)
		end
	end
end

function SenshiNenetsEmptytMusicSlots(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iRequiredCivilization then return end
	print("GreatWorksSlotsInCitiesUtilities processing turn for player " .. iPlayer .. " who is being used as " .. pPlayer:GetName())
	for pCity in pPlayer:Cities() do
		local tNearbyDatas = GetCityMapDatas(pCity, "Resources")
		local iNumberDeer = GetNumCityWorkingResourcePlots(tNearbyDatas, GameInfoTypes.RESOURCE_DEER)
		local iNumberGreatWorksOfType, iNumberEmptySlots = ReturnNumberGreatWorksOfTypeInCity(pCity, sMusicType)
		SetUnFilledCityMusicSlotsEffects(iPlayer, pPlayer, pCity, iNumberEmptySlots, iNumberDeer)
		if bPrintPerTurnData then
			print("For the city of " .. pCity:GetName() .. " the following tourism buildings are present:")
			for k,v in pairs(tTourismMakerDummies) do
				print(GameInfo.Buildings[v].Type .. " qty in the city is " .. pCity:GetNumBuilding(v))
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SenshiNenetsEmptytMusicSlots)

print("SenshiNenetsEmptytMusicSlots.lua loaded to the end")