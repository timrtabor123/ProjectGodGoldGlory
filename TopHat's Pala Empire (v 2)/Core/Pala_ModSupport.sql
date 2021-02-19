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
SELECT      'LEADER_THP_DHARMAPALA',    'POLICY_INDUSTRIOUS_X',        'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------
-- Leaders
------------------------------
UPDATE Leaders
SET Description = 'Dharmapala [ICON_PRODUCTION][ICON_PEACE]'
WHERE Type = 'LEADER_THP_DHARMAPALA'
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
WHERE Type = 'CIVILIZATION_THP_PALA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_INDIA');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24)
--==========================================================================================================================
-----------------------------------
-- Civilizations_YagemStartPosition
-----------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	68,		48);
-----------------------------------
-- Civilizations_YahemStartPosition
-----------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	95,		42);
---------------------------------------
-- Civilizations_CordiformStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	60,		25);
------------------------------------------
-- Civilizations_GreatestEarthStartPosition
------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	81,		38);
---------------------------------------
-- Civilizations_EastAsiaStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EastAsiaStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	0,		14);
---------------------------------------
-- Civilizations_PacificStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	19,		46);
---------------------------------------
-- Civilizations_AsiaStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	40,		33);
---------------------------------------
-- Civilizations_AfriAsiaAustStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	85,		55);
---------------------------------------
-- Civilizations_IndianOceanStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndianOceanStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	59,		64);
---------------------------------------
-- Civilizations_IndiaGiantStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndiaGiantStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	85,		73);
---------------------------------------
-- Civilizations_SouthAsiaHugeStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAsiaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAsiaHugeStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	68,		62);
---------------------------------------
-- Civilizations_SoutheastAsiaLargeStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SoutheastAsiaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SoutheastAsiaLargeStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	12,		47);
---------------------------------------
-- Civilizations_EarthMk3StartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EarthMk3StartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EarthMk3StartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	72,		47);
---------------------------------------
-- Civilizations_IndiaStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_IndiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndiaStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	68,		59);
---------------------------------------
-- Civilizations_OrientStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_OrientLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_OrientStartPosition
	(Type,				X,		Y)
VALUES	('CIVILIZATION_THP_PALA',	127,		33);
---------------------------------------
-- Civilizations_YagemRequestedResource
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_THP_PALA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_INDIA';
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT
--==========================================================================================================================
--==========================================================	
-- COLONIES 
--==========================================================	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 						ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_THP_PALA', 			null,									'JFD_Indo_Iranian');
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
		(LeaderType,			     FlavorType,					Flavor)
VALUES	('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_DECOLONIZATION',	7);
--==========================================================	
-- PROVINCES 
--==========================================================	
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null, -- ignore this
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_THP_PALA',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_INDIA';
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
		(LeaderType,			     FlavorType,				Flavor)
VALUES	('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_SLAVERY',		3);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_THP_PALA',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_INDIA';
--==========================================================================================================================	
-- JFD's AND POUAKAI's MERCENARIES
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
		(LeaderType,				 FlavorType,				Flavor)
VALUES	('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_MERCENARY',		8);
--==========================================================================================================================	
-- JFD's RISE TO POWER
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
		(LeaderType,			     FlavorType,							Flavor)
VALUES	('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_STATE_RELIGION',			8);
--==========================================================	
-- PROSPERITY
--==========================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,			CurrencyType)
SELECT	'CIVILIZATION_THP_PALA',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_INDIA';
--==========================================================
-- INVENTIONS
--==========================================================
-- Civilization_JFD_Inventions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Civilization_JFD_Inventions (
CivilizationType                text     REFERENCES Civilizations(Type)         default null,
InventionType                   text                                            default null,
InventionPreference             text                                            default null);

INSERT INTO Civilization_JFD_Inventions
           (CivilizationType,             InventionType,              InventionPreference)
VALUES     ('CIVILIZATION_THP_PALA',     'INVENTION_JFD_WRITING',    'WRITING_JFD_BRAHMI'),
           ('CIVILIZATION_THP_PALA',     'INVENTION_JFD_CURRENCY',   'CURRENCY_JFD_RUPEE'),
           ('CIVILIZATION_THP_PALA',     'INVENTION_JFD_SPORT',      'SPORT_JFD_CRICKET');
--==========================================================	
-- SOVEREIGNTY
--==========================================================
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
		(CivilizationType,				LegislatureName, 											OfficeTitle, 														GovernmentType, 			Weight)
VALUES	('CIVILIZATION_THP_PALA',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_THP_PALA', 	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_THP_PALA', 	'GOVERNMENT_JFD_MONARCHY', 	100);
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
	(CivilizationType,		DefaultTitle,	UniqueTitle,	UseAdjective)
SELECT	'CIVILIZATION_THP_PALA',	DefaultTitle,	UniqueTitle,	1
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_INDIA';
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
		(PrivyCouncillorType,				CivilizationType,							UniqueName)
VALUES ('COUNCILLOR_JFD_CHANCELLOR',		'CIVILIZATION_THP_PALA',	'TXT_KEY_COUNCILLOR_JFD_CHANCELLOR_DESC_THP_PALA'),
    ('COUNCILLOR_JFD_MARSHAL',			    'CIVILIZATION_THP_PALA',	'TXT_KEY_COUNCILLOR_JFD_MARSHAL_DESC_THP_PALA'),
    ('COUNCILLOR_JFD_HERALD',		    	'CIVILIZATION_THP_PALA',    'TXT_KEY_COUNCILLOR_JFD_HERALD_DESC_THP_PALA'),
    ('COUNCILLOR_JFD_STEWARD',	    		'CIVILIZATION_THP_PALA',	'TXT_KEY_COUNCILLOR_JFD_STEWARD_DESC_THP_PALA');
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
		(LeaderType,			     FlavorType,						Flavor)
VALUES	('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		5),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_LEGAL',			6),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_CULTURE',		2),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_ECONOMIC',		3),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_FOREIGN',		2),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_INDUSTRY',		7),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_MILITARY',		7),
		('LEADER_THP_DHARMAPALA',	'FLAVOR_JFD_REFORM_RELIGION',		8);
--=======================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--=======================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_MAHAYANA" )
THEN "RELIGION_MAHAYANA"
ELSE "RELIGION_BUDDHISM" END
) WHERE CivilizationType = "CIVILIZATION_THP_PALA";
--=======================================================================================
-- EVENTS AND DECISIONS
--=======================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);

INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Pala_Decisions.lua');

---------------
-- E&D Policies
---------------
INSERT INTO Policies
	(Type,					Description)
VALUES	('POLICY_DECISIONS_THP_MEDICINE_DUMMY',	'TXT_KEY_DECISIONS_THP_PALA_MEDICINE_ENACTED_DESC'),
	('POLICY_DECISIONS_THP_PALA_REVIVAL',	'TXT_KEY_DECISIONS_THP_PALA_REVIVAL_ENACTED_DESC');

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType,				ImprovementType,	YieldType,	Yield)
VALUES  ('POLICY_DECISIONS_THP_PALA_REVIVAL',	'IMPROVEMENT_ACADEMY',	'YIELD_FAITH',	1);
----------------
-- E&D Buildings
----------------
INSERT INTO BuildingClasses
        (Type,                               		DefaultBuilding,                	Description)
VALUES  ('BUILDINGCLASS_THP_PALA_REVIVAL_DUMMY',	'BUILDING_THP_PALA_REVIVAL_DUMMY',	'TXT_KEY_DECISIONS_THP_PALA_REVIVAL');

INSERT INTO Buildings
(Type,                                   BuildingClass,                        EnhancedYieldTech, TechEnhancedTourism,   SpecialistCount, GreatWorkCount, Cost, FaithCost, PrereqTech,             Description,                         Help,                                  NeverCapture)
VALUES    ('BUILDING_THP_PALA_REVIVAL_DUMMY', 'BUILDINGCLASS_THP_PALA_REVIVAL_DUMMY',     'TECH_AGRICULTURE',                             1,                     0,               -1,             -1,   -1,        null,       'TXT_KEY_BLDG_THP_PALA_TOURISM',    'TXT_KEY_BLDG_THP_PALA_TOURISM_HELP',   1);

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
VALUES	('MOD_THP_PALA', 'TXT_KEY_MOD_THP_PALA_NAME', 'TXT_KEY_MOD_THP_PALA_ID_STEAM', 'TXT_KEY_MOD_THP_PALA_AUTHORS');
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
VALUES	('AA_THP_PALA_SPECIAL',	'TXT_KEY_AA_THP_PALA_SPECIAL_HEADER',	'TXT_KEY_AA_THP_PALA_SPECIAL_TEXT',	'MOD_THP_PALA',	1,				null,					'THP_PALA_ATLAS',	0),
		('AA_THP_PALA_VICTORY',	'TXT_KEY_AA_THP_PALA_VICTORY_HEADER',	'TXT_KEY_AA_THP_PALA_VICTORY_TEXT',	'MOD_THP_PALA',	1,				'CIVILIZATION_THP_PALA',	 'THP_PALA_ATLAS',	0);

--==========================================================================================================================		
--==========================================================================================================================		
