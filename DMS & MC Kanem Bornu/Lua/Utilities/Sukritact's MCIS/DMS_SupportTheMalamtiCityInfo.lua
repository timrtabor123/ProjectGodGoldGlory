-- DMS_SupportTheMalamtiInfo
-- Author: DMS
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("IconSupport")
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationKanemBornuID				= GameInfoTypes["CIVILIZATION_DMS_MC_KANEM_BORNU"]
local buildingSupportTheMalamti_1ID			= GameInfoTypes["BUILDING_DMS_SUPPORT_THE_MALAMTI_1"]
local buildingSupportTheMalamti_2ID			= GameInfoTypes["BUILDING_DMS_SUPPORT_THE_MALAMTI_2"]
local buildingSupportTheMalamti_3ID			= GameInfoTypes["BUILDING_DMS_SUPPORT_THE_MALAMTI_3"]

if not(JFD_IsCivilisationActive(civilisationKanemBornuID)) then return end
--------------------------------------------------------------
-- DMS_bSupportTheMalamti
--------------------------------------------------------------
function DMS_bSupportTheMalamti(city)
	if city:IsHasBuilding(buildingSupportTheMalamti_1ID) or city:IsHasBuilding(buildingSupportTheMalamti_2ID) or city:IsHasBuilding(buildingSupportTheMalamti_3ID) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "DMS_SupportTheMalamtiCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "DMS_SupportTheMalamtiCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_DMSSupportTheMalamti)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_DMSSupportTheMalamti)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_DMSSupportTheMalamti)
	
	Controls.IconFrame:SetHide(true)
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
isCityScreenOpen = false
g_DMSSupportTheMalamtiTipControls = {}
TTManager:GetTypeControlTable("DMSSupportTheMalamtiTooltip", g_DMSSupportTheMalamtiTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)

	if not(instance) then
		instance = Controls
	end

	-- Ensure City Selected
	local activePlayer = Players[Game.GetActivePlayer()]
	local pCity = UI.GetHeadSelectedCity()
	if not(pCity) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure City is has any Malamti to support (has any Holy Sites)
	local bSupportTheMalamti = DMS_bSupportTheMalamti(pCity)
	if not (bSupportTheMalamti) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("DMSSupportTheMalamtiTooltip")
	IconHookup(0, 64, "DMS_MC_KANEM_BORNU_ATLAS", instance.IconImage)
	
	local iNumbuildingSupportTheMalamti_1 = pCity:GetNumRealBuilding(buildingSupportTheMalamti_1ID)
	local iFaith1 = 2 * iNumbuildingSupportTheMalamti_1
	local iNumbuildingSupportTheMalamti_2 = pCity:GetNumRealBuilding(buildingSupportTheMalamti_2ID)
	local iFaith2 = 4 * iNumbuildingSupportTheMalamti_2
	local iNumbuildingSupportTheMalamti_3 = pCity:GetNumRealBuilding(buildingSupportTheMalamti_3ID)
	local iFaith3 = 6 * iNumbuildingSupportTheMalamti_3
	local total = iFaith1 + iFaith2 + iFaith3
			
	local titleText = Locale.ConvertTextKey("TXT_KEY_DMS_EVENT_DMS_SUPPORT_THE_MALAMTI_CITY_VIEW")
	local helpText = Locale.ConvertTextKey("TXT_KEY_DMS_EVENT_DMS_SUPPORT_THE_MALAMTI_CITY_VIEW_HELP", iNumbuildingSupportTheMalamti_1, iFaith1, iNumbuildingSupportTheMalamti_2, iFaith2, iNumbuildingSupportTheMalamti_3, iFaith3, total)
	
	g_DMSSupportTheMalamtiTipControls.Heading:SetText(titleText)
	g_DMSSupportTheMalamtiTipControls.Body:SetText(helpText)
	g_DMSSupportTheMalamtiTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_DMSSupportTheMalamti()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_DMSSupportTheMalamti)

function SerialEventCityDirty_DMSSupportTheMalamti()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_DMSSupportTheMalamti)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_DMSSupportTheMalamti)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_DMSSupportTheMalamti()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_DMSSupportTheMalamti)
--=======================================================================================================================
--=======================================================================================================================
