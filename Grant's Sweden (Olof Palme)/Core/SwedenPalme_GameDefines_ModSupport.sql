--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
--Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_GT_SWEDEN_PALME';

CREATE TRIGGER ReligionIkeTestTrigger
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANTISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_PROTESTANTISM'
	WHERE CivilizationType IN ('CIVILIZATION_GT_SWEDEN_PALME');
END;
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_DECOLONIZATION',			9),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_MERCENARY',					4),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_GOVERNMENT',			2),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_LEGAL',				4),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_CULTURE',			1),		
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_ECONOMIC',			3),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_FOREIGN',			1),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_INDUSTRY',			5),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_MILITARY',			6),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_REFORM_RELIGION',			3),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_SLAVERY',					0),
		('LEADER_GT_OLOF_PALME',	'FLAVOR_JFD_STATE_RELIGION',			0);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,						GovernmentType,				 Weight)
VALUES  ('CIVILIZATION_GT_SWEDEN_PALME',		'GOVERNMENT_JFD_MONARCHY',	 40);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix, X, Y)
SELECT	'CIVILIZATION_GT_SWEDEN_PALME',	MapPrefix, X, Y
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_SWEDEN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GT_SWEDEN_PALME',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SWEDEN';
--------------------------------------------------------------------------------------------------------------------------	
-- DerivativeCiv
--------------------------------------------------------------------------------------------------------------------------		
UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_AMERICA'
WHERE Type = 'CIVILIZATION_GT_SWEDEN_PALME';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_GT_SWEDEN_PALME',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_GT_SWEDEN_PALME'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- TROLLER Additional ACHIEVEMENTS
--==========================================================================================================================
-- Achievopedia_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Achievopedia_Tabs (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Header					text							default null,
	Description				text							default	null);

INSERT OR REPLACE INTO Achievopedia_Tabs
		(Type,			Header,							Description)
VALUES	('TAB_AA_GT',	'TXT_KEY_TAB_AA_GT_HEADER',		'TXT_KEY_TAB_AA_GT_DESC');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	ModName					text							default null,
	ModID					text							default	null,	
	Authors					text							default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,					ModName,							ModID,									Authors)
VALUES	('MOD_GT_SWEDEN_PALME',	'TXT_KEY_MOD_GT_SWEDEN_PALME_NAME',	'TXT_KEY_MOD_GT_SWEDEN_PALME_MODID',	'TXT_KEY_MOD_GT_SWEDEN_PALME_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Achievopedia			text							default null,
	Header					text							default	null,	
	IconAtlas				text							default	null,	
	PortraitIndex			integer							default	0,
	ModType					text							default	null,	
	ModVersion				integer							default	0,
	Unlocked				boolean							default	0,
	LockedIconAtlas			text							default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex		integer							default	23,
	UnlockSound				text							default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration			integer							default	-1,
	Hidden					boolean							default	0,
	HiddenBorder			boolean							default	0,
	RequiredCivWin			text							default	null,
	RequiredCivLoss			text							default	null,
	RequiredCivKill			text							default	null);

INSERT INTO AdditionalAchievements
		(Type,									Header,												Achievopedia,										ModType,						ModVersion,		RequiredCivWin,							IconAtlas,					PortraitIndex)
VALUES	('AA_GT_SWEDEN_PALME_SPECIAL',	'TXT_KEY_AA_GT_SWEDEN_PALME_SPECIAL_HEADER',	'TXT_KEY_AA_GT_SWEDEN_PALME_SPECIAL_TEXT',	'MOD_GT_SWEDEN_PALME',	1,				null,									'GT_SWEDEN_PALME_ATLAS',	 0),
		('AA_GT_SWEDEN_PALME_VICTORY',	'TXT_KEY_AA_GT_SWEDEN_PALME_VICTORY_HEADER',	'TXT_KEY_AA_GT_SWEDEN_PALME_VICTORY_TEXT',	'MOD_GT_SWEDEN_PALME',	1,				'CIVILIZATION_GT_SWEDEN_PALME',	'GT_SWEDEN_PALME_ATLAS',	 0);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text		default	null,
	TabType					text		default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,						TabType)
VALUES	('AA_GT_SWEDEN_PALME_SPECIAL',	'TAB_AA_GT'),
		('AA_GT_SWEDEN_PALME_VICTORY',	'TAB_AA_GT');
--==========================================================================================================================
--==========================================================================================================================