
print("Nenets Decisions: Loaded")

local civilisationID = GameInfoTypes["CIVILIZATION_SENSHI_NENETS"]
local iDeer = GameInfoTypes["RESOURCE_DEER"]

include("PlotIterators.lua")

function Sukritact_PlaceResource(plot, resourceID, resourceQuantity)
	local plots = {}
	local count = 1
    for loopPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		plots[count] = loopPlot
		count=count+1
    end
    for iVal = 1, resourceQuantity do
		local isPlaced = false
		while (not(isPlaced)) and #plots > 0 do
			local getRandom = JFD_GetRandom(1, #plots)
			local plot = plots[getRandom]
			if plot then
				if (plot:GetFeatureType() == -1 and plot:GetResourceType() == -1 and plot:GetTerrainType() ~= terrainCoastalID and plot:GetTerrainType() ~= terrainOceanID and (not plot:IsMountain())) then
					local isHills = (resourceID == resourceGoldID)
					if isHills and plot:IsHills() then
						plot:SetResourceType(resourceID, resourceQuantity)
						if improvementType then
							plot:SetImprovementType(GameInfoTypes[improvementType])
						end
					else
						plot:SetResourceType(resourceID, resourceQuantity)
						if improvementType then
							plot:SetImprovementType(GameInfoTypes[improvementType])
						end
					end
					isPlaced = true
				end
			end
			table.remove(plots, getRandom)
		end
	end
end

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--[[
Steal Deer
Must be the Nenets
Must have a trade route with a city-state 
Costs influence with a random city-state you're trading with
Has a chance to declare war on a city-state you're trading with
Receive a Deer resource near one of your cities
Once per era
]]

--[[
[NEWLINE]Requirement/Restrictions:
[NEWLINE][ICON_BULLET]Player must be Denmark
[NEWLINE][ICON_BULLET]Must have a Melee Unit in the Capital
[NEWLINE][ICON_BULLET]May not be enacted after the end of the Medieval Era
[NEWLINE][ICON_BULLET]May only be enacted once per City State
[NEWLINE][ICON_BULLET]May only be enacted 8 times per game[NEWLINE]Costs:
[NEWLINE][ICON_BULLET]{2_Chance}% chance the unit is killed
[NEWLINE][ICON_BULLET]-60 [ICON_INFLUENCE] Influence with {1_Name}
[NEWLINE]Rewards:
[NEWLINE][ICON_BULLET]{3_Reward} [ICON_GOLD] Gold
[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Note: Higher level units are less likely to be killed[ENDCOLOR]
]]

-- 	local tPlayerTradeRoutes = pPlayer:GetTradeRoutes()


--[[
function C15_SKorea_DTP_GAPfromTradeRoutes(iPlayer, pCity, tPlayerTradeRoutes)
	local iTradeRouteGoldTotal = 0
	for i = 1, #tPlayerTradeRoutes do
		if (tPlayerTradeRoutes[i]["FromID"] == iPlayer) and not (tPlayerTradeRoutes[i]["ToID"] == iPlayer) then
			if tPlayerTradeRoutes[i]["FromCity"] == pCity then
				iTradeRouteGoldTotal = iTradeRouteGoldTotal + (tPlayerTradeRoutes[i]["FromGPT"] / 100)
			end
		end
	end
	
	return math.floor(iTradeRouteGoldTotal)
end
]]

local Decisions_C15_Nenets_DeerSteal = {}
	Decisions_C15_Nenets_DeerSteal.Name = "TXT_KEY_DECISIONS_C15_NENETS_DEERSTEAL"
	Decisions_C15_Nenets_DeerSteal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_C15_NENETS_DEERSTEAL_DESC")
	HookDecisionCivilizationIcon(Decisions_C15_Nenets_DeerSteal, "CIVILIZATION_SENSHI_NENETS")
	Decisions_C15_Nenets_DeerSteal.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return false, false end
		
		local iEra = load(pPlayer, "Decisions_C15_Nenets_DeerSteal")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_C15_Nenets_DeerSteal", nil)
			else
				Decisions_C15_Nenets_DeerSteal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_C15_NENETS_DEERSTEAL_DESC_ENACTED")
				return false, false, true
			end
		end
		
		local tPlayerTradeRoutes = pPlayer:GetTradeRoutes()
		--local tValidIDs = {}
		local bIsTradeWithCityState = false
		
		local playerID = pPlayer:GetID()
		
		for i = 1, #tPlayerTradeRoutes do
			if (tPlayerTradeRoutes[i]["FromID"] == playerID) and (Players[tPlayerTradeRoutes[i]["ToID"]]:IsMinorCiv()) then
				bIsTradeWithCityState = true
				break
			end
		end
		
		if not bIsTradeWithCityState then return true, false end
		return true, true
	end
	)
	
	Decisions_C15_Nenets_DeerSteal.DoFunc = (
	function(pPlayer)
		local pTeam = Teams[pPlayer:GetTeam()]
		local tValidIDs = {}
		local iValidIDs = 1
		local tPlayerTradeRoutes = pPlayer:GetTradeRoutes()
		local iPlayer = pPlayer:GetID()
		for i = 1, #tPlayerTradeRoutes do
			if (tPlayerTradeRoutes[i]["FromID"] == iPlayer) and (Players[tPlayerTradeRoutes[i]["ToID"]]:IsMinorCiv()) then
				tValidIDs[i] = tPlayerTradeRoutes[i]["ToID"]
			end
		end
		if #tValidIDs == 0 then return end
		local iRandomCityState = JFD_GetRandom(1, #tValidIDs) -- So this apparently doesn't work, but it does and I don't know an alternative :/
		--local pCityState = Players[tValidIDs[iRandomCityState]]
		--pCityState:ChangeMinorCivFriendshipWithMajor(iPlayer, -30)
		--local pCSTeamID = pCityState:GetTeam()
		--if pCityState:GetMinorCivFriendshipWithMajor(iPlayer) == -60 then
		--	pTeam:DeclareWar(pCSTeamID)
		--elseif JFD_GetRandom(1, 10) >= 7  then
		--	pTeam:DeclareWar(pCSTeamID)
		--end

		for pCity in pPlayer:Cities() do
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot then
					if pPlot:GetOwner() == iPlayer then
						--print("Plot is owned by player")
						if pPlot:GetResourceType() == -1 then
							--print("No resource")
							if (not (pPlot:IsCity())) and (not (pPlot:IsMountain())) and (not (pPlot:IsImpassable())) and (not (pPlot:IsHills())) and (not (pPlot:IsWater())) then
								--print("Valid plot")
								--print("Deer be placing")
								pPlot:SetResourceType(iDeer, 1)
								pPlot:SetRevealed(pTeam, true)
								
								-- Had to move this in here, in case there are no valid tiles

								local pCityState = Players[tValidIDs[iRandomCityState]]
								pCityState:ChangeMinorCivFriendshipWithMajor(iPlayer, -30)
								local pCSTeamID = pCityState:GetTeam()
								if pCityState:GetMinorCivFriendshipWithMajor(iPlayer) == -60 then
									pTeam:DeclareWar(pCSTeamID)
								elseif JFD_GetRandom(1, 10) >= 7  then
									pTeam:DeclareWar(pCSTeamID)
								end
								
								local title = "Deer Stolen!";
								local descr = "The [ICON_RES_DEER] Deer stolen from ".. pCityState:GetName() .." have been settled outside " .. pCity:GetName() .. ".";
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title);
								--print("Deer stuff done")
								save(pPlayer, "Decisions_C15_Nenets_DeerSteal", pPlayer:GetCurrentEra())
								return
							end
						end
					end
				end
			end
		end
		
		local title = "No Valid Plot!";
		local descr = "There is no valid plot to place your [ICON_RES_DEER] Deer in. Please try again later. You have not been penalised in this instance.";
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title);

		-- while iDeerNeeded > 0 do
			-- for pCity in pPlayer:Cities() do
				-- for i = 0, pCity:GetNumCityPlots() - 1, 1 do
					-- local pPlot = pCity:GetCityIndexPlot(i)
					-- if pPlot then
						-- if pPlot:GetOwner() == pID then
							-- if pPlot:GetResourceType() == -1 then
								-- if not pTargetPlot:IsCity() and not pTargetPlot:IsMountain() and not pTargetPlot:IsImpassable() and not pTargetPlot:IsHills() then
									-- if JFD_GetRandom(1, 6) > 4 then
										-- pPlot:SetResourceType(iDeer)
										-- pPlot:SetRevealed(pTeam, true)
										-- local title = "Deer Stolen!";
										-- local descr = "The deer stolen from ".. pCityState:GetName() .." have been settled outside " .. pCity:GetName() .. ".";
										-- pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title);
										-- iDeerNeeded = iDeerNeeded - 1
									-- end
								-- end
							-- end
						-- end
					-- end
				-- end
			-- end
		-- end
		--save(pPlayer, "Decisions_C15_Nenets_DeerSteal", pPlayer:GetCurrentEra())
	end
	)
		
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_C15_Nenets_DeerSteal", Decisions_C15_Nenets_DeerSteal)

---------------------------------------------------------------------------------------------------------------------------

local iMyaBuilding = GameInfoTypes["BUILDING_C15_MYA"]

local Decisions_C15_Nenets_Mya = {}
	Decisions_C15_Nenets_Mya.Name = "TXT_KEY_DECISIONS_C15_NENETS_MYA"
	Decisions_C15_Nenets_Mya.Desc = "TXT_KEY_DECISIONS_C15_NENETS_MYA_DESC"
	HookDecisionCivilizationIcon(Decisions_C15_Nenets_Mya, "CIVILIZATION_SENSHI_NENETS")
	
	Decisions_C15_Nenets_Mya.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return false, false end
		if load(pPlayer, "Decisions_C15_Nenets_Mya") == true then
			Decisions_C15_Nenets_Mya.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_C15_NENETS_MYA_DESC_ENACTED")
			return false, false, true
		end
		local iTech = GameInfoTypes["TECH_TRAPPING"]
		--local iCost = GameInfo.Technologies["TECH_TRAPPING"].Cost
		local iCost = math.ceil(pPlayer:GetResearchCost(iTech))
		
		Decisions_C15_Nenets_Mya.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_C15_NENETS_MYA_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		if (pPlayer:GetCurrentResearch() == -1) then return true, false end
			
		if (Teams[pPlayer:GetTeam()]:IsHasTech(iTech)) and (pPlayer:GetResearchProgress(pPlayer:GetCurrentResearch()) >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_C15_Nenets_Mya.DoFunc = (
	function(pPlayer)
		local iTech = GameInfoTypes["TECH_TRAPPING"]
		local iCost = math.ceil(pPlayer:GetResearchCost(iTech))
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
		pTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), -iCost, pPlayer:GetID())
		
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iMyaBuilding, 1)
		end
		
		save(pPlayer, "Decisions_C15_Nenets_Mya", true)
	end
	)
	
	Decisions_C15_Nenets_Mya.Monitors = {}
	Decisions_C15_Nenets_Mya.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerID)
		local pPlayer = Players[playerID]
		
		if load(pPlayer, "Decisions_C15_Nenets_Mya") == true then
			for pCity in pPlayer:Cities() do
				if not pCity:IsHasBuilding(iMyaBuilding) then
					pCity:SetNumRealBuilding(iMyaBuilding, 1)
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_C15_Nenets_Mya", Decisions_C15_Nenets_Mya)