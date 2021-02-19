--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,			TraitOne,					TraitTwo)
VALUES      ('LEADER_TCM_GHAZAN',	'POLICY_AGGRESSIVE_X',		'POLICY_IMPERIALISTIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Ghazan [ICON_WAR][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_TCM_GHAZAN' END) 
WHERE Type = 'LEADER_TCM_GHAZAN';

CREATE TRIGGER CivIVTraitsTCMIlkhanate
AFTER INSERT ON Leaders WHEN 'LEADER_TCM_GHAZAN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Ghazan [ICON_WAR][ICON_CITY_STATE]'
		ELSE 'TXT_KEY_LEADER_TCM_GHAZAN' END) 
	WHERE Type = 'LEADER_TCM_GHAZAN';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_MONGOL' )
	THEN '_MONGOL'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_TCM_ILKHANATE';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	44,		56,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	76,		52,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	47,		21,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	63,		39,		null,	null);
--==========================================================================================================================
-- Civilizations_MesopotamiaStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	52,		46,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ILKHANATE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ILKHANATE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ILKHANATE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ILKHANATE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,					CultureType,	CultureEra)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	'ASIAN',		'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,				CultureType,	SplashScreenTag, SoundtrackTag)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	'JFD_Steppe', 	'JFD_Steppe',	 'JFD_Steppe');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Steppe')
	THEN 'JFD_Steppe'
	ELSE 'MONGOL' END) 
WHERE Type = 'CIVILIZATION_TCM_ILKHANATE';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 			ColonyName,		LinguisticType)
VALUES		('CIVILIZATION_TCM_ILKHANATE',	null,			'JFD_Altaic');
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_MONGOL',			'CIVILIZATION_TCM_ILKHANATE'),
			('CIVILIZATION_TCM_ILKHANATE',	'CIVILIZATION_PERSIA');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
------------------------------					
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_TCM_GHAZAN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcmIlkhanateDecisions.lua');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('tcmIlkhanateEvents.lua');
--==========================================================================================================================
--==========================================================================================================================