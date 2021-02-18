-- Trypillia_Trait
-- Author: User
-- DateCreated: 9/6/2015 7:34:51 PM
--------------------------------------------------------------
 local RTrypilliaID = GameInfoTypes["CIVILIZATION_RTRYPILLIA"]
 include("PlotIterators")



function RTrypilliaFaithFromBuilds(playerID, plotX, plotY, improvementID)
        local player = Players[playerID]
        if improvementID then
                if player:GetCivilizationType() == RTrypilliaID then
                        local plot = Map.GetPlot(plotX, plotY)
                        local city = plot:GetWorkingCity()                     
                                player:ChangeFaith(4)
                        end
                end
        end
GameEvents.BuildFinished.Add(RTrypilliaFaithFromBuilds)

function FaithToSettlers(playerID)
        local player = Players[playerID]
        if player:GetCivilizationType() == RTrypilliaID then
                for city in player:Cities() do
                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_RFAITH_SETTLER"], 0)
                        if city:GetProductionUnit() == GameInfoTypes["UNIT_SETTLER"] then
                                local faith = city:GetBaseYieldRate(GameInfoTypes["YIELD_FAITH"])                                                                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RFAITH_SETTLER"], faith, 15)                                                          
                                                        end
                                                end
                                        end
                                end
                       
GameEvents.PlayerDoTurn.Add(FaithToSettlers)

local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
 
function FaithFromBuildingImprovements(playerID, plotX, plotY, improvementID)
        local player = Players[playerID]
        if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RTRYPILLIA"] then
        if improvementID then
                player:ChangeFaith(6*iMod)
                end
        end
     end
GameEvents.BuildFinished.Add(FaithFromBuildingImprovements)