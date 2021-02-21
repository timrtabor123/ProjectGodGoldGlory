local civilizationID = GameInfoTypes["CIVILIZATION_SENSHI_NENETS"]
local buildingFaithFromDeer = GameInfoTypes["BUILDING_SENSHI_DEERFAITH"]

function NenetsFaithFromDeer(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do
			if (not city:IsHasBuilding(buildingFaithFromDeer)) then
				city:SetNumRealBuilding(buildingFaithFromDeer, 1)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(NenetsFaithFromDeer)
GameEvents.PlayerCityFounded.Add(NenetsFaithFromDeer)