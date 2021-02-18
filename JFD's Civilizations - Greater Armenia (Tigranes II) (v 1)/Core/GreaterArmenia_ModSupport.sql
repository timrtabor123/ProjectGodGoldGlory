--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,            TraitOne,				TraitTwo)
SELECT  'LEADER_JFD_TIGRANES_II',  'POLICY_AGGRESSIVE_X',	'POLICY_DEFENSIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--------------------------------------------------------------------------------------------------------------------------	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Leaders 
SET Description = 'Tigranes [ICON_WAR][ICON_STRENGTH]'
WHERE Type = 'LEADER_JFD_TIGRANES_II'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_PERSIA'
WHERE Type = 'CIVILIZATION_JFD_GREATER_ARMENIA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_PERSIA');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA',	'AfriAsiaAust',			56,		76),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'AfriSouthEuro',		64,		70),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'AsiaSteppeGiant',		5,		19),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'Caucasus',				110,	33),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'Cordiform',			49,		26),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'GreatestEarth',		63,		45),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'EarthMk3',				44,		57),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'EuroGiant',			144,	33),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'EuroLarge',			69,		29),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'EuroLargeNew',			76,		23),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'MediterraneanHuge',	86,		64),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'Mediterranean',		102,	47),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'MesopotamiaGiant',		120,	86),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'Mesopotamia',			41,		48),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'RussiaLarge',			1,		7),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'Yagem',				41,		58),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'Yahem',				75,		53);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType, 							CultureType, CultureEra)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 	text 	  default null,
	Value 	integer   default 1);
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
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
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_DECOLONIZATION',			3),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_MERCENARY',					8),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_GOVERNMENT',			6),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_LEGAL',				6),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_CULTURE',			6),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_ECONOMIC',			5),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_FOREIGN',			7),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_INDUSTRY',			4),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_MILITARY',			7),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_REFORM_RELIGION',			5),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_SLAVERY',					5),
		('LEADER_JFD_TIGRANES_II',	'FLAVOR_JFD_STATE_RELIGION',			5);
--====================================	
-- INVENTIONS 
--====================================	
-- Civilization_JFD_Inventions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_Inventions (
	CivilizationType  					text 	REFERENCES Civilizations(Type) 		default null,
	InventionType  						text 		 								default null,
	InventionPreference					text 		 								default null);
	
INSERT INTO Civilization_JFD_Inventions
		(CivilizationType, 						InventionType, 	InventionPreference)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA', 	InventionType,	InventionPreference
FROM Civilization_JFD_Inventions WHERE CivilizationType = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Building_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Building_ConstructionAudio (
    BuildingType						text		REFERENCES Buildings(Type)      default null,
    ConstructionAudio					text										default null);
	
INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_JFD_SIEGE_WORKSHOP',	'AS2D_BUILDING_JFD_WORKSHOP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--====================================	
-- JFD COLONIES
--====================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,					LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--====================================	
-- JFD DEVELOPMENT
--====================================	
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	ReligionType  						text 		REFERENCES Religions(Type) 			default null,
	DefaultTitle						text 		 									default null,
	UniqueTitle							text 		 									default null,
	UseAdjective						boolean											default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,						DefaultTitle,								UniqueTitle)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC',			'TXT_KEY_PROVINCE_JFD_BARONY_DESC_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC',			'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC',			'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_JFD_GREATER_ARMENIA');
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType 					text														default null,
	SubCultureType 					text														default null,
	ArtDefineTag					text														default	null,
	DecisionsTag					text														default	null,
	DefeatScreenEarlyTag			text														default	null,
	DefeatScreenMidTag				text														default	null,
	DefeatScreenLateTag				text														default	null,
	IdealsTag						text														default	null,
	SplashScreenTag					text														default	null,
	SoundtrackTag					text														default	null,
	UnitDialogueTag					text														default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, 				DefeatScreenMidTag, 				DefeatScreenLateTag, 				IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, 'DefeatScreenGreaterArmenia.dds', 	'DefeatScreenGreaterArmenia.dds', 	'DefeatScreenGreaterArmenia.dds', 	IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Iranian'
WHERE Type = 'CIVILIZATION_JFD_GREATER_ARMENIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Iranian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD SOVEREIGNTY
--====================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	LegislatureName						text											default	null,
	OfficeTitle							text											default	null,
	GovernmentType						text											default	null,
	Weight								integer											default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,						LegislatureName,									OfficeTitle,												GovernmentType,				Weight)
VALUES  ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_LEGISLATURE_NAME_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_JFD_GREATER_ARMENIA',	'GOVERNMENT_JFD_MONARCHY',	80);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType							text 		 									default null,
	HeadOfGovernmentName				text 		 									default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      				HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_1'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_2'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_3'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_4'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_5'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_6'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_7'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_8'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_9'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_10'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_11'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_12'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_13'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_14'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_15'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_16'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_17'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_18'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_19'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_20'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_21'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_22'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_23'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_24'),
        ('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_GREATER_ARMENIA_25');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType							text 		 									default null,
	ReligionType						text 		REFERENCES Religions(Type) 			default null,
	DefaultTitle						text 		 									default null,
	UniqueTitle							text 		 									default null,
	UseAdjective						boolean											default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,						DefaultTitle,												UniqueTitle, 																UseAdjective)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER',				'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_JFD_GREATER_ARMENIA',			0),	
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_JFD_GREATER_ARMENIA',		0),	
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',				'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_JFD_GREATER_ARMENIA',			0),	
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER',				'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER_JFD_GREATER_ARMENIA',			0),	
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',				'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_JFD_GREATER_ARMENIA',			0),	
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE',		'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_LATE_TITLE_LEADER_JFD_GREATER_ARMENIA',	0),	
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_JFD_GREATER_ARMENIA',		0);
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	PoliticsType  						text 											default null,
	UniqueName							text											default	null);
	
INSERT INTO Civilization_JFD_Politics
		(CivilizationType,						PoliticsType, 				UniqueName)                                    
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA',	'ASSEMBLY_JFD_MILITARY',	'TXT_KEY_JFD_ASSEMBLY_JFD_MILITARY_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'FACTION_JFD_NATIONALIST',	'TXT_KEY_JFD_FACTION_JFD_NATIONALIST_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'FACTION_JFD_POPULARIST',	'TXT_KEY_JFD_FACTION_JFD_POPULARIST_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_BURGHERS',		'TXT_KEY_JFD_PARTY_JFD_BURGHERS_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_CLERGY',			'TXT_KEY_JFD_PARTY_JFD_CLERGY_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_NOBILITY',		'TXT_KEY_JFD_PARTY_JFD_NOBILITY_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_CONSERVATIVE',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_LIBERAL',		'TXT_KEY_JFD_PARTY_JFD_LIBERAL_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_REACTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REACTIONARY_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_SOCIALIST',		'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_COMMUNIST',		'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_FASCIST',		'TXT_KEY_JFD_PARTY_JFD_FASCIST_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_JFD_GREATER_ARMENIA');
------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  				text 										 	default null,
	PolicyType  						text 	REFERENCES Policies(Type) 				default null,
	CivilizationType					text	REFERENCES Civilizations(Type) 			default	null,
	CultureType							text											default	null,
	GovernmentType  					text 	 										default null,
	ReligionType						text	REFERENCES Religions(Type) 				default	null,
	UniqueName							text											default	null);

INSERT INTO JFD_PrivyCouncillor_UniqueNames	
		(CivilizationType,						PrivyCouncillorType,			UniqueName)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA',	'COUNCILLOR_JFD_CHANCELLOR',	'TXT_KEY_COUNCILLOR_JFD_CHANCELLOR_DESC_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'COUNCILLOR_JFD_CHAPLAIN',		'TXT_KEY_COUNCILLOR_JFD_CHAPLAIN_DESC_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'COUNCILLOR_JFD_MARSHAL',		'TXT_KEY_COUNCILLOR_JFD_MARSHAL_DESC_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'COUNCILLOR_JFD_HERALD',		'TXT_KEY_COUNCILLOR_JFD_HERALD_DESC_JFD_GREATER_ARMENIA'),
		('CIVILIZATION_JFD_GREATER_ARMENIA',	'COUNCILLOR_JFD_STEWARD',		'TXT_KEY_COUNCILLOR_JFD_STEWARD_DESC_JFD_GREATER_ARMENIA');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  						text 	REFERENCES Leaders(Type) 				default	null,
	ReformType							text											default	null);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Civs_GreaterArmenia_Decisions.lua');
--------------------------------------------------------------------------------------------------------------------------	
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policies	
		(Type,													Description)
VALUES	('POLICY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE',	'TXT_KEY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE');
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassHappiness
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType,											BuildingClassType,				Happiness)
VALUES	('POLICY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE',	'BUILDINGCLASS_AMPHITHEATER',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType, 											BuildingClassType,	ProductionModifier)
SELECT	'POLICY_DECISIONS_JFD_GREATER_ARMENIA_GREEK_THEATRE', 	Type,				10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_AMPHITHEATER');
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
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
VALUES	('TAB_JFD_JFDLC',	'TXT_KEY_TAB_JFD_JFDLC_HEADER',		'TXT_KEY_TAB_JFD_JFDLC_DESC');
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
		(Type,						ModName,								ModID,										Authors)
VALUES	('MOD_JFD_GREATER_ARMENIA',	'TXT_KEY_MOD_JFD_GREATER_ARMENIA_NAME',	'TXT_KEY_MOD_JFD_GREATER_ARMENIA_MODID',	'TXT_KEY_MOD_JFD_GREATER_ARMENIA_AUTHORS');
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
		(Type,								Header,												Achievopedia,									ModType,					ModVersion,		RequiredCivWin,						IconAtlas,							 		PortraitIndex)
VALUES	('AA_JFD_GREATER_ARMENIA_SPECIAL',	'TXT_KEY_AA_JFD_GREATER_ARMENIA_SPECIAL_HEADER',	'TXT_KEY_AA_JFD_GREATER_ARMENIA_SPECIAL_TEXT',	'MOD_JFD_GREATER_ARMENIA',	1,				null,								'JFD_GREATER_ARMENIA_ACHIEVEMENT_ATLAS',	 0),
		('AA_JFD_GREATER_ARMENIA_VICTORY',	'TXT_KEY_AA_JFD_GREATER_ARMENIA_VICTORY_HEADER',	'TXT_KEY_AA_JFD_GREATER_ARMENIA_VICTORY_TEXT',	'MOD_JFD_GREATER_ARMENIA',	1,				'CIVILIZATION_JFD_GREATER_ARMENIA',	'JFD_GREATER_ARMENIA_ACHIEVEMENT_ATLAS',	 0);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text		default	null,
	TabType					text		default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,					TabType)
VALUES	('AA_JFD_GREATER_ARMENIA_SPECIAL',	'TAB_JFD_JFDLC'),
		('AA_JFD_GREATER_ARMENIA_VICTORY',	'TAB_JFD_JFDLC');
--==========================================================================================================================
--==========================================================================================================================