-- JFD_RomeAugustus_DTPS
-- Author: JFD
--=======================================================================================================================
-- CACHED TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--g_Buildings_Table
local g_Buildings_Table = {}
local g_Buildings_Count = 1
for row in DB.Query("SELECT ID FROM Buildings WHERE Cost > 0 AND GreatWorkCount > -1 AND FaithCost > -1;") do 	
	g_Buildings_Table[g_Buildings_Count] = row.ID
	g_Buildings_Count = g_Buildings_Count + 1
end
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
--JFD_RomeAugustus_GetGAPFromBuildings
function JFD_RomeAugustus_GetGAPFromBuildings(playerID)
	local player = Players[playerID]
	local numCities = player:GetNumCities()
	local capital = player:GetCapitalCity()
	local yieldGAP = 0
	
	--g_Buildings_Table
	local buildingsTable = g_Buildings_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local ID = buildingsTable[index]
		if capital:IsHasBuilding(ID) then
			if player:CountNumBuildings(ID) >= numCities then
				yieldGAP = yieldGAP + (2*numCities)
			end
		end	
	end
	return yieldGAP
end
--=======================================================================================================================
--=======================================================================================================================


