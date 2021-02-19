-- JFD_ByzantiumTheodora_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
--IsCPActive
function IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = IsCPActive()

--HasTrait
function HasTrait(player, traitID)
	if isCPActive then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- STOUDION
--------------------------------------------------------------------------------------------------------------------------
--JFD_Byzantium_Stoudion_CityTrained
local buildingStoudionID			= GameInfoTypes["BUILDING_JFD_STOUDION"]
local unitPromotionExtraMovesID		= GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]
local unitPromotionSightPenaltyID	= GameInfoTypes["PROMOTION_SIGHT_PENALTY"]
local unitMissionaryID				= GameInfoTypes["UNIT_MISSIONARY"]
function JFD_Byzantium_Stoudion_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local unit = player:GetUnitByID(unitID)
	if unit and unit:GetUnitType() ~= unitMissionaryID then return end
	local city = player:GetCityByID(cityID)
	if (not city:IsHasBuilding(buildingStoudionID)) then return end
	unit:SetHasPromotion(unitPromotionExtraMovesID, true)
	unit:SetHasPromotion(unitPromotionSightPenaltyID, false)
end
GameEvents.CityTrained.Add(JFD_Byzantium_Stoudion_CityTrained)
--==========================================================================================================================
--==========================================================================================================================