-- DMS_YerimaOrKayghammaCityInfo
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
local buildingYerimaDummyID					= GameInfoTypes["BUILDING_DMS_YERIMA_DUMMY"]
local buildingKayghammaDummyID				= GameInfoTypes["BUILDING_DMS_KAYGHAMMA_DUMMY"]

if not(JFD_IsCivilisationActive(civilisationKanemBornuID)) then return end
-------------------------------------------------------------------------------------------------------------------------
-- DMS_bIsKanembu
-------------------------------------------------------------------------------------------------------------------------
function DMS_bIsKanembu(city)
	if Players[city:GetOwner()]:GetCivilizationType() == civilisationKanemBornuID then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- DMS_bIsCapital
-------------------------------------------------------------------------------------------------------------------------
function DMS_bIsCapital(city)
	local iOwner = city:GetOwner()
	local pOwner = Players[iOwner]
	local pOwnerCapital = pOwner:GetCapitalCity()
	if city == pOwnerCapital then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- DMS_bYerimaOrKayghamma
-------------------------------------------------------------------------------------------------------------------------
function DMS_bYerimaOrKayghamma(city)
	if (city:IsHasBuilding(buildingYerimaDummyID)) or (city:IsHasBuilding(buildingKayghammaDummyID)) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "DMS_YerimaOrKayghammaCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "DMS_YerimaOrKayghammaCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_DMSYerimaOrKayghamma)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_DMSYerimaOrKayghamma)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_DMSYerimaOrKayghamma)
	
	Controls.IconFrame:SetHide(true)
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
isCityScreenOpen = false
g_DMSYerimaOrKayghammaTipControls = {}
TTManager:GetTypeControlTable("DMSYerimaOrKayghammaTooltip", g_DMSYerimaOrKayghammaTipControls)
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
	
	-- Ensure City is Kanembu
	local bIsKanembu = DMS_bIsKanembu(pCity)
	if (not bIsKanembu) then
		instance.IconFrame:SetHide(true)
		return
	end

	-- Ensure City is Capital
	local bIsCapital = DMS_bIsCapital(pCity)
	if (not bIsCapital) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure the Yerima Or Kayghamma Event has occurred
	local bYerimaOrKayghamma = DMS_bYerimaOrKayghamma(pCity)
	if (not bYerimaOrKayghamma) then
		instance.IconFrame:SetHide(true)
		return
	end

	instance.IconFrame:SetToolTipType("DMSYerimaOrKayghammaTooltip")
	IconHookup(0, 64, "DMS_MC_KANEM_BORNU_ATLAS", instance.IconImage)
	
	local sYerimaOrKayghamma
	local sIconAndBonus
	local sPeaceOrWar
	if pCity:IsHasBuilding(buildingYerimaDummyID) then 
		sYerimaOrKayghamma = "YERIMA"
		sIconAndBonus = "[ICON_GREAT_PERSON] Great People Generation"
		sPeaceOrWar = "Peace"
	elseif pCity:IsHasBuilding(buildingKayghammaDummyID) then
		sYerimaOrKayghamma = "KAYGHAMMA"
		sIconAndBonus = "Military Unit Production"
		sPeaceOrWar = "War"
	end
	local sInPeaceOrWar
	local pOwner = Players[pCity:GetOwner()]
	local pTeam = Teams[pOwner:GetTeam()]
	if pTeam:GetAtWarCount(true) == 0 then
		sInPeaceOrWar = "Peace"
	else
		sInPeaceOrWar = "War"
	end
	local sActiveOrInactive
	if (sYerimaOrKayghamma == "YERIMA" and sInPeaceOrWar == "Peace") or (sYerimaOrKayghamma == "KAYGHAMMA" and sInPeaceOrWar == "War") then
		sActiveOrInactive = "[COLOR_POSITIVE_TEXT]Active[ENDCOLOR]"
	elseif (sYerimaOrKayghamma == "YERIMA" and sInPeaceOrWar == "War") or (sYerimaOrKayghamma == "KAYGHAMMA" and sInPeaceOrWar == "Peace") then
		sActiveOrInactive = "[COLOR_NEGATIVE_TEXT]Inactive[ENDCOLOR]"
	end	

	local titleText = Locale.ConvertTextKey("TXT_KEY_DMS_EVENT_DMS_YERIMA_OR_KAYGHAMMA_CITY_VIEW", sYerimaOrKayghamma)
	local helpText = Locale.ConvertTextKey("TXT_KEY_DMS_EVENT_DMS_YERIMA_OR_KAYGHAMMA_CITY_VIEW_HELP", sYerimaOrKayghamma, sIconAndBonus, sPeaceOrWar, sInPeaceOrWar, sActiveOrInactive)
	
	g_DMSYerimaOrKayghammaTipControls.Heading:SetText(titleText)
	g_DMSYerimaOrKayghammaTipControls.Body:SetText(helpText)
	g_DMSYerimaOrKayghammaTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_DMSYerimaOrKayghamma()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_DMSYerimaOrKayghamma)

function SerialEventCityDirty_DMSYerimaOrKayghamma()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_DMSYerimaOrKayghamma)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_DMSYerimaOrKayghamma)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_DMSYerimaOrKayghamma()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_DMSYerimaOrKayghamma)
--=======================================================================================================================
--=======================================================================================================================
