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
       (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_JFD_JUSTINIAN',	'POLICY_CHARISMATIC_X',	'POLICY_IMPERIALISTIC_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--------------------------------------------------------------------------------------------------------------------------	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Leaders 
SET Description = 'Justinian I [ICON_HAPPINESS_1][ICON_CITY_STATE]'
WHERE Type = 'LEADER_JFD_JUSTINIAN'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- COMMUNITY
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_BYZANTIUM'
WHERE Type = 'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_BYZANTIUM');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix, X, Y, AltX, AltY, CapitalName, AltCapitalName)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	MapPrefix, X, Y, AltX, AltY, CapitalName, AltCapitalName
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType, CultureEra)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_BYZANTIUM';
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('BUILDING_JFD_BYZANTIUM_JUSTINIAN_BARRACKS'),
		('BUILDING_JFD_BYZANTIUM_JUSTINIAN_CHANCERY'),
		('BUILDING_JFD_BYZANTIUM_JUSTINIAN_COURTHOUSE'),
		('BUILDING_JFD_BYZANTIUM_JUSTINIAN_M_COURT'),
		('BUILDING_JFD_BYZANTIUM_JUSTINIAN_TEMPLE');
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
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_DECOLONIZATION',			5),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_MERCENARY',					7),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_GOVERNMENT',			7),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_LEGAL',				8),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_CULTURE',			5),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_ECONOMIC',			5),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_FOREIGN',			7),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_INDUSTRY',			5),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_MILITARY',			7),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_REFORM_RELIGION',			7),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_SLAVERY',					3),
		('LEADER_JFD_JUSTINIAN',	'FLAVOR_JFD_STATE_RELIGION',			6);
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
		(CivilizationType, 							InventionType, 	InventionPreference)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN', 	InventionType,	InventionPreference
FROM Civilization_JFD_Inventions WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
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
SELECT	'BUILDING_JFD_HIPPODROME',		'AS2D_BUILDING_JFD_HIPPODROME'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--====================================	
-- JFD COLONIES
--====================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 								text 	REFERENCES Civilizations(Type) 	default null,
	ColonyName 										text									default null,
	LinguisticType									text									default	null,
	CultureType										text									default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 							ColonyName,										  LinguisticType)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	null,											  'JFD_Hellenic'),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_01', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_02', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_03', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_04', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_05', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_06', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_07', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_08', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_09', null),
		('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_JUSTINIAN_10', null);
--====================================
-- JFD PROVINCES 
--====================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,						DefaultTitle, UniqueTitle)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	DefaultTitle, UniqueTitle
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	SubCultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DecisionsTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_EasternByzantine'
WHERE Type = 'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_EasternByzantine');
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- SOVEREIGNTY
--====================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  		text 	REFERENCES Civilizations(Type) 				default null,
	LegislatureName			text												default	null,
	OfficeTitle				text												default	null,
	GovernmentType			text												default	null,
	Weight					integer												default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,							LegislatureName,														OfficeTitle,																	GovernmentType, 			Weight)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'GOVERNMENT_JFD_MONARCHY', 	80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  		text 	REFERENCES Civilizations(Type) 				default null,
	HeadOfGovernmentName	text 	 											default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      					HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_1'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_2'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_3'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_4'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_5'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_6'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_7'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_8'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_9'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_10'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_11'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_12'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_13'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_14'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_15'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_16'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_17'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_18'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_19'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_20'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_21'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_22'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_23'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_24'),
        ('CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN_25');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  		text 	REFERENCES Civilizations(Type) 				default null,
	ReligionType			text 	REFERENCES Religions(Type) 					default null,
	DefaultTitle			text 		 										default null,
	UniqueTitle				text 		 										default null,
	UseAdjective			boolean												default 0);	

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,						DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Politics
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 			default null,
	PoliticsType  			text 												default null,
	UniqueName				text												default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,						PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  	text 												default null,
	PolicyType  			text 												default null,
	CivilizationType		text												default	null,
	CultureType				text												default	null,
	GovernmentType  		text 												default null,
	ReligionType			text												default	null,
	UniqueName				text												default	null);
	
INSERT INTO JFD_PrivyCouncillor_UniqueNames
		(CivilizationType,						PrivyCouncillorType, UniqueName)
SELECT	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',	PrivyCouncillorType, UniqueName
FROM JFD_PrivyCouncillor_UniqueNames WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 			default	null,
	ReformType						text										default	null);
	
INSERT INTO Leader_JFD_Reforms
		(LeaderType,				ReformType)
VALUES	('LEADER_JFD_JUSTINIAN',	'REFORM_JFD_SYSTEM_CIVIL'),
		('LEADER_JFD_JUSTINIAN',	'REFORM_JFD_HERALDRY_MILITARY'),
		('LEADER_JFD_JUSTINIAN',	'REFORM_JFD_RECRUITMENT_PROFESSIONAL'),
		('LEADER_JFD_JUSTINIAN',	'REFORM_JFD_WEAPONS_LOCAL');
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_EE_IMPERIALISM', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CUIRASSIER'
WHERE Type = 'UNIT_BYZANTINE_CATAPHRACT'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ByzantiumJustinian_Decisions.lua');
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policies
		(Type,														Description)
VALUES	('POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_CODE',			'TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_CODE'),
		('POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME',			'TXT_KEY_DECISIONS_JFD_BYZANTIUM_JUSTINIAN_ROME');
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 												BuildingClassType,				YieldType,			YieldChange)
VALUES	('POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME', 			'BUILDINGCLASS_BARRACKS',		'YIELD_CULTURE',	2),
		('POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME', 			'BUILDINGCLASS_COURTHOUSE',		'YIELD_CULTURE',	2),
		('POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME', 			'BUILDINGCLASS_TEMPLE',			'YIELD_CULTURE',	2);

DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 												BuildingClassType,				YieldType,						YieldChange)
SELECT	'POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME', 			BuildingClass,					'YIELD_GOLDEN_AGE_POINTS',		3
FROM Buildings WHERE Type IN ('BUILDING_BARRACKS', 'BUILDING_COURTHOUSE', 'BUILDING_TEMPLE')
AND EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_GOLDEN_AGE_POINTS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CivilizationNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_CivilizationNames (
	PolicyType								text 	REFERENCES Policies(Type) 				default null,
	CivilizationType						text 	REFERENCES Civilizations(Type) 			default null,
	Description								text 											default null,
	ShortDescription						text 											default null,
	Adjective								text 											default null);
	
INSERT INTO Policy_JFD_CivilizationNames 	
		(PolicyType, 											CivilizationType,								Adjective,						Description,				ShortDescription)
VALUES	('POLICY_DECISONS_JFD_BYZANTIUM_JUSTINIAN_ROME',		'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',			'TXT_KEY_CIV_ROME_ADJECTIVE',	'TXT_KEY_CIV_ROME_DESC',	'TXT_KEY_CIV_ROME_SHORT_DESC');
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO BuildingClasses 	
		(Type, 						 							DefaultBuilding, 								Description)
SELECT	'BUILDINGCLASS_JFD_BYZANTIUM_JUSTINIAN_CHANCERY',		'BUILDING_JFD_BYZANTIUM_JUSTINIAN_CHANCERY',	Description
FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_JFD_CHANCERY';

INSERT INTO BuildingClasses 	
		(Type, 						 							DefaultBuilding, 								Description)
SELECT	'BUILDINGCLASS_JFD_BYZANTIUM_JUSTINIAN_M_COURT',		'BUILDING_JFD_BYZANTIUM_JUSTINIAN_M_COURT',		Description
FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_JFD_MAGISTRATE_COURT';
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 						 					BuildingClass,											Cost, FaithCost, GoldMaintenance, PrereqTech,	SpecialistCount, SpecialistType, Description, Help, NeverCapture, ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_CHANCERY', 	'BUILDINGCLASS_JFD_BYZANTIUM_JUSTINIAN_CHANCERY',		Cost, FaithCost, GoldMaintenance, null,			SpecialistCount, SpecialistType, Description, Help,	1,			  ArtDefineTag, PortraitIndex, IconAtlas
FROM Buildings WHERE Type = 'BUILDING_JFD_CHANCERY';																										 
																																							 
INSERT INTO Buildings 																																		 
		(Type, 						 					BuildingClass,											Cost, FaithCost, GoldMaintenance, PrereqTech,	SpecialistCount, SpecialistType, Description, Help, NeverCapture, ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_M_COURT', 	'BUILDINGCLASS_JFD_BYZANTIUM_JUSTINIAN_M_COURT',		Cost, FaithCost, GoldMaintenance, null,			SpecialistCount, SpecialistType, Description, Help,	1,			  ArtDefineTag, PortraitIndex, IconAtlas
FROM Buildings WHERE Type = 'BUILDING_JFD_MAGISTRATE_COURT';
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 	
		(BuildingType, 									FlavorType,		Flavor)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_CHANCERY',	FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_JFD_CHANCERY';

INSERT INTO Building_Flavors 	
		(BuildingType, 									FlavorType,		Flavor)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_M_COURT',		FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_JFD_MAGISTRATE_COURT';
--------------------------------------------------------------------------------------------------------------------------	
-- Policy_BuildingClassProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_BuildingClassProductionModifiers 	
		(BuildingClassType, 							PolicyType,		ProductionModifier)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_CHANCERY',	PolicyType,		ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE BuildingClassType = 'BUILDINGCLASS_CHANCERY';

INSERT INTO Policy_BuildingClassProductionModifiers 	
		(BuildingClassType, 							PolicyType,		ProductionModifier)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_M_COURT',		PolicyType,		ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE BuildingClassType = 'BUILDINGCLASS_MAGISTRATE_COURT';
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Building_JFD_HelpTexts (
    BuildingType			text    REFERENCES Buildings(Type)			default null,
    CivilizationType		text    REFERENCES Civilizations(Type)		default null,
	HelpText				text										default null,
	IsWrittenFirst			boolean										default 0,
	NotOnceBuilt			boolean										default 0);

INSERT INTO Building_JFD_HelpTexts 																																		 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_BARRACKS', 							'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_BASE_HELP',	1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_BARRACKS');

INSERT INTO Building_JFD_HelpTexts 																																		 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_JFD_CHANCERY', 						'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_BASE_HELP',	1	
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_CHANCERY');

INSERT INTO Building_JFD_HelpTexts 																																		 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_COURTHOUSE', 							'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_BASE_HELP',	1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE');

INSERT INTO Building_JFD_HelpTexts 																																		 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_JFD_MAGISTRATE_COURT', 				'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_BASE_HELP',	1	
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_MAGISTRATE_COURT');

INSERT INTO Building_JFD_HelpTexts 																																		 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_TEMPLE',								'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_BASE_HELP',	1	
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_TEMPLE');

INSERT INTO Building_JFD_HelpTexts 																																		 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_BARRACKS', 	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_HELP'	,		1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_BARRACKS');

INSERT INTO Building_JFD_HelpTexts 																																			 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_CHANCERY', 	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_HELP'	,		1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_CHANCERY');

INSERT INTO Building_JFD_HelpTexts 																																			 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_COURTHOUSE', 	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_HELP'	,		1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE');

INSERT INTO Building_JFD_HelpTexts 																																			 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_M_COURT', 	'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_HELP'	,		1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_MAGISTRATE_COURT');

INSERT INTO Building_JFD_HelpTexts 																																			 
		(BuildingType, 						 			CivilizationType,							HelpText,												NotOnceBuilt)
SELECT	'BUILDING_JFD_BYZANTIUM_JUSTINIAN_TEMPLE',		'CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN',		'TXT_KEY_BUILDING_JFD_BYZANTIUM_JUSTINIAN_HELP',		1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_TEMPLE');
--==========================================================================================================================
--==========================================================================================================================