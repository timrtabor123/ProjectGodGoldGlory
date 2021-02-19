-- GwamileCityInfo
-- Author: DuskJockey
-- DateCreated: 2/5/2019 8:52:17 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
local civilisationID = GameInfoTypes["CIVILIZATION_DJ_ESWATINI"]
local isGwamileActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "GwamileCityInfo", ["SortOrder"] = 1})
end

if isGwamileActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "GwamileCityInfo" then return end
	ProcessCityScreen(instance)
end

if isGwamileActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingTrainBonusID = GameInfoTypes["BUILDING_DJ_ESWATINI_BORDERS"]

g_GwamileTipControls = {}
TTManager:GetTypeControlTable("GwamileTooltip", g_GwamileTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("GwamileTooltip")
	IconHookup(0, 64, "DJ_ESWATINI_COLOR_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingTrainBonusID)
	if (bonus <= 0) then
		instance.IconFrame:SetHide(true)
		return
	end

	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_DJ_SIYINQABA_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_DJ_ESWATINI_UA_CITY_VIEW_HELP", bonus)
	g_GwamileTipControls.Heading:SetText(titleText)
	g_GwamileTipControls.Body:SetText(helpText)
	g_GwamileTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

