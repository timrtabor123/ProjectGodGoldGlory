-- ER_Karen_Functions
-- Author: EmeraldRange
-- DateCreated: 1/10/2021 5:07:29 PM
--------------------------------------------------------------
include("PlotIterators.lua")
----------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------------
local iKarenID = GameInfoTypes["CIVILIZATION_ER_KAREN"]
local traitKarenID = GameInfoTypes["TRAIT_ER_KAWTHOOLEI"]
local iMedicPromotion = GameInfoTypes["PROMOTION_ER_KAREN_MEDIC"]

local iBuphaw = GameInfoTypes["BUILDING_ER_BUPHAW"]
local bIsCivActive = JFD_IsCivilisationActive(iKarenID)
if bIsCivActive then print("ER Karen activated") end

function ER_KarenKawthooleiFunc(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iKarenID and pPlayer:IsAlive() then
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			if pPlot and pPlot:GetImprovementType() == -1 and pPlot:GetOwner() == playerID then
				pUnit:SetHasPromotion(iMedicPromotion, true)
			else
				pUnit:SetHasPromotion(iMedicPromotion, false)
			end
		end
	end
end


function ER_KarenBuphawHealFunc(playerID)
	local pPlayer = Players[playerID]
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iBuphaw) then 
			for pAreaPlot in PlotAreaSpiralIterator(pCity:Plot(), 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, pAreaPlot:GetNumUnits() - 1, 1 do
					local pUnit = pAreaPlot:GetUnit(i)
					if pUnit and pUnit:GetOwner() and Players[pUnit:GetOwner()]:GetCivilizationType() == iKarenID then
						pUnit:ChangeDamage(-5)
					end
				end
			end
		end
	end
end 


if bIsCivActive then
	GameEvents.PlayerDoTurn.Add(ER_KarenKawthooleiFunc)
	GameEvents.PlayerDoTurn.Add(ER_KarenBuphawHealFunc)
end