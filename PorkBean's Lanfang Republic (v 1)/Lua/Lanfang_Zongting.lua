--------------------
--PorkBean's Lanfang Republic
--Unique Building: Zongting
--------------------

include("FLuaVector.lua")

local iLanfangCiv = GameInfoTypes.CIVILIZATION_PB_LANFANG;
local impMine = GameInfoTypes["IMPROVEMENT_MINE"];
local feaOasis = FeatureTypes["FEATURE_OASIS"];
local buildZongting = GameInfoTypes["BUILDING_LF_ZONGTING"];
local feaMarsh = FeatureTypes["FEATURE_MARSH"];
local feaForest = FeatureTypes["FEATURE_FOREST"];
local feaJungle = FeatureTypes["FEATURE_JUNGLE"];
local resIron = GameInfoTypes["RESOURCE_IRON"];
local resGold = GameInfoTypes["RESOURCE_GOLD"];
local resSilver = GameInfoTypes["RESOURCE_SILVER"];
local resGems = GameInfoTypes["RESOURCE_GEMS"];
local resCoal = GameInfoTypes["RESOURCE_COAL"];
local resUranium = GameInfoTypes["RESOURCE_URANIUM"];
local resCopper = GameInfoTypes["RESOURCE_COPPER"];
local resSalt = GameInfoTypes["RESOURCE_SALT"];
local resAluminum = GameInfoTypes["RESOURCE_ALUMINUM"];

function HasTradeRoute(pPlot, pPlayer)
	return (#pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot) > 0)
end

function Lanfang_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function LanfangZongting(iPlayer)
	local pPlayer = Players[iPlayer];	
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iLanfangCiv then
		for pCity in pPlayer:Cities() do			
			if pCity:IsHasBuilding(buildZongting) then				
				for i = 0, pCity:GetNumCityPlots()-1, 1 do --iterate the plots in a city (credit whoward69)
					local pPlot = pCity:GetCityIndexPlot(i)
					if (pPlot) then
						if pPlot:GetOwner() == pCity:GetOwner() then
							if HasTradeRoute(pPlot, pPlayer) then
								if not pPlot:IsCity() then
									if not pPlot:IsWater() then	
										if pPlot:GetFeatureType() ~= feaOasis then
											if pPlot:GetResourceType() == -1 then
												if pPlot:GetImprovementType() == -1 then
													if Lanfang_GetRandom(1,100) <= 15 then
														print("successful roll, building mine")
														local iX = pPlot:GetX()
														local iY = pPlot:GetY()
														pPlot:SetImprovementType(impMine)
														if pPlot:GetFeatureType() == feaForest then
															pPlot:SetFeatureType(-1)
														elseif pPlot:GetFeatureType() == feaJungle then
															pPlot:SetFeatureType(-1)
														elseif pPlot:GetFeatureType() == feaMarsh then
															pPlot:SetFeatureType(-1)
														end
														if pPlayer:IsHuman() then						
															Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "Mine built by Zongting!", 0)
														end
													end
												end
											elseif (pPlot:GetResourceType() == resIron) or (pPlot:GetResourceType() == resGold) or (pPlot:GetResourceType() == resSilver) or (pPlot:GetResourceType() == resGems) or (pPlot:GetResourceType() == resCoal) or (pPlot:GetResourceType() == resUranium) or (pPlot:GetResourceType() == resCopper) or (pPlot:GetResourceType() == resSalt) or (pPlot:GetResourceType() == resAluminum) then
												if pPlot:GetImprovementType() == -1 then
													if Lanfang_GetRandom(1,100) <= 15 then
														print("successful roll, building mine")
														local iX = pPlot:GetX()
														local iY = pPlot:GetY()
														pPlot:SetImprovementType(impMine)
														if pPlot:GetFeatureType() == feaForest then
															pPlot:SetFeatureType(-1)
														elseif pPlot:GetFeatureType() == feaJungle then
															pPlot:SetFeatureType(-1)
														elseif pPlot:GetFeatureType() == feaMarsh then
															pPlot:SetFeatureType(-1)
														end						
														if pPlayer:IsHuman() then						
															Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "Mine built by Zongting!", 0)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(LanfangZongting);