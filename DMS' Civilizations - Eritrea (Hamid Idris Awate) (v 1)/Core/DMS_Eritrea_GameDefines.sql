--=======================================================================================================================
-- DMS_Eritrea_Promotions
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS DMS_Eritrea_Promotions(numPromotion INTEGER DEFAULT 0);
INSERT OR REPLACE INTO DMS_Eritrea_Promotions(numPromotion) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 										Type, 													Description)
VALUES	('BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION', 		'BUILDINGCLASS_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION', 	'TXT_KEY_BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION'),
		('BUILDING_DMS_ASKARI_EXTRA_PRODUCTION',				'BUILDINGCLASS_DMS_ASKARI_EXTRA_PRODUCTION', 			'TXT_KEY_BUILDING_DMS_ASKARI_EXTRA_PRODUCTION');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	Cost,	FreeStartEra,	SpecialistType,	SpecialistCount,	AllowsProductionTradeRoutes,	HurryCostModifier,	GoldMaintenance,	PrereqTech,	Description, 								Civilopedia, 								Help, 											Strategy,								 			ArtDefineTag, 	MinAreaSize,	ConquestProb,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_DMS_CABLEWAY_STATION'),	BuildingClass,	Cost,	FreeStartEra,	SpecialistType,	SpecialistCount,	AllowsProductionTradeRoutes,	HurryCostModifier,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_DMS_CABLEWAY_STATION'),	('TXT_KEY_CIV5_DMS_CABLEWAY_STATION_TEXT'),	('TXT_KEY_BUILDING_DMS_CABLEWAY_STATION_HELP'),	('TXT_KEY_BUILDING_DMS_CABLEWAY_STATION_STRATEGY'),	ArtDefineTag,	MinAreaSize,	0,				3, 				('DMS_ERITREA_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_WORKSHOP');

INSERT INTO Buildings 
		(Type, 												BuildingClass,											Cost, 	FaithCost,	GreatWorkSlotType,	GreatWorkCount,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 												Help)
VALUES	('BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION', 	'BUILDINGCLASS_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION',	-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION',	'TXT_KEY_BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION_HELP'),
		('BUILDING_DMS_ASKARI_EXTRA_PRODUCTION', 			'BUILDINGCLASS_DMS_ASKARI_EXTRA_PRODUCTION',			-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_DMS_ASKARI_EXTRA_PRODUCTION',				'TXT_KEY_BUILDING_DMS_ASKARI_EXTRA_PRODUCTION_HELP');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,				Flavor)
SELECT	('BUILDING_DMS_CABLEWAY_STATION'),	FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_WORKSHOP');

INSERT INTO Building_Flavors
		(BuildingType, 						FlavorType,				Flavor)
VALUES	('BUILDING_DMS_CABLEWAY_STATION',	'FLAVOR_GREAT_PEOPLE',	10);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 						YieldType,				Yield)
SELECT	('BUILDING_DMS_CABLEWAY_STATION'),	YieldType,				Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_WORKSHOP');

INSERT INTO Building_YieldChanges 	
		(BuildingType, 								YieldType,				Yield)
VALUES	('BUILDING_DMS_ASKARI_EXTRA_PRODUCTION',	'YIELD_PRODUCTION',		2);
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 						YieldType,				Yield)
SELECT	('BUILDING_DMS_CABLEWAY_STATION'),	YieldType,				Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_WORKSHOP');

INSERT INTO Building_YieldModifiers 	
		(BuildingType, 										YieldType,				Yield)
VALUES	('BUILDING_DMS_CABLEWAY_STATION_EXTRA_PRODUCTION',	'YIELD_PRODUCTION',		25);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 							Class, PrereqTech,	Combat,	Cost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	Description,							Civilopedia,								Strategy,										Help,										MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,								PortraitIndex,	IconAtlas,									MoveRate)
SELECT	('UNIT_DMS_PENNE_DI_FALCO'),	Class, PrereqTech,	Combat,	Cost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	('TXT_KEY_UNIT_DMS_PENNE_DI_FALCO'),	('TXT_KEY_UNIT_DMS_PENNE_DI_FALCO_TEXT'),	('TXT_KEY_UNIT_DMS_PENNE_DI_FALCO_STRATEGY'),	('TXT_KEY_UNIT_DMS_PENNE_DI_FALCO_HELP'),	MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		('ART_DEF_UNIT_DMS_PENNE_DI_FALCO'),	0,					('DMS_UNIT_FLAG_PENNE_DI_FALCO_ATLAS'),		2,				('DMS_ERITREA_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_CAVALRY');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_PENNE_DI_FALCO'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CAVALRY');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_DMS_PENNE_DI_FALCO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,			Flavor)
SELECT	('UNIT_DMS_PENNE_DI_FALCO'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');

INSERT INTO Unit_Flavors 
		(UnitType, 							FlavorType,			Flavor)
VALUES	('UNIT_DMS_PENNE_DI_FALCO', 		'FLAVOR_DEFENSE', 	6);
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	('UNIT_DMS_PENNE_DI_FALCO'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_CAVALRY');

INSERT INTO Unit_FreePromotions 
		(UnitType, 						PromotionType)
VALUES	('UNIT_DMS_PENNE_DI_FALCO', 	'PROMOTION_DMS_ASKARI_CAVALRY');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	('UNIT_DMS_PENNE_DI_FALCO'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 						ResourceType)
SELECT	('UNIT_DMS_PENNE_DI_FALCO'),	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 										CombatPercent,	VisibilityChange,	MovesChange,	Description, 									Help, 													Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_DMS_ASKARI_CAVALRY',			0,				1,					0,				'TXT_KEY_PROMOTION_DMS_ASKARI_CAVALRY',			'TXT_KEY_PROMOTION_DMS_ASKARI_CAVALRY_HELP',			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DMS_ASKARI_CAVALRY_HELP'),
		('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	15,				0,					1,				'TXT_KEY_PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'TXT_KEY_PROMOTION_DMS_STRENGTH_FROM_POLICIES_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DMS_STRENGTH_FROM_POLICIES_HELP');
			
INSERT OR REPLACE INTO UnitPromotions
		(Type, 											FlankAttackModifier,	Description, 											Help, 															Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_DMS_FLANKING_BONUS_'||numPromotion,	numPromotion*3,			'TXT_KEY_PROMOTION_DMS_FLANKING_BONUS_'||numPromotion,	'TXT_KEY_PROMOTION_DMS_FLANKING_BONUS_'||numPromotion||'_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DMS_FLANKING_BONUS_'||numPromotion||'_HELP'
FROM DMS_Eritrea_Promotions;
------------------------------
-- UnitPromotions_UnitCombats
------------------------------
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 							UnitCombatType)
VALUES		('PROMOTION_DMS_ASKARI_CAVALRY',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'UNITCOMBAT_MELEE'),
			('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'UNITCOMBAT_ARCHER'),
			('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'UNITCOMBAT_RECON'),
			('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'UNITCOMBAT_SIEGE'),
			('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'UNITCOMBAT_GUN'),
			('PROMOTION_DMS_STRENGTH_FROM_POLICIES',	'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_1',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_1',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_2',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_2',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_3',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_3',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_4',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_4',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_5',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_5',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_6',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_6',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_7',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_7',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_8',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_8',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_9',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_9',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_10',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_10',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_11',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_11',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_12',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_12',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_13',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_13',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_14',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_14',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_15',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_15',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_16',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_16',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_17',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_17',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_18',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_18',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_19',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_19',			'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_FLANKING_BONUS_20',			'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_FLANKING_BONUS_20',			'UNITCOMBAT_ARMOR');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 								Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 								PortraitIndex)
VALUES	('LEADER_DMS_HAMID_IDRIS_AWATE', 	'TXT_KEY_LEADER_DMS_HAMID_IDRIS_AWATE', 	'TXT_KEY_LEADER_DMS_HAMID_IDRIS_AWATE_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_DMS_HAMID_IDRIS_AWATE', 	'DMS_Awate_Diplo.xml',		8, 						2, 						6, 							8, 			5, 				6, 				4, 						5, 				5, 			6, 			6, 				6, 			5, 			'DMS_ERITREA_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 							MajorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MAJOR_CIV_APPROACH_AFRAID', 		7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 							MinorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 							FlavorType, 						Flavor)
VALUES	('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_OFFENSE', 					7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_DEFENSE', 					7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_RECON', 					5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_RANGED', 					5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_MOBILE', 					5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_NAVAL', 					4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_AIR', 						6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_EXPANSION', 				5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_GROWTH', 					6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_PRODUCTION', 				7),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_GOLD', 						4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_SCIENCE', 					6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_CULTURE', 					6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_WONDER', 					4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_RELIGION', 					4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_DIPLOMACY', 				6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_SPACESHIP', 				5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_NUKE', 						6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_USE_NUKE', 					6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_ESPIONAGE', 				4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_AIRLIFT', 					6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_I_TRADE_DESTINATION', 		6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_I_TRADE_ORIGIN', 			6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_DMS_HAMID_IDRIS_AWATE', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 							TraitType)
VALUES	('LEADER_DMS_HAMID_IDRIS_AWATE', 		'TRAIT_DMS_GEDLI');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 				ShortDescription)
VALUES	('TRAIT_DMS_GEDLI', 	'TXT_KEY_TRAIT_DMS_GEDLI', 	'TXT_KEY_TRAIT_DMS_GEDLI_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations
		(Type, 							Description, 							ShortDescription,							Adjective,										CivilopediaTag,										DefaultPlayerColor,				ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, PortraitIndex,	IconAtlas,				AlphaIconAtlas,					SoundtrackTag,	MapImage,					DawnOfManQuote,								DawnOfManImage)
SELECT	('CIVILIZATION_DMS_ERITREA'), 	('TXT_KEY_CIVILIZATION_DMS_ERITREA'), 	('TXT_KEY_CIVILIZATION_DMS_ERITREA_SHORT'),	('TXT_KEY_CIVILIZATION_DMS_ERITREA_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_DMS_ERITREA'),	('PLAYERCOLOR_DMS_ERITREA'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, 0,				('DMS_ERITREA_ATLAS'),	('DMS_ERITREA_ALPHA_ATLAS'),	('Ethiopia'),	('DMS_Eritrea_Map512.dds'), ('TXT_KEY_CIV5_DAWN_DMS_ERITREA_TEXT'), 	('DMS_Awate_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ETHIOPIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_DMS_ERITREA',  	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_1'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_2'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_3'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_4'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_5'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_6'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_7'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_8'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_9'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_10'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_11'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_12'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_13'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_14'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_15'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_16'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_17'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_18'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_19'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_20'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_21'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_22'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_23'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_24'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_25'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_26'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_27'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_28'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_29'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_30'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_31'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_32'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_33'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_34'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_35'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_36'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_37'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_38'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_39'),
        ('CIVILIZATION_DMS_ERITREA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_ERITREA_40');			
--------------------------------		
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	('CIVILIZATION_DMS_ERITREA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_DMS_ERITREA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_DMS_ERITREA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_DMS_ERITREA',	'LEADER_DMS_HAMID_IDRIS_AWATE');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_DMS_ERITREA', 	'UNITCLASS_CAVALRY',		'UNIT_DMS_PENNE_DI_FALCO');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_DMS_ERITREA', 	'BUILDINGCLASS_WORKSHOP', 	'BUILDING_DMS_CABLEWAY_STATION');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT	('CIVILIZATION_DMS_ERITREA'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_0'),	
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_1'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_2'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_3'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_4'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_5'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_6'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_7'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_8'),
		('CIVILIZATION_DMS_ERITREA', 	'TXT_KEY_SPY_NAME_DMS_ERITREA_9');
--------------------------------	
-- Civilization_Start_Region_Priority 
--------------------------------		
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_DMS_ERITREA', 	'REGION_HILLS');
--==========================================================================================================================
--==========================================================================================================================