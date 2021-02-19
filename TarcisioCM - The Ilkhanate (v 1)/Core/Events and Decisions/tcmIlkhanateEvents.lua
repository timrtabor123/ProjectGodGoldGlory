local civilisationID = GameInfoTypes["CIVILIZATION_TCM_ILKHANATE"]
--------------------------------------------------------------------------------------------------------------------------
-- Origins
--------------------------------------------------------------------------------------------------------------------------
local Event_TCMIlkhanateObservatory = {}
	Event_TCMIlkhanateObservatory.Name = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY"
	Event_TCMIlkhanateObservatory.Desc = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_DESC"
	Event_TCMIlkhanateObservatory.Weight = 3
	Event_TCMIlkhanateObservatory.CanFunc = (
		function(player)			
			if load(player, "Event_TCMIlkhanateObservatory") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < 2 then return false end
			return true
		end
		)
	Event_TCMIlkhanateObservatory.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TCMIlkhanateObservatory.Outcomes[1] = {}
	Event_TCMIlkhanateObservatory.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_1"
	Event_TCMIlkhanateObservatory.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_RESULT_1"
	Event_TCMIlkhanateObservatory.Outcomes[1].CanFunc = (
		function(player)	
			Event_TCMIlkhanateObservatory.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_RESULT_1")
			if player:GetGold() < 650 then return false end
			return true
		end
		)
	Event_TCMIlkhanateObservatory.Outcomes[1].DoFunc = (
		function(player) 
			local capital = player:GetCapitalCity()
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_OBSERVATORY"], 1)
			player:ChangeNumFreeGreatPeople(1)
			player:ChangeGold(-650)

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_DESC"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY"))
			save(player, "Event_TCMIlkhanateObservatory", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TCMIlkhanateObservatory.Outcomes[2] = {}
	Event_TCMIlkhanateObservatory.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_2"
	Event_TCMIlkhanateObservatory.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_RESULT_2"
	Event_TCMIlkhanateObservatory.Outcomes[2].CanFunc = (
		function(player)	
			Event_TCMIlkhanateObservatory.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_TCMIlkhanateObservatory.Outcomes[2].DoFunc = (
		function(player) 
			local capital = player:GetCapitalCity()
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_OBSERVATORY"], 1)
			player:ChangeNumFreeGreatPeople(1)
			capital:ChangeResistanceTurns(5)

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_DESC"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY"))
			save(player, "Event_TCMIlkhanateObservatory", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_TCMIlkhanateObservatory.Outcomes[3] = {}
	Event_TCMIlkhanateObservatory.Outcomes[3].Name = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_3"
	Event_TCMIlkhanateObservatory.Outcomes[3].Desc = "TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_RESULT_3"
	Event_TCMIlkhanateObservatory.Outcomes[3].CanFunc = (
		function(player)	
			Event_TCMIlkhanateObservatory.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_TCMIlkhanateObservatory.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID() 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY_DESC"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ILKHANATE_OBSERVATORY"))
			save(player, "Event_TCMIlkhanateObservatory", true)	
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_TCMIlkhanateObservatory", Event_TCMIlkhanateObservatory)	