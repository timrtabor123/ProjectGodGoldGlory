-- DMS_Eritrea_UU_CityInfo
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
local buildingAskariExtraProduction				= GameInfoTypes["BUILDING_DMS_ASKARI_EXTRA_PRODUCTION"]
if not(JFD_IsCivilisationActive(civilisationEritrea)) then return end
print("DMS_Eritrea_UU_CityInfo is loading")
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Eritrea_HasUUGarrison
----------------------------------------------------------------------------------------------------------------------------
function DMS_Eritrea_HasUUGarrison(city)
	return city:IsHasBuilding(buildingAskariExtraProduction)
end
----------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
----------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "DMS_PenneDiFalcoCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "DMS_PenneDiFalcoCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_DMSPenneDiFalco)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_DMSPenneDiFalco)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_DMSPenneDiFalco)
	
	Controls.IconFrame:SetHide(true)
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--==========================================================================================================================
-- CORE FUNCTIONS	
--==========================================================================================================================
isCityScreenOpen = false
g_DMSPenneDiFalcoTipControls = {}
TTManager:GetTypeControlTable("DMSPenneDiFalcoTooltip", g_DMSPenneDiFalcoTipControls)
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
	
	local hasUUGarrison = DMS_Eritrea_HasUUGarrison(city)
	if not hasUUGarrison then 
		instance.IconFrame:SetHide(true)
		return
	end

	instance.IconFrame:SetToolTipType("DMSPenneDiFalcoTooltip")
	IconHookup(2, 64, 'DMS_ERITREA_ATLAS', instance.IconImage)
	
	local titleText = "[COLOR_POSITIVE_TEXT]PENNE DI FALCO[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_DMS_PENNE_DI_FALCO_CITY_VIEW_HELP")
	g_DMSPenneDiFalcoTipControls.Heading:SetText(titleText)
	g_DMSPenneDiFalcoTipControls.Body:SetText(helpText)
	g_DMSPenneDiFalcoTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_DMSPenneDiFalco()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_DMSPenneDiFalco)

function SerialEventCityDirty_DMSPenneDiFalco()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_DMSPenneDiFalco)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_DMSPenneDiFalco)
----------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_DMSPenneDiFalco()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_DMSPenneDiFalco)
--==========================================================================================================================
--==========================================================================================================================
