--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 			 Description)
VALUES	('BUILDINGCLASS_JFD_INDO_GREEKS',   'BUILDING_JFD_INDO_GREEKS',  'TXT_KEY_BUILDING_JFD_INDO_GREEKS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass, Cost, GoldMaintenance, GreatWorkSlotType, GreatWorkCount, SpecialistCount, SpecialistType, PrereqTech, Description,								Help,											Strategy,											Civilopedia,									ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, ConquestProb, NeverCapture, FreeStartEra, IconAtlas,						PortraitIndex)
SELECT	'BUILDING_JFD_ROYAL_SILVERSMITH',	BuildingClass, Cost, GoldMaintenance, GreatWorkSlotType, GreatWorkCount, SpecialistCount, SpecialistType, PrereqTech, 'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH',	'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH_HELP', 	'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH_STRATEGY', 	'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH_TEXT', 	ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, ConquestProb, NeverCapture, FreeStartEra, 'JFD_INDO_GREEKS_ICON_ATLAS',	2
FROM Buildings WHERE Type = 'BUILDING_MINT';
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 		
		(BuildingType, 						YieldType, Yield)
SELECT	'BUILDING_JFD_ROYAL_SILVERSMITH',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MINT';
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldModifiers 		
		(BuildingType, 						YieldType, Yield)
SELECT	'BUILDING_JFD_ROYAL_SILVERSMITH',	YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_MINT';
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges 		
		(BuildingType, 						ResourceType, YieldType, Yield)
SELECT	'BUILDING_JFD_ROYAL_SILVERSMITH',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_MINT';
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 		
		(BuildingType, 						FlavorType, Flavor)
SELECT	'BUILDING_JFD_ROYAL_SILVERSMITH',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MINT';

 INSERT INTO Building_Flavors 		
		(BuildingType, 						FlavorType, 		Flavor)
 VALUES	('BUILDING_JFD_ROYAL_SILVERSMITH',	'FLAVOR_CULTURE',   20),
		('BUILDING_JFD_ROYAL_SILVERSMITH',	'FLAVOR_RELIGION',  20);
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 												BuildingClass,						GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,												Help, 															NeverCapture)
VALUES	('BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED',		'BUILDINGCLASS_JFD_INDO_GREEKS',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED',		'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED_HELP',		1),
		('BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED_OTHER',	'BUILDINGCLASS_JFD_INDO_GREEKS',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED_OTHER',	'TXT_KEY_BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED_OTHER_HELP',	1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 										YieldType,		  Yield)
VALUES	('BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED',		'YIELD_CULTURE',  1),
		('BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED',		'YIELD_FAITH',	  2),
		('BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED_OTHER',	'YIELD_CULTURE',  1);
------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassLocalYieldChanges
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Building_BuildingClassLocalYieldChanges(BuildingType, BuildingClassType, YieldType, YieldChange);
INSERT INTO Building_BuildingClassLocalYieldChanges 	
		(BuildingType, 										BuildingClassType,		YieldType,		  YieldChange)
VALUES	('BUILDING_JFD_ROYAL_SILVERSMITH_CONNECTED_OTHER',	'BUILDINGCLASS_MINT',	'YIELD_CULTURE',  1);	
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 						 Help, 									   Sound, 				CityDefense,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_WAR_MAHOUT',	'TXT_KEY_PROMOTION_JFD_WAR_MAHOUT',	 'TXT_KEY_PROMOTION_JFD_WAR_MAHOUT_HELP',  'AS2D_IF_LEVELUP', 	25,				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_WAR_MAHOUT');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass,		PrereqTech,			Cost, Combat,   RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves,   CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 									Strategy, 								 Civilopedia, 							ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset,  IconAtlas,						PortraitIndex)
SELECT	'UNIT_JFD_WAR_MAHOUT',	Class,	'UNITCOMBAT_SIEGE', 'TECH_MATHEMATICS', Cost, Combat+3, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves-1, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_WAR_MAHOUT',	'TXT_KEY_UNIT_JFD_WAR_MAHOUT_HELP', 	'TXT_KEY_UNIT_JFD_WAR_MAHOUT_STRATEGY',  'TXT_KEY_UNIT_JFD_WAR_MAHOUT_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_WAR_MAHOUT',	'JFD_INDO_GREEKS_UNIT_FLAG_ATLAS',  0,					 'JFD_INDO_GREEKS_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_CHARIOT_ARCHER';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_WAR_MAHOUT',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CHARIOT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_WAR_MAHOUT',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CHARIOT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_WAR_MAHOUT',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CHARIOT_ARCHER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_WAR_MAHOUT',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CHARIOT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
--INSERT INTO Unit_ResourceQuantityRequirements
--		(UnitType, 					ResourceType, Cost)
--SELECT	'UNIT_JFD_WAR_MAHOUT',	ResourceType, Cost
--FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CHARIOT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_WAR_MAHOUT',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_WAR_MAHOUT',	'PROMOTION_JFD_WAR_MAHOUT');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, 	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_MENANDER', 	'TXT_KEY_LEADER_JFD_MENANDER',		'TXT_KEY_LEADER_JFD_MENANDER_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_MENANDER', 	'JFD_Menander_Scene.xml',	7, 							5, 						4, 							5, 			6, 				8, 				5, 						5, 				6, 			2, 			5, 				3, 			2, 			'JFD_INDO_GREEKS_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MENANDER', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_MENANDER', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JFD_MENANDER', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_MENANDER', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_MENANDER', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_MENANDER', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_MENANDER', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MENANDER', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_MENANDER', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_MENANDER', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_MENANDER', 	'MINOR_CIV_APPROACH_CONQUEST', 		9),
		('LEADER_JFD_MENANDER', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_MENANDER', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_MENANDER', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_MENANDER', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_MENANDER', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_MENANDER', 	'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_MENANDER', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_MENANDER', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_MENANDER', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_MENANDER', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_MENANDER', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_MENANDER', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_MENANDER', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_MENANDER', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_SCIENCE', 					6),
		('LEADER_JFD_MENANDER', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_MENANDER', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_MENANDER', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_MENANDER', 	'FLAVOR_RELIGION', 					7),
		('LEADER_JFD_MENANDER', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_MENANDER', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_MENANDER', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_MENANDER', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_MENANDER', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_MENANDER', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_MENANDER', 	'TRAIT_JFD_INDO_GREEKS');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_INDO_GREEKS', 	'TXT_KEY_TRAIT_JFD_INDO_GREEKS',	'TXT_KEY_TRAIT_JFD_INDO_GREEKS_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 				ResponseType, 								Response, 														Bias)
VALUES 	('LEADER_JFD_MENANDER', 	'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_JFD_MENANDER_DENOUNCE_FRIEND%', 				500),
		('LEADER_JFD_MENANDER', 	'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_JFD_MENANDER_ATTACKED_HOSTILE%', 				500),
		('LEADER_JFD_MENANDER', 	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_JFD_MENANDER_DEFEATED%', 						500),
		('LEADER_JFD_MENANDER', 	'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_JFD_MENANDER_DOW_GENERIC%', 					500),
		('LEADER_JFD_MENANDER', 	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_JFD_MENANDER_FIRSTGREETING%', 					500),
		('LEADER_JFD_MENANDER', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 	'TXT_KEY_LEADER_JFD_MENANDER_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_JFD_MENANDER', 	'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_JFD_MENANDER_DENOUNCE%', 						500),
		('LEADER_JFD_MENANDER', 	'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_JFD_MENANDER_DEC_FRIENDSHIP%', 					500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description,						 ShortDescription,							Adjective,									Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,					SoundtrackTag,  MapImage, 					DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_INDO_GREEKS',		'TXT_KEY_CIV_JFD_INDO_GREEKS_DESC',	 'TXT_KEY_CIV_JFD_INDO_GREEKS_SHORT_DESC',	'TXT_KEY_CIV_JFD_INDO_GREEKS_ADJECTIVE',	'TXT_KEY_CIV5_JFD_INDO_GREEKS_TEXT_1',  'TXT_KEY_CIV5_JFD_INDO_GREEKS',	'PLAYERCOLOR_JFD_INDO_GREEKS',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_INDO_GREEKS_ICON_ATLAS',	0,				'JFD_INDO_GREEKS_ALPHA_ATLAS',	'Greece', 		'JFD_MapIndoGreeks512.dds',	'TXT_KEY_CIV5_DAWN_JFD_INDO_GREEKS_TEXT',	'JFD_DOM_IndoGreeks.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_GREECE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_01'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_02'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_03'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_04'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_05'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_06'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_07'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_08'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_09'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_10'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_11'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_12'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_13'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_14'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_15'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_16'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_17'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_18'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_19'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_20'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_21'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_22'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_23'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_24'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_25'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_26'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_27'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_28'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_29'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_30'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_31'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_32'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_33'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_34'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_CITY_NAME_JFD_INDO_GREEKS_35');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_INDO_GREEKS', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SWEDEN';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_INDO_GREEKS', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SWEDEN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_INDO_GREEKS', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SWEDEN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS',	'LEADER_JFD_MENANDER');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS', 	'UNITCLASS_CHARIOT_ARCHER',	'UNIT_JFD_WAR_MAHOUT');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS', 	'BUILDINGCLASS_MINT',	'BUILDING_JFD_ROYAL_SILVERSMITH');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS',	'RELIGION_BUDDHISM');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_0'),	
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_1'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_2'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_3'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_4'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_5'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_6'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_7'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_8'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_9'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_10'),
		('CIVILIZATION_JFD_INDO_GREEKS', 	'TXT_KEY_SPY_NAME_JFD_INDO_GREEKS_11');
--==========================================================================================================================
--==========================================================================================================================
