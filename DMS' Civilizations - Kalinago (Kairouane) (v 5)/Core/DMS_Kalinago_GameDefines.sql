--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 							Type, 											Description)
VALUES	('BUILDING_DMS_KALINAGO_GROWTH',			'BUILDINGCLASS_DMS_KALINAGO_GROWTH', 			'TXT_KEY_BUILDING_DMS_KALINAGO_GROWTH'),
		('BUILDING_DMS_KALINAGO_CITY_DAMAGE',		'BUILDINGCLASS_DMS_KALINAGO_CITY_DAMAGE', 		'TXT_KEY_BUILDING_DMS_KALINAGO_CITY_DAMAGE'),
		('BUILDING_DMS_KALINAGO_BUYEIS_HAPPINESS',	'BUILDINGCLASS_DMS_KALINAGO_BUYEIS_HAPPINESS', 	'TXT_KEY_BUILDING_DMS_KALINAGO_BUYEIS_HAPPINESS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Happiness,	Help,									Description,						Civilopedia,						Strategy,									ArtDefineTag,	MinAreaSize,	HurryCostModifier,		NeverCapture,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_DMS_KARBAY'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	2,			('TXT_KEY_BUILDING_DMS_KARBAY_HELP'),	('TXT_KEY_BUILDING_DMS_KARBAY'),	('TXT_KEY_CIV5_DMS_KARBAY_TEXT'),	('TXT_KEY_BUILDING_DMS_KARBAY_STRATEGY'),	ArtDefineTag,	MinAreaSize,	HurryCostModifier,		NeverCapture,	('DMS_KALINAGO_ATLAS'),	3
FROM Buildings WHERE (Type = 'BUILDING_BARRACKS');

INSERT INTO Buildings
		(Type, 						 				BuildingClass, 									Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	Happiness,	MinAreaSize,	ConquestProb,	Description, 										Help)
VALUES	('BUILDING_DMS_KALINAGO_GROWTH', 			'BUILDINGCLASS_DMS_KALINAGO_GROWTH',			-1,		-1,			-1,				null,		0,			-1,				100,			'TXT_KEY_BUILDING_DMS_KALINAGO_GROWTH',				'TXT_KEY_BUILDING_DMS_KALINAGO_GROWTH_HELP'),
		('BUILDING_DMS_KALINAGO_CITY_DAMAGE', 		'BUILDINGCLASS_DMS_KALINAGO_CITY_DAMAGE',		-1,		-1,			-1,				null,		0,			-1,				0,				'TXT_KEY_BUILDING_DMS_KALINAGO_CITY_DAMAGE',		'TXT_KEY_BUILDING_DMS_KALINAGO_CITY_DAMAGE_HELP'),
		('BUILDING_DMS_KALINAGO_BUYEIS_HAPPINESS', 	'BUILDINGCLASS_DMS_KALINAGO_BUYEIS_HAPPINESS',	-1,		-1,			-1,				null,		2,			-1,				0,				'TXT_KEY_BUILDING_DMS_KALINAGO_BUYEIS_HAPPINESS',	'TXT_KEY_BUILDING_DMS_KALINAGO_BUYEIS_HAPPINESS_HELP');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
SELECT	('BUILDING_DMS_KARBAY'),	FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_BARRACKS');

INSERT INTO Building_Flavors
		(BuildingType, 				FlavorType,				Flavor)
VALUES	('BUILDING_DMS_KARBAY',		'FLAVOR_HAPPINESS',		8);
------------------------------	
-- Building_DomainFreeExperiences
------------------------------		
INSERT INTO Building_DomainFreeExperiences 	
		(BuildingType, 				DomainType,				Experience)
SELECT	('BUILDING_DMS_KARBAY'),	DomainType,				Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_BARRACKS');
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers
		(BuildingType, 						YieldType,				Yield)
VALUES	('BUILDING_DMS_KALINAGO_GROWTH',	'YIELD_FOOD',			1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses
		(Type, 									Description,					DefaultUnit)
VALUES	('UNITCLASS_DMS_FAKEPROPHET_KALINAGO',	'TXT_KEY_UNIT_PROPHET',			'UNIT_DMS_FAKEPROPHET_KALINAGO');
--------------------------------
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, 					Cost,	Moves,	Capture,				CivilianAttackPriority, Special,	Domain,	DefaultUnitAI,	Description, 					Civilopedia, 						Strategy, 								Help,								AdvancedStartCost,	WorkRate,	CombatLimit,	FoundReligion,	SpreadReligion,	ReligionSpreads,	ReligiousStrength,	UnitArtInfo,					UnitFlagAtlas,					UnitFlagIconOffset,	IconAtlas,				PortraitIndex,	MoveRate)
SELECT	('UNIT_DMS_BUYEIS'),	('UNITCLASS_PROPHET'),	Cost,	Moves,	('UNITCLASS_PROPHET'),	CivilianAttackPriority, Special,	Domain,	DefaultUnitAI,	('TXT_KEY_UNIT_DMS_BUYEIS'), 	('TXT_KEY_CIV5_DMS_BUYEIS_TEXT'), 	('TXT_KEY_UNIT_DMS_BUYEIS_STRATEGY'), 	('TXT_KEY_UNIT_DMS_BUYEIS_HELP'),	AdvancedStartCost,	WorkRate,	CombatLimit,	FoundReligion,	SpreadReligion,	ReligionSpreads,	ReligiousStrength,	('ART_DEF_UNIT_DMS_BUYEIS'),	('DMS_BUYIES_FLAG_ART_ATLAS'),	0,					('DMS_KALINAGO_ATLAS'),	2,				MoveRate
FROM Units WHERE (Type = 'UNIT_PROPHET');

INSERT INTO Units 	
		(Type, 								Class, 									Cost,	Moves,	Capture,				CivilianAttackPriority,				Special,				Domain,			DefaultUnitAI,		Description,					Civilopedia,						Strategy,								Help,									AdvancedStartCost,	WorkRate,	CombatLimit,	FoundReligion,	SpreadReligion,	ReligionSpreads,	ReligiousStrength,	UnitArtInfo,					UnitFlagAtlas,					UnitFlagIconOffset,	IconAtlas,					PortraitIndex)
VALUES	('UNIT_DMS_FAKEPROPHET_KALINAGO',	'UNITCLASS_DMS_FAKEPROPHET_KALINAGO',	-1,		2,		'UNITCLASS_PROPHET',	'CIVILIAN_ATTACK_PRIORITY_HIGH',	'SPECIALUNIT_PEOPLE',	'DOMAIN_LAND',	'UNITAI_PROPHET',	'TXT_KEY_UNIT_GREAT_PROPHET',	'TXT_KEY_CIV5_GREATPROPHETS_TEXT',	'TXT_KEY_UNIT_GREAT_PROPHET_STRATEGY',	'TXT_KEY_UNIT_GREAT_PROPHET_STRATEGY',	-1,					1,			0,				1,				1,				4,					1000,				'ART_DEF_UNIT_GREAT_PROPHET',	'EXPANSION_UNIT_FLAG_ATLAS',	16,					'EXPANSION_UNIT_ATLAS_1',	16);
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_BUYEIS'),			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PROPHET');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_FAKEPROPHET_KALINAGO'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PROPHET');
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_DMS_BUYEIS'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PROPHET');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,			Flavor)
SELECT	('UNIT_DMS_BUYEIS'), 			FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PROPHET');
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 						BuildType)
SELECT	('UNIT_DMS_BUYEIS'),			BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_PROPHET');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	('UNIT_DMS_BUYEIS'),			PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 	
		(Type, 								Description,						Help,										Sound,				MovesChange,	EmbarkDefenseModifier,	CombatPercent,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry,									CannotBeChosen)
VALUES	('PROMOTION_DMS_OUBOUTOU_25_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_25_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_25_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_24_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_24_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_24_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_23_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_23_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_23_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_22_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_22_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_22_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_21_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_21_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_21_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_20_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_20_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_20_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_19_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_19_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_19_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_18_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_18_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_18_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_17_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_17_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_17_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_16_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_16_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_16_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_15_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_15_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_15_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_14_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_14_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_14_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_13_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_13_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_13_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_12_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_12_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_12_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_11_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_11_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_11_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_10_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_10_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_10_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_9_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_9_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_9_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_8_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_8_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_8_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_7_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_7_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_7_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_6_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_6_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_6_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_5_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_5_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_5_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_4_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_4_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_4_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_3_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_3_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_3_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_2_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_2_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_2_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_1_A',		'TXT_KEY_PROMOTION_DMS_OUBOUTOU',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_1_HELP',	'AS2D_IF_LEVELUP',	1,				100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_1_HELP',	1),
		('PROMOTION_DMS_OUBOUTOU_NEARBY',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_NEARBY',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_NEARBY_HELP',	'AS2D_IF_LEVELUP',	1,	100,					0,				33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_OUBOUTOU_NEARBY_HELP',	1);
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType, 				UnitCombatType)
VALUES	('PROMOTION_DMS_OUBOUTOU_25_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_25_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_25_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_24_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_24_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_24_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_23_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_23_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_23_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_22_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_22_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_22_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_21_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_21_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_21_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_20_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_20_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_20_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_19_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_19_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_19_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_18_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_18_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_18_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_17_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_17_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_17_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_16_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_16_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_16_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_15_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_15_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_15_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_14_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_14_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_14_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_13_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_13_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_13_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_12_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_12_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_12_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_11_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_11_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_11_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_10_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_10_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_10_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_9_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_9_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_9_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_8_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_8_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_8_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_7_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_7_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_7_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_6_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_6_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_6_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_5_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_5_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_5_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_4_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_4_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_4_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_3_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_3_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_3_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_2_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_2_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_2_A',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_1_A',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_OUBOUTOU_1_A',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_NEARBY',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_NEARBY',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_OUBOUTOU_NEARBY',	'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_OUBOUTOU_NEARBY',	'UNITCOMBAT_MOUNTED'),
		('PROMOTION_DMS_OUBOUTOU_NEARBY',	'UNITCOMBAT_SIEGE'),
		('PROMOTION_DMS_OUBOUTOU_NEARBY',	'UNITCOMBAT_ARCHER');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_DMS_KAIROUANE', 	'TXT_KEY_LEADER_DMS_KAIROUANE', 	'TXT_KEY_LEADER_DMS_KAIROUANE_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_DMS_KAIROUANE', 	'Kairouane_Scene.xml',	5, 						3, 						5, 							6, 			4, 				6, 				4, 						4, 				5, 			2, 			6, 				5, 			4, 			'DMS_KALINAGO_ATLAS',	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_KAIROUANE', 		'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_DMS_KAIROUANE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_DMS_KAIROUANE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_DMS_KAIROUANE', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_DMS_KAIROUANE', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
		('LEADER_DMS_KAIROUANE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_DMS_KAIROUANE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_KAIROUANE', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_DMS_KAIROUANE', 		'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_DMS_KAIROUANE', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_DMS_KAIROUANE', 		'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_DMS_KAIROUANE', 		'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_DMS_KAIROUANE', 		'FLAVOR_OFFENSE', 					7),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_DEFENSE', 					6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_RECON', 					7),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_RANGED', 					5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_MOBILE', 					5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_NAVAL', 					7),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_AIR', 						5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_EXPANSION', 				5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_GROWTH', 					7),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_GOLD', 						5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_SCIENCE', 					6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_CULTURE', 					7),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_HAPPINESS', 				9),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_WONDER', 					4),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_RELIGION', 					6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_DIPLOMACY', 				5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_SPACESHIP', 				5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_NUKE', 						5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_USE_NUKE', 					6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_ESPIONAGE', 				6),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_DMS_KAIROUANE', 		'FLAVOR_AIR_CARRIER', 				3);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_DMS_KAIROUANE', 		'TRAIT_DMS_SPIRIT_OF_THE_ROCK');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_DMS_SPIRIT_OF_THE_ROCK', 	'TXT_KEY_TRAIT_DMS_SPIRIT_OF_THE_ROCK', 'TXT_KEY_TRAIT_DMS_SPIRIT_OF_THE_ROCK_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 							Description, 							ShortDescription,								Adjective,											CivilopediaTag,										DefaultPlayerColor,				ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,					SoundtrackTag, 	MapImage,				DawnOfManQuote,								DawnOfManImage)
SELECT	('CIVILIZATION_DMS_KALINAGO'), 	('TXT_KEY_CIVILIZATION_DMS_KALINAGO'), 	('TXT_KEY_CIVILIZATION_DMS_KALINAGO_SHORT'),	('TXT_KEY_CIVILIZATION_DMS_KALINAGO_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_DMS_KALINAGO'),	('PLAYERCOLOR_DMS_KALINAGO'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('DMS_KALINAGO_ATLAS'),	('DMS_KALINAGO_ALPHA_ATLAS'),	('Aztec'), 		('KalinagoMap512.dds'),	('TXT_KEY_CIV5_DAWN_DMS_KALINAGO_TEXT'),	('Kairouane_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_AZTEC');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_1'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_2'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_3'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_4'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_5'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_6'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_7'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_8'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_9'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_10'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_11'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_12'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_13'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_14'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_15'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_16'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_17'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_18'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_19'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_20'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_21'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_22'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_23'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_24'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_25'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_26'),
        ('CIVILIZATION_DMS_KALINAGO',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KALINAGO_27');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	('CIVILIZATION_DMS_KALINAGO'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_AZTEC');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_DMS_KALINAGO'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_AZTEC');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_DMS_KALINAGO'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_AZTEC');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_DMS_KALINAGO',	'LEADER_DMS_KAIROUANE');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_DMS_KALINAGO', 	'UNITCLASS_PROPHET',	'UNIT_DMS_BUYEIS');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_DMS_KALINAGO', 	'BUILDINGCLASS_BARRACKS', 	'BUILDING_DMS_KARBAY');
--------------------------------	
-- Civilization_Religions
--------------------------------
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT	('CIVILIZATION_DMS_KALINAGO'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_AZTEC');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_0'),	
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_1'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_2'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_3'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_4'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_5'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_6'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_7'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_8'),
		('CIVILIZATION_DMS_KALINAGO', 		'TXT_KEY_SPY_NAME_DMS_KALINAGO_9');
--==========================================================================================================================
-- Civilization_Start_Along_Ocean
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 					StartAlongOcean)
VALUES	('CIVILIZATION_DMS_KALINAGO', 		1);
--==========================================================================================================================
--==========================================================================================================================