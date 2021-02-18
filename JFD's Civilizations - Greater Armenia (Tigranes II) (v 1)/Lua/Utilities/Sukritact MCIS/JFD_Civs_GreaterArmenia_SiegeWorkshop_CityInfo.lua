-- JFD_Civs_GreaterArmenia_SiegeWorkshop_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey

local Players 			= Players

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]

local civilizationID	= GameInfoTypes["CIVILIZATION_JFD_GREATER_ARMENIA"]
local isCivActive		= (activePlayer:GetCivilizationType() == civilizationID)
if (not isCivActive) then return end
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
--CityInfoStackDataRefresh
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_GreaterArmenia_SiegeWorkshop_CityInfo", ["SortOrder"] = 1})

   table.insert(tEventsToHook, LuaEvents.ProductionPopup)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()
 
 --CityInfoStackDirty
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_GreaterArmenia_SiegeWorkshop_CityInfo" then return end
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- UI FUNCTIONS	
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local buildingSiegeWorkshopID 			= GameInfoTypes["BUILDING_JFD_SIEGE_WORKSHOP"]
local buildingSiegeWorkshopProductionID = GameInfoTypes["BUILDING_JFD_SIEGE_WORKSHOP_PRODUCTION"]

local g_ProductionPanelOpen = false

g_JFD_GreaterArmenia_SiegeWorkshop_TipControls = {}
TTManager:GetTypeControlTable("JFD_GreaterArmenia_SiegeWorkshop_ToolTip", g_JFD_GreaterArmenia_SiegeWorkshop_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------------------------------------
--OnProductionPopup
function OnProductionPopup(isHide)
	g_ProductionPanelOpen = (not isHide)
end
LuaEvents.ProductionPopup.Add(OnProductionPopup)
-------------------------------------------------------------------------------------------------------------------------
--ProcessCityScreen
function ProcessCityScreen(instance)
	local city = UI.GetHeadSelectedCity()
	if (not city) or g_ProductionPanelOpen then
		instance.IconFrame:SetHide(true)
		return
	end
	local numBuilding = city:GetNumBuilding(buildingSiegeWorkshopProductionID)
	if numBuilding <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_GreaterArmenia_SiegeWorkshop_ToolTip")
	IconHookup(3, 64, "JFD_GREATER_ARMENIA_ICON_ATLAS", instance.IconImage)
	
	local strTitle = string.upper(g_ConvertTextKey("TXT_KEY_BUILDING_JFD_SIEGE_WORKSHOP"))
	local strHelp = g_ConvertTextKey("TXT_KEY_JFD_SIEGE_WORKSHOP_PRODUCTION_CITY_VIEW_HELP", (numBuilding*10))
	local tradeRoutes = activePlayer:GetTradeRoutes()
	for _, tradeRoute in ipairs(tradeRoutes) do
		local fromCity = tradeRoute.FromCity
		if fromCity:IsHasBuilding(buildingSiegeWorkshopID) then
			strHelp = strHelp .. "[NEWLINE][ICON_BULLET]" .. g_ConvertTextKey("+10% [ICON_PRODUCTION] from {1_CityDesc}", fromCity:GetName())
		end
	end
	
	local tipControls = g_JFD_GreaterArmenia_SiegeWorkshop_TipControls
	tipControls.Heading:SetText("[COLOR_POSITIVE_TEXT]" .. strTitle .. "[ENDCOLOR]")
	tipControls.Body:SetText(strHelp)
	tipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
