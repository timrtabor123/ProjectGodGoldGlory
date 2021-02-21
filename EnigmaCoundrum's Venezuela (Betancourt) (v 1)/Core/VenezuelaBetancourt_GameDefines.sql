--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture,	Description, 							Help, 										Strategy,										Civilopedia, 								ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_EC_OIL_ADVISORY',		BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, 1, 				'TXT_KEY_BUILDING_EC_OIL_ADVISORY', 	'TXT_KEY_BUILDING_EC_OIL_ADVISORY_HELP',    'TXT_KEY_BUILDING_EC_OIL_ADVISORY_STRATEGY',	'TXT_KEY_BUILDING_EC_OIL_ADVISORY_TEXT',	ArtDefineTag, 3, 			 'EC_VENEZUELA_BETANCOURT_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_HYDRO_PLANT';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceQuantityRequirements
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceQuantityRequirements 	
		(BuildingType, 					ResourceType, 		Cost)
SELECT	'BUILDING_EC_OIL_ADVISORY',		'RESOURCE_OIL', 	Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_HYDRO_PLANT';
------------------------------------------------------------------------------------------------------------------------	
-- Building_RiverPlotYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_RiverPlotYieldChanges 	
		(BuildingType, 					YieldType, 	Yield)
SELECT	'BUILDING_EC_OIL_ADVISORY',		YieldType, 	Yield
FROM Building_RiverPlotYieldChanges WHERE BuildingType = 'BUILDING_HYDRO_PLANT';
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_EC_OIL_ADVISORY',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_HYDRO_PLANT';

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,		Flavor)
VALUES	('BUILDING_EC_OIL_ADVISORY',	'FLAVOR_GOLD',	10);
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 			DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_DUMMY_EC_OIL_ADVISORY', 'BUILDING_DUMMY_EC_OIL_ADVISORY',	'TXT_KEY_BUILDING_DUMMY_EC_OIL_ADVISORY');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 									BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	ConquestProb,	Description, 								Help)
VALUES	('BUILDING_DUMMY_EC_OIL_ADVISORY_1',	'BUILDINGCLASS_DUMMY_EC_OIL_ADVISORY',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_EC_OIL_ADVISORY',	'TXT_KEY_BUILDING_DUMMY_EC_OIL_ADVISORY_HELP'),
		('BUILDING_DUMMY_EC_OIL_ADVISORY_2',	'BUILDINGCLASS_DUMMY_EC_OIL_ADVISORY',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_EC_OIL_ADVISORY',	'TXT_KEY_BUILDING_DUMMY_EC_OIL_ADVISORY_HELP');
------------------------------------------------------------------------------------------------------------------------								
-- Building_YieldModifiers																																	
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldModifiers
		(BuildingType,							YieldType,			Yield)
VALUES	('BUILDING_DUMMY_EC_OIL_ADVISORY_1',	'YIELD_GOLD',		2),
		('BUILDING_DUMMY_EC_OIL_ADVISORY_2',	'YIELD_PRODUCTION',	2);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, CombatLimit, BaseGold, NumGoldPerEra, Special, CivilianAttackPriority, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Domain, DefaultUnitAI, AdvancedStartCost, MoveRate, Description, 					Help, 									Strategy, 									Civilopedia, 							UnitArtInfo, 					UnitFlagAtlas,								UnitFlagIconOffset,	IconAtlas,								PortraitIndex)
SELECT	'UNIT_EC_BEAUTY_QUEEN',	Class, PrereqTech, Combat, CombatLimit, BaseGold, NumGoldPerEra, Special, CivilianAttackPriority, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Domain, DefaultUnitAI, AdvancedStartCost, MoveRate, 'TXT_KEY_UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_UNIT_EC_BEAUTY_QUEEN_HELP', 	'TXT_KEY_UNIT_EC_BEAUTY_QUEEN_STRATEGY', 	'TXT_KEY_UNIT_EC_BEAUTY_QUEEN_TEXT',	'ART_DEF_UNIT_EC_BEAUTY_QUEEN',	'EC_VENEZUELA_BETANCOURT_UNIT_FLAG_ATLAS',  0,					'EC_VENEZUELA_BETANCOURT_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_MERCHANT';

UPDATE Units
SET OneShotTourism = (SELECT OneShotTourism FROM Units WHERE Type = 'UNIT_MUSICIAN'), OneShotTourismPercentOthers = (SELECT OneShotTourismPercentOthers FROM Units WHERE Type = 'UNIT_MUSICIAN')
WHERE Type = 'UNIT_EC_BEAUTY_QUEEN';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_EC_BEAUTY_QUEEN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_EC_BEAUTY_QUEEN', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MERCHANT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_EC_BEAUTY_QUEEN', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_EC_BEAUTY_QUEEN', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MERCHANT';	
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_EC_BEAUTY_QUEEN', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT';
------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 					UniqueName)
VALUES	('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_01'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_02'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_03'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_04'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_05'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_06'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_07'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_08'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_09'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_10'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_11'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_12'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_13'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_14'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_15'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_16'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_17'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_18'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_19'),
		('UNIT_EC_BEAUTY_QUEEN',	'TXT_KEY_GREAT_PERSON_EC_BEAUTY_QUEEN_20');	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								ArtDefineTag, 						Description, 								Civilopedia, 									CivilopediaTag, 										IconAtlas, 								PortraitIndex)
VALUES	('LEADER_EC_VENEZUELA_BETANCOURT', 	'EC_VenezuelaBetancourt_Scene.xml',	'TXT_KEY_LEADER_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_LEADER_EC_VENEZUELA_BETANCOURT_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_EC_VENEZUELA_BETANCOURT',	'EC_VENEZUELA_BETANCOURT_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 5,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 5,
Boldness = 6,
DiploBalance = 6,
WarmongerHate = 6,
DenounceWillingness = 6,
DoFWillingness = 6,
Loyalty = 6,
Neediness = 5,
Forgiveness = 4,
Chattiness = 4,
Meanness = 4
WHERE Type = 'LEADER_EC_VENEZUELA_BETANCOURT';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_EC_VENEZUELA_BETANCOURT', 	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		6),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_EC_VENEZUELA_BETANCOURT', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'MINOR_CIV_APPROACH_BULLY', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_RECON', 					4),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_RANGED', 					4),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_MOBILE', 					5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_NAVAL', 					4),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_AIR', 						3),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_GROWTH', 					6),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_GOLD', 						6),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_CULTURE', 					7),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_WONDER', 					6),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_RELIGION', 					6),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_NUKE', 						2),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_ESPIONAGE', 				3),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_EC_VENEZUELA_BETANCOURT', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 				Response, 													Bias)
VALUES 	('LEADER_EC_VENEZUELA_BETANCOURT',	'RESPONSE_DEFEATED', 		'TXT_KEY_LEADER_EC_VENEZUELA_BETANCOURT_DEFEATED%', 		500),
		('LEADER_EC_VENEZUELA_BETANCOURT',	'RESPONSE_FIRST_GREETING', 	'TXT_KEY_LEADER_EC_VENEZUELA_BETANCOURT_FIRSTGREETING%', 	500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_EC_VENEZUELA_BETANCOURT', 	'TRAIT_EC_VENEZUELA_BETANCOURT');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_EC_VENEZUELA_BETANCOURT', 	'TXT_KEY_TRAIT_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_TRAIT_EC_VENEZUELA_BETANCOURT_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 							DefaultBuilding, 									Description)
VALUES	('BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT',			'BUILDING_DUMMY_VENEZUELA_BETANCOURT',				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT'),
		('BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1',	'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1',		'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1'),
		('BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2',	'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2',		'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2'),
		('BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3',	'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3',		'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3'),
		('BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4',	'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4',		'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 												BuildingClass, 											GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	ConquestProb,	Description, 												Help)
VALUES	('BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1',	'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1', 	'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2',	'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2',		'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3',	'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3',		'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4',	'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4',		'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_1',			'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT',				-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT',				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_2',			'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT',				-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT',				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_3',			'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT',				-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT',				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_4',			'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT',				-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT',				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_5',			'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT',				-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT',				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_HELP'),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_6',			'BUILDINGCLASS_DUMMY_VENEZUELA_BETANCOURT',				-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT',				'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_HELP');

UPDATE Buildings
SET SpecialistCount = 1, SpecialistType = 'SPECIALIST_ARTIST'
WHERE Type IN ('BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1', 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2', 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3', 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4');

UPDATE Buildings
SET IconAtlas = (SELECT IconAtlas FROM Buildings WHERE Type = 'BUILDING_COLOSSEUM'), PortraitIndex = (SELECT PortraitIndex FROM Buildings WHERE Type = 'BUILDING_COLOSSEUM')
WHERE Type = 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_1';

UPDATE Buildings
SET IconAtlas = (SELECT IconAtlas FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'), PortraitIndex = (SELECT PortraitIndex FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN')
WHERE Type = 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_2'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

UPDATE Buildings
SET IconAtlas = (SELECT IconAtlas FROM Buildings WHERE Type = 'BUILDING_THEATRE'), PortraitIndex = (SELECT PortraitIndex FROM Buildings WHERE Type = 'BUILDING_THEATRE')
WHERE Type = 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3';

UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3_EE', IconAtlas = (SELECT IconAtlas FROM Buildings WHERE Type = 'BUILDING_EE_MENAGERIE'), PortraitIndex = (SELECT PortraitIndex FROM Buildings WHERE Type = 'BUILDING_EE_MENAGERIE')
WHERE Type = 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_3'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_MENAGERIE');

UPDATE Buildings
SET IconAtlas = (SELECT IconAtlas FROM Buildings WHERE Type = 'BUILDING_STADIUM'), PortraitIndex = (SELECT PortraitIndex FROM Buildings WHERE Type = 'BUILDING_STADIUM')
WHERE Type = 'BUILDING_DUMMY_VENEZUELA_BETANCOURT_ARTIST_4';
------------------------------------------------------------------------------------------------------------------------								
-- Building_YieldChanges																																	
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges
		(BuildingType, 								YieldType,			Yield)
VALUES	('BUILDING_DUMMY_VENEZUELA_BETANCOURT_1',	'YIELD_PRODUCTION', 1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_2',	'YIELD_CULTURE',  	1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_3',	'YIELD_SCIENCE',  	1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_4',	'YIELD_FOOD',  		1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_5',	'YIELD_GOLD',  		1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_6',	'YIELD_FAITH',  	1);
------------------------------------------------------------------------------------------------------------------------	
-- Building_CityToolTipYieldFromOther
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Building_CityToolTipYieldFromOther(BuildingType, YieldType, Yield integer);
INSERT INTO Building_CityToolTipYieldFromOther
		(BuildingType, 								YieldType,				Yield)
VALUES	('BUILDING_DUMMY_VENEZUELA_BETANCOURT_1',	'YIELD_PRODUCTION',		1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_2',	'YIELD_CULTURE',  		1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_3',	'YIELD_SCIENCE',  		1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_4',	'YIELD_FOOD',  			1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_5',	'YIELD_GOLD',  			1),
		('BUILDING_DUMMY_VENEZUELA_BETANCOURT_6',	'YIELD_FAITH',  		1);
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 										DerivativeCiv,					SoundtrackTag,  MapImage, 							DawnOfManQuote, 									DawnOfManImage,					Description,									ShortDescription,									Adjective,											Civilopedia,												CivilopediaTag,										 DefaultPlayerColor,					 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,								PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_EC_VENEZUELA_BETANCOURT',		'TXT_KEY_EC_TAL_AFGHANISTAN',	'Brazil', 		'MapVenezuelaBetancourt512.dds',	'TXT_KEY_CIV_DAWN_EC_VENEZUELA_BETANCOURT_TEXT',	'DOM_VenezuelaBetancourt.dds',	'TXT_KEY_CIV_EC_VENEZUELA_BETANCOURT_DESC', 	'TXT_KEY_CIV_EC_VENEZUELA_BETANCOURT_SHORT_DESC',	'TXT_KEY_CIV_EC_VENEZUELA_BETANCOURT_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_EC_VENEZUELA_BETANCOURT_TEXT_1',  'TXT_KEY_CIVILOPEDIA_CIVS_EC_VENEZUELA_BETANCOURT',	 'PLAYERCOLOR_EC_VENEZUELA_BETANCOURT',	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'EC_VENEZUELA_BETANCOURT_ICON_ATLAS',	0,				'EC_VENEZUELA_BETANCOURT_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
VALUES	('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_1'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_2'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_3'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_4'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_5'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_6'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_7'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_8'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_9'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_10'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_11'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_12'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_13'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_14'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_15'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_16'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_17'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_18'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_19'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_20'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_21'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_22'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_23'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_24'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_25'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_26'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_27'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_28'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_29'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_30'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_31'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_32'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_33'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_34'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_35'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_36'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_37'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_38'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_39'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_CITY_NAME_EC_VENEZUELA_BETANCOURT_40');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	'CIVILIZATION_EC_VENEZUELA_BETANCOURT', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	'CIVILIZATION_EC_VENEZUELA_BETANCOURT', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_EC_VENEZUELA_BETANCOURT', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'LEADER_EC_VENEZUELA_BETANCOURT');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'BUILDINGCLASS_HYDRO_PLANT',	'BUILDING_EC_OIL_ADVISORY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'UNITCLASS_MERCHANT',			'UNIT_EC_BEAUTY_QUEEN');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
VALUES	('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'RELIGION_ISLAM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_0'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_1'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_2'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_3'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_4'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_5'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_6'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_7'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_8'),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'TXT_KEY_SPY_NAME_EC_VENEZUELA_BETANCOURT_9');
--=======================================================================================================================
--=======================================================================================================================