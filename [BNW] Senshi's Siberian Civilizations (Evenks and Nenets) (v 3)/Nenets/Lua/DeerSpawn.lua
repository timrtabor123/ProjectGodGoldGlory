local iNenetsCiv = GameInfoTypes.CIVILIZATION_SENSHI_NENETS
local iDeer = GameInfoTypes.RESOURCE_DEER
local iSnow = GameInfoTypes.TERRAIN_SNOW
local iTundra = GameInfoTypes.TERRAIN_TUNDRA
local iNotification = NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE

function DeerSpawn(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iNenetsCiv then
		local CheckedPlots = {} -- to avoid having higher chances of deer spawning if a plot is within range of multiple cities
		for pCity in pPlayer:Cities() do
			for i = 0, pCity:GetNumCityPlots()-1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot and ((pPlot:GetTerrainType() == iSnow) or (pPlot:GetTerrainType() == iTundra)) and pPlot:GetResourceType() == -1 and (not CheckedPlots[pPlot:GetPlotIndex()]) and pPlot:GetOwner() == iPlayer then
					CheckedPlots[pPlot:GetPlotIndex()] = 1
					if Game.Rand(100, "Nenets deer spawn") < 2 then
						pPlot:SetResourceType(iDeer,1)
						pPlayer:AddNotification(iNotification, Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FOUND_RESOURCE","TXT_KEY_RESOURCE_DEER"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FOUND_RESOURCE","TXT_KEY_RESOURCE_DEER"),pPlot:GetX(),pPlot:GetY(),iDeer)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DeerSpawn)