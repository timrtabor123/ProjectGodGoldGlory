--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================
-- BUILDINGS
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- Buildings
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, Description, 								Help, 											Strategy,								 			Civilopedia, 									ArtDefineTag, IconAtlas,							PortraitIndex)
SELECT	'BUILDING_JFD_JOUSTING_GROUNDS',	BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, 1, 			  'TXT_KEY_BUILDING_JFD_JOUSTING_GROUNDS', 	'TXT_KEY_BUILDING_JFD_JOUSTING_GROUNDS_HELP',	'TXT_KEY_BUILDING_JFD_JOUSTING_GROUNDS_STRATEGY',	'TXT_KEY_BUILDING_JFD_JOUSTING_GROUNDS_TEXT',	ArtDefineTag, 'JFD_ENGLAND_HENRY_VIII_ICON_ATLAS',  2
FROM Buildings WHERE Type = 'BUILDING_ARMORY';	

UPDATE Buildings
SET PrereqTech = 'TECH_CHIVALRY'
WHERE Type = 'BUILDING_JFD_JOUSTING_GROUNDS';
-------------------------------------------------------------------------------------------------------------------------	                                                                                                                 				
-- Building_ClassesNeededInCity
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_JOUSTING_GROUNDS',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_ARMORY';
-------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainFreeExperiences
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_DomainFreeExperiences 	
		(BuildingType, 						DomainType,		Experience)
SELECT	'BUILDING_JFD_JOUSTING_GROUNDS',	DomainType,		Experience
FROM Building_DomainFreeExperiences WHERE BuildingType = 'BUILDING_ARMORY';
-------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,						Flavor)
SELECT	'BUILDING_JFD_JOUSTING_GROUNDS',	FlavorType,						Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_ARMORY';	

INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,						Flavor)
VALUES	('BUILDING_JFD_JOUSTING_GROUNDS',	'FLAVOR_CULTURE',				20),
		('BUILDING_JFD_JOUSTING_GROUNDS',	'FLAVOR_MOBILE',				20),
		('BUILDING_JFD_JOUSTING_GROUNDS',	'FLAVOR_MILITARY_TRAINING',		10);
-------------------------------------------------------------------------------------------------------------------------	
-- Building_UnitCombatFreeExperiences
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_UnitCombatFreeExperiences 	
		(BuildingType, 						UnitCombatType,			Experience)
VALUES	('BUILDING_JFD_JOUSTING_GROUNDS',	'UNITCOMBAT_MOUNTED',	10);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	LostWithUpgrade,  Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_GRAND_CARRACK',	-10,					1,						0,				  'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK',	'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK');
------------------------------------------------------------------------------------------------------------------------	
-- UnitPromotions_UnitClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_UnitClasses
		(PromotionType, 				UnitClassType,  Attack)
SELECT	'PROMOTION_JFD_GRAND_CARRACK',	Type,			33
FROM UnitClasses WHERE DefaultUnit IN (SELECT Type FROM Units WHERE Domain = 'DOMAIN_SEA' AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL', 'ERA_MEDIEVAL')));
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, RangedCombat, Range, Cost, Moves, HurryCostModifier, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, Description, 						Help, 									Strategy, 									 Civilopedia, 							UnitArtInfo, 						UnitFlagAtlas,								UnitFlagIconOffset,	IconAtlas,								PortraitIndex)
SELECT	'UNIT_JFD_GRAND_CARRACK',	Class, PrereqTech, Combat, RangedCombat, Range, Cost, Moves, HurryCostModifier, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_GRAND_CARRACK',	'TXT_KEY_UNIT_JFD_GRAND_CARRACK_HELP', 	'TXT_KEY_UNIT_JFD_GRAND_CARRACK_STRATEGY',	 'TXT_KEY_UNIT_JFD_GRAND_CARRACK_TEXT',	'ART_DEF_UNIT_JFD_GRAND_CARRACK',	'JFD_ENGLAND_HENRY_VIII_UNIT_FLAG_ATLAS',   0,					'JFD_ENGLAND_HENRY_VIII_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_GALLEASS';	

UPDATE Units
SET RangedCombat = 0, Range = 0, CombatClass = 'UNITCOMBAT_NAVALMELEE', Cost = Cost + 50, Moves = 2, ExtraMaintenanceCost = 1
WHERE Type = 'UNIT_JFD_GRAND_CARRACK';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GRAND_CARRACK', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GALLEASS';	
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_GRAND_CARRACK',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GALLEASS';	
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GRAND_CARRACK', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GALLEASS';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GRAND_CARRACK', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';	

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_GRAND_CARRACK',	'PROMOTION_JFD_GRAND_CARRACK');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_GRAND_CARRACK', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GALLEASS';	
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 								Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 						IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ENGLAND_HENRY_VIII', 	'JFD_EnglandHenryVIII_Scene.xml',	'JFD_ENGLAND_HENRY_VIII_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 3,
MinorCivCompetitiveness = 3,
Boldness = 8,
DiploBalance = 6,
WarmongerHate = 6,
DenounceWillingness = 5,
DoFWillingness = 5,
Loyalty = 6,
Neediness = 6,
Forgiveness = 5,
Chattiness = 5,
Meanness = 5
WHERE Type = 'LEADER_JFD_ENGLAND_HENRY_VIII';	
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'MINOR_CIV_APPROACH_BULLY', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_RANGED', 					7),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_MOBILE', 					8),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_AIR', 						4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_ENGLAND_HENRY_VIII', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																		Bias)
VALUES 	('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DEFEATED%', 					 			500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_FIRSTGREETING%', 				 		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_REQUEST%', 		  						500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_WINWAR%', 					  			500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DENOUNCE%', 					  			500),
		('LEADER_JFD_ENGLAND_HENRY_VIII',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_ENGLAND_HENRY_VIII_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_ENGLAND_HENRY_VIII',	'TRAIT_JFD_ENGLAND_HENRY_VIII');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_TRAIT_JFD_ENGLAND_HENRY_VIII',		'TXT_KEY_TRAIT_JFD_ENGLAND_HENRY_VIII_SHORT');	
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 					DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_ENGLAND_HENRY_VIII',	'BUILDING_DUMMY_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_BUILDING_DUMMY_JFD_ENGLAND_HENRY_VIII');
--------------------------------------------------------------------------------------------------------------------------	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 						 				BuildingClass, 										GreatPeopleRateModifier,	GreatWorkCount, Cost, FaithCost, NeverCapture,	ConquestProb,	Description, 										Help)
VALUES	('BUILDING_DUMMY_JFD_ENGLAND_HENRY_VIII',	'BUILDINGCLASS_DUMMY_JFD_ENGLAND_HENRY_VIII', 		20,							-1, 			-1,   -1, 		 1,				0,				'TXT_KEY_BUILDING_DUMMY_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_BUILDING_DUMMY_JFD_ENGLAND_HENRY_VIII_HELP');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,									Adjective,										Civilopedia, CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,								PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'CIVILIZATION_ENGLAND',		'England', 		'JFD_MapEnglandHenryVIII512.dds',	'TXT_KEY_CIV_DAWN_JFD_ENGLAND_HENRY_VIII_TEXT',	'JFD_DOM_EnglandHenryVIII.dds',	'TXT_KEY_CIV_JFD_ENGLAND_HENRY_VIII_DESC', 	'TXT_KEY_CIV_JFD_ENGLAND_HENRY_VIII_SHORT_DESC',	'TXT_KEY_CIV_JFD_ENGLAND_HENRY_VIII_ADJECTIVE',	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_ENGLAND_HENRY_VIII',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_ENGLAND_HENRY_VIII_ICON_ATLAS',	0,				'JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_1'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_2'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_3'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_4'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_5'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_6'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_7'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_8'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_9'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_10'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_11'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_12'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_13'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_14'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_15'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_16'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_17'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_18'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_19'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_20'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_21'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_22'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_23'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_24'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_25'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_26'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_27'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_28'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_29'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_30'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_31'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_32'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_33'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_34'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_35'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_36'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_37'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_38'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_39'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_HENRY_VIII_40');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits	
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'LEADER_JFD_ENGLAND_HENRY_VIII');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 'BUILDINGCLASS_ARMORY', 	'BUILDING_JFD_JOUSTING_GROUNDS');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'UNITCLASS_GALLEASS',		'UNIT_JFD_GRAND_CARRACK');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII', 'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_0'),	
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_1'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_2'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_3'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_4'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_5'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_6'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_7'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_8'),
		('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_SPY_NAME_JFD_ENGLAND_HENRY_VIII_9');
--==========================================================================================================================
--==========================================================================================================================