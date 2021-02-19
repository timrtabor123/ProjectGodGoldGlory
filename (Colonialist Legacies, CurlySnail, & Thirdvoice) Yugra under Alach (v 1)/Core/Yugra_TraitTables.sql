--==========================================================================================================================
-- TRAIT TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--======================================================================================================
-- BUILDINGS
--======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                         DefaultBuilding,          				Description)
VALUES  ('BUILDINGCLASS_CS_YUGRA',  	'BUILDING_CS_YUGRA_LUXURY_SETTLE',   'TXT_KEY_BUILDING_CS_YUGRA');
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings		
		(Type, 									BuildingClass, 			  	Cost, 	FaithCost,			GreatWorkCount,			Description, 								Help,											NeverCapture)
VALUES	('BUILDING_CS_YUGRA_LUXURY_SETTLE', 	'BUILDINGCLASS_CS_YUGRA', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_CS_YUGRA_LUXURY_SETTLE', 	'TXT_KEY_BUILDING_CS_YUGRA_LUXURY_SETTLE_HELP',	1),
		('BUILDING_CS_YUGRA_ART', 				'BUILDINGCLASS_CS_YUGRA', 	-1,				-1, 					1,			'TXT_KEY_BUILDING_CS_YUGRA_ART', 			'TXT_KEY_BUILDING_CS_YUGRA_ART_HELP',			1),
		('BUILDING_CS_NEVED_STORE', 			'BUILDINGCLASS_CS_YUGRA', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_CS_NEVED_STORE', 			'TXT_KEY_BUILDING_CS_NEVED_STORE_HELP',			1),
		('BUILDING_CS_MOOSETRAIN', 				'BUILDINGCLASS_CS_YUGRA', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_CS_MOOSETRAIN', 			'TXT_KEY_BUILDING_CS_MOOSETRAIN_HELP',			1);
UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'
WHERE (Type = 'BUILDING_CS_YUGRA_ART');
UPDATE Buildings
SET GreatWorkCount = 1
WHERE (Type = 'BUILDING_CS_YUGRA_ART');
UPDATE Buildings
SET IconAtlas = 'BW_ATLAS_1'
WHERE (Type = 'BUILDING_CS_YUGRA_ART');
UPDATE Buildings
SET PortraitIndex = 19
WHERE (Type = 'BUILDING_CS_YUGRA_ART');

INSERT INTO Unit_ProductionModifierBuildings
		(UnitType, 					BuildingType, 				ProductionModifier)
VALUES	('UNIT_CTCL_MOOSECAV',	'BUILDING_CS_MOOSETRAIN', 			20);

INSERT INTO Building_FeatureYieldChanges
		(BuildingType,	FeatureType,	YieldType,	Yield)
VALUES	('BUILDING_CS_NEVED_STORE',	'FEATURE_MARSH',	'YIELD_FOOD',	1);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 								Help, 											Sound, 					CannotBeChosen, MovesChange, 	DefenseMod,	ExperiencePercent,	LostWithUpgrade,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry,								ExtraAttacks)
VALUES	('PROMOTION_CS_YUGRA_SETTLER', 			'TXT_KEY_PROMOTION_CS_YUGRA_SETTLER',		'TXT_KEY_PROMOTION_CS_YUGRA_SETTLER_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0,			0,					0, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CS_YUGRA_SETTLER',	1),
		('PROMOTION_CS_BONUSARMOR',				'TXT_KEY_PROMOTION_CS_BONUSARMOR',			'TXT_KEY_PROMOTION_CS_BONUSARMOR_HELP',			'AS2D_IF_LEVELUP',		1,				0,				50,			0,					0,					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CS_BONUSARMOR',		1),
		('PROMOTION_CS_BONUSEXP',				'TXT_KEY_PROMOTION_CS_BONUSEXP',			'TXT_KEY_PROMOTION_CS_BONUSEXP',				'AS2D_IF_LEVELUP',		1,				0,				0,			100,				0,					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_CS_BONUSEXP',		1),
		('PROMOTION_CS_BONUSATTACK',			'TXT_KEY_PROMOTION_CS_BONUSATTACK',			'TXT_KEY_PROMOTION_CS_BONUSATTACK_HELP',		'AS2D_IF_LEVELUP',		1,				0,				0,			0,					0,					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_CS_BONUSATTACK',		1);
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
INSERT INTO Resources
		(Type,					TechReveal,	TechCityTrade,	Description,								Civilopedia,						ResourceClassType,		ArtDefineTag,					OnlyMinorCivs,	Happiness,	PlacementOrder,	ConstAppearance,	AITradeModifier,	RandApp1,	RandApp2,	ResourceUsage,	AIObjective,	MinAreaSize,	MaxLatitude,	TilesPer,	Hills,	Flatlands,	Normalize,	Player,	IconString,				PortraitIndex,	IconAtlas)
VALUES	('RESOURCE_CS_CAVIAR',	null,		'TECH_TRAPPING',			'TXT_KEY_RESOURCE_CS_CAVIAR',	'TXT_KEY_RESOURCE_CS_CAVIAR_PEDIA',	'RESOURCECLASS_LUXURY',	'ART_DEF_RESOURCE_CS_CAVIAR',	0,				4,			4,				5,					10,					0,			0,			2,				0,				3,				50,				12,			0,		1,			1,			0,		'[ICON_RES_CS_CAVIAR]',	1,				'ATLAS_EW_YUGRA');
UPDATE Resources
SET 'Unique' = 2
WHERE (Type = 'RESOURCE_CS_CAVIAR');

-----

INSERT INTO Improvement_ResourceTypes
(ImprovementType,  ResourceType)
VALUES  ('IMPROVEMENT_CAMP',  'RESOURCE_CS_CAVIAR');

-----

INSERT INTO Resource_YieldChanges
(ResourceType,  YieldType,  Yield)
VALUES  ('RESOURCE_CS_CAVIAR',  'YIELD_PRODUCTION',  1),
        ('RESOURCE_CS_CAVIAR',  'YIELD_GOLD',  1);