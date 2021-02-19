-- I hate doing these pls send help
--------------------------------------------------------------

local civilisationID = GameInfoTypes["CIVILIZATION_TCM_ILKHANATE"]
local mathCeil 		 = math.ceil

local ilkhanidunit1		= GameInfoTypes["UNIT_MODERN_ARMOR"]
local ilkhanidunit2		= GameInfoTypes["UNIT_TANK"]
local ilkhanidunit3		= GameInfoTypes["UNIT_WWI_TANK"]
local ilkhanidunit4		= GameInfoTypes["UNIT_CAVALRY"]
local ilkhanidunit5		= GameInfoTypes["UNIT_LANCER"]
local ilkhanidunit6		= GameInfoTypes["UNIT_TCM_ILDUCHI"]
local ilkhanidunit7		= GameInfoTypes["UNIT_HORSEMAN"]
local ilkhanidunit8		= GameInfoTypes["UNIT_WARRIOR"]

local ilkhanidunitList = {
	ilkhanidunit1,
	ilkhanidunit2,
	ilkhanidunit3,
	ilkhanidunit4,
	ilkhanidunit5,
	ilkhanidunit6,
	ilkhanidunit7,
	ilkhanidunit8
	}

--Decision #1
local Decisions_IlkhanatePoliticalConversion = {}
	Decisions_IlkhanatePoliticalConversion.Name = "TXT_KEY_DECISIONS_TCM_ILKHANATE_POLITICAL_CONVERSION_1"
	Decisions_IlkhanatePoliticalConversion.Desc = "TXT_KEY_DECISIONS_TCM_ILKHANATE_POLITICAL_CONVERSION_DESC_1"
	HookDecisionCivilizationIcon(Decisions_IlkhanatePoliticalConversion, "CIVILIZATION_TCM_ILKHANATE")
	Decisions_IlkhanatePoliticalConversion.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_IlkhanatePoliticalConversion") == true then
			Decisions_IlkhanatePoliticalConversion.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ILKHANATE_POLITICAL_CONVERSION_ENACTED")
			return false, false, true
		end
		
		local faithCost = mathCeil(300 * iMod)
		Decisions_IlkhanatePoliticalConversion.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ILKHANATE_POLITICAL_CONVERSION_DESC_1", faithCost)

		local capital = player:GetCapitalCity()
		local capitalReligion = capital:GetReligiousMajority()
		local highestFollowerNum = 0
		local oldReligionFollowers = 0
		local biggerReligion = nil
		for religion in GameInfo.Religions() do
			if religion.ID ~= 0 then
				local numFollowers = 0
				for city in player:Cities() do
					if city:GetNumFollowers(religion.ID) > 0 then
						if religion.ID ~= capitalReligion then
							numFollowers = numFollowers + city:GetNumFollowers(religion.ID)
						else
							oldReligionFollowers = oldReligionFollowers + city:GetNumFollowers(religion.ID)
						end
					end
				end
				if numFollowers > highestFollowerNum then
					highestFollowerNum = numFollowers
					biggerReligion = religion.ID
				end
			end
		end

		if biggerReligion == nil then return true, false end

		local religionName = GameInfo.Religions[biggerReligion].Description
		Decisions_IlkhanatePoliticalConversion.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ILKHANATE_POLITICAL_CONVERSION_2", religionName)
		Decisions_IlkhanatePoliticalConversion.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ILKHANATE_POLITICAL_CONVERSION_DESC_2", religionName,faithCost)
		if player:GetFaith() < faithCost then return true, false end

		save(player, "Decisions_IlkhanatePoliticalConversion_biggerReligion", biggerReligion)
		save(player, "Decisions_IlkhanatePoliticalConversion_oldReligionFollowers", oldReligionFollowers)
		save(player, "Decisions_IlkhanatePoliticalConversion_highestFollowerNum", highestFollowerNum)

		return true, true
	end
	)
	
	Decisions_IlkhanatePoliticalConversion.DoFunc = (
	function(player)
		local biggerReligion = load(player, "Decisions_IlkhanatePoliticalConversion_biggerReligion")
		local oldReligionFollowers = load(player, "Decisions_IlkhanatePoliticalConversion_oldReligionFollowers")
		local highestFollowerNum = load(player, "Decisions_IlkhanatePoliticalConversion_highestFollowerNum")

		local faithCost = mathCeil(300 * iMod)
		player:ChangeFaith(-faithCost)

		local faithGain = highestFollowerNum * 10
		local faithLoss = oldReligionFollowers * 10

		player:ChangeFaith(-faithLoss)
		player:ChangeFaith(-faithGain)

		local capital = player:GetCapitalCity()
		capital:ConvertPercentFollowers(biggerReligion, -1, 100)

		local militaryUnit
		for _, unitID in ipairs(ilkhanidunitList) do
			if player:CanTrain(unitID) then
				militaryUnit = unitID
				break
			end
		end

		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		player:InitUnit(militaryUnit, capitalX, capitalY):JumpToNearestValidPlot()
		player:InitUnit(militaryUnit, capitalX, capitalY):JumpToNearestValidPlot()
		player:InitUnit(militaryUnit, capitalX, capitalY):JumpToNearestValidPlot()

		save(player, "Decisions_IlkhanatePoliticalConversion", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_IlkhanatePoliticalConversion", Decisions_IlkhanatePoliticalConversion)

--Decision #2
local Decisions_IlkhanateBuildCapital = {}
	Decisions_IlkhanateBuildCapital.Name = "TXT_KEY_DECISIONS_TCM_ILKHANATE_BUILD_CAPITAL"
	Decisions_IlkhanateBuildCapital.Desc = "TXT_KEY_DECISIONS_TCM_ILKHANATE_BUILD_CAPITAL_DESC"
	HookDecisionCivilizationIcon(Decisions_IlkhanateBuildCapital, "CIVILIZATION_TCM_ILKHANATE")
	Decisions_IlkhanateBuildCapital.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_IlkhanateBuildCapital") == true then
			Decisions_IlkhanateBuildCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ILKHANATE_BUILD_CAPITAL_ENACTED")
			return false, false, true
		end
		
		local goldCost = mathCeil(500 * iMod)
		Decisions_IlkhanateBuildCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ILKHANATE_BUILD_CAPITAL_DESC", goldCost)

		if player:GetGold() < goldCost then return true, false end
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if player:GetGoldenAgeTurns() < 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_IlkhanateBuildCapital.DoFunc = (
	function(player)
		for city in player:Cities() do
			if city:IsOriginalCapital() then
				player:ChangeJONSCulture(150)
			end
		end

		local goldCost = mathCeil(500 * iMod)
		player:ChangeGold(-goldCost)

		player:ChangeNumResourceTotal(iMagistrate, -1)
					
		local capital = player:GetCapitalCity()
		capital:SetName("Soltaniyeh")

		save(player, "Decisions_IlkhanateBuildCapital", true)
	end
	)
	Decisions_AddCivilisationSpecific(civilisationID, "Decisions_IlkhanateBuildCapital", Decisions_IlkhanateBuildCapital)