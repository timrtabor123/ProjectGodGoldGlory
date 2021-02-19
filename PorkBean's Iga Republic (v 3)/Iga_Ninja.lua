--------------------
--PorkBean's Iga Republic
--Co-authored by Homusubi
--Unique Unit: Ninja
--------------------

--Local variables
local iIgaCiv = GameInfoTypes.CIVILIZATION_IGA;
local iIgaNinja = GameInfoTypes["UNIT_IGA_NINJA"];
local iEraMedieval = GameInfoTypes["ERA_MEDIEVAL"];
local iNinjaRecon = GameInfoTypes["UNITAI_EXPLORE"];
local iNinjaAttack = GameInfoTypes["UNITAI_RANGED"];

function IgaNinjaAI(playerID)
    local iPlayer = Players[playerID]
    local iEra = iPlayer:GetCurrentEra();
    if iPlayer:IsHuman() then return end
    local playerTeam = Teams[iPlayer:GetTeam()]
    if playerTeam:GetAtWarCount(true) > 0 then
        for unit in iPlayer:Units() do
            if iEra <= iEraMedieval then
                if unit:GetUnitType() == iIgaNinja then
                    print("Setting Ninja to Attack AI")
                    unit:SetUnitAIType(iNinjaAttack)
                end
            end
        end
    else
        for unit in iPlayer:Units() do
            if unit:GetUnitType() == iIgaNinja then
                print("Setting Ninja to Recon AI")
                unit:SetUnitAIType(iNinjaRecon)
            end
        end
    end
end

GameEvents.PlayerDoTurn.Add(IgaNinjaAI);
