-- Rashtrakuta
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                    Description,                ShortDescription,                          Adjective,                     Civilopedia,                    CivilopediaTag,      DefaultPlayerColor,  ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,         IconAtlas,   PortraitIndex,  AlphaIconAtlas,             SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_RASHTRAKUTA', 'TXT_KEY_CIV_THP_RASHTRAKUTA_DESC',  'TXT_KEY_CIV_THP_RASHTRAKUTA_SHORT_DESC',   'TXT_KEY_CIV_THP_RASHTRAKUTA_ADJECTIVE',    'TXT_KEY_PEDIA_THP_RASHTRAKUTA_TEXT',  'TXT_KEY_PEDIA_THP_RASHTRAKUTA', 'PLAYERCOLOR_THP_RASHTRAKUTA',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_RASHTRAKUTA_ATLAS',   0,             'THP_RASHTRAKUTA_ALPHA_ATLAS',   SoundtrackTag,  'Map_Rashtrakuta.dds',  'TXT_KEY_CIV5_DAWN_THP_RASHTRAKUTA_TEXT',   'Amoghavarsha_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_INDIA';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
          (CivilizationType,                    CityName)
VALUES    ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_1'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_2'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_3'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_4'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_5'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_6'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_7'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_8'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_9'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_10'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_11'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_12'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_13'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_14'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_15'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_16'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_17'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_18'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_19'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_20'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_21'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_22'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_23'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_24'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_25'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_26'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_27'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_28'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_CITY_NAME_THP_RASHTRAKUTA_29');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,                  BuildingClassType)
SELECT    'CIVILIZATION_THP_RASHTRAKUTA',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_INDIA';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,                  TechType)
SELECT    'CIVILIZATION_THP_RASHTRAKUTA',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_INDIA';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,                  UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_RASHTRAKUTA',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_INDIA';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,                LeaderheadType)
VALUES ('CIVILIZATION_THP_RASHTRAKUTA', 'LEADER_THP_AMOGHAVARSHA');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,                UnitClassType,       UnitType)
VALUES ('CIVILIZATION_THP_RASHTRAKUTA', 'UNITCLASS_PIKEMAN', 'UNIT_THP_STHIRABHUTA');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,                ReligionType)
VALUES ('CIVILIZATION_THP_RASHTRAKUTA', 'RELIGION_HINDUISM');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,                    SpyName)
VALUES    ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_0'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_1'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_2'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_3'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_4'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_5'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_6'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_7'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_8'),
          ('CIVILIZATION_THP_RASHTRAKUTA',     'TXT_KEY_SPY_NAME_THP_RASHTRAKUTA_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                          Civilopedia,                               CivilopediaTag,                               ArtDefineTag,                    VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,     WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_AMOGHAVARSHA',     'TXT_KEY_LEADER_THP_AMOGHAVARSHA',    'TXT_KEY_LEADER_THP_AMOGHAVARSHA_PEDIA_TEXT',    'TXT_KEY_LEADER_THP_AMOGHAVARSHA_PEDIA',     'Leaderhead_Amoghavarsha.xml',    5,                                        8,                         7,                           3,            7,                7,                             3,                       6,              7,           2,            4,               5,          2,           'THP_RASHTRAKUTA_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                     MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_AMOGHAVARSHA',     'MAJOR_CIV_APPROACH_WAR',           4),
          ('LEADER_THP_AMOGHAVARSHA',     'MAJOR_CIV_APPROACH_HOSTILE',       2),
          ('LEADER_THP_AMOGHAVARSHA',     'MAJOR_CIV_APPROACH_DECEPTIVE',     2),
          ('LEADER_THP_AMOGHAVARSHA',     'MAJOR_CIV_APPROACH_GUARDED',       6),
          ('LEADER_THP_AMOGHAVARSHA',     'MAJOR_CIV_APPROACH_AFRAID',        6),
          ('LEADER_THP_AMOGHAVARSHA',     'MAJOR_CIV_APPROACH_FRIENDLY',      7),
          ('LEADER_THP_AMOGHAVARSHA',     'MAJOR_CIV_APPROACH_NEUTRAL',       8);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                     MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_AMOGHAVARSHA',     'MINOR_CIV_APPROACH_IGNORE',        6),
          ('LEADER_THP_AMOGHAVARSHA',     'MINOR_CIV_APPROACH_FRIENDLY',      7),
          ('LEADER_THP_AMOGHAVARSHA',     'MINOR_CIV_APPROACH_PROTECTIVE',    9),
          ('LEADER_THP_AMOGHAVARSHA',     'MINOR_CIV_APPROACH_CONQUEST',      2),
          ('LEADER_THP_AMOGHAVARSHA',     'MINOR_CIV_APPROACH_BULLY',         1);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                     FlavorType,                        Flavor)
VALUES    ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_OFFENSE',                   6),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_DEFENSE',                   8),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_CITY_DEFENSE',              6),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_MILITARY_TRAINING',         5),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_RECON',                     4),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_RANGED',                    4),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_MOBILE',                    5),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_NAVAL',                     4),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_NAVAL_RECON',               5),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_NAVAL_GROWTH',              7),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    4),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_AIR',                       8),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_EXPANSION',                 9),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_GROWTH',                    6),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_TILE_IMPROVEMENT',          8),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_INFRASTRUCTURE',            7),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_PRODUCTION',                5),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_GOLD',                      2),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_SCIENCE',                   5),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_CULTURE',                   8),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_HAPPINESS',                 7),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_GREAT_PEOPLE',              10),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_WONDER',                    6),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_RELIGION',                  9),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_DIPLOMACY',                 7),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_SPACESHIP',                 2),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_WATER_CONNECTION',          4),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_NUKE',                      1),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_USE_NUKE',                  1),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_ESPIONAGE',                 3),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_AIRLIFT',                   6),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_I_TRADE_DESTINATION',       7),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_I_TRADE_ORIGIN',            5),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_I_SEA_TRADE_ROUTE',         4),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_I_LAND_TRADE_ROUTE',        5),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_ARCHAEOLOGY',               9),
          ('LEADER_THP_AMOGHAVARSHA',     'FLAVOR_AIR_CARRIER',               5);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,                   TraitType)
VALUES ('LEADER_THP_AMOGHAVARSHA',   'TRAIT_THP_RASHTRAKUTA');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                        Description,                       ShortDescription)
VALUES ('TRAIT_THP_RASHTRAKUTA',    'TXT_KEY_TRAIT_THP_RASHTRAKUTA',   'TXT_KEY_TRAIT_THP_RASHTRAKUTA_SHORT');
-- ======================================================================================================
-- HAPPINESS DUMMIES
-- ======================================================================================================
-- this section was mostly written by Chrisy15 because he's a god

CREATE TABLE IF NOT EXISTS TopHat_Rashtrakuta_Dummies (BuildingType TEXT NOT NULL, DummyType TEXT NOT NULL, PRIMARY KEY (BuildingType, DummyType));

INSERT INTO Buildings
(Type,                                BuildingClass,   Cost,    GreatWorkSlotType,              GreatWorkCount,   FaithCost,    MinAreaSize, NeverCapture,    NukeImmune,   IconAtlas,    PortraitIndex,    Description)
SELECT    Type||'_THP_RASHDUMMY',     BuildingClass,   -1,      'GREAT_WORK_SLOT_ART_ARTIFACT', 1,                -1,           -1,          1,             1,                      IconAtlas,    PortraitIndex,   'TXT_KEY_THP_RASHTRAKUTA_DUMMY_BUILDING'
FROM Buildings WHERE (Happiness > 0);

INSERT INTO TopHat_Rashtrakuta_Dummies
         (BuildingType,       DummyType)
SELECT    Type,               Type||'_THP_RASHDUMMY'
FROM Buildings WHERE (Happiness > 0);

CREATE TRIGGER IF NOT EXISTS C15_TopHat_RashDummies_Insert
AFTER INSERT ON Buildings
WHEN (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = NEW.BuildingClass) NOT IN (SELECT BuildingType FROM TopHat_Rashtrakuta_Dummies) AND NEW.Happiness > 0
BEGIN
INSERT OR REPLACE INTO Buildings
          (Type,                      BuildingClass,   Cost,    GreatWorkSlotType,              GreatWorkCount,   FaithCost,    MinAreaSize,    NeverCapture,    NukeImmune,   IconAtlas,    PortraitIndex,    Description)
SELECT    Type||'_THP_RASHDUMMY',     BuildingClass,   -1,      'GREAT_WORK_SLOT_ART_ARTIFACT', 1,                -1,           -1,                              1,                         1,            IconAtlas,    PortraitIndex,    'TXT_KEY_THP_RASHTRAKUTA_DUMMY_BUILDING'
FROM Buildings WHERE BuildingClass = NEW.BuildingClass;

INSERT OR REPLACE INTO TopHat_Rashtrakuta_Dummies
         (BuildingType,       DummyType)
SELECT    DefaultBuilding,    DefaultBuilding||'_THP_RASHDUMMY'
FROM BuildingClasses WHERE Type = NEW.BuildingClass;
END;

CREATE TRIGGER IF NOT EXISTS C15_TopHat_RashDummies_Update
AFTER UPDATE ON Buildings
WHEN (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = NEW.BuildingClass) NOT IN (SELECT BuildingType FROM TopHat_Rashtrakuta_Dummies) AND NEW.Happiness > 0
BEGIN
INSERT OR REPLACE INTO Buildings
(Type,                      BuildingClass,   Cost,    GreatWorkSlotType,    GreatWorkCount,   FaithCost,    MinAreaSize,    NeverCapture,    NukeImmune,   IconAtlas,    PortraitIndex,    Description)
SELECT    Type||'_THP_RASHDUMMY',     BuildingClass,   -1,  'GREAT_WORK_SLOT_ART_ARTIFACT',      1,                -1,           -1,                              1,                         1,            IconAtlas,    PortraitIndex,    'TXT_KEY_THP_RASHTRAKUTA_DUMMY_BUILDING'
FROM Buildings WHERE BuildingClass = NEW.BuildingClass;

INSERT OR REPLACE INTO TopHat_Rashtrakuta_Dummies
(BuildingType,        DummyType)
SELECT    DefaultBuilding,    DefaultBuilding||'_THP_RASHDUMMY'
FROM BuildingClasses WHERE Type = NEW.BuildingClass;

DELETE FROM TopHat_Rashtrakuta_Dummies WHERE BuildingType = (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = OLD.BuildingClass) AND NOT EXISTS (SELECT BuildingClass FROM Buildings WHERE BuildingClass = OLD.BuildingClass AND OLD.Happiness > 0);
END;

CREATE TRIGGER IF NOT EXISTS C15_TopHat_RashDummies_Delete
AFTER DELETE ON Buildings
WHEN NOT EXISTS (SELECT BuildingClass FROM Buildings WHERE BuildingClass = OLD.BuildingClass AND OLD.Happiness > 0)
BEGIN
DELETE FROM TopHat_Rashtrakuta_Dummies WHERE BuildingType = (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = OLD.BuildingClass);
END;
--=======================================================================================================
-- BUILDS
--=======================================================================================================
-- Builds
---------
INSERT INTO Builds
(Type,                                 PrereqTech,         ImprovementType,            Time,  Recommendation,                    Description,            Help,                              CtrlDown,    OrderPriority,    IconIndex, IconAtlas,              HotKey,    EntityEvent)
VALUES        ('BUILD_THP_BASADI',    'TECH_THEOLOGY',    'IMPROVEMENT_THP_BASADI',    800, 'TXT_KEY_BUILD_THP_BASADI_REC', 'TXT_KEY_THP_BASADI',  'TXT_KEY_BUILD_THP_BASADI_HELP',    1,           98,               1,        'THP_BASADI_ATLAS',    'KB_B',    'ENTITY_EVENT_BUILD');
----------------
-- BuildFeatures
----------------
INSERT INTO BuildFeatures
              (BuildType,              FeatureType, PrereqTech,        Time, Remove)
SELECT        ('BUILD_THP_BASADI'),    FeatureType, ('TECH_THEOLOGY'), Time, 0
FROM BuildFeatures WHERE BuildType = 'BUILD_MINE';
--=======================================================================================================
-- IMPROVEMENTS
--=======================================================================================================
-- Improvements
---------------
INSERT INTO Improvements
(Type,                                      SpecificCivRequired, CivilizationType,                 GoldMaintenance,    NoTwoAdjacent,    HillsMakesValid,    Description,                       Civilopedia,                                    ArtDefineTag,                    BuildableOnResources,    DestroyedWhenPillaged,    PillageGold,    DefenseModifier,    PortraitIndex,    IconAtlas)
VALUES        ('IMPROVEMENT_THP_BASADI',    1,                  'CIVILIZATION_THP_RASHTRAKUTA',    0,                         1,                1,                 'TXT_KEY_IMPROVEMENT_THP_BASADI',  'TXT_KEY_CIV5_IMPROVEMENTS_THP_BASADI_TEXT',    'ART_DEF_IMPROVEMENT_THP_BASADI',    0,                       0,                        50,             0,                  0,                'THP_BASADI_ATLAS');
-------------------------------
-- Improvement_TechYieldChanges
-------------------------------
INSERT INTO Improvement_TechYieldChanges
        (ImprovementType,            TechType,           YieldType,         Yield)
VALUES  ('IMPROVEMENT_THP_BASADI',  'TECH_ARCHAEOLOGY', 'YIELD_CULTURE',    2);
----------------------------
-- Improvement_ValidTerrains
----------------------------
INSERT INTO Improvement_ValidTerrains
              (ImprovementType,                TerrainType)
VALUES        ('IMPROVEMENT_THP_BASADI',      'TERRAIN_HILL');
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                   Description,                             Help,                                                 Sound,                CannotBeChosen,                 PortraitIndex,     GoldenAgeValueFromKills,    IconAtlas,                         PediaType,             PediaEntry)
VALUES    ('PROMOTION_THP_STHIRABHUTA', 'TXT_KEY_PROMOTION_THP_STHIRABHUTA',     'TXT_KEY_PROMOTION_THP_STHIRABHUTA_HELP',    'AS2D_IF_LEVELUP',    1,                              2,                 100,              'EXPANSION2_PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_STHIRABHUTA');

INSERT INTO UnitPromotions
(Type,                                   Description,                       Help,                                          Sound,              CannotBeChosen,  PortraitIndex,  IconAtlas,         CombatPercent,   PediaType,  PediaEntry)
VALUES  ('PROMOTION_THP_RASH_ONE_GW',   'TXT_KEY_PROMOTION_THP_RASH_GW',   'TXT_KEY_PROMOTION_THP_RASH_ONE_GW_HELP',    'AS2D_IF_LEVELUP',  1,               59,             'ABILITY_ATLAS',   5,              'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_RASH_GW'),
('PROMOTION_THP_RASH_TWO_GW',   'TXT_KEY_PROMOTION_THP_RASH_GW',   'TXT_KEY_PROMOTION_THP_RASH_TWO_GW_HELP',    'AS2D_IF_LEVELUP',  1,               59,             'ABILITY_ATLAS',   10,              'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_RASH_GW'),
('PROMOTION_THP_RASH_THREE_GW',   'TXT_KEY_PROMOTION_THP_RASH_GW',   'TXT_KEY_PROMOTION_THP_RASH_THREE_GW_HELP',    'AS2D_IF_LEVELUP',  1,               59,             'ABILITY_ATLAS',   15,              'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_RASH_GW'),
('PROMOTION_THP_RASH_MANY_GW',   'TXT_KEY_PROMOTION_THP_RASH_GW',   'TXT_KEY_PROMOTION_THP_RASH_MANY_GW_HELP',    'AS2D_IF_LEVELUP',  1,               59,             'ABILITY_ATLAS',   20,              'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_RASH_GW');
--------
-- Units
--------
INSERT INTO Units
(Type,                           Class,    CombatClass, WorkRate, PrereqTech, CanBuyCityState, Combat,     FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,                   Help,                                             Strategy,                                 Civilopedia,          MilitarySupport,             MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo,                UnitFlagAtlas,                                 UnitFlagIconOffset,    IconAtlas,            PortraitIndex,    MoveRate)
SELECT    'UNIT_THP_STHIRABHUTA',    Class,    CombatClass, WorkRate, PrereqTech, CanBuyCityState, Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost,  Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_STHIRABHUTA',    'TXT_KEY_UNIT_THP_STHIRABHUTA_HELP',    'TXT_KEY_UNIT_THP_STHIRABHUTA_STRATEGY',      'TXT_KEY_UNIT_THP_STHIRABHUTA_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_STHIRABHUTA', 'THP_UNIT_STHIRABHUTA_FLAG_ATLAS',    0,                    'THP_RASHTRAKUTA_ATLAS',   2,        MoveRate
FROM Units WHERE Type = 'UNIT_PIKEMAN';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,               SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_STHIRABHUTA',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                 UnitAIType)
SELECT    'UNIT_THP_STHIRABHUTA',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PIKEMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,               FlavorType, Flavor)
SELECT 'UNIT_THP_STHIRABHUTA',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PIKEMAN';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
       (UnitType,               PromotionType)
SELECT 'UNIT_THP_STHIRABHUTA',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_FreePromotions
        (UnitType,                   PromotionType)
VALUES  ('UNIT_THP_STHIRABHUTA',    'PROMOTION_THP_STHIRABHUTA');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
       (UnitType,               UnitClassType)
SELECT 'UNIT_THP_STHIRABHUTA',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PIKEMAN';
--------------
-- Unit_Builds
--------------
INSERT INTO Unit_Builds
        (UnitType,           BuildType)
VALUES  ('UNIT_WORKER',     'BUILD_THP_BASADI');
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_AMOGHAVARSHA_ATTACKED_GENERIC%',                     500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_AMOGHAVARSHA_DEFEATED%',                             500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_AMOGHAVARSHA_DOW_GENERIC%',                             500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_AMOGHAVARSHA_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_AMOGHAVARSHA_FIRSTGREETING%',                         500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_AMOGHAVARSHA_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_AMOGHAVARSHA_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_AMOGHAVARSHA_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_AMOGHAVARSHA_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_AMOGHAVARSHA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_AMOGHAVARSHA_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_AMOGHAVARSHA_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_AMOGHAVARSHA_LETS_HEAR_IT%',                         500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_AMOGHAVARSHA_LUXURY_TRADE%',                         500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_AMOGHAVARSHA_NO_PEACE%',                             500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_AMOGHAVARSHA_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_AMOGHAVARSHA_LOSEWAR%',                                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_AMOGHAVARSHA_REPEAT_NO%',                             500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_AMOGHAVARSHA_RESPONSE_REQUEST%',                     500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_AMOGHAVARSHA_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_AMOGHAVARSHA_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_AMOGHAVARSHA_WINWAR%',                                 500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_AMOGHAVARSHA_DENOUNCE%',                             500),
('LEADER_THP_AMOGHAVARSHA',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_AMOGHAVARSHA_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
