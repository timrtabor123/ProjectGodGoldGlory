include("FLuaVector.lua")

--Log Spamming Mode 
local bVerboseMode = false
if bVerboseMode then print("Ding Dong! Dang! It's Deng!") end

local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_PLAYERS"]
--Useful Things
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--HasTrait
function HasTrait(player, traitID)
	if (not player:IsMinorCiv()) and (not player:IsBarbarian()) then
		if (not traitID) then
			print(player:GetName(), debug.traceback())
		end
		if Player.HasTrait then 
			return player:HasTrait(traitID)
		else
			local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
			local traitType  = GameInfo.Traits[traitID].Type
			for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
				return true
			end
		end
		return false
	end
end

local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

--Definitions
local civDengID = GameInfoTypes["CIVILIZATION_RELIC_DENG_CHINA"]
local traitDengID = GameInfoTypes["TRAIT_RELIC_DENG_CHINA"]

local buildingSEZ = GameInfoTypes["BUILDING_RELIC_DENG_SEZ"]
local buildingSEZProdDummy = GameInfoTypes["BUILDING_RELIC_DENG_CHINA_SEZ_PROD"]

local unitT59ID = GameInfoTypes["UNIT_RELIC_T59"]

local tAllPolicies = DB.Query("SELECT ID FROM Policies")

--Balancing Variables
local goldenAgePointPerPolicy = 1
local cultureTurnsPerFriendPolicy = 3
local unitCombatBonus = 3

--Helper function to get a table of all major civs that a player is trading with
local function RelicGetAllTradePartners(pPlayer)
	local tTradePartners = {}
	for _, route in ipairs(pPlayer:GetTradeRoutes()) do
		if not tTradePartners[route.ToID] then
			if bVerboseMode then print("Found new trade partner") end
			if not Players[route.ToID]:IsMinorCiv() then
				if bVerboseMode then print("Major Civ") end
				tTradePartners[route.ToID] = true
			end
		end
	end
	return tTradePartners
end

--JFD's Spirit Ideology support
local function JFD_Ideology(pPlayer) 
	local ideologyID = -1
	if Player.GetIdeology then
		ideologyID = pPlayer:GetIdeology()
	else
		ideologyID = pPlayer:GetLateGamePolicyTree()
	end
	return ideologyID
end

--Helper function to get all policies adopted by a player
local function RelicGetPlayerPolicyIDs(pPlayer)
	local tPoliciesAdopted = {}
	local numPolicies = 0
	for row in tAllPolicies do
		if pPlayer:HasPolicy(row.ID) then
			tPoliciesAdopted[row.ID] = true
			numPolicies = numPolicies + 1
		end
	end
	if bVerboseMode then 
		print("Finished checking policies") 
		print(numPolicies)
	end
	for policy, _ in pairs(tPoliciesAdopted) do 
		if bVerboseMode then 
			print(policy)
		end
	end
	return tPoliciesAdopted
end
local function RelicTestHelpers(iPlayerID)
	local pPlayer = Players[iPlayerID]
	if bVerboseMode then print("Got player") end
	if not pPlayer:IsAlive() then return end
	print(iPlayerID)
	RelicGetPlayerPolicyIDs(pPlayer)
	RelicGetAllTradePartners(pPlayer)
end

if bVerboseMode then 
--	GameEvents.PlayerDoTurn.Add(RelicTestHelpers)
end
--UA: Gain Golden Age points for each policy you have that is different from your trade partners
local function RelicDoTurnGAP(iPlayerID)
	if bVerboseMode then print("Starting Deng UA Function, DoTurn Event: "..iPlayerID) end
	local pPlayer = Players[iPlayerID]
	if bVerboseMode then print("Got player") end
	if not pPlayer:IsAlive() then return end
	if not HasTrait(pPlayer, traitDengID) then return end
	if bVerboseMode then print("Trait Check Passed") end
	local numGAPToAdd = 0
	tPlayerPolicyIDs = RelicGetPlayerPolicyIDs(pPlayer)
	tPlayerTradePartners = RelicGetAllTradePartners(pPlayer)

	for id, _ in pairs(tPlayerTradePartners) do
		if bVerboseMode then print(id) end
		pPartner = Players[id]
		if pPartner:IsAlive() then
			tPartnerPolicyIDs = RelicGetPlayerPolicyIDs(pPartner)
			for policy, _ in pairs(tPartnerPolicyIDs) do
				if not tPlayerPolicyIDs[policy] then
					if bVerboseMode then print("Found distinct policy"..policy) end
					numGAPToAdd = numGAPToAdd + goldenAgePointPerPolicy
				end
			end
		end
	end
	if bVerboseMode then print(numGAPToAdd) end
	pPlayer:ChangeGoldenAgeProgressMeter(numGAPToAdd)
end
GameEvents.PlayerDoTurn.Add(RelicDoTurnGAP)

--UA Part 2: Gain X turns worth of culture when a friend adopts a social policy that you don't have
local function RelicOnAdoptPolicy(iPlayerAdopted, iPolicyID) 
	if bVerboseMode then print("Starting Deng UA Function, Social Policy Event: "..iPlayerID) end
	local pPlayerAdopted = Players[iPlayerAdopted]
	if not pPlayerAdopted:IsAlive() then return end
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
        if otherPlayer:IsAlive() and HasTrait(otherPlayer, traitDengID) then
			if bVerboseMode then print("Found Deng") end
			if pPlayerAdopted:IsDoF(otherPlayerID) or otherPlayer:IsDoF(iPlayerAdopted) then
				if bVerboseMode then print("Friendly Deng") end
				otherPlayer:ChangeJONSCulture(cultureTurnsPerFriendPolicy * otherPlayer:GetTotalJONSCulturePerTurn())
			end
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(RelicOnAdoptPolicy)

--UU: Plus combat strength for each trade partner with a different ideology
local function RelicUUDoTurn(iPlayerID)
	if bVerboseMode then print("Starting Deng UU Function, DoTurn Event: "..iPlayerID) end
	local pPlayer = Players[iPlayerID]
	if bVerboseMode then print("Got player") end
	if not pPlayer:IsAlive() then return end
	tTradePartners = RelicGetAllTradePartners(pPlayer)
	iPlayerIdeology = JFD_Ideology(pPlayer)
	if iPlayerIdeology == -1 then return end
	if bVerboseMode then print(iPlayerIdeology) end
	local combatBonus = 0
	for id, _ in pairs(tTradePartners) do
		pPartner = Players[id]
		if pPartner:IsAlive() then
			iPartnerIdeology = JFD_Ideology(pPartner)
			if bVerboseMode then print("Partner Ideology: "..iPartnerIdeology) end
			if iPartnerIdeology ~= iPlayerIdeology and iPartnerIdeology ~= -1 then 
				combatBonus = combatBonus + unitCombatBonus
			end
		end
	end
	if bVerboseMode then print(combatBonus) end
	for unit in pPlayer:Units() do
		if unit:GetUnitType() == unitT59ID then 
			if bVerboseMode then print("Found T-59") end
			unit:SetBaseCombatStrength(unit:GetBaseCombatStrength() + combatBonus)
		end
	end
end

GameEvents.PlayerDoTurn.Add(RelicUUDoTurn)

--UB: Every resource gains one production when in a golden age
local function RelicDoTurnGoldenAge(iPlayer)
	if bVerboseMode then print("Starting Deng UB Function, DoTurn Event: "..iPlayer) end
	local pPlayer = Players[iPlayer]
	if bVerboseMode then print("Got player") end
	if not pPlayer:IsAlive() then return end
	local isGoldenAge = pPlayer:IsGoldenAge()
	if bVerboseMode then print(isGoldenAge) end
	for pCity in pPlayer:Cities() do
		if pCity:GetNumBuilding(buildingSEZ) then
			if isGoldenAge then
				pCity:SetNumRealBuilding(buildingSEZProdDummy, 1)
			else
				pCity:SetNumRealBuilding(buildingSEZProdDummy, 0)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(RelicDoTurnGoldenAge)

local function RelicUUOnCityFinished(iPlayer, iCity, iUnit)
	if bVerboseMode then print("Starting Deng UU Function, City Finished Unit Event: "..iPlayer) end
	if bVerboseMode then print("Starting Deng UU Function, City Finished Unit Event: Unit ID is "..iUnit) end
	local pPlayer = Players[iPlayer]
	if bVerboseMode then print("Got player") end
	if not pPlayer:IsAlive() then return end
	if bVerboseMode then print(unitT59ID) end
	if pPlayer:GetUnitByID(iUnit):GetUnitType() ~= unitT59ID then return end
	if bVerboseMode then print("Trained a T-59") end
	local isAtWar = false
	if bVerboseMode then print(pPlayer:GetTeam()) end
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
        if otherPlayer:IsAlive()  then
			if Teams[pPlayer:GetTeam()]:IsAtWar(otherPlayer:GetTeam()) then
				if bVerboseMode then print("At war") end
				isAtWar = true
			end
		end
	end
	if not isAtWar then return end
	if bVerboseMode then print("At war") end
	if pPlayer:IsMinorCiv() then return end
	--Loop through all players to get allied city states
	local numAllies = 0
	local tAllies = {}
	for otherPlayerID = 0, defineMaxPlayers - 1 do
		local pOtherPlayer = Players[otherPlayerID]
		if pOtherPlayer:IsMinorCiv() then
			if pOtherPlayer:IsAlive() then
				if bVerboseMode then print("Checking CS "..otherPlayerID) end
				if bVerboseMode then print(pOtherPlayer:GetMinorCivFriendshipLevelWithMajor(iPlayer)) end
				if pOtherPlayer:GetMinorCivFriendshipLevelWithMajor(iPlayer) == 2 then
					numAllies = numAllies + 1
					tAllies[numAllies] = otherPlayerID
				end
			end
		end
	end
	if numAllies == 0 then return end
	if bVerboseMode then print(numAllies) end
	local rand = JFD_GetRandom(1, numAllies)
	local iAlly = tAllies[rand]
	pOtherPlayer = Players[iAlly]
	pCSCapital = pOtherPlayer:GetCapitalCity()
	pOtherPlayer:InitUnit(unitT59ID, pCSCapital:GetX(), pCSCapital:GetY())
end
GameEvents.CityTrained.Add(RelicUUOnCityFinished)