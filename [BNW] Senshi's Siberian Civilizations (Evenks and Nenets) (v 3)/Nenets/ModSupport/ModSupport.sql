--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SENSHI_NENETS',	46,	86);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SENSHI_NENETS',	81, 72);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Cordiform)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SENSHI_NENETS',	43, 43);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_SENSHI_NENETS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_SENSHI_NENETS',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
        ( CASE WHEN EXISTS(SELECT TYPE FROM Religions WHERE TYPE='RELIGION_SAMAN' )
                THEN 'RELIGION_SAMAN'
                ELSE 'RELIGION_TENGRIISM' END
        ) WHERE CivilizationType = 'CIVILIZATION_SENSHI_NENETS';
 
CREATE TRIGGER NenetsReligion
AFTER INSERT ON Religions WHEN 'RELIGION_SAMAN' = NEW.TYPE
BEGIN
        UPDATE Civilization_Religions
        SET ReligionType = 'RELIGION_SAMAN'
        WHERE CivilizationType IN ('CIVILIZATION_SENSHI_NENETS');
END;
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_MONGOL'
WHERE Type = 'CIVILIZATION_SENSHI_NENETS'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_MONGOL');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_SENSHI_NENETS',	CultureType,	CultureEra
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                             text     REFERENCES Civilizations(Type)             default null,
    CultureType                                 text                                            default null,
    ArtDefineTag                                text                                            default    null,
    DefeatScreenEarlyTag                        text                                            default    null,
    DefeatScreenMidTag                            text                                            default    null,
    DefeatScreenLateTag                            text                                            default    null,
    IdealsTag                                    text                                            default    null,
    SplashScreenTag                                text                                            default    null,
    SoundtrackTag                                text                                            default    null,
    UnitDialogueTag                                text                                            default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType,	 IdealsTag,		SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SENSHI_NENETS',	'JFD_Polar', 'JFD_Polar', 'JFD_Polar',	'JFD_Polar',	 'JFD_Polar', UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Polar'
WHERE Type = 'CIVILIZATION_SENSHI_NENETS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Polar')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,						FlavorType,					Flavor)
VALUES	('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_MERCENARY',		7);
--==========================================================================================================================	
-- JFD PIETY & SOVEREIGNTY
--==========================================================================================================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,			LegislatureName,											OfficeTitle,														GovernmentType,				Weight)
SELECT	'CIVILIZATION_SENSHI_NENETS',	LegislatureName,	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SENSHI_NENETS',	'GOVERNMENT_JFD_THEOCRACY',	80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
VALUES  ('CIVILIZATION_SENSHI_NENETS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SENSHI_NENETS_1'),
        ('CIVILIZATION_SENSHI_NENETS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SENSHI_NENETS_2'),
        ('CIVILIZATION_SENSHI_NENETS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SENSHI_NENETS_3'),
        ('CIVILIZATION_SENSHI_NENETS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SENSHI_NENETS_4'),
        ('CIVILIZATION_SENSHI_NENETS',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SENSHI_NENETS_5');
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_REFORM_CULTURE',		3),
		('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_REFORM_ECONOMIC',		7),
		('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_REFORM_FOREIGN',		9),
		('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_REFORM_INDUSTRY',		8),
		('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_REFORM_MILITARY',		7),
		('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_REFORM_RELIGION',		8),
		('LEADER_SENSHI_VAVLYO',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	8);
--==========================================================================================================================
-- JFD PROSPERITY
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies	
		(CivilizationType,			CurrencyType)
SELECT	'CIVILIZATION_SENSHI_NENETS',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_SENSHI_SAMOYED',	'PROMOTION_JFD_SNOW_IMMUNITY'
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SNOW_IMMUNITY');
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,            TraitOne,                    TraitTwo)
SELECT  'LEADER_SENSHI_VAVLYO',     'POLICY_SPIRITUAL_X',    'POLICY_AGGRESSIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Vavlyo [ICON_PEACE][ICON_WAR]'
WHERE Type = 'LEADER_SENSHI_VAVLYO'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_SPIRITUAL_X');