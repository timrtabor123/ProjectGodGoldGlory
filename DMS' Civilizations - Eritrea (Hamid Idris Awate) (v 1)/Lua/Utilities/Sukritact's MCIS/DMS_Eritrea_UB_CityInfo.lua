-- DMS_Eritrea_UB_CityInfo
-- Author: DMS
--==========================================================================================================================
-- UTILITY FUNCTIONS	
--==========================================================================================================================
include("IconSupport")
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationEritrea						= GameInfoTypes["CIVILIZATION_DMS_ERITREA"]
local buildingCablewayStation					= GameInfoTypes["BUILDING_DMS_CABLEWAY_STATION"]
local buildingCablewayStationExtraProduction	= GameInfoTypes["BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION"]
if not(JFD_IsCivilisationActive(civilisationEritrea)) then return end
print("DMS_Eritrea_UB_CityInfo is loading")
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_HasUB
----------------------------------------------------------------------------------------------------------------------------
function DMS_Eritrea_HasUB(city)
	local hasUB = city:IsHasBuilding(buildingCablewayStation)
	return hasUB
end
----------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
----------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "DMS_CablewayStationCityInfo", ["SortOrder"] = 1})
	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "DMS_CablewayStationCityInfo" then return end
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_DMSCablewayStation)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_DMSCablewayStation)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_DMSCablewayStation)
	Controls.IconFrame:SetHide(true)
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--==========================================================================================================================
-- CORE FUNCTIONS	
--==========================================================================================================================
isCityScreenOpen = false
g_DMSCablewayStationTipControls = {}
TTManager:GetTypeControlTable("DMSCablewayStationTooltip", g_DMSCablewayStationTipControls)
----------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
----------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)

	if not(instance) then
		instance = Controls
	end

	-- Ensure City Selected
	local activePlayer = Players[Game.GetActivePlayer()]
	local city = UI.GetHeadSelectedCity()
	if not(city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local hasUB = DMS_Eritrea_HasUB(city)
	if not hasUB then 
		instance.IconFrame:SetHide(true)
		return
	end
	
	local isCapital = city:IsCapital()
	if isCapital then 
		instance.IconFrame:SetHide(true)
		return
	end

	instance.IconFrame:SetToolTipType("DMSCablewayStationTooltip")
	IconHookup(3, 64, 'DMS_ERITREA_ATLAS', instance.IconImage)
	
	local stringUB = "as this City is not producting the same thing as the Capital"
	local extraProductionFromUB = city:GetNumRealBuilding(buildingCablewayStationExtraProduction)
	if extraProductionFromUB > 0 then
		stringUB = "as this City is producting the same thing as the Capital"
	end
	local titleText = "[COLOR_POSITIVE_TEXT]CABLEWAY STATION[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_MCIS_DMS_CABLEWAY_STATION", 25 * extraProductionFromUB, stringUB)
	g_DMSCablewayStationTipControls.Heading:SetText(titleText)
	g_DMSCablewayStationTipControls.Body:SetText(helpText)
	g_DMSCablewayStationTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_DMSCablewayStation()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_DMSCablewayStation)

function SerialEventCityDirty_DMSCablewayStation()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_DMSCablewayStation)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_DMSCablewayStation)
----------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_DMSCablewayStation()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_DMSCablewayStation)
--==========================================================================================================================
--==========================================================================================================================
