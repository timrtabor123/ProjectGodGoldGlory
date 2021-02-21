-- Game Defines for the Lanfang Republic, by PorkBean
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_PB_LANFANG', 'TXT_KEY_CIV_PB_LANFANG_DESC',  'TXT_KEY_CIV_PB_LANFANG_SHORT_DESC',   'TXT_KEY_CIV_PB_LANFANG_ADJECTIVE',    'TXT_KEY_PEDIA_PB_LANFANG_TEXT',  'TXT_KEY_PEDIA_PB_LANFANG', 'PLAYERCOLOR_PB_LANFANG',     'ART_DEF_CIVILIZATION_LANFANG',   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'LANFANG_ICON_ATLAS',   0,             'LANFANG_ALPHA_ATLAS',   SoundtrackTag,  'Lanfang_Map.dds',  'TXT_KEY_CIV5_DAWN_PB_LANFANG_TEXT',   'Lanfang_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
          (CivilizationType,                    CityName)
VALUES	  ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_0'),
		  ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_1'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_2'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_3'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_4'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_5'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_6'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_7'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_8'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_9'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_10'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_11'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_12'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_13'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_14'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_15'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_16'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_17'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_18'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_19'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_20'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_21'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_22'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_23'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_24'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_25'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_26'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_27'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_28'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_CITY_NAME_PB_LANFANG_29');

-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,                BuildingClassType)
SELECT    'CIVILIZATION_PB_LANFANG',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CHINA';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,                TechType)
SELECT    'CIVILIZATION_PB_LANFANG',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,                UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_PB_LANFANG',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,              LeaderheadType)
VALUES ('CIVILIZATION_PB_LANFANG', 'LEADER_LF_LUO_FANGBO');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
(CivilizationType,            BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_PB_LANFANG', 'BUILDINGCLASS_FORGE', 'BUILDING_LF_ZONGTING');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,              UnitClassType,       UnitType)
VALUES ('CIVILIZATION_PB_LANFANG', 'UNITCLASS_RIFLEMAN', 'UNIT_LF_LANSAAI');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,              ReligionType)
VALUES ('CIVILIZATION_PB_LANFANG', 'RELIGION_TAOISM');
-------------------------
-- Civilization_Start_Region_Priority
-------------------------
INSERT INTO Civilization_Start_Region_Priority
       (CivilizationType,              RegionType)
VALUES ('CIVILIZATION_PB_LANFANG', 'REGION_JUNGLE');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,                  SpyName)
VALUES    ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_0'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_1'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_2'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_3'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_4'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_5'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_6'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_7'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_8'),
          ('CIVILIZATION_PB_LANFANG',     'TXT_KEY_SPY_NAME_PB_LANFANG_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                          Civilopedia,                               CivilopediaTag,                            ArtDefineTag,                 VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,     WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_LF_LUO_FANGBO',     'TXT_KEY_LEADER_LF_LUO_FANGBO',    'TXT_KEY_LEADER_LF_LUO_FANGBO_PEDIA_TEXT',    'TXT_KEY_LEADER_LF_LUO_FANGBO_PEDIA',     'Luo_Scene.xml',    5,                                        4,                         8,                           6,            7,                8,                 5,                       6,                    6,           4,            6,               6,          5,           'LANFANG_ICON_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                  MajorCivApproachType,              Bias)
VALUES    ('LEADER_LF_LUO_FANGBO',     'MAJOR_CIV_APPROACH_WAR',           5),
          ('LEADER_LF_LUO_FANGBO',     'MAJOR_CIV_APPROACH_HOSTILE',       4),
          ('LEADER_LF_LUO_FANGBO',     'MAJOR_CIV_APPROACH_DECEPTIVE',     4),
          ('LEADER_LF_LUO_FANGBO',     'MAJOR_CIV_APPROACH_GUARDED',       7),
          ('LEADER_LF_LUO_FANGBO',     'MAJOR_CIV_APPROACH_AFRAID',        4),
          ('LEADER_LF_LUO_FANGBO',     'MAJOR_CIV_APPROACH_FRIENDLY',      7),
          ('LEADER_LF_LUO_FANGBO',     'MAJOR_CIV_APPROACH_NEUTRAL',       5);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                     MinorCivApproachType,              Bias)
VALUES    ('LEADER_LF_LUO_FANGBO',     'MINOR_CIV_APPROACH_IGNORE',        2),
          ('LEADER_LF_LUO_FANGBO',     'MINOR_CIV_APPROACH_FRIENDLY',      8),
          ('LEADER_LF_LUO_FANGBO',     'MINOR_CIV_APPROACH_PROTECTIVE',    7),
          ('LEADER_LF_LUO_FANGBO',     'MINOR_CIV_APPROACH_CONQUEST',      6),
          ('LEADER_LF_LUO_FANGBO',     'MINOR_CIV_APPROACH_BULLY',         6);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                  FlavorType,                        Flavor)
VALUES    ('LEADER_LF_LUO_FANGBO',     'FLAVOR_OFFENSE',                   7),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_DEFENSE',                   8),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_CITY_DEFENSE',              5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_MILITARY_TRAINING',         4),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_RECON',                     6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_RANGED',                    5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_MOBILE',                    5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_NAVAL',                     6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_NAVAL_RECON',               5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_NAVAL_GROWTH',              6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    4),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_AIR',                       4),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_EXPANSION',                 8),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_GROWTH',                    6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_TILE_IMPROVEMENT',          8),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_INFRASTRUCTURE',            6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_PRODUCTION',                8),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_GOLD',                      7),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_SCIENCE',                   6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_CULTURE',                   5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_HAPPINESS',                 6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_GREAT_PEOPLE',              4),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_WONDER',                    4),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_RELIGION',                  4),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_DIPLOMACY',                 8),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_SPACESHIP',                 7),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_WATER_CONNECTION',          6),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_NUKE',                      7),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_USE_NUKE',                  4),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_ESPIONAGE',                 7),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_ANTIAIR',                   5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_AIRLIFT',                   5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_I_TRADE_DESTINATION',       7),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_I_TRADE_ORIGIN',            7),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_I_SEA_TRADE_ROUTE',         5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_I_LAND_TRADE_ROUTE',        8),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_ARCHAEOLOGY',               5),
          ('LEADER_LF_LUO_FANGBO',     'FLAVOR_AIR_CARRIER',               3);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,              TraitType)
VALUES ('LEADER_LF_LUO_FANGBO',   'TRAIT_LF_KONGSI_FEDERATION');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                   Description,                  ShortDescription)
VALUES ('TRAIT_LF_KONGSI_FEDERATION',    'TXT_KEY_TRAIT_LF_KONGSI_FEDERATION',   'TXT_KEY_TRAIT_LF_KONGSI_FEDERATION_SHORT');

-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- Units
--------
INSERT INTO Units
(Type,                           Class,    CombatClass, WorkRate, PrereqTech, CanBuyCityState, Combat, BaseSightRange, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,                   Help,                                             Strategy,                                 Civilopedia,          MilitarySupport,             MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, MoveRate, DontShowYields, ShowInPedia)
SELECT    'UNIT_LF_LANSAAI',    Class,    CombatClass, WorkRate, PrereqTech, CanBuyCityState, 32, BaseSightRange, FaithCost, RequiresFaithPurchaseEnabled, Cost,  Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_LF_LANSAAI',    'TXT_KEY_UNIT_LF_LANSAAI_HELP',    'TXT_KEY_UNIT_LF_LANSAAI_STRATEGY',      'TXT_KEY_UNIT_LF_LANSAAI_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_LF_LANSAAI', 'LANFANG_LANSAAI_FLAG_ATLAS', 0, 'LANFANG_ICON_ATLAS', 2, MoveRate, DontShowYields, ShowInPedia
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,               SelectionSound, FirstSelectionSound)
SELECT 'UNIT_LF_LANSAAI',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
       (UnitType,               UnitAIType)
SELECT 'UNIT_LF_LANSAAI',  UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,               FlavorType, Flavor)
SELECT 'UNIT_LF_LANSAAI',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
       (UnitType, PromotionType)
SELECT 'UNIT_LF_LANSAAI',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions
       (UnitType,                   PromotionType)
VALUES ('UNIT_LF_LANSAAI',    'PROMOTION_LF_MINER');
----------------------
-- UnitPromotions_CivilianUnitType
----------------------
INSERT INTO UnitPromotions_CivilianUnitType
       (UnitType, PromotionType)
SELECT 'UNIT_LF_LANSAAI',  PromotionType
FROM UnitPromotions_CivilianUnitType WHERE UnitType = 'UNIT_RIFLEMAN';
----------------------
-- Unit_Builds
----------------------
INSERT INTO Unit_Builds
       (UnitType, BuildType)
SELECT 'UNIT_LF_LANSAAI',  BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_RIFLEMAN';
-----------------
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions	
(Type,      Description,                             Help,                     													Sound,                CannotBeChosen,		LostWithUpgrade,	CombatPercent,                PortraitIndex,    IconAtlas,                         PediaType,             PediaEntry)
VALUES    ('PROMOTION_LF_PROTECT_TRADE', 'TXT_KEY_PROMOTION_LF_PROTECT_TRADE',     'TXT_KEY_PROMOTION_LF_PROTECT_TRADE_HELP',    'AS2D_IF_LEVELUP',    1,				0,				50,					    11,            'EXPANSION2_PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_LF_PROTECT_TRADE'),
		  ('PROMOTION_LF_MINER', 'TXT_KEY_PROMOTION_LF_MINER',     'TXT_KEY_PROMOTION_LF_MINER_HELP',    'AS2D_IF_LEVELUP',    1,				0,				0,					    36,            'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_LF_MINER');
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
(Type,                               DefaultBuilding,                Description)
VALUES  ('BUILDINGCLASS_LF_KONGSI_DUMMY',  'BUILDING_LF_KONGSI_DUMMY',    'TXT_KEY_BUILDING_LF_KONGSI_DUMMY'),
		('BUILDINGCLASS_LF_NOTIFICATION_DUMMY',  'BUILDING_LF_NOTIFICATION_DUMMY',    'TXT_KEY_BUILDING_LF_NOTIFICATION_DUMMY');
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                              BuildingClass,    Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,     Description,                  Help,                                         Civilopedia,                        Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT    'BUILDING_LF_ZONGTING',    BuildingClass,    Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,   'TXT_KEY_BUILDING_LF_ZONGTING',    'TXT_KEY_BUILDING_LF_ZONGTING_HELP',    'TXT_KEY_BUILDING_LF_ZONGTING_TEXT',    'TXT_KEY_BUILDING_LF_ZONGTING_STRATEGY',    'ART_DEF_BUILDING_FORGE', MinAreaSize, 1, HurryCostModifier, 3,            'LANFANG_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_FORGE';

INSERT INTO Buildings
(Type,                                    BuildingClass,                              SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                           Help,                             NeverCapture,   NukeImmune)
VALUES    ('BUILDING_LF_KONGSI_DUMMY', 'BUILDINGCLASS_LF_KONGSI_DUMMY',     0,               -1,             -1,   -1,        'TXT_KEY_BUILDING_LF_KONGSI_DUMMY',    'TXT_KEY_BUILDING_LF_KONGSI_DUMMY',   1,   1);

INSERT INTO Buildings
(Type,                                    BuildingClass,                              SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                           Help,                             NeverCapture,   NukeImmune, PortraitIndex, IconAtlas)
VALUES    ('BUILDING_LF_NOTIFICATION_DUMMY', 'BUILDINGCLASS_LF_NOTIFICATION_DUMMY',     0,               -1,             -1,   -1,        'TXT_KEY_BUILDING_LF_NOTIFICATION_DUMMY',    'TXT_KEY_BUILDING_LF_NOTIFICATION_DUMMY',   1,   1, 0, 'LANFANG_ICON_ATLAS');
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,            FlavorType,    Flavor)
SELECT    'BUILDING_LF_ZONGTING',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_FORGE';