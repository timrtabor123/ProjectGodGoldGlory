local iCiv = GameInfoTypes["CIVILIZATION_CTCL_YUGRA"]

local tYugraDummies = {}
for row in DB.Query("SELECT * FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY'") do
	tYugraDummies[GameInfoTypes[row.Type]] = GameInfoTypes["BUILDING_CTCL_YUGRA_" .. row.Type]
end

function Yugra_DistributeBuildings(iBuilding, bIsTrading, pPlayer)
	local iNum = 0
	if bIsTrading then 
		iNum = 1 
	end
	for pCity in pPlayer:Cities() do
		pCity:SetNumRealBuilding(iBuilding, iNum)
	end
end

function Yugra_AssignFaithDummies(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		for k, v in pairs(tYugraDummies) do
			local bIsTrading = (pPlayer:GetNumResourceTotal(k, false) > pPlayer:GetNumResourceAvailable(k, false))
			Yugra_DistributeBuildings(v, bIsTrading, pPlayer)
		end
	end
end
GameEvents.PlayerDoTurn.Add(Yugra_AssignFaithDummies)