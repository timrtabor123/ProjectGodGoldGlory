-- Mayor S
-- Comanche Decisions
-------------------------------------------------------------------------------------------------------------------------
-- Horse Migration
-------------------------------------------------------------------------------------------------------------------------
local Decisions_HorseMigration = {}
	Decisions_HorseMigration.Name = "TXT_KEY_DECISIONS_HORSEMIGRATION"
	Decisions_HorseMigration.Desc = "TXT_KEY_DECISIONS_HORSEMIGRATION_DESC"
	HookDecisionCivilizationIcon(Decisions_HorseMigration, "CIVILIZATION_S_COMANCHE")
	Decisions_HorseMigration.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_S_COMANCHE) then
			return false, false
		end
		if load(pPlayer, "Decisions_HorseMigration") == true then
			Decisions_HorseMigration.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HORSEMIGRATION_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_HorseMigration.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HORSEMIGRATION_DESC", iCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
	end)

	Decisions_HorseMigration.DoFunc = (
	function(pPlayer)
	local iCost = math.ceil(500) * iMod
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_HORSE4, 1)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_SETTLER, 1)
		save(pPlayer, "Decisions_HorseMigration", true)
	end)

	Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_S_COMANCHE, "Decisions_HorseMigration", Decisions_HorseMigration)
-------------------------------------------------------------------------------------------------------------------------
-- Full Moon Raid
-------------------------------------------------------------------------------------------------------------------------
local Decisions_MoonRaid = {}
	Decisions_MoonRaid.Name = "TXT_KEY_DECISIONS_MOONRAID"
	Decisions_MoonRaid.Desc = "TXT_KEY_DECISIONS_MOONRAID_DESC"
	Decisions_MoonRaid.Data1 = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MOUNTED'") do
		Decisions_MoonRaid.Data1[row.Type] = row.Combat
	end
	HookDecisionCivilizationIcon(Decisions_MoonRaid, "CIVILIZATION_S_COMANCHE")
	Decisions_MoonRaid.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_S_COMANCHE) then
			return false, false
		end
		local iEra = load(pPlayer, "Decisions_MoonRaid")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_MoonRaid", nil)
			else
				Decisions_MoonRaid.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MOONRAID_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_HorseMigration.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MOONRAID_DESC", iCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
	end)

	Decisions_MoonRaid.DoFunc = (
	function(pPlayer, tUnitTypes, iUnitType)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local horseMen = InitUnitFromCity(pPlayer:GetCapitalCity(), iUnitType, 3)
		horseMen:SetHasPromotion(GameInfoTypes.PROMOTION_COMANCHEMOONMOVE, true)
		save(pPlayer, "Decisions_MoonRaid", pPlayer:GetCurrentEra())
	end
	)
	Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_S_COMANCHE, "Decisions_MoonRaid", Decisions_MoonRaid)