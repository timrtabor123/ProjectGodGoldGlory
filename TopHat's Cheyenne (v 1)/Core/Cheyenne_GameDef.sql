-- Tang Dynasty
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_CHEYENNE', 'TXT_KEY_CIV_THP_CHEYENNE_DESC',  'TXT_KEY_CIV_THP_CHEYENNE_SHORT_DESC',   'TXT_KEY_CIV_THP_CHEYENNE_ADJECTIVE',    'TXT_KEY_PEDIA_THP_CHEYENNE_TEXT',  'TXT_KEY_PEDIA_THP_CHEYENNE', 'PLAYERCOLOR_THP_CHEYENNE',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_CHEYENNE_ATLAS',   0,             'THP_CHEYENNE_ALPHA_ATLAS',   SoundtrackTag,  'Map_Cheyenne.dds',  'TXT_KEY_CIV5_DAWN_THP_CHEYENNE_TEXT',   'Woqini_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_SHOSHONE';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,                 CityName)
VALUES  ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_1'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_2'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_3'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_4'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_5'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_6'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_7'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_8'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_9'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_10'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_11'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_12'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_13'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_14'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_15'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_16'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_17'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_18'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_19'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_20'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_21'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_22'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_23'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_24'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_25'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_26'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_27'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_28'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_29'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_30'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_31'),
        ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_CITY_NAME_THP_CHEYENNE_32');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,               BuildingClassType)
SELECT    'CIVILIZATION_THP_CHEYENNE',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,               TechType)
SELECT    'CIVILIZATION_THP_CHEYENNE',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,               UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_CHEYENNE',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,             LeaderheadType)
VALUES ('CIVILIZATION_THP_CHEYENNE', 'LEADER_THP_WOQINI');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,             BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_THP_CHEYENNE', 'BUILDINGCLASS_STABLE', 'BUILDING_THP_SUN_DANCE');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,             UnitClassType,      UnitType)
VALUES ('CIVILIZATION_THP_CHEYENNE', 'UNITCLASS_LANCER', 'UNIT_THP_DOG_SOLDIER');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,             ReligionType)
VALUES ('CIVILIZATION_THP_CHEYENNE', 'RELIGION_PROTESTANTISM');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,                 SpyName)
VALUES    ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_0'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_1'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_2'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_3'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_4'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_5'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_6'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_7'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_8'),
          ('CIVILIZATION_THP_CHEYENNE',     'TXT_KEY_SPY_NAME_THP_CHEYENNE_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                                             Civilopedia,                               CivilopediaTag,                     ArtDefineTag,                 VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_WOQINI',     'TXT_KEY_LEADER_THP_WOQINI',    'TXT_KEY_LEADER_THP_WOQINI_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_WOQINI_PEDIA', 'Leaderhead_Woqini.xml',    8,                          2,                         5,                           9,                     4,              8,                 7,                       3,              7,           2,            3,               2,          6,           'THP_CHEYENNE_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,               MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_WOQINI',     'MAJOR_CIV_APPROACH_WAR',           8),
          ('LEADER_THP_WOQINI',     'MAJOR_CIV_APPROACH_HOSTILE',       8),
          ('LEADER_THP_WOQINI',     'MAJOR_CIV_APPROACH_DECEPTIVE',     4),
          ('LEADER_THP_WOQINI',     'MAJOR_CIV_APPROACH_GUARDED',       9),
          ('LEADER_THP_WOQINI',     'MAJOR_CIV_APPROACH_AFRAID',        5),
          ('LEADER_THP_WOQINI',     'MAJOR_CIV_APPROACH_FRIENDLY',      2),
          ('LEADER_THP_WOQINI',     'MAJOR_CIV_APPROACH_NEUTRAL',       4);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,               MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_WOQINI',     'MINOR_CIV_APPROACH_IGNORE',        4),
          ('LEADER_THP_WOQINI',     'MINOR_CIV_APPROACH_FRIENDLY',      3),
          ('LEADER_THP_WOQINI',     'MINOR_CIV_APPROACH_PROTECTIVE',    7),
          ('LEADER_THP_WOQINI',     'MINOR_CIV_APPROACH_CONQUEST',      6),
          ('LEADER_THP_WOQINI',     'MINOR_CIV_APPROACH_BULLY',         3);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,               FlavorType,                        Flavor)
VALUES    ('LEADER_THP_WOQINI',     'FLAVOR_OFFENSE',                   8),
          ('LEADER_THP_WOQINI',     'FLAVOR_DEFENSE',                   4),
          ('LEADER_THP_WOQINI',     'FLAVOR_CITY_DEFENSE',              3),
          ('LEADER_THP_WOQINI',     'FLAVOR_MILITARY_TRAINING',         10),
          ('LEADER_THP_WOQINI',     'FLAVOR_RECON',                     7),
          ('LEADER_THP_WOQINI',     'FLAVOR_RANGED',                    5),
          ('LEADER_THP_WOQINI',     'FLAVOR_MOBILE',                    8),
          ('LEADER_THP_WOQINI',     'FLAVOR_NAVAL',                     2),
          ('LEADER_THP_WOQINI',     'FLAVOR_NAVAL_RECON',               4),
          ('LEADER_THP_WOQINI',     'FLAVOR_NAVAL_GROWTH',              2),
          ('LEADER_THP_WOQINI',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    3),
          ('LEADER_THP_WOQINI',     'FLAVOR_AIR',                       7),
          ('LEADER_THP_WOQINI',     'FLAVOR_EXPANSION',                 7),
          ('LEADER_THP_WOQINI',     'FLAVOR_GROWTH',                    6),
          ('LEADER_THP_WOQINI',     'FLAVOR_TILE_IMPROVEMENT',          5),
          ('LEADER_THP_WOQINI',     'FLAVOR_INFRASTRUCTURE',            5),
          ('LEADER_THP_WOQINI',     'FLAVOR_PRODUCTION',                7),
          ('LEADER_THP_WOQINI',     'FLAVOR_GOLD',                      6),
          ('LEADER_THP_WOQINI',     'FLAVOR_SCIENCE',                   4),
          ('LEADER_THP_WOQINI',     'FLAVOR_CULTURE',                   6),
          ('LEADER_THP_WOQINI',     'FLAVOR_HAPPINESS',                 4),
          ('LEADER_THP_WOQINI',     'FLAVOR_GREAT_PEOPLE',              4),
          ('LEADER_THP_WOQINI',     'FLAVOR_WONDER',                    2),
          ('LEADER_THP_WOQINI',     'FLAVOR_RELIGION',                  7),
          ('LEADER_THP_WOQINI',     'FLAVOR_DIPLOMACY',                 6),
          ('LEADER_THP_WOQINI',     'FLAVOR_SPACESHIP',                 2),
          ('LEADER_THP_WOQINI',     'FLAVOR_WATER_CONNECTION',          3),
          ('LEADER_THP_WOQINI',     'FLAVOR_NUKE',                      1),
          ('LEADER_THP_WOQINI',     'FLAVOR_USE_NUKE',                  7),
          ('LEADER_THP_WOQINI',     'FLAVOR_ESPIONAGE',                 5),
          ('LEADER_THP_WOQINI',     'FLAVOR_ANTIAIR',                   7),
          ('LEADER_THP_WOQINI',     'FLAVOR_AIRLIFT',                   5),
          ('LEADER_THP_WOQINI',     'FLAVOR_I_TRADE_DESTINATION',       6),
          ('LEADER_THP_WOQINI',     'FLAVOR_I_TRADE_ORIGIN',            9),
          ('LEADER_THP_WOQINI',     'FLAVOR_I_SEA_TRADE_ROUTE',         4),
          ('LEADER_THP_WOQINI',     'FLAVOR_I_LAND_TRADE_ROUTE',        10),
          ('LEADER_THP_WOQINI',     'FLAVOR_ARCHAEOLOGY',               6),
          ('LEADER_THP_WOQINI',     'FLAVOR_AIR_CARRIER',               3);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,             TraitType)
VALUES ('LEADER_THP_WOQINI',   'TRAIT_THP_CHEYENNE');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                     Description,                ShortDescription)
VALUES ('TRAIT_THP_CHEYENNE',    'TXT_KEY_TRAIT_THP_CHEYENNE',   'TXT_KEY_TRAIT_THP_CHEYENNE_SHORT');
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- Buildings
------------
INSERT INTO Buildings
(Type,                              BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,  FreePromotion,  TradeRouteLandDistanceModifier,    Description,                         Help,                               Civilopedia,                                                    Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_SUN_DANCE',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,  'PROMOTION_THP_SUN_DANCE',  50,   'TXT_KEY_BLDG_THP_SUN_DANCE',    'TXT_KEY_BLDG_THP_SUN_DANCE_HELP',    'TXT_KEY_BLDG_THP_SUN_DANCE_TEXT',    'TXT_KEY_BLDG_THP_SUN_DANCE_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'THP_CHEYENNE_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_STABLE';
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,            BuildingClassType)
SELECT  'BUILDING_THP_SUN_DANCE', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_STABLE';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,               FlavorType,    Flavor)
SELECT    'BUILDING_THP_SUN_DANCE',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STABLE';

INSERT OR REPLACE INTO Building_Flavors
        (BuildingType,                 FlavorType,                Flavor)
VALUES  ('BUILDING_THP_SUN_DANCE',    'FLAVOR_MILITARY_TRAINING', 15),
        ('BUILDING_THP_SUN_DANCE',    'FLAVOR_I_TRADE_ORIGIN',    6);
----------------------------
-- Building_LocalResourceOrs
----------------------------
INSERT INTO Building_LocalResourceOrs
        (BuildingType,            ResourceType)
SELECT  'BUILDING_THP_SUN_DANCE', ResourceType
FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_STABLE';
--------------------------------
-- Building_ResourceYieldChanges
--------------------------------
INSERT INTO Building_ResourceYieldChanges
        (BuildingType,            ResourceType, YieldType, Yield)
SELECT  'BUILDING_THP_SUN_DANCE', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STABLE';
--------------------------------
-- Building_UnitCombatProductionModifiers
--------------------------------
INSERT INTO Building_UnitCombatProductionModifiers
        (BuildingType,            UnitCombatType, Modifier)
SELECT  'BUILDING_THP_SUN_DANCE', UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_STABLE';
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                         Description,                                              Help,                                        Sound,  EnemyHealChange,                CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_THP_DOG_SOLDIER_1',         'TXT_KEY_PROMOTION_THP_DOG_SOLDIER_1',     'TXT_KEY_PROMOTION_THP_DOG_SOLDIER_1_HELP',     'AS2D_IF_LEVELUP',  0,     1,              3,             'EXPANSION2_PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_DOG_SOLDIER_1'),
('PROMOTION_THP_DOG_SOLDIER_2',         'TXT_KEY_PROMOTION_THP_DOG_SOLDIER_2',     'TXT_KEY_PROMOTION_THP_DOG_SOLDIER_2_HELP',     'AS2D_IF_LEVELUP',  0,     1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_DOG_SOLDIER_2'),
('PROMOTION_THP_SUN_DANCE',         'TXT_KEY_PROMOTION_THP_SUN_DANCE',     'TXT_KEY_PROMOTION_THP_SUN_DANCE_HELP',     'AS2D_IF_LEVELUP',  5,     1,              49,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_SUN_DANCE');

INSERT INTO UnitPromotions_UnitCombatMods
        (PromotionType,                  UnitCombatType,    Modifier)
VALUES  ('PROMOTION_THP_DOG_SOLDIER_1', 'UNITCOMBAT_GUN',   25);

INSERT INTO UnitPromotions_UnitCombats
        (PromotionType,             UnitCombatType)
SELECT  'PROMOTION_THP_SUN_DANCE',  Type
FROM UnitCombatInfos;
--------
-- Units
--------
INSERT INTO Units
(Type,                                 Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special,  Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_DOG_SOLDIER',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_DOG_SOLDIER',    'TXT_KEY_UNIT_THP_DOG_SOLDIER_HELP',    'TXT_KEY_UNIT_THP_DOG_SOLDIER_STRATEGY',      'TXT_KEY_UNIT_THP_DOG_SOLDIER_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_DOG_SOLDIER', 'THP_UNIT_DOG_SOLDIER_FLAG_ATLAS',    0,                    'THP_CHEYENNE_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_LANCER';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,               SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_DOG_SOLDIER',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LANCER';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                 UnitAIType)
SELECT    'UNIT_THP_DOG_SOLDIER',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LANCER';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,               FlavorType, Flavor)
SELECT 'UNIT_THP_DOG_SOLDIER',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LANCER';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,               PromotionType)
SELECT  'UNIT_THP_DOG_SOLDIER',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LANCER';

INSERT INTO Unit_FreePromotions
        (UnitType,                PromotionType)
VALUES  ('UNIT_THP_DOG_SOLDIER', 'PROMOTION_THP_DOG_SOLDIER_1'),
        ('UNIT_THP_DOG_SOLDIER', 'PROMOTION_THP_DOG_SOLDIER_2');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,               UnitClassType)
SELECT  'UNIT_THP_DOG_SOLDIER',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LANCER';
------------------------------------
-- Unit_ResourceQuantityRequirements
------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
       (UnitType,               ResourceType)
SELECT 'UNIT_THP_DOG_SOLDIER',  ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LANCER';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_WOQINI',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_WOQINI_ATTACKED_GENERIC%',                     500),
('LEADER_THP_WOQINI',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_WOQINI_DEFEATED%',                             500),
('LEADER_THP_WOQINI',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_WOQINI_DOW_GENERIC%',                             500),
('LEADER_THP_WOQINI',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_WOQINI_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_WOQINI',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_WOQINI_FIRSTGREETING%',                         500),
('LEADER_THP_WOQINI',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_WOQINI_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_WOQINI',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_WOQINI_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_WOQINI',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_WOQINI_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_WOQINI',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_WOQINI_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_WOQINI',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_WOQINI_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_WOQINI',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_WOQINI_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_WOQINI',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_WOQINI_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_WOQINI',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_WOQINI_LETS_HEAR_IT%',                         500),
('LEADER_THP_WOQINI',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_WOQINI_LUXURY_TRADE%',                         500),
('LEADER_THP_WOQINI',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_WOQINI_NO_PEACE%',                             500),
('LEADER_THP_WOQINI',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_WOQINI_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_WOQINI',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_WOQINI_LOSEWAR%',                                 500),
('LEADER_THP_WOQINI',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_WOQINI_REPEAT_NO%',                             500),
('LEADER_THP_WOQINI',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_WOQINI_RESPONSE_REQUEST%',                     500),
('LEADER_THP_WOQINI',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_WOQINI_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_WOQINI',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_WOQINI_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_WOQINI',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_WOQINI_WINWAR%',                                 500),
('LEADER_THP_WOQINI',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_WOQINI_DENOUNCE%',                             500),
('LEADER_THP_WOQINI',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_WOQINI_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
