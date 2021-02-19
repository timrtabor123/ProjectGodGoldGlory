-- Namibia
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                    Description,                ShortDescription,                          Adjective,                     Civilopedia,                    CivilopediaTag,      DefaultPlayerColor,  ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,         IconAtlas,   PortraitIndex,  AlphaIconAtlas,             SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_PALA', 'TXT_KEY_CIV_THP_PALA_DESC',  'TXT_KEY_CIV_THP_PALA_SHORT_DESC',   'TXT_KEY_CIV_THP_PALA_ADJECTIVE',    'TXT_KEY_PEDIA_THP_PALA_TEXT',  'TXT_KEY_PEDIA_THP_PALA', 'PLAYERCOLOR_THP_PALA',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_PALA_ATLAS',   0,             'THP_PALA_ALPHA_ATLAS',   SoundtrackTag,  'Map_Pala.dds',  'TXT_KEY_CIV5_DAWN_THP_PALA_TEXT',   'Dharmapala_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_INDIA';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
          (CivilizationType,             CityName)
VALUES    ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_1'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_2'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_3'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_4'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_5'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_6'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_7'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_8'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_9'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_10'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_11'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_12'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_13'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_14'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_15'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_16'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_17'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_18'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_19'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_20'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_21'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_22'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_23'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_24'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_25'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_26'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_27'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_28'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_CITY_NAME_THP_PALA_29');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,           BuildingClassType)
SELECT    'CIVILIZATION_THP_PALA',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_INDIA';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,           TechType)
SELECT    'CIVILIZATION_THP_PALA',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_INDIA';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,           UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_PALA',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_INDIA';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,         LeaderheadType)
VALUES ('CIVILIZATION_THP_PALA', 'LEADER_THP_DHARMAPALA');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,         BuildingClassType,          BuildingType)
VALUES ('CIVILIZATION_THP_PALA', 'BUILDINGCLASS_UNIVERSITY', 'BUILDING_THP_MAHAVIHARA');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,         UnitClassType,      UnitType)
VALUES ('CIVILIZATION_THP_PALA', 'UNITCLASS_KNIGHT', 'UNIT_THP_PALA_ELEPHANT');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,         ReligionType)
VALUES ('CIVILIZATION_THP_PALA', 'RELIGION_BUDDHISM');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,             SpyName)
VALUES    ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_0'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_1'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_2'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_3'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_4'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_5'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_6'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_7'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_8'),
          ('CIVILIZATION_THP_PALA',     'TXT_KEY_SPY_NAME_THP_PALA_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                   Description,                                                   Civilopedia,                               CivilopediaTag,                                      ArtDefineTag,                VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,     WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_DHARMAPALA',     'TXT_KEY_LEADER_THP_DHARMAPALA',    'TXT_KEY_LEADER_THP_DHARMAPALA_PEDIA_TEXT',    'TXT_KEY_LEADER_THP_DHARMAPALA_PEDIA',     'Leaderhead_Dharmapala.xml',     6,                                   9,                         6,                           4,            6,                5,                 4,                       8,              7,           7,    6,               8,          3,             'THP_PALA_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                   MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_DHARMAPALA',     'MAJOR_CIV_APPROACH_WAR',           5),
          ('LEADER_THP_DHARMAPALA',     'MAJOR_CIV_APPROACH_HOSTILE',       4),
          ('LEADER_THP_DHARMAPALA',     'MAJOR_CIV_APPROACH_DECEPTIVE',     7),
          ('LEADER_THP_DHARMAPALA',     'MAJOR_CIV_APPROACH_GUARDED',       2),
          ('LEADER_THP_DHARMAPALA',     'MAJOR_CIV_APPROACH_AFRAID',        5),
          ('LEADER_THP_DHARMAPALA',     'MAJOR_CIV_APPROACH_FRIENDLY',      9),
          ('LEADER_THP_DHARMAPALA',     'MAJOR_CIV_APPROACH_NEUTRAL',       5);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                   MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_DHARMAPALA',     'MINOR_CIV_APPROACH_IGNORE',        4),
          ('LEADER_THP_DHARMAPALA',     'MINOR_CIV_APPROACH_FRIENDLY',      8),
          ('LEADER_THP_DHARMAPALA',     'MINOR_CIV_APPROACH_PROTECTIVE',    6),
          ('LEADER_THP_DHARMAPALA',     'MINOR_CIV_APPROACH_CONQUEST',      5),
          ('LEADER_THP_DHARMAPALA',     'MINOR_CIV_APPROACH_BULLY',         3);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                FlavorType,                        Flavor)
VALUES    ('LEADER_THP_DHARMAPALA',     'FLAVOR_OFFENSE',                   7),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_DEFENSE',                   4),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_CITY_DEFENSE',              7),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_MILITARY_TRAINING',         6),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_RECON',                     3),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_RANGED',                    4),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_MOBILE',                    3),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_NAVAL',                     3),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_NAVAL_RECON',               2),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_NAVAL_GROWTH',              3),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    5),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_AIR',                       5),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_EXPANSION',                 9),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_GROWTH',                    6),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_TILE_IMPROVEMENT',          7),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_INFRASTRUCTURE',            9),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_PRODUCTION',                7),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_GOLD',                      5),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_SCIENCE',                   5),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_CULTURE',                   8),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_HAPPINESS',                 7),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_GREAT_PEOPLE',              9),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_WONDER',                    10),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_RELIGION',                  8),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_DIPLOMACY',                 6),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_SPACESHIP',                 3),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_WATER_CONNECTION',          3),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_NUKE',                      5),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_USE_NUKE',                  2),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_ESPIONAGE',                 4),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_AIRLIFT',                   5),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_I_TRADE_DESTINATION',       7),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_I_TRADE_ORIGIN',            4),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_I_SEA_TRADE_ROUTE',         2),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_I_LAND_TRADE_ROUTE',        6),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_ARCHAEOLOGY',               8),
          ('LEADER_THP_DHARMAPALA',     'FLAVOR_AIR_CARRIER',               4);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,                 TraitType)
VALUES ('LEADER_THP_DHARMAPALA',   'TRAIT_THP_PALA');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                 Description,                 ShortDescription)
VALUES ('TRAIT_THP_PALA',    'TXT_KEY_TRAIT_THP_PALA',    'TXT_KEY_TRAIT_THP_PALA_SHORT');
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                               DefaultBuilding,                Description)
VALUES  ('BUILDINGCLASS_THP_PALA_TOURISM',  'BUILDING_THP_PALA_TOURISM',    'TXT_KEY_BLDG_THP_PALA_TOURISM'),
        ('BUILDINGCLASS_THP_PALA_UB_DUMMY', 'BUILDING_THP_PALA_UB_DUMMY',   'TXT_KEY_BLDG_THP_PALA_UB_DUMMY');
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,    Description,                                              Help,                                     Civilopedia,                                              Strategy,                                 ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier,    GreatPeopleRateModifier, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_MAHAVIHARA',    BuildingClass,    Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,   'TXT_KEY_BLDG_THP_MAHAVIHARA',    'TXT_KEY_BLDG_THP_MAHAVIHARA_HELP',    'TXT_KEY_BLDG_THP_MAHAVIHARA_TEXT',    'TXT_KEY_BLDG_THP_MAHAVIHARA_STRATEGY',    ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier,    10,                      HurryCostModifier, 3,            'THP_PALA_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';

INSERT INTO Buildings
(Type,                                   BuildingClass,                        EnhancedYieldTech, TechEnhancedTourism,   SpecialistCount, GreatWorkCount, Cost, FaithCost,             Description,                         Help,                                  NeverCapture)
VALUES    ('BUILDING_THP_PALA_TOURISM', 'BUILDINGCLASS_THP_PALA_TOURISM',     'TECH_AGRICULTURE',                             2,                     0,               -1,             -1,   -1,               'TXT_KEY_BLDG_THP_PALA_TOURISM',    'TXT_KEY_BLDG_THP_PALA_TOURISM_HELP',   1);

INSERT INTO Buildings
(Type,                                    BuildingClass,                        GreatPeopleRateModifier,    SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                                Help,                                             NeverCapture)
VALUES    ('BUILDING_THP_PALA_UB_DUMMY', 'BUILDINGCLASS_THP_PALA_UB_DUMMY',     10,                             0,               -1,             -1,   -1,        'TXT_KEY_BLDG_THP_PALA_UB_DUMMY',    'TXT_KEY_BLDG_THP_PALA_UB_DUMMY_HELP',   1);
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
       (BuildingType,             BuildingClassType)
SELECT 'BUILDING_THP_MAHAVIHARA', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,                FlavorType,    Flavor)
SELECT    'BUILDING_THP_MAHAVIHARA',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';

UPDATE Building_Flavors
SET Flavor = 25 WHERE BuildingType = 'BUILDING_THP_MAHAVIHARA' AND FlavorType = 'FLAVOR_GREAT_PEOPLE';
------------------------
-- Building_FeatureYieldChanges
------------------------
INSERT INTO Building_FeatureYieldChanges
          (BuildingType,                FeatureType,    YieldType,    Yield)
SELECT    'BUILDING_THP_MAHAVIHARA',    FeatureType,    YieldType,    Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';
--------------------------
-- Building_YieldChanges
--------------------------
INSERT INTO Building_YieldChanges
          (BuildingType,                 YieldType,     Yield)
VALUES    ('BUILDING_THP_PALA_TOURISM', 'YIELD_FAITH',  2);
--------------------------
-- Building_YieldModifiers
--------------------------
INSERT INTO Building_YieldModifiers
          (BuildingType,                YieldType,    Yield)
SELECT    'BUILDING_THP_MAHAVIHARA',    YieldType,    Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY';
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                               Description,                                             Help,                                              Sound,                CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_THP_PALA_FAKE_PROMO',         'TXT_KEY_PROMOTION_THP_PALA_FAKE_PROMO',     'TXT_KEY_PROMOTION_THP_PALA_FAKE_PROMO_HELP',     'AS2D_IF_LEVELUP',     1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_PALA_FAKE_PROMO');
--------
-- Units
--------
INSERT INTO Units
(Type,                           Class,    CombatClass, WorkRate, PrereqTech, CanBuyCityState, Combat,     FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,                   Help,                                             Strategy,                                 Civilopedia,          MilitarySupport,             MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo,                UnitFlagAtlas,                                 UnitFlagIconOffset,    IconAtlas,            PortraitIndex,    MoveRate)
SELECT    'UNIT_THP_PALA_ELEPHANT',    Class,    CombatClass, WorkRate, PrereqTech, CanBuyCityState, Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost,  Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_PALA_ELEPHANT',    'TXT_KEY_UNIT_THP_PALA_ELEPHANT_HELP',    'TXT_KEY_UNIT_THP_PALA_ELEPHANT_STRATEGY',      'TXT_KEY_UNIT_THP_PALA_ELEPHANT_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_PALA_ELEPHANT', 'THP_UNIT_PALA_ELEPHANT_FLAG_ATLAS',    0,                    'THP_PALA_ATLAS',   2,        MoveRate
FROM Units WHERE Type = 'UNIT_KNIGHT';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,                 SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_PALA_ELEPHANT',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,                 FlavorType, Flavor)
SELECT 'UNIT_THP_PALA_ELEPHANT',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
       (UnitType,                 PromotionType)
SELECT 'UNIT_THP_PALA_ELEPHANT',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions
VALUES ('UNIT_THP_PALA_ELEPHANT',   'PROMOTION_THP_PALA_FAKE_PROMO');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
       (UnitType,                 UnitClassType)
SELECT 'UNIT_THP_PALA_ELEPHANT',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_DHARMAPALA',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_DHARMAPALA_ATTACKED_GENERIC%',                     500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_DHARMAPALA_DEFEATED%',                             500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_DHARMAPALA_DOW_GENERIC%',                             500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_DHARMAPALA_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_DHARMAPALA_FIRSTGREETING%',                         500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_DHARMAPALA_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_DHARMAPALA_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_DHARMAPALA_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_DHARMAPALA_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_DHARMAPALA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_DHARMAPALA_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_DHARMAPALA_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_DHARMAPALA_LETS_HEAR_IT%',                         500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_DHARMAPALA_LUXURY_TRADE%',                         500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_DHARMAPALA_NO_PEACE%',                             500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_DHARMAPALA_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_DHARMAPALA_LOSEWAR%',                                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_DHARMAPALA_REPEAT_NO%',                             500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_DHARMAPALA_RESPONSE_REQUEST%',                     500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_DHARMAPALA_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_DHARMAPALA_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_DHARMAPALA_WINWAR%',                                 500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_DHARMAPALA_DENOUNCE%',                             500),
('LEADER_THP_DHARMAPALA',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_DHARMAPALA_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================




