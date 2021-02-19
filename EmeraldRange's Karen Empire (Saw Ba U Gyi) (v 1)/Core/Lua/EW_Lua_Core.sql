INSERT INTO UnitPromotions
		(Type,							Description,						Help,										PortraitIndex,	IconAtlas,			PediaType,			PediaEntry,									HasPostCombatPromotions,	CannotBeChosen,	CombatPercent,	LostWithUpgrade)
VALUES	('PROMOTION_EW_THUKAY',			'TXT_KEY_PROMOTION_EW_THUKAY',		'TXT_KEY_PROMOTION_EW_THUKAY_HELP',			59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_EW_THUKAY_HELP',			1,							1,				0,				1),
		('PROMOTION_EW_THUKAY_II',		'TXT_KEY_PROMOTION_EW_THUKAY',		'TXT_KEY_PROMOTION_EW_THUKAY_HELP',			59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_EW_THUKAY_HELP',			0,							1,				0,				0);

INSERT INTO Unit_FreePromotions
		(UnitType,	PromotionType)
VALUES	('UNIT_ER_THUKAY',	'PROMOTION_EW_THUKAY');

INSERT INTO UnitPromotions_PostCombatRandomPromotion
		(PromotionType,			NewPromotion)
VALUES	('PROMOTION_EW_THUKAY',	'PROMOTION_EW_THUKAY_II');

-----

INSERT INTO BuildingClasses
		(Type,								DefaultBuilding,			Description)
VALUES	('BUILDINGCLASS_EW_KAREN_DUMMY',	'BUILDING_EW_KAREN_DUMMY',	'TXT_KEY_BUILDING_EW_KAREN_DUMMY');

INSERT INTO Buildings
		(Type,						Description,						BuildingClass,					NukeImmune,	Cost,	FaithCost,	MinAreaSize,	NeverCapture,	PortraitIndex,	IconAtlas,		GreatWorkCount)
VALUES	('BUILDING_EW_KAREN_DUMMY',	'TXT_KEY_BUILDING_EW_KAREN_DUMMY',	'BUILDINGCLASS_EW_KAREN_DUMMY',	1,			-1,		-1,			-1,				1,				19,				'BW_ATLAS_1',	-1);

INSERT INTO Building_YieldModifiers
		(BuildingType,				YieldType,			Yield)
VALUES	('BUILDING_EW_KAREN_DUMMY',	'YIELD_PRODUCTION',	1);