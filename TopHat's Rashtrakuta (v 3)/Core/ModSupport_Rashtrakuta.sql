--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);
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
(LeaderType,                TraitOne,                  TraitTwo)
SELECT      'LEADER_THP_AMOGHAVARSHA',    'POLICY_PHILOSOPHICAL_X',        'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------
-- Leaders
------------------------------
UPDATE Leaders
SET Description = 'Amoghavarsha I [ICON_GREAT_PEOPLE][ICON_PEACE]'
WHERE Type = 'LEADER_THP_AMOGHAVARSHA'
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
SET ArtStyleSuffix = '_INDIA'
WHERE Type = 'CIVILIZATION_THP_RASHTRAKUTA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_INDIA');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24)
--==========================================================================================================================
-----------------------------------
-- Civilizations_YagemStartPosition
-----------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	60,		41);
-----------------------------------
-- Civilizations_YahemStartPosition
-----------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	90,		40);
---------------------------------------
-- Civilizations_CordiformStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	58,		21);
------------------------------------------
-- Civilizations_GreatestEarthStartPosition
------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	76,		35);
---------------------------------------
-- Civilizations_PacificStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	9,		40);
---------------------------------------
-- Civilizations_AsiaStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	28,		24);
---------------------------------------
-- Civilizations_AfriAsiaAustStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	76,		50);
---------------------------------------
-- Civilizations_IndianOceanStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndianOceanStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	48,		57);
---------------------------------------
-- Civilizations_IndiaGiantStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndiaGiantStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	47,		50);
---------------------------------------
-- Civilizations_SouthAsiaHugeStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAsiaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAsiaHugeStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	44,		25);
------------------------------------------------
-- Civilizations_SoutheastAsiaLargeStartPosition
------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SoutheastAsiaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SoutheastAsiaLargeStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	0,		36);
-----------------------------------
-- Civilizations_IndiaStartPosition
-----------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndiaStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	43,		30);
--------------------------------------
-- Civilizations_EarthMk3StartPosition
--------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EarthMk3StartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EarthMk3StartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	65,		40);
------------------------------------
-- Civilizations_OrientStartPosition
------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_OrientStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_OrientStartPosition
	(Type,					X,		Y)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	116,		20);
-------------------------------------
-- Civilizations_YagemRequestedResource (Earth Giant)
-------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_THP_RASHTRAKUTA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_INDIA';
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
--==========================================================================================================================
--==========================================================	
-- COLONIES
--==========================================================	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 		text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 			text						default null,
	LinguisticType			text						default	null,
	CultureType			text						default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 			ColonyName,	LinguisticType)
VALUES		('CIVILIZATION_THP_RASHTRAKUTA', 	null,		'JFD_Indo_Iranian');
------------------------------------------------------------		
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,		FlavorType,			Flavor)
VALUES	('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_DECOLONIZATION',	7);
--==========================================================
-- PROVINCES 
--==========================================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  			text 		REFERENCES Civilizations(Type)  default null,
	ReligionType  				text 		REFERENCES Religions(Type) 	default null, -- ignore this
	DefaultTitle				text 						default null,
	UniqueTitle				text 						default null,
	UseAdjective				boolean						default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
	(CivilizationType,			DefaultTitle, 				    UniqueTitle, 		   UseAdjective)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_MONARCHY', 'TXT_KEY_PROVINCE_JFD_DUCHY_RASHTRAKUTA', 1),
('CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_MONARCHY', 'TXT_KEY_PROVINCE_JFD_COUNTY_RASHTRAKUTA', 1),
('CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC_MONARCHY', 'TXT_KEY_PROVINCE_JFD_BARONY_RASHTRAKUTA', 1);
--==========================================================	
-- SLAVERY 
--==========================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,		FlavorType,		Flavor)
VALUES	('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_SLAVERY',	4);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 	text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 		text						default null,
	ArtDefineTag		text						default	null,
	DefeatScreenEarlyTag	text						default	null,
	DefeatScreenMidTag	text						default	null,
	DefeatScreenLateTag	text						default	null,
	IdealsTag		text						default	null,
	SplashScreenTag		text						default	null,
	SoundtrackTag		text						default	null,
	UnitDialogueTag		text						default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_THP_RASHTRAKUTA',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_INDIA';
--==========================================================================================================================	
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
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
		(LeaderType,		FlavorType,			Flavor)
VALUES	('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_MERCENARY',		0);
--==========================================================================================================================	
-- JFD's RISE TO POWER (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- PIETY
--==========================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,				Flavor)
VALUES	('LEADER_THP_AMOGHAVARSHA',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	0),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_STATE_RELIGION',		7);
--==========================================================	
-- PROSPERITY
--==========================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  		text 		 				default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_THP_RASHTRAKUTA',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_INDIA';
--==========================================================	
-- INVENTIONS 
--==========================================================	
-- Civilization_JFD_Inventions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Inventions (
	CivilizationType  		text 	REFERENCES Civilizations(Type) 				default null,
	InventionType  			text 		 						default null,
	InventionPreference		text 		 						default null);
	
INSERT INTO Civilization_JFD_Inventions
		(CivilizationType, 		InventionType, 				InventionPreference)
VALUES 	('CIVILIZATION_THP_RASHTRAKUTA', 	'INVENTION_JFD_WRITING',	'WRITING_JFD_BRAHMI'),
	('CIVILIZATION_THP_RASHTRAKUTA', 	'INVENTION_JFD_CURRENCY',	'CURRENCY_JFD_RUPEE'),
	('CIVILIZATION_THP_RASHTRAKUTA', 	'INVENTION_JFD_SOCIETY',	'SOCIETY_JFD_LORDS_AYYAVOLU');	
--==========================================================	
-- SOVEREIGNTY
--==========================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
INSERT INTO Civilization_JFD_Governments
	(CivilizationType, 			GovernmentType,			Weight)
VALUES	('CIVILIZATION_THP_RASHTRAKUTA', 	'GOVERNMENT_JFD_MONARCHY',	80),
	('CIVILIZATION_THP_RASHTRAKUTA',	'GOVERNMENT_JFD_MONASTIC',	55),
	('CIVILIZATION_THP_RASHTRAKUTA',	'GOVERNMENT_JFD_THEOCRATIC',	20);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  			text 	REFERENCES Civilizations(Type) 	default null,
	CultureType				text 					default null,
	HeadOfGovernmentName			text 		 			default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
SELECT  'CIVILIZATION_THP_RASHTRAKUTA',		HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_INDIA';
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 	default null,
	CultureType			text 		 				default null,
	ReligionType			text 		REFERENCES Religions(Type) 	default null,
	DefaultTitle			text 		 				default null,
	UniqueTitle			text 		 				default null,
	UseAdjective			boolean						default 0);	

INSERT INTO Civilization_JFD_Titles
	(CivilizationType,			DefaultTitle,	UniqueTitle,	UseAdjective)
SELECT	'CIVILIZATION_THP_RASHTRAKUTA',		DefaultTitle,	UniqueTitle,	1
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_INDIA';
------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  			text 					default null,
	PolicyType  				text 	REFERENCES Policies(Type) 	default null,
	CivilizationType			text	REFERENCES Civilizations(Type) 	default	null,
	CultureType				text					default	null,
	GovernmentType  			text 	 				default null,
	ReligionType				text	REFERENCES Religions(Type) 	default	null,
	UniqueName				text					default	null);
	
INSERT INTO JFD_PrivyCouncillor_UniqueNames	
	(PrivyCouncillorType,		CivilizationType,		UniqueName)
VALUES	('COUNCILLOR_JFD_CHANCELLOR',	'CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_COUNCILLOR_JFD_CHANCELLOR_DESC_THP_RASHTRAKUTA'),
('COUNCILLOR_JFD_CHAPLAIN',		'CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_COUNCILLOR_JFD_CHAPLAIN_DESC_THP_RASHTRAKUTA'),
('COUNCILLOR_JFD_MARSHAL',		'CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_COUNCILLOR_JFD_MARSHAL_DESC_THP_RASHTRAKUTA'),
('COUNCILLOR_JFD_HERALD',		'CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_COUNCILLOR_JFD_HERALD_DESC_THP_RASHTRAKUTA'),
('COUNCILLOR_JFD_STEWARD',		'CIVILIZATION_THP_RASHTRAKUTA',	'TXT_KEY_COUNCILLOR_JFD_STEWARD_DESC_THP_RASHTRAKUTA');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,				Flavor)
VALUES	('LEADER_THP_AMOGHAVARSHA',		'FLAVOR_JFD_REFORM_GOVERNMENT',		8),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_REFORM_LEGAL',		7),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_REFORM_CULTURE',		7),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_REFORM_ECONOMIC',		3),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_REFORM_FOREIGN',		3),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_REFORM_MILITARY',		1),
		('LEADER_THP_AMOGHAVARSHA',	'FLAVOR_JFD_REFORM_RELIGION',		9);
--=======================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--=======================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_JAIN" )
THEN "RELIGION_JAIN"
ELSE "RELIGION_HINDUISM" END
) WHERE CivilizationType = "CIVILIZATION_THP_RASHTRAKUTA";

CREATE TRIGGER IF NOT EXISTS THP_Rashtrakuta_ReligionInsert
AFTER INSERT ON Religions
WHEN (NEW.Type = 'RELIGION_JAIN')
BEGIN
UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_JAIN'
WHERE CivilizationType = 'CIVILIZATION_THP_RASHTRAKUTA';
END;
--=======================================================================================
-- EVENTS AND DECISIONS
--=======================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);

INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Rashtrakuta_Decisions.lua');

-----------
-- Policies
-----------
INSERT INTO Policies
	(Type,						Description)
VALUES	('POLICY_DECISIONS_THP_RASHTRAKUTA_MAPPILA',	'TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA'),
	('POLICY_DECISIONS_THP_RASHTRAKUTA_TAXATION',	'TXT_KEY_DECISIONS_THP_RASHTRAKUTA_TAXATION');
------------------
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
	(Type,					DefaultBuilding,		Description)
VALUES	('BUILDINGCLASS_THP_MAPPILA_GOLD',	'BUILDING_THP_MAPPILA_GOLD',	'TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA');
------------
-- Buildings
------------
INSERT INTO Buildings
	(Type,                                     BuildingClass,                     SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                         Help,                                  NeverCapture)
VALUES  ('BUILDING_THP_MAPPILA_GOLD',           'BUILDINGCLASS_THP_MAPPILA_GOLD', 0,               -1,             -1,   -1,       'TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA',   'TXT_KEY_DECISIONS_THP_RASHTRAKUTA_MAPPILA_ENACTED_DESC',   1);
--------------------------------
-- Building_ResourceYieldChanges
--------------------------------
INSERT INTO Building_ResourceYieldChanges
	(BuildingType,			ResourceType,		YieldType,	Yield)
VALUES	('BUILDING_THP_MAPPILA_GOLD',	'RESOURCE_HORSE',	'YIELD_GOLD',	2);
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
-- AdditionalAchievements_Mods
------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  				integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text					default	null,
	ModName				text					default null,
	ModID				text					default	null,	
	Authors				text					default	null);

INSERT INTO AdditionalAchievements_Mods
	(Type,			ModName,			ModID,				Authors)
VALUES	('MOD_THP_RASHTRAKUTA', 'TXT_KEY_MOD_THP_RASHTRAKUTA_NAME', 'TXT_KEY_MOD_THP_RASHTRAKUTA_ID_CFC', 'TXT_KEY_MOD_THP_RASHTRAKUTA_AUTHORS');
-------------------------
-- AdditionalAchievements
-------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  			integer 	PRIMARY KEY		AUTOINCREMENT,
	Type			text					default	null,
	Achievopedia		text					default null,
	Header			text					default	null,	
	IconAtlas		text					default	null,	
	PortraitIndex		integer					default	0,
	ModType			text					default	null,	
	ModVersion		integer					default	0,
	Unlocked		boolean					default	0,
	LockedIconAtlas		text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex	integer					default	23,
	UnlockSound		text					default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration		integer					default	-1,
	Hidden			boolean					default	0,
	HiddenBorder		boolean					default	0,
	RequiredCivWin		text					default	null,
	RequiredCivLoss		text					default	null,
	RequiredCivKill		text					default	null);

INSERT INTO AdditionalAchievements
		(Type,			Header,			Achievopedia,		ModType,	ModVersion,		RequiredCivWin,				IconAtlas,		PortraitIndex)
VALUES	('AA_THP_RASHTRAKUTA_SPECIAL',	'TXT_KEY_AA_THP_RASHTRAKUTA_SPECIAL_HEADER',	'TXT_KEY_AA_THP_RASHTRAKUTA_SPECIAL_TEXT',	'MOD_THP_RASHTRAKUTA',	1,				null,					'THP_RASHTRAKUTA_ATLAS',	0),
		('AA_THP_RASHTRAKUTA_VICTORY',	'TXT_KEY_AA_THP_RASHTRAKUTA_VICTORY_HEADER',	'TXT_KEY_AA_THP_RASHTRAKUTA_VICTORY_TEXT',	'MOD_THP_RASHTRAKUTA',	1,				'CIVILIZATION_THP_RASHTRAKUTA',	 'THP_RASHTRAKUTA_ATLAS',	0);
--==========================================================================================================================
-- MISC
--==========================================================================================================================
UPDATE Building_YieldChanges
SET Yield = 0
WHERE YieldType = 'YIELD_JFD_DISEASE'
AND BuildingType LIKE '%_THP_RASHDUMMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Builds
SET Time = null, ChargeCost = 1
WHERE Type = 'BUILD_THP_BASADI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_BUILDERS_CORE' AND Value = 1);

INSERT INTO Unit_Builds 
	(UnitType,		BuildType)
VALUES	('UNIT_JFD_SLAVE',	'BUILD_THP_BASADI')
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);

UPDATE Building_JFD_DevelopmentMods
SET DevelopmentThresholdMod = 0
WHERE BuildingType LIKE '%_THP_RASHDUMMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================