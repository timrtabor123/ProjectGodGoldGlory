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
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_DECOLONIZATION',			10),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_MERCENARY',					1),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_GOVERNMENT',			5),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_LEGAL',				8),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_CULTURE',			10),		
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_ECONOMIC',			2),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_FOREIGN',			10),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_INDUSTRY',			10),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_MILITARY',			7),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_REFORM_RELIGION',			7),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_SLAVERY',					3),
		('LEADER_GT_FRANCIS_ONA',	'FLAVOR_JFD_STATE_RELIGION',			6);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType,			     Weight)
VALUES  ('CIVILIZATION_GT_BOUGAINVILLE',	'GOVERNMENT_JFD_MONARCHY',	 60);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y,		AltX,  		AltY,  	AltCapitalName)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE',	'AfriAsiaAust',			124,	31, 	null,	null,	null),
		('CIVILIZATION_GT_BOUGAINVILLE',	'AustralasiaGiant',		98,		78,     null,	null,	null),
		('CIVILIZATION_GT_BOUGAINVILLE',	'Australia',			68,		78,		null,	null,	null),
		('CIVILIZATION_GT_BOUGAINVILLE',	'EastAsia',				77,		7,		null,	null,	null),
		('CIVILIZATION_GT_BOUGAINVILLE',	'GreatestEarth',		100,	22,		null,	null,	null),							
		('CIVILIZATION_GT_BOUGAINVILLE',	'Pacific',				51,		25,		null,	null,	null),
		('CIVILIZATION_GT_BOUGAINVILLE',	'Cordiform',			74,		20,		null,	null,	null),
		('CIVILIZATION_GT_BOUGAINVILLE',	'Yagem',				105,	39,		null,	null,	null),
		('CIVILIZATION_GT_BOUGAINVILLE',	'Yahem',				122,	37,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GT_BOUGAINVILLE',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_CultureTypes(
	CivilizationType 					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType 						text											default null,
	SubCultureType 						text											default null,
	ArtDefineTag						text											default	null,
	DecisionsTag						text											default	null,
	DefeatScreenEarlyTag				text											default	null,
	DefeatScreenMidTag					text											default	null,
	DefeatScreenLateTag					text											default	null,
	IdealsTag							text											default	null,
	SplashScreenTag						text											default	null,
	SoundtrackTag						text											default	null,
	UnitDialogueTag						text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_GT_BOUGAINVILLE',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Pacific'
WHERE Type = 'CIVILIZATION_GT_BOUGAINVILLE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Pacific')
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
		(Type,				Header,								Description)
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
		(Type,						ModName,							ModID,							  Authors)
VALUES	('MOD_GT_BOUGAINVILLE',	'TXT_KEY_MOD_GT_BOUGAINVILLE_NAME',	'TXT_KEY_MOD_GT_BOUGAINVILLE_MODID',	'TXT_KEY_MOD_GT_BOUGAINVILLE_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Achievopedia			text							default null,
	Header					text							default	null,	
	IconAtlas				text						default	null,	
	PortraitIndex			integer							default	0,
	ModType					text							default	null,	
	ModVersion				integer							default	0,
	Unlocked				boolean							default	0,
	LockedIconAtlas			text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex		integer							default	23,
	UnlockSound				text							default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration			integer							default	-1,
	Hidden					boolean							default	0,
	HiddenBorder			boolean							default	0,
	RequiredCivWin			text							default	null,
	RequiredCivLoss			text							default	null,
	RequiredCivKill			text							default	null);

INSERT INTO AdditionalAchievements
		(Type,							Header,											Achievopedia,								ModType,				ModVersion,		RequiredCivWin,						IconAtlas,					PortraitIndex)
VALUES	('AA_GT_BOUGAINVILLE_SPECIAL',	'TXT_KEY_AA_GT_BOUGAINVILLE_SPECIAL_HEADER',	'TXT_KEY_AA_GT_BOUGAINVILLE_SPECIAL_TEXT',	'MOD_GT_BOUGAINVILLE',	1,				null,								'GT_BOUGAINVILLE_ATLAS',	 0),
		('AA_GT_BOUGAINVILLE_VICTORY',	'TXT_KEY_AA_GT_BOUGAINVILLE_VICTORY_HEADER',	'TXT_KEY_AA_GT_BOUGAINVILLE_VICTORY_TEXT',	'MOD_GT_BOUGAINVILLE',	1,				'CIVILIZATION_GT_BOUGAINVILLE',	'GT_BOUGAINVILLE_ATLAS',	 0);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text		default	null,
	TabType					text		default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,				TabType)
VALUES	('AA_GT_BOUGAINVILLE_SPECIAL',	'TAB_AA_GT'),
		('AA_GT_BOUGAINVILLE_VICTORY',	'TAB_AA_GT');
--==========================================================================================================================
--==========================================================================================================================