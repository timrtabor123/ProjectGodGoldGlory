--TSL
--===

include("EW_Start_GlobalDefines.lua");
include("TableSaverLoader016.lua");

tableRoot = EW_Start
tableName = "EW_Start"

include("EW_Start_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)

function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()

--Deletes all units except a Scout and Settler
--============================================

local ewSettler = GameInfoTypes["UNITCLASS_SETTLER"]
local ewScout = GameInfoTypes["UNITCLASS_SCOUT"]

function Delete_NonSettlers()
	if Game.GetGameTurn() < 3 then
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pPlayer = Players[iPlayer]
			if not pPlayer then return end
			if (not pPlayer:IsHuman()) then
				SettlerVar[iPlayer] = SettlerVar[iPlayer] or -1
				ScoutVar[iPlayer] = ScoutVar[iPlayer] or -1
				for pUnit in pPlayer:Units() do
					--Kills one Settler
					if (pUnit:GetUnitClassType() == ewSettler) then
						if (SettlerVar[iPlayer] == -1) then
							pUnit:Kill()
							SettlerVar[iPlayer] = 1
							print("Settler Killed")
						end
					--Can be edited to kill scout if Necessary
					elseif (pUnit:GetUnitClassType() == ewScout) then
						if (ScoutVar[iPlayer] == -1) then
							--pUnit:Kill()
							ScoutVar[iPlayer] = 1
							print("Scout Killed")
						end
					else
						pUnit:Kill()
					end
				end
			end
		end
	end
end

Events.SequenceGameInitComplete.Add(Delete_NonSettlers)