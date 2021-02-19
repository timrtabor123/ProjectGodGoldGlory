-- CatherineCityInfo
-- Author: DuskJockey
-- DateCreated: 10/3/2020 12:11:06 PM
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
local civilisationID = GameInfoTypes.CIVILIZATION_RUSSIA
local isRussiaActivePlayer = activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "CatherineIICityInfo", ["SortOrder"] = 1})
end

if isRussiaActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "CatherineIICityInfo" then return end
	ProcessCityScreen(instance)
end

if isRussiaActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local buildingCatherineIIBonusID = GameInfoTypes.BUILDING_DJ_CATHERINE_PRODUCTION

g_CatherineIITipControls = {}
TTManager:GetTypeControlTable("CatherineIITooltip", g_CatherineIITipControls)
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
	
	instance.IconFrame:SetToolTipType("CatherineIITooltip")
	IconHookup(18, 64, "CIV_COLOR_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingCatherineIIBonusID)
	if (bonus < 1) then
		instance.IconFrame:SetHide(true)
		return
	end

	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_DJ_NAKAZ_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_DJ_CATHERINE_II_CITY_VIEW_HELP", bonus * 5)
	g_CatherineIITipControls.Heading:SetText(titleText)
	g_CatherineIITipControls.Body:SetText(helpText)
	g_CatherineIITipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
