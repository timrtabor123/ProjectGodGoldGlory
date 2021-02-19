-- DMS_MC_KanemBornu_Decisions
-- Author: DMS
--=======================================================================================================================--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
print("DMS's The Kanem-Bornu Empire's Decisions: loaded")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local bPrintForDebug = DMS_GetUserSetting("DMS_KANEM_BORNU_DEBUGGING_ON") == 1

function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- GetNearestCity (adapted from Sukritact's Sami civ)
------------------------------------------------------------------------------------------------------------------------
function GetNearestCity(pPlayer, plotX, plotY)
	local iDistance = nil
	local pTargetCity = nil
	for pCity in pPlayer:Cities() do
		if not(iDistance) or iDistance > Map.PlotDistance(plotX, plotY, pCity:GetX(), pCity:GetY()) then
			pTargetCity = pCity
			iDistance = Map.PlotDistance(plotX, plotY, pCity:GetX(), pCity:GetY())
		end
	end
	return(pTargetCity)
end
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationKanemBornuID				= GameInfoTypes["CIVILIZATION_DMS_MC_KANEM_BORNU"]
local eraClassicalID						= GameInfoTypes["ERA_CLASSICAL"]
local eraMedievalID							= GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID						= GameInfoTypes["ERA_RENAISSANCE"]
local eraIndustrialID						= GameInfoTypes["ERA_INDUSTRIAL"]
local buildingWasiliramID					= GameInfoTypes["BUILDING_DMS_MC_WASILIRAM"]
local unitAskawrID							= GameInfoTypes["UNIT_DMS_MC_ASKAWR"]
local policyAppointZannaArjinamaID			= GameInfoTypes["POLICY_DMS_APPOINT_ZANNA_ARJINAMA"]
local buildingSupportTheMalamti_1ID			= GameInfoTypes["BUILDING_DMS_SUPPORT_THE_MALAMTI_1"]
local buildingSupportTheMalamti_2ID			= GameInfoTypes["BUILDING_DMS_SUPPORT_THE_MALAMTI_2"]
local buildingSupportTheMalamti_3ID			= GameInfoTypes["BUILDING_DMS_SUPPORT_THE_MALAMTI_3"]
-------------------------------------------------------------------------------------------------------------------------
-- Kanem-Bornu: Appoint Zanna Arjinama
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AppointZannaArjinama = {}
	Decisions_AppointZannaArjinama.Name = "TXT_KEY_DECISIONS_DMS_APPOINT_ZANNA_ARJINAMA"
	Decisions_AppointZannaArjinama.Desc = "TXT_KEY_DECISIONS_DMS_APPOINT_ZANNA_ARJINAMA_DESC"
	HookDecisionCivilizationIcon(Decisions_AppointZannaArjinama, civilisationKanemBornuID)
	Decisions_AppointZannaArjinama.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationKanemBornuID) then return false, false end
		if load(pPlayer, "Decisions_AppointZannaArjinama") == true then
			Decisions_AppointZannaArjinama.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_APPOINT_ZANNA_ARJINAMA_ENACTED_DESC")
			return false, false, true 
		end
			
		local iCultureCost = math.ceil(200 * iMod)
		Decisions_AppointZannaArjinama.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_APPOINT_ZANNA_ARJINAMA_DESC", iCultureCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1)	then return true, false end
		if (pPlayer:GetJONSCulture() < iCultureCost)					then return true, false end

		local bWasiliramInAllCities = false
		local iWasiliramInCities = 0
		for pCity in pPlayer:Cities() do
			if pCity and pCity:IsHasBuilding(buildingWasiliramID) then
				bWasiliramInAllCities = true
				iWasiliramInCities = iWasiliramInCities + 1
			else
				bWasiliramInAllCities = false
			end
		end
		
		if iWasiliramInCities < 3										then return true, false end

		return true, true
	end
	)
	
	Decisions_AppointZannaArjinama.DoFunc = (
	function(pPlayer)
		local iCultureCost = math.ceil(200 * iMod)
		pPlayer:ChangeJONSCulture(-iCultureCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(policyAppointZannaArjinamaID, true)

		save(pPlayer, "Decisions_AppointZannaArjinama", true)
	end
	)

Decisions_AddCivilisationSpecific(civilisationKanemBornuID, "Decisions_AppointZannaArjinama", Decisions_AppointZannaArjinama)
-------------------------------------------------------------------------------------------------------------------------
-- Kanem-Bornu: Support the Malamti
-------------------------------------------------------------------------------------------------------------------------
local Decisions_SupportTheMalamti = {}
	Decisions_SupportTheMalamti.Name = "TXT_KEY_DECISIONS_DMS_SUPPORT_THE_MALAMTI"
	Decisions_SupportTheMalamti.Desc = "TXT_KEY_DECISIONS_DMS_SUPPORT_THE_MALAMTI_DESC"
	Decisions_SupportTheMalamti.Data1 = {}
	HookDecisionCivilizationIcon(Decisions_SupportTheMalamti, civilisationKanemBornuID)
	Decisions_SupportTheMalamti.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationKanemBornuID) then return false, false end
		if load(pPlayer, "Decisions_SupportTheMalamti") == true then
			Decisions_SupportTheMalamti.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_SUPPORT_THE_MALAMTI_ENACTED_DESC")
			return false, false, true 
		end
		
		local iGoldCost = math.ceil(250 * iMod)
		Decisions_SupportTheMalamti.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_SUPPORT_THE_MALAMTI_DESC", iGoldCost)
		
		if (pPlayer:GetCurrentEra() >= eraIndustrialID)					then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2)	then return true, false end
		if (pPlayer:GetGold() < iGoldCost) 								then return true, false end
		if (pPlayer:GetCapitalCity():GetReligiousMajority() == -1)		then return true, false end
		
		return true, true
	end
	)
	
	Decisions_SupportTheMalamti.DoFunc = (
	function(pPlayer)
		DMS_Print("Decisions_SupportTheMalamti enacted..")
		local iPlayer = pPlayer:GetID()
		local iGoldCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iGoldCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		DMS_Print("Decisions_SupportTheMalamti: iterate Cities..")
		for pCity in pPlayer:Cities() do
			if pCity then
				DMS_Print("Decisions_SupportTheMalamti: processing for " .. pCity:GetName() .. "..")
				local iNumImprovement_1 = 0
				local iNumImprovement_2 = 0
				local iNumImprovement_3 = 0
				local pCityPlot = pCity:Plot()
				DMS_Print("Decisions_SupportTheMalamti: iterate through radii i = 1, 3..")
				for i = 1, 3 do
					DMS_Print("Decisions_SupportTheMalamti: i = " .. i .. " iterate through plots..")
					for pPlot in PlotRingIterator(pCityPlot, i, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
						if pPlot then
							DMS_Print("Decisions_SupportTheMalamti: processing for plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")..")
							if pPlot:GetOwner() == iPlayer then
								DMS_Print("Decisions_SupportTheMalamti: plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ") is owned by the player..")
								if pPlot:GetWorkingCity() == pCity then
									DMS_Print("Decisions_SupportTheMalamti: improvement is worked by " .. pCity:GetName() .. "..")
									local iImprovement = pPlot:GetImprovementType()
									if iImprovement ~= -1 then
										DMS_Print("Decisions_SupportTheMalamti: improvement found, accessing improvement table of info..")
										local tImprovementInfo = GameInfo.Improvements[iImprovement]
										if tImprovementInfo.CreatedByGreatPerson then
											DMS_Print("Decisions_SupportTheMalamti: improvement created by great person..")
											if i == 1 then
												DMS_Print("Decisions_SupportTheMalamti: improvement is one tile from the nearest city..")
												iNumImprovement_1 = iNumImprovement_1 + 1
												DMS_Print("Decisions_SupportTheMalamti: iNumImprovement_1 = " .. iNumImprovement_1 .. "..")
											elseif i == 2 then
												DMS_Print("Decisions_SupportTheMalamti: improvement is two tiles from the nearest city..")
												iNumImprovement_2 = iNumImprovement_2 + 1
												DMS_Print("Decisions_SupportTheMalamti: iNumImprovement_2 = " .. iNumImprovement_2 .. "..")
											elseif i == 3 then
												DMS_Print("Decisions_SupportTheMalamti: improvement is three tiles from the nearest city..")
												iNumImprovement_3 = iNumImprovement_3 + 1
												DMS_Print("Decisions_SupportTheMalamti: iNumImprovement_3 = " .. iNumImprovement_3 .. "..")
											end
										else
											DMS_Print("Decisions_SupportTheMalamti: improvement not created by great person - do nothing..")
										end
									else
										DMS_Print("Decisions_SupportTheMalamti: no improvement on plot - do nothing..")
									end
								else
									DMS_Print("Decisions_SupportTheMalamti: improvement is worked by another city (" .. pPlot:GetWorkingCity():GetName() .. ") - do nothing..")
								end
							else
								DMS_Print("Decisions_SupportTheMalamti: plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ") is not owned by the player - do nothing..")
							end
						else
							DMS_Print("Decisions_SupportTheMalamti: Plot nil check failed - do nothing..")
						end
					end
				end

				if iNumImprovement_1 > 0 or iNumImprovement_2 > 0 or iNumImprovement_3 > 0 then
					pCity:SetNumRealBuilding(buildingSupportTheMalamti_1ID, iNumImprovement_1) 
					pCity:SetNumRealBuilding(buildingSupportTheMalamti_2ID, iNumImprovement_2) 
					pCity:SetNumRealBuilding(buildingSupportTheMalamti_3ID, iNumImprovement_3)
					DMS_Print("Decisions_SupportTheMalamti: In " .. pCity:GetName() .. ", added " .. iNumImprovement_1 .. " buildingSupportTheMalamti_1ID dummy buildings..")
					DMS_Print("Decisions_SupportTheMalamti: In " .. pCity:GetName() .. ", added " .. iNumImprovement_2 .. " buildingSupportTheMalamti_2ID dummy buildings..")
					DMS_Print("Decisions_SupportTheMalamti: In " .. pCity:GetName() .. ", added " .. iNumImprovement_3 .. " buildingSupportTheMalamti_3ID dummy buildings..")
				else
					DMS_Print("Decisions_SupportTheMalamti: no great tile improvements found for " .. pCity:GetName() .. " - do nothing..")
				end

			else
				DMS_Print("Decisions_SupportTheMalamti: City nil check failed - do nothing..")
			end
		end


		save(pPlayer, "Decisions_SupportTheMalamti", true)
	end
	)

	Decisions_SupportTheMalamti_BuildFinished_iPlayer = 0
	Decisions_SupportTheMalamti_BuildFinished_iX = 0
	Decisions_SupportTheMalamti_BuildFinished_iY = 0
	Decisions_SupportTheMalamti_BuildFinished_iImprovement = 0

	Decisions_SupportTheMalamti.Monitors = {}
	Decisions_SupportTheMalamti.Monitors[GameEvents.BuildFinished] = (
	function(iPlayer, iX, iY, iImprovement)
		-- Don't continue if this is a duplicate call
		DMS_Print("Decisions_SupportTheMalamti: Don't continue if this is a duplicate call")
		if (Decisions_SupportTheMalamti_BuildFinished_iPlayer == iPlayer and Decisions_SupportTheMalamti_BuildFinished_iX == iX and Decisions_SupportTheMalamti_BuildFinished_iY == iY and Decisions_SupportTheMalamti_BuildFinished_iImprovement == iImprovement) then
			return
		end
		-- Store inputs for duplication check
		print("CorsicaCitadelTourism: Store inputs for duplication check")
		Decisions_SupportTheMalamti_BuildFinished_iPlayer		= iPlayer;			DMS_Print("Decisions_SupportTheMalamti: Decisions_SupportTheMalamti_BuildFinished_iPlayer = " .. iPlayer .. ".")
		Decisions_SupportTheMalamti_BuildFinished_iX			= iX;				DMS_Print("Decisions_SupportTheMalamti: Decisions_SupportTheMalamti_BuildFinished_iX = " .. iX .. ".")
		Decisions_SupportTheMalamti_BuildFinished_iY			= iY;				DMS_Print("Decisions_SupportTheMalamti: Decisions_SupportTheMalamti_BuildFinished_iY = " .. iY .. ".")
		Decisions_SupportTheMalamti_BuildFinished_iImprovement	= iImprovement;		DMS_Print("Decisions_SupportTheMalamti: Decisions_SupportTheMalamti_BuildFinished_iImprovement = " .. iImprovement .. ".")

		local pPlayer = Players[iPlayer]
		if (pPlayer and pPlayer:GetCivilizationType() == civilisationKanemBornuID) then
			if load(pPlayer, "Decisions_SupportTheMalamti") == true then
				DMS_Print("Decisions_SupportTheMalamti initializing for BuildFinished Event at plot (" .. iX .. "," .. iY .. ")..")
				local pPlot = Map.GetPlot(iX, iY)
				if pPlot:GetOwner() == iPlayer then
					DMS_Print("Decisions_SupportTheMalamti plot is owned by the player ..")
					local tImprovementInfo = GameInfo.Improvements[iImprovement]
					DMS_Print("Decisions_SupportTheMalamti: accessing improvement table of info..")
					if tImprovementInfo.CreatedByGreatPerson then
						DMS_Print("Decisions_SupportTheMalamti: improvement created by great person..")
						local pCity = pPlot:GetWorkingCity()
						if (not pCity) then
							pCity = GetNearestCity(pPlayer, iX, iY)
						end
						DMS_Print("Decisions_SupportTheMalamti: nearest (or working) city is " .. pCity:GetName() .. "..")
						local iPlotDistance = Map.PlotDistance(iX, iY, pCity:GetX(), pCity:GetY())
						DMS_Print("Decisions_SupportTheMalamti: distance from plot (" .. iX .. "," .. iY .. ") to " .. pCity:GetName() .. " is " .. iPlotDistance .. "..")
						if iPlotDistance == 1 then 
							local iNumbuildingSupportTheMalamti_1 = pCity:GetNumRealBuilding(buildingSupportTheMalamti_1ID)
							DMS_Print("Decisions_SupportTheMalamti: " .. pCity:GetName() .. " already has " .. iNumbuildingSupportTheMalamti_1 .. " buildingSupportTheMalamti_1ID buildings..")
							pCity:SetNumRealBuilding(buildingSupportTheMalamti_1ID, iNumbuildingSupportTheMalamti_1 + 1)
							DMS_Print("Decisions_SupportTheMalamti: " .. pCity:GetName() .. " now has " .. iNumbuildingSupportTheMalamti_1 .. " buildingSupportTheMalamti_1ID buildings..")
						elseif iPlotDistance == 2 then
							local iNumbuildingSupportTheMalamti_2 = pCity:GetNumRealBuilding(buildingSupportTheMalamti_2ID)
							DMS_Print("Decisions_SupportTheMalamti: " .. pCity:GetName() .. " already has " .. iNumbuildingSupportTheMalamti_2 .. " buildingSupportTheMalamti_2ID buildings..")
							pCity:SetNumRealBuilding(buildingSupportTheMalamti_2ID, iNumbuildingSupportTheMalamti_2 + 1)
							DMS_Print("Decisions_SupportTheMalamti: " .. pCity:GetName() .. " now has " .. iNumbuildingSupportTheMalamti_2 .. " buildingSupportTheMalamti_2ID buildings..")
						elseif iPlotDistance == 3 then
							local iNumbuildingSupportTheMalamti_3 = pCity:GetNumRealBuilding(buildingSupportTheMalamti_3ID)
							DMS_Print("Decisions_SupportTheMalamti: " .. pCity:GetName() .. " already has " .. iNumbuildingSupportTheMalamti_3 .. " buildingSupportTheMalamti_3ID buildings..")
							pCity:SetNumRealBuilding(buildingSupportTheMalamti_3ID, iNumbuildingSupportTheMalamti_3 + 1)
							DMS_Print("Decisions_SupportTheMalamti: " .. pCity:GetName() .. " now has " .. iNumbuildingSupportTheMalamti_3 .. " buildingSupportTheMalamti_3ID buildings..")
						end
					end
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationKanemBornuID, "Decisions_SupportTheMalamti", Decisions_SupportTheMalamti)
--=======================================================================================================================
--=======================================================================================================================