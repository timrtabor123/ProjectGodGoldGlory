--E&D
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TomatekhGaramantesDecisions.lua');

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_EGYPT")
		THEN "_EGYPT"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_ANCIENT_LIBYA_MOD";

--Nazca
UPDATE Features SET Description =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD"
		ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

UPDATE Features SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD_TEXT"
		ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_TEXT" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

CREATE TRIGGER GaramaAquiferOverlap
AFTER INSERT ON Civilizations WHEN 'CIVILIZATION_NAZCA' = NEW.Type
BEGIN

	UPDATE Features SET Description =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD"
			ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

	UPDATE Features SET Civilopedia =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD_TEXT"
			ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_TEXT" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

END;

UPDATE Features SET Description =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
		THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD"
		ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

UPDATE Features SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
		THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD_TEXT"
		ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_TEXT" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

CREATE TRIGGER GaramaMCAquiferOverlap
AFTER INSERT ON Civilizations WHEN 'CIVILIZATION_MC_NAZCA' = NEW.Type
BEGIN

	UPDATE Features SET Description =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
			THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD"
			ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

	UPDATE Features SET Civilopedia =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
			THEN "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_MOD_TEXT"
			ELSE "TXT_KEY_FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER_TEXT" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

END;

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						        CultureType,	CultureEra)
VALUES		('CIVILIZATION_ANCIENT_LIBYA_MOD',		  'ARABIAN',		 'ANY'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD',		  'AFRICAN',	     'ANY');

--JFD
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                        text                                        default null,
    Value                                       integer                                     default 1);

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									        FlavorType,    Flavor)
VALUES      ('LEADER_ANCIENT_LIBYA_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         4);

--Prestige
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);

CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);

INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT  ('CIVILIZATION_ANCIENT_LIBYA_MOD'), LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_ANCIENT_LIBYA_MOD'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT INTO Civilization_JFD_Titles
        (CivilizationType,          DefaultTitle,   UniqueTitle)
SELECT  ('CIVILIZATION_ANCIENT_LIBYA_MOD'), DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT INTO Civilization_JFD_Politics
        (CivilizationType,          PoliticsType, UniqueName)
SELECT  ('CIVILIZATION_ANCIENT_LIBYA_MOD'), PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');

INSERT INTO Leader_Flavors
        (LeaderType,							            FlavorType,                         Flavor)
VALUES  ('LEADER_ANCIENT_LIBYA_MOD',    'FLAVOR_JFD_REFORM_GOVERNMENT',                              8),
        ('LEADER_ANCIENT_LIBYA_MOD',       'FLAVOR_JFD_REFORM_CULTURE',                              2),
        ('LEADER_ANCIENT_LIBYA_MOD',      'FLAVOR_JFD_REFORM_ECONOMIC',                              5),
        ('LEADER_ANCIENT_LIBYA_MOD',       'FLAVOR_JFD_REFORM_FOREIGN',                              2),
        ('LEADER_ANCIENT_LIBYA_MOD',      'FLAVOR_JFD_REFORM_INDUSTRY',                              8),
        ('LEADER_ANCIENT_LIBYA_MOD',      'FLAVOR_JFD_REFORM_RELIGION',                              5);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	('CIVILIZATION_ANCIENT_LIBYA_MOD'),	ArtDefineTag, ('JFD_Semitic'), SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_EGYPT';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_MesopotamicEgyptian'
WHERE Type = 'CIVILIZATION_ANCIENT_LIBYA_MOD'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_MesopotamicEgyptian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
			(LeaderType,									              TraitOne,					TraitTwo)
SELECT		('LEADER_ANCIENT_LIBYA_MOD'),	                ('POLICY_EXPANSIVE_X'),	   ('POLICY_FINANCIAL_X')
WHERE EXISTS (SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Djalla[ICON_FOOD][ICON_TRADE]'
	ELSE 'TXT_KEY_LEADER_JALLA_MOD_DESC' END) 
WHERE Type = 'LEADER_ANCIENT_LIBYA_MOD';

CREATE TRIGGER CivIVTraitsGarama
AFTER INSERT ON Leaders WHEN 'LEADER_ANCIENT_LIBYA_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Djalla[ICON_FOOD][ICON_TRADE]'
		ELSE 'TXT_KEY_LEADER_JALLA_MOD_DESC' END) 
	WHERE Type = 'LEADER_ANCIENT_LIBYA_MOD';
END;

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								    LinguisticType)
VALUES		('CIVILIZATION_ANCIENT_LIBYA_MOD', 		      null,							    'JFD_Mesopotamian');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_ANCIENT_LIBYA_MOD',		'CIVILIZATION_EGYPT');

INSERT INTO Unit_FreePromotions
			(UnitType, 				                       PromotionType)
SELECT		('UNIT_LIBYAN_NOMAD_MOD'),	('PROMOTION_JFD_DESERT_IMMUNITY')
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_DESERT_IMMUNITY');

--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,									 FlavorType,                 Flavor)
VALUES  ('LEADER_ANCIENT_LIBYA_MOD',         'FLAVOR_JFD_MERCENARY',                      6);

--Cultural Development
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								                            CivilizationType,						CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_TOMATEKH_GARAMANTES_01',			'CIVILIZATION_ANCIENT_LIBYA_MOD',					           null);

--EE & ExCE
--
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LIBYAN_NOMAD_MOD' AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_SURVEYOR');

INSERT INTO Unit_ClassUpgrades
			(UnitType, UnitClassType)
SELECT		('UNIT_LIBYAN_NOMAD_MOD'),	('UNITCLASS_EE_SURVEYOR')		 
WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_SURVEYOR');

UPDATE Units
SET ObsoleteTech = 'TECH_EE_ROMANTICISM'
WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SURVEYOR');

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_ARCHER'
WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SURVEYOR');

--
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LIBYAN_NOMAD_MOD' AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_ADVENTURER');

INSERT INTO Unit_ClassUpgrades
			(UnitType, UnitClassType)
SELECT		('UNIT_LIBYAN_NOMAD_MOD'),	('UNITCLASS_JFD_ADVENTURER')		 
WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_ADVENTURER');

UPDATE Units
SET ObsoleteTech = 'TECH_SCIENTIFIC_THEORY'
WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_JFD_ADVENTURER');

UPDATE Units
SET GoodyHutUpgradeUnitClass = 'UNITCLASS_ARCHER'
WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_JFD_ADVENTURER');

--
CREATE TRIGGER GaraUUScoutEE
AFTER INSERT ON Buildings WHEN 'BUILDING_EE_CRYSTAL_PALACE' = NEW.TYPE
BEGIN

	DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LIBYAN_NOMAD_MOD' AND NOT EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_ADVENTURER');

	INSERT INTO Unit_ClassUpgrades
				(UnitType, UnitClassType)
	SELECT		('UNIT_LIBYAN_NOMAD_MOD'),	('UNITCLASS_EE_SURVEYOR')		 
	WHERE NOT EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_ADVENTURER');

	UPDATE Units
	SET ObsoleteTech = 'TECH_EE_ROMANTICISM'
	WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
	AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_JFD_ADVENTURER');

	UPDATE Units
	SET GoodyHutUpgradeUnitClass = 'UNITCLASS_ARCHER'
	WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
	AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_JFD_ADVENTURER');

END;

--
CREATE TRIGGER GaraUUScoutExCE
AFTER INSERT ON Unit_ClassUpgrades WHEN 'UNIT_JFD_EXPLORER' = NEW.UnitType
BEGIN

	DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LIBYAN_NOMAD_MOD' AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_ADVENTURER');

	INSERT INTO Unit_ClassUpgrades
				(UnitType, UnitClassType)
	SELECT		('UNIT_LIBYAN_NOMAD_MOD'),	('UNITCLASS_JFD_ADVENTURER')		 
	WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_ADVENTURER');

	UPDATE Units
	SET ObsoleteTech = 'TECH_SCIENTIFIC_THEORY'
	WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
	AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_JFD_ADVENTURER');

	UPDATE Units
	SET GoodyHutUpgradeUnitClass = 'UNITCLASS_ARCHER'
	WHERE Type = 'UNIT_LIBYAN_NOMAD_MOD'
	AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_JFD_ADVENTURER');

END;

--Future Worlds
INSERT INTO Unit_Builds
			(UnitType,						                   BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_COMM_ARRAY')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_COMM_ARRAY');

INSERT INTO Unit_Builds
			(UnitType,						                     BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_NETWORK_NODE')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_NETWORK_NODE');

INSERT INTO Unit_Builds
			(UnitType,						                         BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_HYDROPONICS_DOME')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_HYDROPONICS_DOME');

INSERT INTO Unit_Builds
			(UnitType,						                           BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_INDUSTRIAL_COMPLEX')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_INDUSTRIAL_COMPLEX');

INSERT INTO Unit_Builds
			(UnitType,						                 BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_PRESERVE')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_PRESERVE');

INSERT INTO Unit_Builds
			(UnitType,						                 BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_GENERATOR')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_GENERATOR');

INSERT INTO Unit_Builds
			(UnitType,						                BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_BIOWELL')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_BIOWELL');

INSERT INTO Unit_Builds
			(UnitType,						             BuildType)
SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_CORE')
WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_CORE');

CREATE TRIGGER GaramaFuture
AFTER INSERT ON Builds WHEN 'BUILD_FW_CORE' = NEW.Type
BEGIN

	INSERT INTO Unit_Builds
				(UnitType,						                   BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_COMM_ARRAY')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_COMM_ARRAY');

	INSERT INTO Unit_Builds
				(UnitType,						                     BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_NETWORK_NODE')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_NETWORK_NODE');

	INSERT INTO Unit_Builds
				(UnitType,						                         BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_HYDROPONICS_DOME')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_HYDROPONICS_DOME');

	INSERT INTO Unit_Builds
				(UnitType,						                           BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_INDUSTRIAL_COMPLEX')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_INDUSTRIAL_COMPLEX');

	INSERT INTO Unit_Builds
				(UnitType,						                 BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_PRESERVE')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_PRESERVE');

	INSERT INTO Unit_Builds
				(UnitType,						                 BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_GENERATOR')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_GENERATOR');

	INSERT INTO Unit_Builds
				(UnitType,						                BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_BIOWELL')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_BIOWELL');

	INSERT INTO Unit_Builds
				(UnitType,						             BuildType)
	SELECT		('UNIT_GARAMA_DUMMY'),		          ('BUILD_FW_CORE')
	WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_FW_CORE');

END;

--CiD
UPDATE Units
SET UnitArtInfoEraVariation = 0, ExtraMaintenanceCost = 0, WorkRate = 75
WHERE Class = 'UNITCLASS_GARAMA_DUMMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Unit_ClassUpgrades
		(UnitType, 			UnitClassType)
SELECT 	'UNIT_GARAMA_DUMMY',		'UNITCLASS_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

UPDATE Units
SET Description = 'TXT_KEY_UNIT_JFD_PEASANT', Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP', Civilopedia = 'TXT_KEY_UNIT_JFD_PEASANT_PEDIA'
WHERE Type = 'UNIT_GARAMA_DUMMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_GARAMA_DUMMY' AND BuildType = 'BUILD_RAILROAD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO UnitClasses 
		(Type,						                      Description,				 DefaultUnit)
SELECT	'UNITCLASS_JFD_WORKER_GARAMA',		'TXT_KEY_UNIT_JFD_WORKER', 	 'UNIT_JFD_WORKER_GARAMA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_BARBARIAN',   'UNITCLASS_JFD_WORKER_GARAMA', 	null
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_MINOR',	    'UNITCLASS_JFD_WORKER_GARAMA', 	null
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Units 
		(Type,											  Class,		Cost,	ShowInPedia,	ExtraMaintenanceCost,	HurryCostModifier,	AdvancedStartCost, 	WorkRate,		CivilianAttackPriority, 			Capture, 				Moves,	Unhappiness, 	BaseHurry,  HurryMultiplier, WorkRate, 	Domain,			DefaultUnitAI,		Description,					Civilopedia,						Strategy,								Help,								UnitArtInfo,				IconAtlas,		PortraitIndex,	UnitFlagAtlas,		UnitFlagIconOffset,		MoveRate)
SELECT	'UNIT_JFD_WORKER_GARAMA',	'UNITCLASS_JFD_WORKER_GARAMA',		  -1,			  0,						1,				    0,				   35,		 150,		'CIVILIAN_ATTACK_PRIORITY_LOW',		'UNITCLASS_WORKER',		2,		0, 				0, 			0, 				 50, 		'DOMAIN_LAND',	'UNITAI_WORKER',	'TXT_KEY_UNIT_JFD_WORKER',		'TXT_KEY_CIV5_JFD_WORKER_TEXT',		'TXT_KEY_UNIT_JFD_WORKER_STRATEGY',		'TXT_KEY_UNIT_HELP_JFD_WORKER', 	'ART_DEF_UNIT_JFD_WORKER',	'UNIT_ATLAS_2',	43,				'UNIT_FLAG_ATLAS',	1,						'BIPED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Unit_AITypes 
		(UnitType,			UnitAIType)
SELECT	'UNIT_JFD_WORKER_GARAMA',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Unit_Flavors 
		(UnitType,			FlavorType, Flavor)
SELECT	'UNIT_JFD_WORKER_GARAMA',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Unit_Builds 
		(UnitType,							   BuildType)
SELECT	('UNIT_JFD_WORKER_GARAMA'),	('BUILD_JFD_VILLAGE')
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Unit_Builds 
		(UnitType,			BuildType)
SELECT	'UNIT_JFD_WORKER_GARAMA',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Unit_Builds
			(UnitType,						                           BuildType)
SELECT		('UNIT_JFD_WORKER_GARAMA'),		                       ('BUILD_GARAMA_FOGGORA_DUMMY')
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

CREATE TRIGGER GaramaSlaveChanges
AFTER INSERT ON Units WHEN 'UNIT_JFD_SLAVE' = NEW.Type
BEGIN

	UPDATE Units
	SET UnitArtInfoEraVariation = 0, ExtraMaintenanceCost = 0, WorkRate = 75
	WHERE Class = 'UNITCLASS_GARAMA_DUMMY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Unit_ClassUpgrades
			(UnitType, 			UnitClassType)
	SELECT 	'UNIT_GARAMA_DUMMY',		'UNITCLASS_JFD_WORKER'
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	UPDATE Units
	SET Description = 'TXT_KEY_UNIT_JFD_PEASANT', Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP', Civilopedia = 'TXT_KEY_UNIT_JFD_PEASANT_PEDIA'
	WHERE Type = 'UNIT_GARAMA_DUMMY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_GARAMA_DUMMY' AND BuildType = 'BUILD_RAILROAD'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO UnitClasses 
			(Type,						                      Description,				 DefaultUnit)
	SELECT	'UNITCLASS_JFD_WORKER_GARAMA',		'TXT_KEY_UNIT_JFD_WORKER', 	 'UNIT_JFD_WORKER_GARAMA'
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Civilization_UnitClassOverrides	
			(CivilizationType, 			UnitClassType, 				UnitType)
	SELECT 	'CIVILIZATION_BARBARIAN',   'UNITCLASS_JFD_WORKER_GARAMA', 	null
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Civilization_UnitClassOverrides	
			(CivilizationType, 			UnitClassType, 				UnitType)
	SELECT 	'CIVILIZATION_MINOR',	    'UNITCLASS_JFD_WORKER_GARAMA', 	null
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Units 
			(Type,											  Class,		Cost,	ShowInPedia,	ExtraMaintenanceCost,	HurryCostModifier,	AdvancedStartCost, 	WorkRate,		CivilianAttackPriority, 			Capture, 				Moves,	Unhappiness, 	BaseHurry,  HurryMultiplier, WorkRate, 	Domain,			DefaultUnitAI,		Description,					Civilopedia,						Strategy,								Help,								UnitArtInfo,				IconAtlas,		PortraitIndex,	UnitFlagAtlas,		UnitFlagIconOffset,		MoveRate)
	SELECT	'UNIT_JFD_WORKER_GARAMA',	'UNITCLASS_JFD_WORKER_GARAMA',		  -1,			  0,						1,				    0,				   35,		 150,		'CIVILIAN_ATTACK_PRIORITY_LOW',		'UNITCLASS_WORKER',		2,		0, 				0, 			0, 				 50, 		'DOMAIN_LAND',	'UNITAI_WORKER',	'TXT_KEY_UNIT_JFD_WORKER',		'TXT_KEY_CIV5_JFD_WORKER_TEXT',		'TXT_KEY_UNIT_JFD_WORKER_STRATEGY',		'TXT_KEY_UNIT_HELP_JFD_WORKER', 	'ART_DEF_UNIT_JFD_WORKER',	'UNIT_ATLAS_2',	43,				'UNIT_FLAG_ATLAS',	1,						'BIPED'
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Unit_AITypes 
			(UnitType,			UnitAIType)
	SELECT	'UNIT_JFD_WORKER_GARAMA',	UnitAIType
	FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Unit_Flavors 
			(UnitType,			FlavorType, Flavor)
	SELECT	'UNIT_JFD_WORKER_GARAMA',	FlavorType, Flavor
	FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Unit_Builds 
			(UnitType,							   BuildType)
	SELECT	('UNIT_JFD_WORKER_GARAMA'),	('BUILD_JFD_VILLAGE')
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

	INSERT INTO Unit_Builds 
			(UnitType,			BuildType)
	SELECT	'UNIT_JFD_WORKER_GARAMA',	BuildType
	FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Unit_Builds
				(UnitType,						                           BuildType)
	SELECT		('UNIT_JFD_WORKER_GARAMA'),		                       ('BUILD_GARAMA_FOGGORA_DUMMY')
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

END;

--Charges
CREATE TABLE IF NOT EXISTS
	Unit_JFD_BuildCharges (
	UnitType													text	 										default null,
	NumCharges  												integer 										default 0);	

CREATE TABLE IF NOT EXISTS
    Build_JFD_ChargeCosts (
    BuildType                                                    text                                             default null,
    UnitType                                                    text     REFERENCES Units(Type)                 default null,
    ChargeCost                                                  integer                                            default 0,
    RequiresPolicy                                              text     REFERENCES Policies(Type)                 default null);

UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP_CHARGES'
WHERE Type = 'UNIT_GARAMA_DUMMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Units
SET WorkRate = 1000
WHERE Type = 'UNIT_GARAMA_DUMMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO Unit_JFD_BuildCharges
		(UnitType,			NumCharges)
SELECT	Type,				3
FROM Units WHERE Class = 'UNITCLASS_GARAMA_DUMMY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_WORKER_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_HELP_JFD_WORKER_CHARGES'
WHERE Type = 'UNIT_JFD_WORKER_GARAMA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO Unit_JFD_BuildCharges
		(UnitType,			NumCharges)
SELECT	Type,				5
FROM Units WHERE Class = 'UNITCLASS_JFD_WORKER_GARAMA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Builds
SET Time = null
WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_GARAMA_DUMMY' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

UPDATE Builds
SET Time = null
WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_GARAMA_DUMMY' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR', 'BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);

INSERT INTO Build_JFD_ChargeCosts 
			(BuildType,								    UnitType,				      ChargeCost)
VALUES		('BUILD_GARAMA_FOGGORA_DUMMY',				'UNIT_GARAMA_DUMMY',				   1),
			('BUILD_GARAMA_FOGGORA',					'UNIT_GARAMA_DUMMY',				   1);
	
INSERT INTO Build_JFD_ChargeCosts 
			(BuildType,								    UnitType,				      ChargeCost)
SELECT		('BUILD_GARAMA_FOGGORA_DUMMY'),				('UNIT_JFD_WORKER_GARAMA'),			  1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Build_JFD_ChargeCosts 
			(BuildType,								    UnitType,				      ChargeCost)
SELECT		('BUILD_GARAMA_FOGGORA'),				('UNIT_JFD_WORKER_GARAMA'),			  1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
			
CREATE TRIGGER GaramaChargeChanges
AFTER INSERT ON Units WHEN 'UNIT_JFD_WORKER' = NEW.Type
BEGIN

	UPDATE Units
	SET Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP_CHARGES'
	WHERE Type = 'UNIT_GARAMA_DUMMY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

	UPDATE Units
	SET WorkRate = 1000
	WHERE Type = 'UNIT_GARAMA_DUMMY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

	INSERT INTO Unit_JFD_BuildCharges
			(UnitType,			NumCharges)
	SELECT	Type,				3
	FROM Units WHERE Class = 'UNITCLASS_GARAMA_DUMMY'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

	UPDATE Units
	SET Strategy = 'TXT_KEY_UNIT_JFD_WORKER_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_HELP_JFD_WORKER_CHARGES'
	WHERE Type = 'UNIT_JFD_WORKER_GARAMA'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

	INSERT INTO Unit_JFD_BuildCharges
			(UnitType,			NumCharges)
	SELECT	Type,				5
	FROM Units WHERE Class = 'UNITCLASS_JFD_WORKER_GARAMA'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

	UPDATE Builds
	SET Time = null
	WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_GARAMA_DUMMY' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR'))
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

	UPDATE Builds
	SET Time = null
	WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_GARAMA_DUMMY' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR', 'BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT'))
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);

	INSERT INTO Build_JFD_ChargeCosts 
				(BuildType,								    UnitType,				      ChargeCost)
	VALUES		('BUILD_GARAMA_FOGGORA_DUMMY',				'UNIT_GARAMA_DUMMY',				   1),
				('BUILD_GARAMA_FOGGORA',					'UNIT_GARAMA_DUMMY',				   1);
	
	INSERT INTO Build_JFD_ChargeCosts 
				(BuildType,								    UnitType,				      ChargeCost)
	SELECT		('BUILD_GARAMA_FOGGORA_DUMMY'),				('UNIT_JFD_WORKER_GARAMA'),			  1
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	INSERT INTO Build_JFD_ChargeCosts 
				(BuildType,								    UnitType,				      ChargeCost)
	SELECT		('BUILD_GARAMA_FOGGORA'),				('UNIT_JFD_WORKER_GARAMA'),			  1
	WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

END;















