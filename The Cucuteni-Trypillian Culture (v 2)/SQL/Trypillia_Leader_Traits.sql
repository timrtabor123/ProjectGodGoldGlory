
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_VENERA',	 'POLICY_PROTECTIVE_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PROTECTIVE_X' )
	THEN 'Venera [ICON_STRENGTH][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_VENERA' END) 
WHERE Type = 'LEADER_VENERA';

CREATE TRIGGER CivIVTraitsRTrypillia
AFTER INSERT ON Leaders WHEN 'LEADER_VENERA' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_SPIRITUAL_X' )
		THEN 'Venera [ICON_STRENGTH][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_VENERA' END) 
	WHERE Type = 'LEADER_VENERA';
END;	