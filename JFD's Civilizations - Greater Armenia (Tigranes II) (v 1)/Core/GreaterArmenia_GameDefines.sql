--=======================================================================================================================
-- CUSTOM MOD OPTIONS
--=======================================================================================================================
-- CustomModOptions
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text default null, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 									DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_GREATER_ARMENIA', 	'BUILDING_JFD_GREATER_ARMENIA', 	'TXT_KEY_BUILDING_JFD_GREATER_ARMENIA');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, Cost, GoldMaintenance, AllowsProductionTradeRoutes,  GreatWorkSlotType, GreatWorkCount, SpecialistCount, SpecialistType, PrereqTech, Description,								Help,										Strategy,										Civilopedia,								ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, ConquestProb, NeverCapture, FreeStartEra, IconAtlas,							PortraitIndex)
SELECT	'BUILDING_JFD_SIEGE_WORKSHOP',	BuildingClass, Cost, GoldMaintenance, 1, 							GreatWorkSlotType, GreatWorkCount, SpecialistCount, SpecialistType, PrereqTech, 'TXT_KEY_BUILDING_JFD_SIEGE_WORKSHOP',	'TXT_KEY_BUILDING_JFD_SIEGE_WORKSHOP_HELP', 'TXT_KEY_BUILDING_JFD_SIEGE_WORKSHOP_STRATEGY', 'TXT_KEY_BUILDING_JFD_SIEGE_WORKSHOP_TEXT', ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, ConquestProb, NeverCapture, FreeStartEra, 'JFD_GREATER_ARMENIA_ICON_ATLAS',	3
FROM Buildings WHERE Type = 'BUILDING_WORKSHOP';

INSERT INTO Buildings 		
		(Type, 										BuildingClass,							GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,										Help, 													NeverCapture)
VALUES	('BUILDING_JFD_SIEGE_WORKSHOP_PRODUCTION',	'BUILDINGCLASS_JFD_GREATER_ARMENIA',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_SIEGE_WORKSHOP_PRODUCTION',	'TXT_KEY_BUILDING_JFD_SIEGE_WORKSHOP_PRODUCTION_HELP',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 		
		(BuildingType, 					YieldType, Yield)
SELECT	'BUILDING_JFD_SIEGE_WORKSHOP',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WORKSHOP';
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldModifiers 		
		(BuildingType, 					YieldType, Yield)
SELECT	'BUILDING_JFD_SIEGE_WORKSHOP',	YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_WORKSHOP';
--------------------------------------------------------------------------------------------------------------------------
-- Building_UnitCombatProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers 		
		(BuildingType, 								UnitCombatType, 	Modifier)
VALUES	('BUILDING_JFD_SIEGE_WORKSHOP',				'UNITCOMBAT_SIEGE', 10),
		('BUILDING_JFD_SIEGE_WORKSHOP_PRODUCTION',	'UNITCOMBAT_SIEGE', 10);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 		
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_JFD_SIEGE_WORKSHOP',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_WORKSHOP';

INSERT INTO Building_Flavors 		
		(BuildingType, 					FlavorType, 				Flavor)
VALUES	('BUILDING_JFD_SIEGE_WORKSHOP',	'FLAVOR_MILITARY_TRAINING', 20);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen, LostWithUpgrade, PortraitIndex,  IconAtlas, 		PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_AZATAVREAR',	'TXT_KEY_PROMOTION_JFD_AZATAVREAR',		'TXT_KEY_PROMOTION_JFD_AZATAVREAR_HELP',	'AS2D_IF_LEVELUP', 	1, 				0, 				 59, 			 'ABILITY_ATLAS',   'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_AZATAVREAR');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,	CombatClass, PrereqTech, Cost, Combat, 	 FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 								 Civilopedia, 							MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, ObsoleteTech, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 							UnitFlagIconOffset, IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_AZATAVREAR',		Class,	CombatClass, PrereqTech, Cost, Combat+5, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_AZATAVREAR',	'TXT_KEY_UNIT_JFD_AZATAVREAR_HELP',	'TXT_KEY_UNIT_JFD_AZATAVREAR_STRATEGY',  'TXT_KEY_UNIT_JFD_AZATAVREAR_TEXT',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, ObsoleteTech, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_AZATAVREAR',	'JFD_GREATER_ARMENIA_UNIT_FLAG_ATLAS',	0,					'JFD_GREATER_ARMENIA_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_KNIGHT';         	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_AZATAVREAR',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_AZATAVREAR',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_AZATAVREAR',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_JFD_AZATAVREAR',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_AZATAVREAR',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
VALUES	('UNIT_JFD_AZATAVREAR',		'PROMOTION_JFD_AZATAVREAR');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_AZATAVREAR',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			 	VictoryCompetitiveness, 	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 							PortraitIndex)
VALUES	('LEADER_JFD_TIGRANES_II', 	'TXT_KEY_LEADER_JFD_TIGRANES_II',	'TXT_KEY_LEADER_JFD_TIGRANES_II_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_TIGRANES_II', 	'JFD_TigranesII_Scene.xml',	8, 							2, 						2, 							6, 			5, 				8, 				5, 						4, 				4, 			5, 			4, 				4, 			4, 			'JFD_GREATER_ARMENIA_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_TIGRANES_II', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_TIGRANES_II', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_TIGRANES_II', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JFD_TIGRANES_II', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_TIGRANES_II', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_TIGRANES_II', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_TIGRANES_II', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_TIGRANES_II', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_TIGRANES_II', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_TIGRANES_II', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_JFD_TIGRANES_II', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_JFD_TIGRANES_II', 	'MINOR_CIV_APPROACH_BULLY', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_TIGRANES_II', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_RECON', 					3),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_MOBILE', 					9),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_WONDER', 					1),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_TIGRANES_II', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_TIGRANES_II', 	'TRAIT_JFD_GREATER_ARMENIA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_JFD_GREATER_ARMENIA', 	'TXT_KEY_TRAIT_JFD_GREATER_ARMENIA',	'TXT_KEY_TRAIT_JFD_GREATER_ARMENIA_SHORT');
--------------------------------------------------------------------------------------------------------------------------
-- Trait_FreePromotionUnitCombats
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_FreePromotionUnitCombats 
		(TraitType,						PromotionType, 					  UnitCombatType)
VALUES	('TRAIT_JFD_GREATER_ARMENIA',	'PROMOTION_JFD_GREATER_ARMENIA',  'UNITCOMBAT_MOUNTED');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 										 BuildingClass,							GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,										Help, 													NeverCapture)
VALUES	('BUILDING_JFD_GREATER_ARMENIA_PRODUCTION',	 'BUILDINGCLASS_JFD_GREATER_ARMENIA',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_GREATER_ARMENIA_PRODUCTION',	'TXT_KEY_BUILDING_JFD_GREATER_ARMENIA_PRODUCTION_HELP',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_UnitCombatProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers 		
		(BuildingType, 								 UnitCombatType, 		Modifier)
VALUES	('BUILDING_JFD_GREATER_ARMENIA_PRODUCTION',	 'UNITCOMBAT_MOUNTED',  10);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Building_JFD_HelpTexts (
    BuildingType			text    REFERENCES Buildings(Type)			default null,
    CivilizationType		text    REFERENCES Civilizations(Type)		default null,
	PolicyType				text    REFERENCES Policies(Type)			default null,
	HelpText				text										default null,
	IsWrittenFirst			boolean										default 0,
	NotOnceBuilt			boolean										default 0);
	
INSERT INTO Building_JFD_HelpTexts 		
		(BuildingType, 			CivilizationType,					  HelpText)
VALUES	('BUILDING_CASTLE',		'CIVILIZATION_JFD_GREATER_ARMENIA',	  'TXT_KEY_BUILDING_JFD_GREATER_ARMENIA_HORSES_HELP'),
		('BUILDING_WALLS',		'CIVILIZATION_JFD_GREATER_ARMENIA',	  'TXT_KEY_BUILDING_JFD_GREATER_ARMENIA_HORSES_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, LostWithUpgrade, PortraitIndex,  IconAtlas, 		PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROMOTION_JFD_GREATER_ARMENIA',	'TXT_KEY_PROMOTION_JFD_GREATER_ARMENIA_HELP',	'AS2D_IF_LEVELUP', 	1, 				0, 				 59, 			 'ABILITY_ATLAS',   'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_GREATER_ARMENIA');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 					UnitCombatType)
VALUES	('PROMOTION_JFD_GREATER_ARMENIA',	'UNITCOMBAT_MOUNTED');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 				ResponseType, 									Response, 																Bias)
VALUES 	('LEADER_JFD_TIGRANES_II', 	'RESPONSE_AI_DOF_BACKSTAB', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_DENOUNCE%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_ATTACKED_EXCITED', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_ATTACKED_EXCITED%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_ATTACKED_HOSTILE', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_ATTACKED_HOSTILE%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_ATTACKED_SAD', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_ATTACKED_SAD%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			'TXT_KEY_LEADER_JFD_TIGRANES_II_ATTACKED_HOSTILE%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_ATTACKED_WEAK_HOSTILE', 				'TXT_KEY_LEADER_JFD_TIGRANES_II_ATTACKED_HOSTILE%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_DEFEATED', 							'TXT_KEY_LEADER_JFD_TIGRANES_II_DEFEATED%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_DONT_SETTLE_NO', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_DONT_SETTLE_NO%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_DONT_SETTLE_YES', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_DONT_SETTLE_YES%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_DOW_GENERIC', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_DOW_GENERIC%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_DOW_LAND', 							'TXT_KEY_LEADER_JFD_TIGRANES_II_DOW_LAND%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_DOW_WORLD_CONQUEST', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_DOW_WORLD_CONQUEST%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_EMBASSY_EXCHANGE', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_EMBASSY_EXCHANGE%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_EXPANSION_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_TIGRANES_II_EXPANSION_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_FIRST_GREETING', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_FIRSTGREETING%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_GREETING_AT_WAR_HOSTILE', 			'TXT_KEY_LEADER_JFD_TIGRANES_II_GREETING_AT_WAR_HOSTILE%', 				500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_GREETING_POLITE_HELLO', 				'TXT_KEY_LEADER_JFD_TIGRANES_II_GREETING_POLITE_HELLO%', 				500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_GREETING_NEUTRAL_HELLO', 				'TXT_KEY_LEADER_JFD_TIGRANES_II_GREETING_NEUTRAL_HELLO%', 				500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_GREETING_HOSTILE_HELLO', 				'TXT_KEY_LEADER_JFD_TIGRANES_II_GREETING_HOSTILE_HELLO%', 				500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_JFD_TIGRANES_II_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_INFLUENTIAL_ON_AI', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_INFLUENTIAL_ON_AI%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_INFLUENTIAL_ON_HUMAN', 				'TXT_KEY_LEADER_JFD_TIGRANES_II_INFLUENTIAL_ON_HUMAN%', 				500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_INSULT_CITIES', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_INSULT_CITIES%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_INSULT_MILITARY', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_INSULT_MILITARY%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_INSULT_POPULATION', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_INSULT_POPULATION%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_LETS_HEAR_IT', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_LETS_HEAR_IT%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_LUXURY_TRADE', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_LUXURY_TRADE%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_NO_PEACE', 							'TXT_KEY_LEADER_JFD_TIGRANES_II_NO_PEACE%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_OPEN_BORDERS_EXCHANGE', 				'TXT_KEY_LEADER_JFD_TIGRANES_II_OPEN_BORDERS_EXCHANGE%', 				500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_PEACE_OFFER', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_PEACE_OFFER%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_REPEAT_NO', 							'TXT_KEY_LEADER_JFD_TIGRANES_II_REPEAT_NO%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_REPEAT_TRADE', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_REPEAT_TRADE%', 						500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_REQUEST', 							'TXT_KEY_LEADER_JFD_TIGRANES_II_RESPONSE_REQUEST%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 		'TXT_KEY_LEADER_JFD_TIGRANES_II_RESPONSE_TO_BEING_DENOUNCED%', 			500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_TOO_SOON_FOR_DOF', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_TOO_SOON_FOR_DOF_1%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_TOO_SOON_NO_PEACE', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_TOO_SOON_NO_PEACE_1%', 					500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_WARMONGER', 							'TXT_KEY_LEADER_JFD_TIGRANES_II_WARMONGER%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_WINNER_PEACE_OFFER', 					'TXT_KEY_LEADER_JFD_TIGRANES_II_WINWAR%', 								500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_WORK_AGAINST_SOMEONE', 				'TXT_KEY_LEADER_JFD_TIGRANES_II_DENOUNCE%', 							500),
		('LEADER_JFD_TIGRANES_II', 	'RESPONSE_WORK_WITH_US', 						'TXT_KEY_LEADER_JFD_TIGRANES_II_DEC_FRIENDSHIP%', 						500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									Description,							 ShortDescription,								Adjective,										Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas,						SoundtrackTag,  MapImage, 						DawnOfManQuote, 								DawnOfManImage)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA',		'TXT_KEY_CIV_JFD_GREATER_ARMENIA_DESC',	 'TXT_KEY_CIV_JFD_GREATER_ARMENIA_SHORT_DESC',	'TXT_KEY_CIV_JFD_GREATER_ARMENIA_ADJECTIVE',	'TXT_KEY_CIV5_JFD_GREATER_ARMENIA_TEXT_1',  'TXT_KEY_CIV5_JFD_GREATER_ARMENIA',	'PLAYERCOLOR_JFD_GREATER_ARMENIA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_GREATER_ARMENIA_ICON_ATLAS',	0,				'JFD_GREATER_ARMENIA_ALPHA_ATLAS',	'Persia', 		'JFD_MapGreaterArmenia512.dds',	'TXT_KEY_CIV5_DAWN_JFD_GREATER_ARMENIA_TEXT',	'JFD_DOM_GreaterArmenia.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_BYZANTIUM';

UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_JFD_ARMENIA'
WHERE Type = 'CIVILIZATION_JFD_GREATER_ARMENIA'; 
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_01'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_02'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_03'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_04'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_05'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_06'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_07'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_08'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_09'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_10'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_11'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_12'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_13'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_14'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_15'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_16'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_17'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_18'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_19'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_20'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_21'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_22'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_23'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_24'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_25'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_26'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_27'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_28'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_29'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GREATER_ARMENIA_30');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_GREATER_ARMENIA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA',	'LEADER_JFD_TIGRANES_II');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA', 	'UNITCLASS_KNIGHT',			'UNIT_JFD_AZATAVREAR');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA', 	'BUILDINGCLASS_WORKSHOP',	'BUILDING_JFD_SIEGE_WORKSHOP');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA',	'RELIGION_ZOROASTRIANISM');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_0'),	
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_1'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_2'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_3'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_4'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_5'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_6'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_7'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_8'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_9'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_10'),
		('CIVILIZATION_JFD_GREATER_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_GREATER_ARMENIA_11');
--==========================================================================================================================
--==========================================================================================================================
