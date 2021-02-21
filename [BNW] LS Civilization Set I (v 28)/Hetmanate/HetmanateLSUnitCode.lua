print ("Raids - Hetmanate UU code ")

include( "HorsemanSaveUtils" );

local HetmanateLeaderIDTrait = {}
local HetmanatePlayersTrait = {}

for row in GameInfo.Leader_Traits() do
	if row.TraitType == "TRAIT_LS_RAIDS" then
		HetmanateLeaderIDTrait[GameInfoTypes[row.LeaderType]] = 1
	end
end

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if HetmanateLeaderIDTrait[player:GetLeaderType()] then
			table.insert(HetmanatePlayersTrait, i)
		end
	end
end

if #HetmanatePlayersTrait > 0 then
	include("HetmanateLSTraitCode")
	GiveTableOfValidTraitPlayers(HetmanatePlayersTrait)
end

-- Unique unit code 

include("IconSupport.lua")

local HetPrID = GameInfoTypes.PROMOTION_LS_HETBORN;
local Citadel = GameInfoTypes.IMPROVEMENT_CITADEL;
local BaseHetman = GameInfoTypes.UNIT_LS_HETMAN;
local citadelHD = {}

GameEvents.GreatPersonExpended.Add(function(playerId, eGreatPersonType) 
	if eGreatPersonType == BaseHetman then
		if citadelHD[1] == playerId then
			if citadelHD[2] == Game.GetGameTurn() then
				local jUnit = Players[playerId]:InitUnit(BaseHetman, citadelHD[3]:GetX(), citadelHD[3]:GetY());
				jUnit:SetName(citadelHD[4]);
				jUnit:SetHasPromotion(HetPrID, false);
				jUnit:SetMoves(0);	
				jUnit:SetUnitAIType(GameInfoTypes.UNITAI_GENERAL);	
			end
		end
	end
	citadelHD = {}
end)

GameEvents.BuildFinished.Add(function(iPlayer, x, y, improID)
	if improID == Citadel then
		local iPlot = Map.GetPlot(x, y);
		for i = 0, iPlot:GetNumUnits() -1 do
			local iUnit = iPlot:GetUnit(i);
			if iUnit:IsHasPromotion(HetPrID) then
				citadelHD[1] = iPlayer;
				citadelHD[2] = Game.GetGameTurn();
				citadelHD[3] = Map.GetPlot(x, y);
				citadelHD[4] = Locale.Lookup(iUnit:GetNameNoDesc());
				iUnit:SetHasPromotion(HetPrID, false)
				break;
			end
		end
	end
end)
