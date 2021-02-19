--=======================================================================================================================
print("Pala Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

function JFD_IsUsingEE()
	local iEEID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == iEEID) then
			return true
		end
	end
	return false
end
local isUsingEE = JFD_IsUsingEE()

function JFD_IsEDActive()
	local cPDLLID = "1f941088-b185-4159-865c-472df81247b2"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local bIsEDActive = JFD_IsEDActive()

--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do
    g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
    return g_JFD_GlobalUserSettings_Table[type]
end
local g_GetUserSetting = Game_GetUserSetting

local userSettingCIDHealthCore = (g_GetUserSetting("JFD_CID_HEALTH_CORE") == 1)
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID  = GameInfoTypes.CIVILIZATION_THP_PALA
local mathCeil = math.ceil

-------------------------------------------------------------------------------------------------------------------------
-- Pala: Revive Defunct Universities
-------------------------------------------------------------------------------------------------------------------------

local pRevivalPolicy = GameInfoTypes.POLICY_DECISIONS_THP_PALA_REVIVAL
local tEducation = GameInfoTypes.TECH_EDUCATION
local pAcademy = GameInfoTypes.IMPROVEMENT_ACADEMY

local Decisions_THP_Pala_Revival = {}
	Decisions_THP_Pala_Revival.Name = "TXT_KEY_DECISIONS_THP_PALA_REVIVAL"
	Decisions_THP_Pala_Revival.Desc = "TXT_KEY_DECISIONS_THP_PALA_REVIVAL_DESC"
	HookDecisionCivilizationIcon(Decisions_THP_Pala_Revival, "CIVILIZATION_THP_PALA")
	Decisions_THP_Pala_Revival.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
        	if player:HasPolicy(pRevivalPolicy) then
                	Decisions_THP_Pala_Revival.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_PALA_REVIVAL_ENACTED_DESC")
	                return false, false, true
           	end
		local goldCost = mathCeil(300*iMod)
		Decisions_THP_Pala_Revival.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_PALA_REVIVAL_DESC", goldCost)
		if player:GetGold() < goldCost then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(tEducation)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetImprovementCount(pAcademy) < 3 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Pala_Revival.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(300*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
        	player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(pRevivalPolicy, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_PALA_REVIVAL", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
	end
	)
	
local bRevivalTourismDummy = GameInfoTypes.BUILDING_THP_PALA_REVIVAL_DUMMY

function RevivalDoTurn(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	local iNumAcademies = 0
	if pPlayer:GetCivilizationType() == civilizationID then
		if pPlayer:HasPolicy(pRevivalPolicy) then
			for cCity in pPlayer:Cities() do
				iNumAcademies = 0
				for i = 0, cCity:GetNumCityPlots(), 1 do
					local pPlot = cCity:GetCityIndexPlot(i)
					if pCheckedPlot:GetImprovementType() == pAcademy then
						iNumAcademies = iNumAcademies + 1
					end
				end
				cCity:SetNumRealBuilding(bRevivalTourismDummy, iNumAcademies)
			end
		end
	end
end

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Pala_Revival", Decisions_THP_Pala_Revival)

if bIsEDActive then
	GameEvents.PlayerDoTurn.Add(RevivalDoTurn)
end

-------------------------------------------------------------------------------------------------------------------------
-- Pala: Commission Medical Treatises
-------------------------------------------------------------------------------------------------------------------------
local bAmphitheater = GameInfoTypes.BUILDING_AMPHITHEATER
local bNationalEpic = GameInfoTypes.BUILDING_NATIONAL_EPIC
local bHeroicEpic = GameInfoTypes.BUILDING_HEROIC_EPIC
local bGreatLib = GameInfoTypes.BUILDING_GREAT_LIBRARY
local bOxford = GameInfoTypes.BUILDING_OXFORD_UNIVERSITY
local bGlobe = GameInfoTypes.BUILDING_GLOBE_THEATER
local bTheater = GameInfoTypes.BUILDING_THEATRE
--
local bcAmphitheater = GameInfoTypes.BUILDINGCLASS_AMPHITHEATER
local bcNationalEpic = GameInfoTypes.BUILDINGCLASS_NATIONAL_EPIC
local bcHeroicEpic = GameInfoTypes.BUILDINGCLASS_HEROIC_EPIC
local bcGreatLib = GameInfoTypes.BUILDINGCLASS_GREAT_LIBRARY
local bcOxford = GameInfoTypes.BUILDINGCLASS_OXFORD_UNIVERSITY
local bcGlobe = GameInfoTypes.BUILDINGCLASS_GLOBE_THEATER
local bcTheater = GameInfoTypes.BUILDINGCLASS_THEATRE

function GetNumGreatWritings(cCity)
	-- i know it's all hardcoded. sry future worlds & whoever else
	local iNumGreatWritings = 0
	if cCity:IsHasBuilding(bAmphitheater) and cCity:GetNumGreatWorksInBuilding(bcAmphitheater) > 0 then
		iNumGreatWritings = iNumGreatWritings + 1
	end
	if cCity:IsHasBuilding(bNationalEpic) and cCity:GetNumGreatWorksInBuilding(bcNationalEpic) > 0 then
		iNumGreatWritings = iNumGreatWritings + 1
	end
	if cCity:IsHasBuilding(bHeroicEpic) and cCity:GetNumGreatWorksInBuilding(bcHeroicEpic) > 0 then
		iNumGreatWritings = iNumGreatWritings + 1
	end
	if cCity:IsHasBuilding(bGreatLib) and cCity:GetNumGreatWorksInBuilding(bcGreatLib) > 0 then
		iNumGreatWritings = iNumGreatWritings + cCity:GetNumGreatWorksInBuilding(bcGreatLib)
	end
	if cCity:IsHasBuilding(bOxford) and cCity:GetNumGreatWorksInBuilding(bcOxford) > 0 then
		iNumGreatWritings = iNumGreatWritings + cCity:GetNumGreatWorksInBuilding(bcOxford)
	end
	if cCity:IsHasBuilding(bGlobe) and cCity:GetNumGreatWorksInBuilding(bcGlobe) > 0 then
		iNumGreatWritings = iNumGreatWritings + cCity:GetNumGreatWorksInBuilding(bcGlobe)
	end
	if isUsingEE then
		if cCity:IsHasBuilding(bTheatre) and cCity:GetNumGreatWorksInBuilding(bcTheatre) > 0 then
			iNumGreatWritings = iNumGreatWritings + 1
		end
	end
	return iNumGreatWritings
end

local bcWritersGuild = GameInfoTypes.BUILDINGCLASS_WRITERS_GUILD
local pMedicineDummyPolicy = GameInfoTypes.POLICY_DECISIONS_THP_MEDICINE_DUMMY

local Decisions_THP_Pala_Medicine = {}
	Decisions_THP_Pala_Medicine.Name = "TXT_KEY_DECISIONS_THP_PALA_MEDICINE"
	if userSettingCIDHealthCore then
		Decisions_THP_Pala_Medicine.Desc = "TXT_KEY_DECISIONS_THP_PALA_MEDICINE_HEALTH_DESC"
	else
		Decisions_THP_Pala_Medicine.Desc = "TXT_KEY_DECISIONS_THP_PALA_MEDICINE_DESC"
	end
	HookDecisionCivilizationIcon(Decisions_THP_Pala_Medicine, "CIVILIZATION_THP_PALA")
	Decisions_THP_Pala_Medicine.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_THP_Pala_Medicine") == true then
			if userSettingCIDHealthCore then
				Decisions_THP_Pala_Medicine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_PALA_MEDICINE_HEALTH_ENACTED_DESC")
			else
				Decisions_THP_Pala_Medicine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_PALA_MEDICINE_ENACTED_DESC")
			end
			return false, false, true
		end
		local cultureCost = mathCeil(100*iMod)
		if userSettingCIDHealthCore then
			Decisions_THP_Pala_Medicine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_PALA_MEDICINE_HEALTH_DESC", cultureCost)
		else
			Decisions_THP_Pala_Medicine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_PALA_MEDICINE_DESC", cultureCost)
		end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetBuildingClassCount(bcWritersGuild) < 1 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Pala_Medicine.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(100*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeJONSCulture(-cultureCost)
        	save(player, "Decisions_THP_Pala_Medicine", true)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(pMedicineDummyPolicy, true)

		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_PALA_MEDICINE", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Pala_Medicine", Decisions_THP_Pala_Medicine)

function MedicineDoTurn(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsEverAlive() then return end
	if pPlayer:GetCivilizationType() == civilizationID then
		if pPlayer:HasPolicy(pMedicineDummyPolicy) then
			for cCity in pPlayer:Cities() do
				local iNumGreatWritings = GetNumGreatWritings(cCity)
				if userSettingCIDHealthCore then
					cCity:ChangePlagueCounter(-iNumGreatWritings)
				else
					cCity:ChangeFood(iNumGreatWritings)
				end
			end
		end
	end
end

if bIsEDActive then
	GameEvents.PlayerDoTurn.Add(MedicineDoTurn)
end

--
--
