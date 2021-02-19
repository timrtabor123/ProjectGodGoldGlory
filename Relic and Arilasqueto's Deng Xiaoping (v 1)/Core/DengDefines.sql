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
		(Type, 								DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_RELIC_DENG_CHINA', 	'BUILDING_RELIC_DENG_CHINA', 	'TXT_KEY_BUILDING_RELIC_DENG_CHINA');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description,							ShortDescription,							Adjective,								 Civilopedia, 							 CivilopediaTag, 					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,					SoundtrackTag,  MapImage, 						DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_RELIC_DENG_CHINA',	'TXT_KEY_CIV_RELIC_DENG_CHINA_DESC',	'TXT_KEY_CIV_RELIC_DENG_CHINA_SHORT_DESC',	'TXT_KEY_CIV_RELIC_DENG_CHINA_ADJECTIVE', 'TXT_KEY_CIV5_RELIC_DENG_CHINA_TEXT_1',  'TXT_KEY_CIV5_RELIC_DENG_CHINA',	'PLAYERCOLOR_RELIC_DENG_CHINA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'RELIC_DENG_CHINA_ICON_ATLAS',	0,				'RELIC_DENG_CHINA_ALPHA_ATLAS',	'China', 		'RelicMapDeng512.dds',		'TXT_KEY_DOM_RELIC_DENG_CHINA_TEXT',	'RelicDomDeng.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_01'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_02'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_03'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_04'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_05'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_06'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_07'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_08'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_09'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_10'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_11'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_12'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_13'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_14'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_15'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_16'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_17'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_18'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_19'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_20'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_21'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_22'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_23'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_CITY_NAME_RELIC_DENG_CHINA_24');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_RELIC_DENG_CHINA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_RELIC_DENG_CHINA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_RELIC_DENG_CHINA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA',	'LEADER_RELIC_DENG');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA', 	'UNITCLASS_TANK',	'UNIT_RELIC_T59');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA',	'RELIGION_CONFUCIANISM');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_0'),	
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_1'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_2'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_3'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_4'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_5'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_6'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_7'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_8'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_9'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_10'),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'TXT_KEY_SPY_NAME_RELIC_DENG_CHINA_11');
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, 	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_RELIC_DENG', 	'TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_DENG_CHINA_NAME',	'TXT_KEY_LEADER_RELIC_DENG_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_DENG', 	'DengFallback.xml',	7, 							5, 						3, 							6, 			4, 				4, 				3, 						6, 				6, 			4, 			4, 				4, 			2, 			'RELIC_DENG_CHINA_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_RELIC_DENG', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_RELIC_DENG', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_RELIC_DENG', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_RELIC_DENG', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_RELIC_DENG', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_RELIC_DENG', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_RELIC_DENG', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_RELIC_DENG', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_RELIC_DENG', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_RELIC_DENG', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_RELIC_DENG', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_RELIC_DENG', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_RELIC_DENG', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_RELIC_DENG', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_RELIC_DENG', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_RELIC_DENG', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_RELIC_DENG', 	'FLAVOR_RECON', 					2),
		('LEADER_RELIC_DENG', 	'FLAVOR_RANGED', 					7),
		('LEADER_RELIC_DENG', 	'FLAVOR_MOBILE', 					7),
		('LEADER_RELIC_DENG', 	'FLAVOR_NAVAL', 					5),
		('LEADER_RELIC_DENG', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_RELIC_DENG', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_RELIC_DENG', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_RELIC_DENG', 	'FLAVOR_AIR', 						7),
		('LEADER_RELIC_DENG', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_RELIC_DENG', 	'FLAVOR_GROWTH', 					8),
		('LEADER_RELIC_DENG', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_RELIC_DENG', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_RELIC_DENG', 	'FLAVOR_PRODUCTION', 				8),
		('LEADER_RELIC_DENG', 	'FLAVOR_GOLD', 						5),
		('LEADER_RELIC_DENG', 	'FLAVOR_SCIENCE', 					6),
		('LEADER_RELIC_DENG', 	'FLAVOR_CULTURE', 					6),
		('LEADER_RELIC_DENG', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_RELIC_DENG', 	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_RELIC_DENG', 	'FLAVOR_WONDER', 					3),
		('LEADER_RELIC_DENG', 	'FLAVOR_RELIGION', 					4),
		('LEADER_RELIC_DENG', 	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_RELIC_DENG', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_RELIC_DENG', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_RELIC_DENG', 	'FLAVOR_NUKE', 						4),
		('LEADER_RELIC_DENG', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_RELIC_DENG', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_RELIC_DENG', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_RELIC_DENG', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_RELIC_DENG', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_RELIC_DENG', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_RELIC_DENG', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_RELIC_DENG', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_RELIC_DENG', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_RELIC_DENG', 	'TRAIT_RELIC_DENG_CHINA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_RELIC_DENG_CHINA', 	'TXT_KEY_TRAIT_RELIC_DENG_CHINA',	'TXT_KEY_TRAIT_RELIC_DENG_CHINA_SHORT');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 					BuildingType)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA',			'BUILDINGCLASS_STOCK_EXCHANGE',		'BUILDING_RELIC_DENG_SEZ');
--=========================================================================================================================
-- BUILDINGS
--=========================================================================================================================
INSERT INTO Buildings 	
		(Type, 							TradeRouteRecipientBonus,	TradeRouteTargetBonus,	SpecialistType,	SpecialistCount, BuildingClass,  PrereqTech, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, MinAreaSize, ConquestProb, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_RELIC_DENG_SEZ',		TradeRouteRecipientBonus,	TradeRouteTargetBonus,	SpecialistType,	SpecialistCount, BuildingClass,  PrereqTech, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, MinAreaSize, ConquestProb, HurryCostModifier, 1, 				'TXT_KEY_BUILDING_RELIC_DENG_SEZ', 	'TXT_KEY_BUILDING_RELIC_DENG_SEZ_HELP', 	'TXT_KEY_BUILDING_RELIC_DENG_SEZ_STRATEGY',	'TXT_KEY_BUILDING_RELIC_DENG_SEZ_TEXT',	ArtDefineTag, 3, 			 'RELIC_DENG_CHINA_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_STOCK_EXCHANGE';	
------------------------------------------------------------------------------------------------------------------------ 	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_RELIC_DENG_SEZ',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_RELIC_DENG_SEZ',		YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';
------------------------------------------------------------------------------------------------------------------------	                                                                                                                 				
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_RELIC_DENG_SEZ',		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_RELIC_DENG_SEZ',		YieldType,	Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';
--------------------------------------------------------------------------------------------------------------------------
-- Dummies
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 									BuildingClass,						GreatWorkCount,	Cost, 	FaithCost, 	PrereqTech,  Description,									Help, 											NeverCapture)
VALUES	('BUILDING_RELIC_DENG_CHINA_SEZ_PROD',	'BUILDINGCLASS_RELIC_DENG_CHINA',	-1,   			-1,		-1,			null,		 'TXT_KEY_BUILDING_RELIC_DENG_CHINA_PROD_DUMMY',	'TXT_KEY_BUILDING_RELIC_DENG_CHINA_PROD_DUMMY',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,							ResourceType,	YieldType,			Yield)
SELECT	'BUILDING_RELIC_DENG_CHINA_SEZ_PROD',	Type,			'YIELD_PRODUCTION', 1
FROM Resources;
--------------------------------------------------------------------------------------------------------------------------
-- Resources Trigger
--------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER RelicDengSEZ AFTER INSERT ON Resources 
BEGIN
INSERT INTO Building_ResourceYieldChanges 
		(BuildingType,							ResourceType,	YieldType,			Yield)
VALUES	('BUILDING_RELIC_DENG_CHINA_SEZ_PROD',	NEW.Type,		'YIELD_PRODUCTION',	1);
END;
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_RELIC_DENG',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_RELIC_DENG_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_RELIC_DENG',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_RELIC_DENG_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_RELIC_DENG',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_RELIC_DENG_DEFEATED%', 					 			500),
		('LEADER_RELIC_DENG',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_RELIC_DENG_DOW_GENERIC%', 				 				500),
		('LEADER_RELIC_DENG',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_RELIC_DENG_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_RELIC_DENG',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_RELIC_DENG_FIRSTGREETING%', 				 			500),
		('LEADER_RELIC_DENG',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_RELIC_DENG_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_RELIC_DENG',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_RELIC_DENG_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_RELIC_DENG',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_RELIC_DENG_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_RELIC_DENG',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_RELIC_DENG_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 		500),
		('LEADER_RELIC_DENG',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_RELIC_DENG_LUXURY_TRADE%', 		  					500),
		('LEADER_RELIC_DENG',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_RELIC_DENG_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_RELIC_DENG',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_RELIC_DENG_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_RELIC_DENG',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_RELIC_DENG_REQUEST%', 		  							500),
		('LEADER_RELIC_DENG',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_RELIC_DENG_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_RELIC_DENG',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_RELIC_DENG_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_RELIC_DENG',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_RELIC_DENG_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_RELIC_DENG',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_RELIC_DENG_DENOUNCE%', 					  			500),
		('LEADER_RELIC_DENG',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_RELIC_DENG_DEC_FRIENDSHIP%', 			  	  			500);

--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 									Civilopedia, 						MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_RELIC_T59',		Class,	CombatClass, PrereqTech, 0.8 * Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_RELIC_T59',	'TXT_KEY_UNIT_RELIC_T59_HELP', 'TXT_KEY_UNIT_RELIC_T59_STRATEGY',   'TXT_KEY_UNIT_RELIC_T59_TEXT',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_RELIC_T59',	'RELIC_DENG_CHINA_UNIT_FLAG_ATLAS',	0,					'RELIC_DENG_CHINA_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_TANK';      
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_RELIC_T59',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_RELIC_T59',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_RELIC_T59',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_RELIC_T59',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_RELIC_T59',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_TANK';

--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_RELIC_T59',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_TANK';