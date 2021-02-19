-- JFD_Civs_IndoGreeks_DTP
-- Author: JFD
-- DateCreated: 6/5/2015 2:42:50 AM
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- GENERAL UTILS
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
-- DTP UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player_GetGoldenAgePointsFromCultureAndFaith
local yieldCultureID = GameInfoTypes["YIELD_CULTURE"]
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]
function Player_GetGoldenAgePointsFromCultureAndFaith(player)
	local playerID = player:GetID()
	local numGAPs = 0
	for city in player:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			numGAPs = numGAPs + city:GetYieldRate(yieldCultureID)
			numGAPs = numGAPs + city:GetYieldRate(yieldFaithID)
		end
	end
	return numGAPs
end
--=======================================================================================================================
--=======================================================================================================================


