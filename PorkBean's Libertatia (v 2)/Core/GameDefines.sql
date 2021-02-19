-- Game Defines for Libertatia, by PorkBean
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_PB_LIBERTATIA', 'TXT_KEY_CIV_PB_LIBERTATIA_DESC',  'TXT_KEY_CIV_PB_LIBERTATIA_SHORT_DESC',   'TXT_KEY_CIV_PB_LIBERTATIA_ADJECTIVE',    'TXT_KEY_PEDIA_PB_LIBERTATIA_TEXT',  'TXT_KEY_PEDIA_PB_LIBERTATIA', 'PLAYERCOLOR_PB_LIBERTATIA',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'LIB_ICON_ATLAS',   0,             'LIB_ALPHA_ATLAS',   SoundtrackTag,							 'Libertatia_Map.dds',  'TXT_KEY_CIV5_DAWN_PB_LIBERTATIA_TEXT',   'Libertatia_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
          (CivilizationType,                    CityName)
VALUES    ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_1'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_2'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_3'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_4'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_5'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_6'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_7'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_8'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_9'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_10'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_11'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_12'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_13'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_14'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_15'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_16'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_17'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_18'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_19'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_20'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_21'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_22'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_23'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_24'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_25'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_26'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_27'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_28'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_CITY_NAME_PB_LIBERTATIA_29');

-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,                BuildingClassType)
SELECT    'CIVILIZATION_PB_LIBERTATIA',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,                TechType)
SELECT    'CIVILIZATION_PB_LIBERTATIA',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,                UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_PB_LIBERTATIA',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,              LeaderheadType)
VALUES ('CIVILIZATION_PB_LIBERTATIA', 'LEADER_PB_MISSON');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
(CivilizationType,            BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_PB_LIBERTATIA', 'BUILDINGCLASS_HARBOR', 'BUILDING_PB_SESSION_HOUSE');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,              UnitClassType,       UnitType)
VALUES ('CIVILIZATION_PB_LIBERTATIA', 'UNITCLASS_PRIVATEER', 'UNIT_PB_MANOFWAR');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,              ReligionType)
VALUES ('CIVILIZATION_PB_LIBERTATIA', 'RELIGION_CHRISTIANITY');
-------------------------
-- Civilization_Start_Along_Ocean
-------------------------
INSERT INTO Civilization_Start_Along_Ocean
       (CivilizationType,                StartAlongOcean)
VALUES ('CIVILIZATION_PB_LIBERTATIA', 1);
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,                  SpyName)
VALUES    ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_0'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_1'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_2'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_3'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_4'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_5'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_6'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_7'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_8'),
          ('CIVILIZATION_PB_LIBERTATIA',     'TXT_KEY_SPY_NAME_PB_LIBERTATIA_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                          Civilopedia,                               CivilopediaTag,                            ArtDefineTag,                 VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,     WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_PB_MISSON',     'TXT_KEY_LEADER_PB_MISSON',    'TXT_KEY_LEADER_PB_MISSON_PEDIA_TEXT',    'TXT_KEY_LEADER_PB_MISSON_PEDIA',						   'Scene_Misson.xml',    7,                                        3,                         5,                           6,            7,                8,                 3,                       6,                    6,           8,            6,               5,          3,           'LIB_ICON_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                  MajorCivApproachType,              Bias)
VALUES    ('LEADER_PB_MISSON',     'MAJOR_CIV_APPROACH_WAR',           7),
          ('LEADER_PB_MISSON',     'MAJOR_CIV_APPROACH_HOSTILE',       4),
          ('LEADER_PB_MISSON',     'MAJOR_CIV_APPROACH_DECEPTIVE',     2),
          ('LEADER_PB_MISSON',     'MAJOR_CIV_APPROACH_GUARDED',       6),
          ('LEADER_PB_MISSON',     'MAJOR_CIV_APPROACH_AFRAID',        3),
          ('LEADER_PB_MISSON',     'MAJOR_CIV_APPROACH_FRIENDLY',      7),
          ('LEADER_PB_MISSON',     'MAJOR_CIV_APPROACH_NEUTRAL',       4);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                     MinorCivApproachType,              Bias)
VALUES    ('LEADER_PB_MISSON',     'MINOR_CIV_APPROACH_IGNORE',        7),
          ('LEADER_PB_MISSON',     'MINOR_CIV_APPROACH_FRIENDLY',      7),
          ('LEADER_PB_MISSON',     'MINOR_CIV_APPROACH_PROTECTIVE',    5),
          ('LEADER_PB_MISSON',     'MINOR_CIV_APPROACH_CONQUEST',      5),
          ('LEADER_PB_MISSON',     'MINOR_CIV_APPROACH_BULLY',         1);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                  FlavorType,                        Flavor)
VALUES    ('LEADER_PB_MISSON',     'FLAVOR_OFFENSE',                   6),
          ('LEADER_PB_MISSON',     'FLAVOR_DEFENSE',                   7),
          ('LEADER_PB_MISSON',     'FLAVOR_CITY_DEFENSE',              6),
          ('LEADER_PB_MISSON',     'FLAVOR_MILITARY_TRAINING',         5),
          ('LEADER_PB_MISSON',     'FLAVOR_RECON',                     4),
          ('LEADER_PB_MISSON',     'FLAVOR_RANGED',                    7),
          ('LEADER_PB_MISSON',     'FLAVOR_MOBILE',                    5),
          ('LEADER_PB_MISSON',     'FLAVOR_NAVAL',                     9),
          ('LEADER_PB_MISSON',     'FLAVOR_NAVAL_RECON',               7),
          ('LEADER_PB_MISSON',     'FLAVOR_NAVAL_GROWTH',              6),
          ('LEADER_PB_MISSON',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    6),
          ('LEADER_PB_MISSON',     'FLAVOR_AIR',                       4),
          ('LEADER_PB_MISSON',     'FLAVOR_EXPANSION',                 8),
          ('LEADER_PB_MISSON',     'FLAVOR_GROWTH',                    6),
          ('LEADER_PB_MISSON',     'FLAVOR_TILE_IMPROVEMENT',          6),
          ('LEADER_PB_MISSON',     'FLAVOR_INFRASTRUCTURE',            4),
          ('LEADER_PB_MISSON',     'FLAVOR_PRODUCTION',                6),
          ('LEADER_PB_MISSON',     'FLAVOR_GOLD',                      4),
          ('LEADER_PB_MISSON',     'FLAVOR_SCIENCE',                   6),
          ('LEADER_PB_MISSON',     'FLAVOR_CULTURE',                   4),
          ('LEADER_PB_MISSON',     'FLAVOR_HAPPINESS',                 7),
          ('LEADER_PB_MISSON',     'FLAVOR_GREAT_PEOPLE',              3),
          ('LEADER_PB_MISSON',     'FLAVOR_WONDER',                    4),
          ('LEADER_PB_MISSON',     'FLAVOR_RELIGION',                  2),
          ('LEADER_PB_MISSON',     'FLAVOR_DIPLOMACY',                 4),
          ('LEADER_PB_MISSON',     'FLAVOR_SPACESHIP',                 5),
          ('LEADER_PB_MISSON',     'FLAVOR_WATER_CONNECTION',          8),
          ('LEADER_PB_MISSON',     'FLAVOR_NUKE',                      2),
          ('LEADER_PB_MISSON',     'FLAVOR_USE_NUKE',                  2),
          ('LEADER_PB_MISSON',     'FLAVOR_ESPIONAGE',                 4),
          ('LEADER_PB_MISSON',     'FLAVOR_ANTIAIR',                   5),
          ('LEADER_PB_MISSON',     'FLAVOR_AIRLIFT',                   3),
          ('LEADER_PB_MISSON',     'FLAVOR_I_TRADE_DESTINATION',       6),
          ('LEADER_PB_MISSON',     'FLAVOR_I_TRADE_ORIGIN',            5),
          ('LEADER_PB_MISSON',     'FLAVOR_I_SEA_TRADE_ROUTE',         8),
          ('LEADER_PB_MISSON',     'FLAVOR_I_LAND_TRADE_ROUTE',        4),
          ('LEADER_PB_MISSON',     'FLAVOR_ARCHAEOLOGY',               4),
          ('LEADER_PB_MISSON',     'FLAVOR_AIR_CARRIER',               4);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,              TraitType)
VALUES ('LEADER_PB_MISSON',   'TRAIT_PB_PIRATE_ROUND');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                   Description,                  ShortDescription)
VALUES ('TRAIT_PB_PIRATE_ROUND',    'TXT_KEY_TRAIT_PB_PIRATE_ROUND',   'TXT_KEY_TRAIT_PB_PIRATE_ROUND_SHORT');

--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------
INSERT INTO Policies
			(Type,								Description)
Values		('POLICY_PB_PLUNDER', 'TXT_KEY_POLICY_PB_PLUNDER');
--------------------------------------------------------------------------------------------------------------------------
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClasses
		(Type,		Description,	DefaultUnit)
VALUES	('UNITCLASS_PB_PLUNDER', 'TXT_KEY_UNIT_PB_PLUNDER', 'UNIT_PB_PLUNDER');	
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class, CombatClass, PrereqTech, Cost, Combat, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 								 Civilopedia, 							ShowInPedia,	OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,			PortraitIndex,	MoveRate)
SELECT	'UNIT_PB_MANOFWAR',		Class, CombatClass, PrereqTech, Cost, Combat, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_PB_MANOFWAR',	'TXT_KEY_UNIT_PB_MANOFWAR_HELP',	'TXT_KEY_UNIT_PB_MANOFWAR_STRATEGY', 	 'TXT_KEY_UNIT_PB_MANOFWAR_TEXT',		ShowInPedia,	OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_PB_MAN_OF_WAR',	'LIB_MANOFWAR_FLAG',	0,					'LIB_ICON_ATLAS',	2,				MoveRate
FROM Units WHERE Type = 'UNIT_PRIVATEER';

INSERT INTO Units 	
		(Type, 						Class, CombatClass, PrereqTech, PolicyType, Cost, Combat, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 								 Civilopedia, 							ShowInPedia,	OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, Capture, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,			PortraitIndex,	MoveRate)
SELECT	'UNIT_PB_PLUNDER',		'UNITCLASS_PB_PLUNDER', CombatClass, 'TECH_AGRICULTURE', 'POLICY_PB_PLUNDER', Cost, Combat, FaithCost, RequiresFaithPurchaseEnabled, 2, 'CIVILIAN_ATTACK_PRIORITY_HIGH', Special, Domain, 'UNITAI_SPACESHIP_PART',	'TXT_KEY_UNIT_PB_PLUNDER',	'TXT_KEY_UNIT_PB_PLUNDER_HELP',	'TXT_KEY_UNIT_PB_PLUNDER_STRATEGY', 	 'TXT_KEY_UNIT_PB_PLUNDER_TEXT',		ShowInPedia,	OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, 'UNITCLASS_PB_PLUNDER', CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_PB_PLUNDER',	'LIB_PLUNDER_FLAG',	0,					'LIB_ICON_ATLAS',	4,				MoveRate
FROM Units WHERE Type = 'UNIT_WORKBOAT';     
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_PB_MANOFWAR',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_PB_PLUNDER',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKBOAT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_PB_MANOFWAR',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_PB_PLUNDER',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKBOAT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_PB_MANOFWAR',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_PB_MANOFWAR',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_PB_MANOFWAR',		'PROMOTION_PB_MOW_GIVES_MOVEMENT');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_PB_MANOFWAR',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PRIVATEER';
-----------------
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                   Description,                             Help,                     Sound,													CannotBeChosen, LostWithUpgrade, CombatPercent,                 PortraitIndex,    IconAtlas,                         PediaType,             PediaEntry)
VALUES    ('PROMOTION_PB_MOW_OCEAN_COMBAT', 'TXT_KEY_PROMOTION_PB_MOW_OCEAN_COMBAT',     'TXT_KEY_PROMOTION_PB_MOW_OCEAN_COMBAT_HELP',    'AS2D_IF_LEVELUP',    1,	0,				30,                              5,            'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PB_MOW_OCEAN_COMBAT'),
		  ('PROMOTION_PB_MOW_GIVES_MOVEMENT', 'TXT_KEY_PROMOTION_PB_MOW_GIVES_MOVEMENT',     'TXT_KEY_PROMOTION_PB_MOW_GIVES_MOVEMENT_HELP',    'AS2D_IF_LEVELUP',    1,	1,				0,                              11,            'EXPANSION2_PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PB_MOW_GIVES_MOVEMENT');
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
--------------------	
-- BuildingClasses
--------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_PB_LIB_ADMIRAL_POINTS_DUMMY', 	'BUILDING_PB_LIB_ADMIRAL_POINTS_DUMMY', 	'TXT_KEY_BUILDING_PB_LIB_ADMIRAL_POINTS_DUMMY'),
		('BUILDINGCLASS_PB_LIB_SH_PROD_DUMMY', 	'BUILDING_PB_LIB_SH_PROD_DUMMY', 	'TXT_KEY_BUILDING_PB_LIB_SH_PROD_DUMMY');
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 												MutuallyExclusiveGroup,			BuildingClass,	 Cost, FaithCost, PrereqTech,							HurryCostModifier,							GoldMaintenance, Water, ArtDefineTag, ArtInfoEraVariation, DisplayPosition, AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, MinAreaSize,			NeverCapture, 	Description, 								Help, 											Strategy,											Civilopedia, 									ArtDefineTag,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_PB_SESSION_HOUSE',					MutuallyExclusiveGroup,			BuildingClass,	 Cost, FaithCost, PrereqTech,							HurryCostModifier,							GoldMaintenance, Water, ArtDefineTag, ArtInfoEraVariation, DisplayPosition, AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, MinAreaSize,			1, 				'TXT_KEY_BUILDING_PB_SESSION_HOUSE', 	'TXT_KEY_BUILDING_PB_SESSION_HOUSE_HELP',	'TXT_KEY_BUILDING_PB_SESSION_HOUSE_STRATEGY',	'TXT_KEY_CIV5_BUILDING_PB_SESSION_HOUSE_TEXT',										ArtDefineTag,	3, 				'LIB_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_HARBOR';

INSERT INTO Buildings		
		(Type, 								BuildingClass, 			  				Cost,  FaithCost, GreatWorkCount,	NeverCapture,  Description, 								 Help)
VALUES	('BUILDING_PB_LIB_ADMIRAL_POINTS_DUMMY', 'BUILDINGCLASS_PB_LIB_ADMIRAL_POINTS_DUMMY',					-1,    -1,		  -1,				1,			   'TXT_KEY_BUILDING_PB_LIB_ADMIRAL_POINTS_DUMMY',	 'TXT_KEY_BUILDING_PB_LIB_ADMIRAL_POINTS_DUMMY_HELP'),
		('BUILDING_PB_LIB_SH_PROD_DUMMY', 'BUILDINGCLASS_PB_LIB_SH_PROD_DUMMY',					-1,    -1,		  -1,				1,			   'TXT_KEY_BUILDING_PB_LIB_SH_PROD_DUMMY',	 'TXT_KEY_BUILDING_PB_LIB_SH_PROD_DUMMY_HELP');

--------------------------------
-- Building_Flavors
--------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 							     FlavorType, 	     			Flavor)
VALUES	('BUILDING_PB_SESSION_HOUSE',		'FLAVOR_CULTURE', 							20),
		('BUILDING_PB_SESSION_HOUSE',		'FLAVOR_PRODUCTION', 							10),
		('BUILDING_PB_SESSION_HOUSE',		'FLAVOR_I_SEA_TRADE_ROUTE', 							10),
		('BUILDING_PB_SESSION_HOUSE',		'FLAVOR_WATER_CONNECTION', 							40),
		('BUILDING_PB_SESSION_HOUSE',		'FLAVOR_I_TRADE_ORIGIN', 							20);

--------------------------------
-- Building_SeaResourceYieldChanges
--------------------------------		
INSERT INTO Building_SeaResourceYieldChanges 	
		(BuildingType, 							     YieldType, 	     			Yield)
VALUES	('BUILDING_PB_SESSION_HOUSE',		'YIELD_CULTURE', 							1);

--------------------------------
-- Building_DomainProductionModifiers
--------------------------------		
INSERT INTO Building_DomainProductionModifiers 	
		(BuildingType, 							     DomainType, 	     			Modifier)
VALUES	('BUILDING_PB_LIB_SH_PROD_DUMMY',		'DOMAIN_SEA', 							1);