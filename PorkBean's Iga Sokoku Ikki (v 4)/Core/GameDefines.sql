-- Game Defines for the Iga Sokoku Ikki, by PorkBean
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilizations
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations
       (Type,					Description,				ShortDescription,					Adjective,						Civilopedia,					CivilopediaTag,			DefaultPlayerColor,		ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	IconAtlas,				PortraitIndex,	AlphaIconAtlas,			SoundtrackTag,	MapImage,		DawnOfManQuote,				DawnOfManImage)
SELECT 'CIVILIZATION_PB_IGA',	'TXT_KEY_CIV_PB_IGA_DESC',	'TXT_KEY_CIV_PB_IGA_SHORT_DESC',	'TXT_KEY_CIV_PB_IGA_ADJECTIVE',	'TXT_KEY_PEDIA_PB_IGA_TEXT',	'TXT_KEY_PEDIA_PB_IGA',	'PLAYERCOLOR_PB_IGA',	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	'PB_IGA_ICON_ATLAS',	0,				'PB_IGA_ALPHA_ATLAS',	SoundtrackTag,	'Iga_Map.dds',	'TXT_KEY_DAWN_PB_IGA_TEXT',	'Iga_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_CityNames
          (CivilizationType,		CityName)
VALUES    ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_1'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_2'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_3'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_4'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_5'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_6'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_7'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_8'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_9'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_10'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_11'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_12'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_13'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_14'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_15'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_16'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_17'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_18'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_19'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_20'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_21'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_22'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_23'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_24'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_25'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_26'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_27'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_28'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_29'),
		  ('CIVILIZATION_PB_IGA',	'TXT_KEY_CITY_NAME_PB_IGA_30');

------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,		BuildingClassType)
SELECT    'CIVILIZATION_PB_IGA',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_JAPAN';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,		TechType)
SELECT    'CIVILIZATION_PB_IGA',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_JAPAN';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,		UnitClassType,	Count,	UnitAIType)
SELECT    'CIVILIZATION_PB_IGA',	UnitClassType,	Count,	UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_JAPAN';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,		LeaderheadType)
VALUES ('CIVILIZATION_PB_IGA',	'LEADER_PB_MOMOCHI_TAMBA');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_UnitClassOverrides
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,		UnitClassType,		UnitType)
VALUES ('CIVILIZATION_PB_IGA',	'UNITCLASS_SCOUT',	'UNIT_PB_NINJA');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,		ReligionType)
VALUES ('CIVILIZATION_PB_IGA',	'RELIGION_SHINTO');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Priority
       (CivilizationType,		RegionType)
VALUES ('CIVILIZATION_PB_IGA',	'REGION_FOREST');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,		SpyName)
VALUES    ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_0'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_1'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_2'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_3'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_4'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_5'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_6'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_7'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_8'),
          ('CIVILIZATION_PB_IGA',	'TXT_KEY_SPY_NAME_PB_IGA_9');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Leaders
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leaders
		(Type,						Description,						Civilopedia,									CivilopediaTag,								ArtDefineTag,			VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	IconAtlas,			PortraitIndex)
VALUES	('LEADER_PB_MOMOCHI_TAMBA',	'TXT_KEY_LEADER_PB_MOMOCHI_TAMBA',	'TXT_KEY_LEADER_PB_MOMOCHI_TAMBA_PEDIA_TEXT',	'TXT_KEY_LEADER_PB_MOMOCHI_TAMBA_PEDIA',	'Momochi_Scene.xml',	6,						3,						7,							4,			7,				5,				4,						7,				7,			3,			6,				1,			6,			'PB_IGA_ICON_ATLAS',	1);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,					MajorCivApproachType,			Bias)
VALUES    ('LEADER_PB_MOMOCHI_TAMBA',	'MAJOR_CIV_APPROACH_WAR',		6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MAJOR_CIV_APPROACH_HOSTILE',	7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MAJOR_CIV_APPROACH_DECEPTIVE',	9),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MAJOR_CIV_APPROACH_GUARDED',	6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MAJOR_CIV_APPROACH_AFRAID',	2),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MAJOR_CIV_APPROACH_FRIENDLY',	7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MAJOR_CIV_APPROACH_NEUTRAL',	4);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MinorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,					MinorCivApproachType,				Bias)
VALUES    ('LEADER_PB_MOMOCHI_TAMBA',	'MINOR_CIV_APPROACH_IGNORE',		4),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MINOR_CIV_APPROACH_FRIENDLY',		7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MINOR_CIV_APPROACH_PROTECTIVE',	8),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MINOR_CIV_APPROACH_CONQUEST',		4),
          ('LEADER_PB_MOMOCHI_TAMBA',	'MINOR_CIV_APPROACH_BULLY',			5);
------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Flavors
          (LeaderType,					FlavorType,							Flavor)
VALUES    ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_OFFENSE',					7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_DEFENSE',					6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_CITY_DEFENSE',				6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_MILITARY_TRAINING',			7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_RECON',						6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_RANGED',					8),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_MOBILE',					3),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_NAVAL',						5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_NAVAL_RECON',				5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_NAVAL_GROWTH',				5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_AIR',						8),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_EXPANSION',					6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_GROWTH',					5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_TILE_IMPROVEMENT',			6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_INFRASTRUCTURE',			4),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_PRODUCTION',				3),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_GOLD',						6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_SCIENCE',					5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_CULTURE',					7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_HAPPINESS',					4),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_GREAT_PEOPLE',				3),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_WONDER',					3),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_RELIGION',					6),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_DIPLOMACY',					7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_SPACESHIP',					3),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_WATER_CONNECTION',			5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_NUKE',						3),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_USE_NUKE',					2),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_ESPIONAGE',					11),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_ANTIAIR',					5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_AIRLIFT',					7),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_I_TRADE_DESTINATION',		5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_I_TRADE_ORIGIN',			5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_ARCHAEOLOGY',				3),
          ('LEADER_PB_MOMOCHI_TAMBA',	'FLAVOR_AIR_CARRIER',				2);
------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Traits
       (LeaderType,					TraitType)
VALUES ('LEADER_PB_MOMOCHI_TAMBA',	'TRAIT_PB_KISHOMON');
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,					Description,					ShortDescription)
VALUES	('TRAIT_PB_KISHOMON',	'TXT_KEY_TRAIT_PB_KISHOMON',	'TXT_KEY_TRAIT_PB_KISHOMON_SHORT');


INSERT INTO Trait_FreePromotionUnitCombats
		(TraitType,				UnitCombatType,			PromotionType)
VALUES	('TRAIT_PB_KISHOMON',	'UNITCOMBAT_ARCHER',	'PROMOTION_PB_KISHOMON'),
		('TRAIT_PB_KISHOMON',	'UNITCOMBAT_SIEGE',		'PROMOTION_PB_KISHOMON');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units
		(Type,				Description,				Civilopedia,					Strategy,							Help,							Requirements,	Combat,		RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,			Domain,	CivilianAttackPriority,	DefaultUnitAI,		Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport, MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,		HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,		SpreadReligion,		RemoveHeresy,		ReligionSpreads,		ReligiousStrength,		FoundReligion,		RequiresEnhancedReligion,		ProhibitsSpread,		CanBuyCityState,		CombatLimit,		RangeAttackOnlyInDomain,		RangeAttackIgnoreLOS,		Trade,		NumExoticGoods,		PolicyType,		RangedCombatLimit,		XPValueAttack,		XPValueDefense,		SpecialCargo,		DomainCargo,		Conscription,		ExtraMaintenanceCost,		NoMaintenance,		Unhappiness,	UnitArtInfo,				UnitArtInfoCulturalVariation,		UnitArtInfoEraVariation,		ProjectPrereq,		SpaceshipProject,		LeaderPromotion,		LeaderExperience,		DontShowYields,		ShowInPedia,		MoveRate,		UnitFlagIconOffset,		PortraitIndex,		IconAtlas,				UnitFlagAtlas)
SELECT	'UNIT_PB_NINJA',	'TXT_KEY_UNIT_PB_NINJA',	'TXT_KEY_UNIT_PB_NINJA_TEXT',	'TXT_KEY_UNIT_PB_NINJA_STRATEGY',	'TXT_KEY_UNIT_PB_NINJA_HELP',	Requirements,	Combat*0.8,	8,				Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase,	Moves,	Immobile,	2,		BaseSightRange,	Class,	Special,	Capture,	'UNITCOMBAT_ARCHER',	Domain,	CivilianAttackPriority,	'UNITAI_RANGED',	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport, MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	'UNITCLASS_COMPOSITE_BOWMAN',	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,		SpreadReligion,		RemoveHeresy,		ReligionSpreads,		ReligiousStrength,		FoundReligion,		RequiresEnhancedReligion,		ProhibitsSpread,		CanBuyCityState,		CombatLimit,		RangeAttackOnlyInDomain,		RangeAttackIgnoreLOS,		Trade,		NumExoticGoods,		PolicyType,		RangedCombatLimit,		XPValueAttack,		XPValueDefense,		SpecialCargo,		DomainCargo,		Conscription,		ExtraMaintenanceCost,		NoMaintenance,		Unhappiness,	'ART_DEF_UNIT_PB_NINJA',	UnitArtInfoCulturalVariation,		UnitArtInfoEraVariation,		ProjectPrereq,		SpaceshipProject,		LeaderPromotion,		LeaderExperience,		DontShowYields,		ShowInPedia,		'WHEELED',		0,						2,					'PB_IGA_ICON_ATLAS',	'PB_IGA_NINJA_FLAG'
FROM Units WHERE Type = 'UNIT_SCOUT';

------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType,			SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_PB_NINJA',	SelectionSound,	'AS2D_BIRTH_PB_NINJA'
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCOUT';
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType,			UnitAIType)
SELECT	'UNIT_PB_NINJA',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';

------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType,			FlavorType, Flavor)
SELECT	'UNIT_PB_NINJA',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCOUT';

------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType,			PromotionType)
SELECT	'UNIT_PB_NINJA',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
VALUES	('UNIT_PB_NINJA',	'PROMOTION_ONLY_DEFENSIVE'),
		('UNIT_PB_NINJA',	'PROMOTION_PB_NINJA');

------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType,			UnitClassType)
SELECT	'UNIT_PB_NINJA',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SCOUT';

------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
		(Type,					Description,					Help,								Sound,				CannotBeChosen,	LostWithUpgrade, RivalTerritory,	CanMoveAfterAttacking,   	PortraitIndex,  IconAtlas,           PediaType,          PediaEntry)
VALUES	('PROMOTION_PB_NINJA',	'TXT_KEY_PROMOTION_PB_NINJA',	'TXT_KEY_PROMOTION_PB_NINJA_HELP',	'AS2D_IF_LEVELUP',	1,				0,				 1,					1,                  		59,            	'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PB_NINJA');

INSERT INTO UnitPromotions
		(Type,						Description,						Help,									Sound,				CannotBeChosen, LostWithUpgrade, 	HasPostCombatPromotions,	MovesChange,   	PortraitIndex,  IconAtlas,             PediaType,          PediaEntry)
VALUES	('PROMOTION_PB_KAKUREZATO',	'TXT_KEY_PROMOTION_PB_KAKUREZATO',	'TXT_KEY_PROMOTION_PB_KAKUREZATO_HELP',	'AS2D_IF_LEVELUP',	1,				0,					1,							1,				0,            	'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PB_KAKUREZATO');

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										Sound,				CannotBeChosen, LostWithUpgrade,  	PortraitIndex,  IconAtlas,              PediaType,          PediaEntry)
VALUES	('PROMOTION_PB_SNEAK_ATTACK',	'TXT_KEY_PROMOTION_PB_SNEAK_ATTACK',	'TXT_KEY_PROMOTION_PB_SNEAK_ATTACK_HELP',	'AS2D_IF_LEVELUP',	1,				1,					0,            	'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PB_SNEAK_ATTACK'),
		('PROMOTION_PB_KISHOMON',		'TXT_KEY_PROMOTION_PB_KISHOMON',		'TXT_KEY_PROMOTION_PB_KISHOMON_HELP',		'AS2D_IF_LEVELUP',	1,				0,					0,            	'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PB_KISHOMON');

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										Sound,				CannotBeChosen, LostWithUpgrade,	HasPostCombatPromotions,	IgnoreZoC,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry)
VALUES	('PROMOTION_PB_RECONNAISSANCE',	'TXT_KEY_PROMOTION_PB_RECONNAISSANCE',	'TXT_KEY_PROMOTION_PB_RECONNAISSANCE_HELP',	'AS2D_IF_LEVELUP',	1,				0,					1,							1,			0,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_RECONNAISSANCE');


------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_PostCombatRandomPromotion
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_PostCombatRandomPromotion
		(PromotionType,				NewPromotion)
VALUES	('PROMOTION_PB_KAKUREZATO',	'PROMOTION_PB_SNEAK_ATTACK');

------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Features
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Features
		(PromotionType,				FeatureType,		DoubleMove)
VALUES	('PROMOTION_PB_KISHOMON',	'FEATURE_JUNGLE',	1),
		('PROMOTION_PB_KISHOMON',	'FEATURE_FOREST',	1);

--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Builds
		(Type,					PrereqTech,		ImprovementType,				Time,	Recommendation,						Description,					Help,								CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey,	EntityEvent)
VALUES	('BUILD_PB_KAKUREZATO',	'TECH_GUILDS',	'IMPROVEMENT_PB_KAKUREZATO',	700,	'TXT_KEY_BUILD_PB_KAKUREZATO_REC',	'TXT_KEY_BUILD_PB_KAKUREZATO',	'TXT_KEY_BUILD_PB_KAKUREZATO_HELP',	1,			96,				0,			'ACTION_PB_KAKUREZATO',	'KB_F',	'ENTITY_EVENT_BUILD');
------------------------------------------------------------------------------------------------------------------------
-- Improvements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,							SpecificCivRequired,	CivilizationType,		Description,							Help,									 	Civilopedia,									PillageGold,	ArtDefineTag,							IconAtlas,			PortraitIndex)
VALUES	('IMPROVEMENT_PB_KAKUREZATO',	1,						'CIVILIZATION_PB_IGA',	'TXT_KEY_IMPROVEMENT_PB_KAKUREZATO',	'TXT_KEY_IMPROVEMENT_PB_KAKUREZATO_HELP',	'TXT_KEY_CIV5_IMPROVEMENTS_PB_KAKUREZATO_TEXT',	10,				'ART_DEF_IMPROVEMENT_PB_KAKUREZATO',	'PB_IGA_ICON_ATLAS',	3);
------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidFeatures
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidFeatures
		(ImprovementType,				FeatureType)
VALUES	('IMPROVEMENT_PB_KAKUREZATO',	'FEATURE_FOREST'),
		('IMPROVEMENT_PB_KAKUREZATO',	'FEATURE_JUNGLE');
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_PB_KAKUREZATO',	'YIELD_CULTURE',	2);
------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds
		(UnitType,		 BuildType)
VALUES	('UNIT_WORKER',	 'BUILD_PB_KAKUREZATO');