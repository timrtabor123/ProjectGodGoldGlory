-------------------------------------------------
-- TECH PANEL
-------------------------------------------------
include( "JFD_RTP_Utils.lua" );
include( "InstanceManager" );
include( "IconSupport" );

if (not GameInfo) then return end

function OnCivButtonClicked()
	 LuaEvents.UI_UpdateCivilizationOverview()
end
Controls.CivButton:RegisterCallback( Mouse.eLClick, OnCivButtonClicked );

local gridX = 470
local gridY = 45
function OnCivPanelUpdated()
	if Game.IsFinalInitialized() then
		
		local activePlayerID = Game.GetActivePlayer()
		local activePlayer = Players[activePlayerID]
		local civilization = GameInfo.Civilizations[activePlayer:GetCivilizationType()]
		if civilization then
			--Update civ and leader icon
			local civilization = GameInfo.Civilizations[activePlayer:GetCivilizationType()]
			local leader = GameInfo.Leaders[activePlayer:GetLeaderType()]
			IconHookup( civilization.PortraitIndex, 45, civilization.IconAtlas, Controls.CivIcon )
			IconHookup( leader.PortraitIndex, 128, leader.IconAtlas, Controls.LeaderIcon )
			
			--Update civ description
			local civDesc = "[" .. GameInfo.PlayerColors[activePlayer:GetPlayerColor()].PrimaryColor .. "]" .. activePlayer:GetCivilizationDescription() .. "[ENDCOLOR]" 
			local leaderDesc = activePlayer:GetName()
			
			-- if Controls.ShowOn2MouseOver:HasMouseover() then
				local primaryColor, secondaryColor = activePlayer:GetPlayerColors();
				local otherColor = GameInfo.Colors["COLOR_DARK_GREY"]
				local backgroundColor = {x = otherColor.Red, y = otherColor.Green, z = otherColor.Blue, w = 1};
				local headerColor = {x = secondaryColor.x, y = secondaryColor.y, z = secondaryColor.z, w = 1};
				Controls.BannerBody:SetColor(backgroundColor)
				Controls.BannerHeader:SetColor(headerColor)
			
				local strGovtStats = ""
				local strSocStats = ""
					
				--STABILITY
				Controls.StabilityStats:LocalizeAndSetText("[ICON_HAPPINESS_1] [COLOR_HAPPINESS]STABLE[ENDCOLOR]")
				Controls.StabilityStats:LocalizeAndSetToolTip("[ICON_HAPPINESS_1] [COLOR_HAPPINESS]STABLE[ENDCOLOR]")
				if activePlayer:IsEmpireSuperUnhappy() then
					Controls.StabilityStats:LocalizeAndSetText("[ICON_HAPPINESS_4] [COLOR_NEGATIVE_TEXT]CIVIL WAR![ENDCOLOR]")
					Controls.StabilityStats:LocalizeAndSetToolTip("[ICON_HAPPINESS_4] [COLOR_NEGATIVE_TEXT]CIVIL WAR![ENDCOLOR]")
				end
				if activePlayer:IsEmpireVeryUnhappy() then
					Controls.StabilityStats:LocalizeAndSetText("[ICON_HAPPINESS_4] [COLOR_UNHAPPINESS_4]REBELLION![ENDCOLOR]")
					Controls.StabilityStats:LocalizeAndSetToolTip("[ICON_HAPPINESS_4] [COLOR_UNHAPPINESS_4]REBELLION![ENDCOLOR]")
				end
				if activePlayer:IsEmpireUnhappy() then
					Controls.StabilityStats:LocalizeAndSetText("[ICON_HAPPINESS_3] [COLOR_UNHAPPINESS_3]DISCONTENT![ENDCOLOR]")
					Controls.StabilityStats:LocalizeAndSetToolTip("[ICON_HAPPINESS_3] [COLOR_UNHAPPINESS_3]DISCONTENT![ENDCOLOR]")
				end
				if activePlayer:IsGoldenAge() then
					Controls.StabilityStats:LocalizeAndSetText("[ICON_GOLDEN_AGE] [COLOR_GOLDEN_AGE]GOLDEN AGE![ENDCOLOR]")
					Controls.StabilityStats:LocalizeAndSetToolTip("[ICON_GOLDEN_AGE] [COLOR_GOLDEN_AGE]GOLDEN AGE![ENDCOLOR]")
				end
				if Player.IsDarkAge and activePlayer:IsDarkAge() then
					Controls.StabilityStats:LocalizeAndSetText("[ICON_DARK_AGE] [COLOR_DARK_AGE]DARK AGE![ENDCOLOR]")
					Controls.StabilityStats:LocalizeAndSetToolTip("[ICON_DARK_AGE] [COLOR_DARK_AGE]DARK AGE![ENDCOLOR]")
				end
				if activePlayer:IsAnarchy() then
					Controls.StabilityStats:LocalizeAndSetText("[ICON_RESISTANCE] [COLOR_RED]ANARCHY![ENDCOLOR]")
					Controls.StabilityStats:LocalizeAndSetToolTip("[ICON_RESISTANCE] [COLOR_RED]ANARCHY![ENDCOLOR]")
				end
				
				if JFD_RTP ~= nil then
					--EPITHETS
					if Player.GetEpithetTitle then
						local strEpithet = activePlayer:GetEpithetTitle()
						if strEpithet then
							leaderDesc = leaderDesc .. " " .. Locale.ConvertTextKey(strEpithet)
						end
					end
					
					--GREAT POWER STATUS
					if Player.GetGreatPowerStatus then
						local greatPowerStatusID = activePlayer:GetGreatPowerStatus()
						if greatPowerStatusID ~= -1 then
							local greatPowerStatus = GameInfo.JFD_GreatPowers[greatPowerStatusID]
							civDesc =  greatPowerStatus.IconString .. civDesc
						end
					end
						
					--CYCLES OF POWER
					if Player.GetCyclePower then
						local cyclePowerID = activePlayer:GetCyclePower() or -1
						if cyclePowerID ~= -1 then
							if activePlayer:IsAnarchy() then
								if strGovtStats ~= "" then
									strGovtStats = strGovtStats .. "[ICON_BULLET]" .. "[ICON_RESISTANCE][COLOR_NEGATIVE_TEXT] " .. Locale.ToUpper("TXT_KEY_CYCLE_POWER_JFD_ANARCHY_DESC") .. "[ENDCOLOR]"
								else
									strGovtStats = "[ICON_RESISTANCE][COLOR_NEGATIVE_TEXT] " .. Locale.ToUpper("TXT_KEY_CYCLE_POWER_JFD_ANARCHY_DESC") .. "[ENDCOLOR]"
								end
							else
								local cyclePower = GameInfo.JFD_CyclePowers[cyclePowerID]
								local cyclePowerID = activePlayer:GetCyclePower() or -1
								if cyclePowerID ~= -1 then
									local cyclePower = GameInfo.JFD_CyclePowers[cyclePowerID]
									local strCyclePowerTT = activePlayer:GetCyclePowerToolTip(cyclePowerID)
									local numVirtueMax = activePlayer:GetMaxVirtue()
									local numVirtue = activePlayer:GetVirtue()
									local numVirtueRate = activePlayer:GetVirtueRate(cyclePowerID)
									local strVirtueTT = activePlayer:GetVirtueToolTip(cyclePowerID)
									
									if strGovtStats ~= "" then
										strGovtStats = strGovtStats .. "[ICON_BULLET]" .. Locale.ConvertTextKey("[ICON_JFD_CYCLE_POWER] " .. Locale.ToUpper(cyclePower.Description))
									else
										strGovtStats = "[ICON_JFD_CYCLE_POWER] " .. Locale.ToUpper(cyclePower.Description)
									end
								end
							end
						end
					end
					
					--GOVERNMENT
					if Player.IsHasGovernment then
						local currentGovernmentID = activePlayer:GetCurrentGovernment()
						if currentGovernmentID > -1 then
							local government = GameInfo.JFD_Governments[currentGovernmentID]
							if strGovtStats ~= "" then
								strGovtStats = strGovtStats .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CIVILIZATION_INFO_GOVERNMENT", government.Description)
							else
								strGovtStats = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILIZATION_INFO_GOVERNMENT", government.Description)
							end
							
							local factionID = activePlayer:GetDominantFaction()
							if factionID ~= -1 then
								strGovtStats = strGovtStats .. "[COLOR_JFD_SOVEREIGNTY][NEWLINE]" .. GameInfo.JFD_Factions[factionID].IconString .. " " .. Locale.ConvertTextKey(GameInfo.JFD_Factions[factionID].Description) .. "[ENDCOLOR]" 
							end
						end
					end				
				
					--LAST POLICY/REFORM
					if Player.GetLastReformPassed then
						local strLastReform = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILIZATION_INFO_LAST_REFORM", activePlayer:GetLastReformPassed())
						Controls.LastReform:SetText(strLastReform)
						Controls.LastReform:SetToolTipString(strLastReform)
						-- Controls.LastReform:SetHide(false)
						
						local strLastPolicy = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILIZATION_INFO_LAST_POLICY", activePlayer:GetLastPolicyAdopted())
						Controls.LastPolicy:SetText(strLastPolicy)
						Controls.LastPolicy:SetToolTipString(strLastPolicy)
						-- Controls.LastPolicy:SetHide(false)
					else
						Controls.LastReform:SetHide(true)
						Controls.LastPolicy:SetHide(true)
					end
				end
					
				--IDEOLOGY
				local ideologyID = activePlayer:GetIdeology()
				local ideologyFont = nil
				local ideologyDesc = nil
				if ideologyID == -1 then
					ideologyID = activePlayer:GetDominantPolicyBranchForTitle()
					ideologyFont = "[ICON_CULTURE]"
					ideologyDesc = "None"
				else
					ideologyFont = GameInfo.PolicyBranchTypes[ideologyID].IconString
					ideologyDesc = GameInfo.PolicyBranchTypes[ideologyID].Description
				end
				if ideologyID ~= -1 then
					strSocStats = strSocStats .. "[COLOR_MAGENTA]" .. ideologyFont .. " " .. Locale.ConvertTextKey(ideologyDesc) .. "[ENDCOLOR]"
					Controls.IdeologyIcon:SetText(ideologyFont)
					Controls.IdeologyIcon:LocalizeAndSetToolTip(ideologyDesc)
				else
					strSocStats = strSocStats .. "[COLOR_MAGENTA][ICON_CULTURE] None[ENDCOLOR]	"
				end
				
				--RELIGION
				local religionID = activePlayer:GetMainReligion()
				local religionFont = nil
				local religionDesc = nil
				if religionID >= 0 then
					religionFont = GameInfo.Religions[religionID].IconString
					religionDesc = GameInfo.Religions[religionID].Description
					strSocStats = strSocStats .. "[COLOR_WHITE][ICON_BULLET]" .. religionFont .. Locale.ConvertTextKey(religionDesc) .. "[ENDCOLOR]"
					Controls.ReliIcon:SetText(religionFont)
					Controls.ReliIcon:LocalizeAndSetToolTip(religionDesc)
				end
				
				if strGovtStats ~= "" then
					Controls.GovtStats:SetText(strGovtStats)
				end
				if strSocStats ~= "" then
					Controls.SocStats:SetText(strSocStats)
				end
				
				Controls.CivText:SetText(civDesc);
				Controls.CivText:LocalizeAndSetToolTip(civDesc);
				Controls.CivText:SetHide(false);
				Controls.LeaderText:SetText(leaderDesc);
				Controls.LeaderText:LocalizeAndSetToolTip(leaderDesc);
				Controls.LeaderText:SetHide(false);
			end
		-- end
			
		Controls.RightInfoStack:ReprocessAnchoring()
		Controls.LeftInfoStack:ReprocessAnchoring()
	end
end
Events.SerialEventGameDataDirty.Add(OnCivPanelUpdated);
LuaEvents.UI_UpdateCivilizationOverview.Add(OnCivPanelUpdated);
-------------------------------------------------
-------------------------------------------------
local g_PlayerListInstanceManager = InstanceManager:new( "PlayerEntryInstance", "PlayerEntryBox", Controls.PlayerListStack );
function OnWorldCivsListUpdated()
	print("OnWorldCivsListUpdated", OnWorldCivsListUpdated)
	Controls.WorldCivsList:SetHide(false)
	
	g_PlayerListInstanceManager:ResetInstances();
	
	local worldCivsTable = {}
	local worldCivsCount = 1
	
	for iPlayerLoop = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		
		-- Player has to be alive to be in the list
		local pPlayer = Players[iPlayerLoop];
		if (pPlayer:IsAlive()) then
		
			local iTeam = pPlayer:GetTeam();
			local pTeam = Teams[iTeam];
		
			if pTeam:IsHasMet(Game.GetActiveTeam()) then
			
				local greatPowerRank = iPlayerLoop
				if Player.CalculateGreatPowerStats then
					greatPowerRank = pPlayer:CalculateGreatPowerStats()
				end
				
				worldCivsTable[worldCivsCount] = {PlayerID = iPlayerLoop, GreatPowerRank = greatPowerRank}
				worldCivsCount = worldCivsCount + 1
			end
		end
	end	
		
	table.sort(worldCivsTable, function(a,b) return a.GreatPowerRank > b.GreatPowerRank end)
	
	for _, worldCiv in pairs(worldCivsTable) do
		local iPlayerLoop = worldCiv.PlayerID
		local pPlayer = Players[iPlayerLoop];
		local iTeam = pPlayer:GetTeam();
		local pTeam = Teams[iTeam];
			
		local civDesc = Locale.ToUpper(pPlayer:GetCivilizationShortDescription())
		local leaderDesc = pPlayer:GetName()
		
		-- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
		local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
		local leaderDescription = leader.Description;
			
		local strName
		local srCivName = pPlayer:GetCivilizationDescription()
		local strLeaderName = leaderDesc
		local srGovtName
		local strGovtStatsName = ""
		local strSocStatsName = ""
		local strEcoStatsName = ""
		
		local controlTable = g_PlayerListInstanceManager:GetInstance();
		
		if (pPlayer:GetID() == Game.GetActivePlayer()) then
			strName = civDesc .. " (" .. Locale.ToUpper( "TXT_KEY_POP_VOTE_RESULTS_YOU" ) .. ")"
		else
			strName = civDesc
		end	
		strName = "[" .. GameInfo.PlayerColors[pPlayer:GetPlayerColor()].PrimaryColor .. "]" .. civDesc .. "[ENDCOLOR]" 
		
		--ICONS
		CivIconHookup( iPlayerLoop, 32, controlTable.Icon, controlTable.CivIconBG, controlTable.CivIconShadow, false, true);  
		IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, controlTable.Portrait );
		
		--BACKGROUND
		local primaryColor, secondaryColor = pPlayer:GetPlayerColors();
		local headerColor = {x = secondaryColor.x, y = secondaryColor.y, z = secondaryColor.z, w = 1};
		controlTable.WorldBannerHeader:SetColor(headerColor)
		local otherColor = GameInfo.Colors["COLOR_DARK_GREY"]
		local backgroundColor = {x = otherColor.Red, y = otherColor.Green, z = otherColor.Blue, w = 1};
		controlTable.PlayerEntryBannerBackground:SetColor(backgroundColor)
				
		--CYCLES OF POWER
		local cyclePowerID = -1
		if Player.GetCyclePower then
			cyclePowerID = pPlayer:GetCyclePower() or -1
		end				
		if cyclePowerID ~= -1 then
			local cyclePower = GameInfo.JFD_CyclePowers[cyclePowerID]
			controlTable.CyclePower:SetHide(false)		
			strGovtStatsName = "[COLOR_JFD_VIRTUE][ICON_BULLET][ICON_JFD_CYCLE_OF_POWER] " .. Locale.ToUpper(cyclePower.Description) .. "[ENDCOLOR]"
		else
			controlTable.CyclePower:SetHide(true)
		end
		
		--SOVEREIGNTY
		local governmentID = -1
		if Player.GetCurrentGovernment then		
			governmentID = pPlayer:GetCurrentGovernment()
			if governmentID ~= -1 then
				srGovtName = pPlayer:GetGovernmentName(governmentID)	
				strGovtStatsName = strGovtStatsName .. "[COLOR_JFD_SOVEREIGNTY][ICON_BULLET][ICON_JFD_GOVERNMENT] " .. Locale.ConvertTextKey(GameInfo.JFD_Governments[governmentID].Description) .. "[ENDCOLOR]" 
				-- strGovtStatsName = strGovtStatsName .. " (" .. srGovtName .. ")" 
				
				local factionID = pPlayer:GetDominantFaction()
				if factionID ~= -1 then
					strGovtStatsName = strGovtStatsName .. "[COLOR_JFD_SOVEREIGNTY][ICON_BULLET]" .. GameInfo.JFD_Factions[factionID].IconString .. " " .. Locale.ConvertTextKey(GameInfo.JFD_Factions[factionID].ShortDescription) .. "[ENDCOLOR]" 
					-- strGovtStatsName = strGovtStatsName .. " (" .. pPlayer:GetFactionName(factionID) .. ")" 
				end
			end
		end
		
		--IDEOLOGY
		local ideologyID = pPlayer:GetIdeology()
		local ideologyFont = nil
		if ideologyID == -1 then
			ideologyID = pPlayer:GetDominantPolicyBranchForTitle()
			ideologyFont = "[ICON_CULTURE]"
		else
			ideologyFont = GameInfo.PolicyBranchTypes[ideologyID].IconString
		end
		if ideologyID ~= -1 then
			strSocStatsName = strSocStatsName .. "[COLOR_MAGENTA][ICON_BULLET]" .. ideologyFont .. " " .. Locale.ConvertTextKey(GameInfo.PolicyBranchTypes[ideologyID].Description) .. "[ENDCOLOR]	"
		end
		
		--RELIGION
		local religionID = pPlayer:GetMainReligion()
		local religionFont = nil
		if religionID >= 0 then
			religionFont = GameInfo.Religions[religionID].IconString
			strSocStatsName = strSocStatsName .. "[COLOR_WHITE][ICON_BULLET]" .. religionFont .. Locale.ConvertTextKey(GameInfo.Religions[religionID].Description) .. "[ENDCOLOR]"
		end
		
		--STABILITY
		local strStability = ""
		--Update status
		strStability = "[ICON_HAPPINESS_1] [COLOR_HAPPINESS]STABLE[ENDCOLOR]"
		if pPlayer:IsEmpireSuperUnhappy() then
			strStability = "[ICON_HAPPINESS_4] [COLOR_UNHAPPINESS_4]CIVIL WAR![ENDCOLOR]"
		end
		if pPlayer:IsEmpireVeryUnhappy() then
			strStability = "[ICON_HAPPINESS_4] [COLOR_NEGATIVE_TEXT]REBELLION![ENDCOLOR]"
		end
		if pPlayer:IsEmpireUnhappy() then
			strStability = "[ICON_HAPPINESS_3] [COLOR_UNHAPPINESS_3]DISCONTENT![ENDCOLOR]"
		end
		if pPlayer:IsGoldenAge() then
			strStability = "[ICON_GOLDEN_AGE] [COLOR_GOLDEN_AGE]GOLDEN AGE![ENDCOLOR]"
		end
		if Player.IsDarkAge and pPlayer:IsDarkAge() then
			strStability = "[ICON_DARK_AGE] [COLOR_DARK_AGE]DARK AGE![ENDCOLOR]"
		end
		if pPlayer:IsAnarchy() then
			strStability = "[ICON_RESISTANCE] [COLOR_RED]ANARCHY![ENDCOLOR]"
		end
		strStability = strStability .. " [ICON_BULLET]" .. Locale.ConvertTextKey(GameInfo.Eras[pPlayer:GetCurrentEra()].Description)
		controlTable.PlayerStabilityStatsText:LocalizeAndSetText(strStability)
		controlTable.PlayerStabilityStatsText:LocalizeAndSetToolTip(strStability)
		
		--GREAT POWER STATUS
		if Player.GetGreatPowerStatus then
			local greatPowerStatusID = pPlayer:GetGreatPowerStatus()
			if greatPowerStatusID ~= -1 then
				local greatPowerStatus = GameInfo.JFD_GreatPowers[greatPowerStatusID]
				-- strName = greatPowerStatus.IconString .. "[" .. greatPowerStatus.ColorString .. "]" .. strName .. "[ENDCOLOR]"
				strName = greatPowerStatus.IconString .. " " .. strName 
				
				-- local secondaryColor = GameInfo.Colors[greatPowerStatus.ColorString]
				-- local backgroundColor = {x = secondaryColor.Red, y = secondaryColor.Green, z = secondaryColor.Blue, w = 0.3};
				-- controlTable.PlayerEntryAnimGrid:SetColor(backgroundColor)
			end
		end
		
		--EPITHET
		if Player.GetEpithetTitle then
			local strEpithet = pPlayer:GetEpithetTitle()
			if strEpithet then
				strLeaderName = strLeaderName .. " " .. Locale.ConvertTextKey(strEpithet)
			end
		end
		
		--LAND PERCENT
		local numPlotPercent = Game.GetRound(((pPlayer:GetNumPlots()/Map.GetNumPlots())*100),2)
		if strEcoStatsName ~= "" then
			strEcoStatsName = strEcoStatsName .. "[ICON_BULLET]"
		end
		strEcoStatsName = strEcoStatsName .. "[ICON_BULLET]"
		strEcoStatsName = strEcoStatsName .. "Land: " .. numPlotPercent .. "%" 
			
		--POPULATION PERCENT
		local numPopPercent = Game.GetRound(((pPlayer:GetTotalPopulation()/Game.GetTotalPopulation())*100),2)
		strEcoStatsName = strEcoStatsName .. "[ICON_BULLET]"
		strEcoStatsName = strEcoStatsName .. "Population: " .. numPopPercent .. "%" 
		
		--MILITARY PERCENT
		local numMilitary = pPlayer:GetMilitaryMight()
		local numGlobalMilitary = 0
		for otherPlayerID = 0, GameDefines["MAX_MINOR_CIVS"], 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() and otherPlayerID ~= playerID then
				numGlobalMilitary = numGlobalMilitary + otherPlayer:GetMilitaryMight()
			end
		end
		local numMilitaryPercent = Game.GetRound(((numMilitary/numGlobalMilitary)*100),2)
		strEcoStatsName = strEcoStatsName .. "[ICON_BULLET]"
		strEcoStatsName = strEcoStatsName .. "Military: " .. numMilitaryPercent .. "%" 
		
		--RELIGION PERCENT
		local religionID = pPlayer:GetReligionCreatedByPlayer()
		if religionID > 0 then
			local numReliPercent = Game.GetRound(((Game.GetNumCitiesFollowing(religionID)/Game.GetNumCities())*100),2)
			strEcoStatsName = strEcoStatsName .. "[ICON_BULLET]"
			strEcoStatsName = strEcoStatsName .. "Religion: " .. numReliPercent .. "%" 
		end
		
		controlTable.PlayerGovtStatsText:LocalizeAndSetText(strGovtStatsName)
		controlTable.PlayerSocStatsText:LocalizeAndSetText(strSocStatsName)
		controlTable.PlayerEcoStatsText:LocalizeAndSetText(strEcoStatsName)
		controlTable.PlayerEcoStatsText:LocalizeAndSetToolTip("TXT_KEY_JFD_WORLD_CIVILIZATIONS_ECO_STATS", numPlotPercent, numPopPercent, numMilitaryPercent)
		controlTable.PlayerNameText:SetText(strName);
		controlTable.PlayerCivNameText:SetText("[ICON_BULLET]" .. srCivName);
		controlTable.PlayerLeaderNameText:SetText("[ICON_BULLET]" .. strLeaderName);
		controlTable.RightInfoStack:ReprocessAnchoring()
	end
	
	Controls.PlayerListStack:CalculateSize();
	Controls.PlayerListStack:ReprocessAnchoring();
	Controls.PlayerListScrollPanel:CalculateInternalSize();
end
Controls.WorldCivsButton:RegisterCallback( Mouse.eLClick, OnWorldCivsListUpdated );
LuaEvents.JFD_OpenWorldCivsInterface.Add(OnWorldCivsListUpdated)
-------------------------------------------------
-------------------------------------------------
function OnWorldCivsListClose()
	Controls.WorldCivsList:SetHide(true)
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnWorldCivsListClose );

-------------------------------------------------
-------------------------------------------------
function OnOpenInfoCorner( iInfoType )
    -- show if it's our id and we're not already visible
    if( iInfoType == InfoCornerID.Civilization ) then
        ContextPtr:SetHide( false );
    else
        ContextPtr:SetHide( true );
    end
end
Events.OpenInfoCorner.Add( OnOpenInfoCorner );

-------------------------------------------------
-------------------------------------------------
function OnChangeEvent()
	if( ContextPtr:IsHidden() == false ) then
		OnCivPanelUpdated();
	end
end
Events.SerialEventGameDataDirty.Add( OnChangeEvent );
Events.SerialEventCityInfoDirty.Add( OnChangeEvent );
Events.GameplaySetActivePlayer.Add( OnChangeEvent );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnPopup( popupInfo )	
    if( (popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CHOOSETECH or popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CHOOSE_TECH_TO_STEAL) and
        ContextPtr:IsHidden() == true ) then
        Events.OpenInfoCorner( InfoCornerID.Civilization );
    end
end
--Events.SerialEventGameMessagePopup.Add( OnPopup );

----------------------------------------------------------------
----------------------------------------------------------------
--function UpdatePlayerData()
--	local playerID = Game.GetActivePlayer();	
--	local player = Players[playerID];
--	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
--	GatherInfoAboutUniqueStuff( civType );
--end

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnCivPanelActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	-- UpdatePlayerData();    
	OnCivPanelUpdated();
end
Events.GameplaySetActivePlayer.Add(OnCivPanelActivePlayerChanged);

-- UpdatePlayerData();    
OnCivPanelUpdated();
