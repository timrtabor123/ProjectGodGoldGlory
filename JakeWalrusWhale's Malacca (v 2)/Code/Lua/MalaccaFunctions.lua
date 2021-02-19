--============================================================
-- GLOBALS
--============================================================
local iMalacca = GameInfoTypes["CIVILIZATION_JWW_MALACCA"]
local iHulubalang = GameInfoTypes["UNIT_JWW_HULUBALANG"]
local iOrang = GameInfoTypes["UNIT_JWW_ORANG_LAUT"]
local iOrangPromotion = GameInfoTypes["PROMOTION_JWW_ORANG_TRADE"]

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--============================================================
-- UA
--============================================================
function JWW_MalaccaSpeedyBois(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iMalacca then
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			local pOwner = Players[pPlot:GetOwner()]
			if pOwner then 
				if pPlayer == pOwner then
					local iMoves = pUnit:MaxMoves()
					pUnit:SetMoves(iMoves * 2)
				elseif pOwner:IsDoF(iPlayer) then
					local iMoves = pUnit:MaxMoves()
					pUnit:SetMoves(iMoves * 2)
				elseif pOwner:IsMinorCiv() and pOwner:GetAlly() == iPlayer then
					local iMoves = pUnit:MaxMoves()
					pUnit:SetMoves(iMoves * 2)
				end
			end
		end
	elseif pPlayer:IsMinorCiv() then
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			local iOwner = pPlot:GetOwner()
			local pOwner = Players[pPlot:GetOwner()]
			if pOwner then 
				if pPlayer:GetAlly() == iOwner and pOwner:GetCivilizationType() == iMalacca then
					local iMoves = pUnit:MaxMoves()
					pUnit:SetMoves(iMoves * 2)
				end
			end
		end
	elseif pPlayer:IsAlive() then
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			local iOwner = pPlot:GetOwner()
			local pOwner = Players[pPlot:GetOwner()]
			if pOwner then 
				if pPlayer:IsDoF(iOwner) and pOwner:GetCivilizationType() == iMalacca then
					local iMoves = pUnit:MaxMoves()
					pUnit:SetMoves(iMoves * 2)
				end
			end
		end
	end
end

function JWW_MasGoldPorFavor(iPlayer)
	local iNumTR = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iMalacca then
		for _,v in ipairs(pPlayer:GetTradeRoutes()) do
			local pToCity = v.ToCity
			if pPlayer:IsDoF(pToCity:GetOwner()) then
				iNumTR = iNumTR + 1
			else
				local pOwner = Players[pToCity:GetOwner()]
				if pOwner:IsMinorCiv() then
					if pOwner:GetAlly() == iPlayer then
						iNumTR = iNumTR + 1
					end
				end
			end
		end
		for _,v in ipairs(pPlayer:GetTradeRoutesToYou()) do
			local pFromCity = v.FromCity
			if pPlayer:IsDoF(pFromCity:GetOwner()) then
				iNumTR = iNumTR + 1
			else
				local pOwner = Players[pFromCity:GetOwner()]
				if pOwner:IsMinorCiv() then
					if pOwner:GetAlly() == iPlayer then
						iNumTR = iNumTR + 1
					end
				end
			end
		end
		if iNumTR > 0 then
			local iEra = pPlayer:GetCurrentEra()
			local iGold = iEra * iNumTR * 3
			pPlayer:ChangeGold(iGold)
		end
	end
end

GameEvents.PlayerDoTurn.Add(JWW_MalaccaSpeedyBois)
GameEvents.PlayerDoTurn.Add(JWW_MasGoldPorFavor)
--============================================================
-- UU
--============================================================
function JWW_BuffToDefendThoseRoutes(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() == iOrang then
			local pPlot = pUnit:GetPlot()
			if #pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot) > 0 then
				pUnit:SetHasPromotion(iOrangPromotion, true)
			else
				pUnit:SetHasPromotion(iOrangPromotion, false)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(JWW_BuffToDefendThoseRoutes)
--============================================================
-- UGP
--============================================================
function JWW_DudeDidYouJustSeriouslyDieNearAHulubalang(iPlayer, iUnit, eUnit, iPlotX, iPlotY, bDelay, iByPlayer)
	if not bDelay then return end
	if iByPlayer ~= iPlayer then
		local pByPlayer = Players[iByPlayer]
		if pByPlayer and pByPlayer:GetCivilizationType() == iMalacca then
			for pUnit in pByPlayer:Units() do
				if pUnit:GetUnitType() == iHulubalang then
					local pPlot = pUnit:GetPlot()
					local iDistance = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), iPlotX, iPlotY)
					if iDistance < 4 then
						local pPlayer = Players[iPlayer]
						local pDedUnit = pPlayer:GetUnitByID(iUnit)
						local pDedPlot = pDedUnit:GetPlot()
						if JFD_GetRandom(1, 20) == 1 then
							local pNewUnit = pByPlayer:InitUnit(pDedUnit:GetUnitType(), pDedPlot:GetX(), pDedPlot:GetY(), pDedUnit:GetUnitAIType())
							pNewUnit:JumpToNearestValidPlot()
						end
						if JFD_GetRandom(1, 20) == 1 then
							if (#pByPlayer:GetInternationalTradeRoutePlotToolTip(pDedPlot) > 0) or pDedPlot:IsRoute() then
								if iPlayer == pDedUnit:GetOwner() then
									pDedPlot:SetOwner(iByPlayer)
								end
							end
						end
					end
				end
			end
		end
	end
end
							

GameEvents.UnitPrekill.Add(JWW_DudeDidYouJustSeriouslyDieNearAHulubalang)