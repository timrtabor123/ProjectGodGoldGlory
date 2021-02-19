--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass,	Cost,	HurryCostModifier,	PrereqTech,	Happiness,	Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag,	ArtInfoCulturalVariation,	MinAreaSize,	NeverCapture,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_DMS_MC_WASILIRAM'),	BuildingClass,	Cost,	HurryCostModifier,	PrereqTech,	1,			('TXT_KEY_BUILDING_DMS_MC_WASILIRAM'),	('TXT_KEY_CIV5_DMS_MC_WASILIRAM_TEXT'),	('TXT_KEY_BUILDING_DMS_MC_WASILIRAM_HELP'),	('TXT_KEY_BUILDING_DMS_MC_WASILIRAM_STRATEGY'),	ArtDefineTag,	ArtInfoCulturalVariation,	MinAreaSize,	NeverCapture,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	3,			 	('DMS_MC_KANEM_BORNU_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_CARAVANSARY');
------------------------------	
-- Building_SpecialistYieldChanges
------------------------------	
INSERT INTO Building_SpecialistYieldChanges 	
		(BuildingType, 						SpecialistType,				YieldType,		Yield)
VALUES	('BUILDING_DMS_MC_WASILIRAM',		'SPECIALIST_WRITER',		'YIELD_FAITH',	1),
		('BUILDING_DMS_MC_WASILIRAM',		'SPECIALIST_MUSICIAN',		'YIELD_FAITH',	1),
		('BUILDING_DMS_MC_WASILIRAM',		'SPECIALIST_SCIENTIST',		'YIELD_FAITH',	1),
		('BUILDING_DMS_MC_WASILIRAM',		'SPECIALIST_MERCHANT',		'YIELD_FAITH',	1),
		('BUILDING_DMS_MC_WASILIRAM',		'SPECIALIST_ENGINEER',		'YIELD_FAITH',	1);

--INSERT INTO Building_SpecialistYieldChanges
--		(BuildingType,					SpecialistType,		YieldType,       Yield)
--SELECT	'BUILDING_DMS_MC_WASILIRAM',    Type,				'YIELD_FAITH',   1
--FROM Specialists;
--
--CREATE TRIGGER InsertOnSpecialist_With_YieldChangeForSpecialist
--	AFTER INSERT ON Specialists
--	WHERE NEW.Type NOT NULL
--BEGIN
--	INSERT INTO Building_SpecialistYieldChanges
--			(BuildingType,					SpecialistType,		YieldType,      Yield)
--	SELECT	'BUILDING_DMS_MC_WASILIRAM',    Type,				'YIELD_FAITH',	1
--	FROM Specialists WHERE Type = NEW.Type;
--END;

INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,    SpecialistType,	YieldType,       Yield)
SELECT	'BUILDING_TYPE',  Type,             'YIELD_TYPE',    1
FROM Specialists WHERE Type IN ('SPECIALIST_JFD_DIGNITARY', 'SPECIALIST_JFD_MAGISTRATE', 'SPECIALIST_JFD_MONK', 'SPECIALIST_JFD_DOCTOR');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,				Flavor)
SELECT	('BUILDING_DMS_MC_WASILIRAM'),		FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CARAVANSARY');

INSERT INTO Building_Flavors
		(BuildingType, 						FlavorType,				Flavor)
VALUES	('BUILDING_DMS_MC_WASILIRAM',		'FLAVOR_HAPPINESS',		10),
		('BUILDING_DMS_MC_WASILIRAM',		'FLAVOR_RELIGION',		20);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class, 	PrereqTech,	Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,		CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	('UNIT_DMS_MC_ASKAWR'),		Class,	PrereqTech, Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves+1,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_DMS_MC_ASKAWR'),	('TXT_KEY_CIV5_DMS_MC_ASKAWR_TEXT'),	('TXT_KEY_UNIT_DMS_MC_ASKAWR_STRATEGY'),	('TXT_KEY_UNIT_DMS_MC_ASKAWR_HELP'),	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_DMS_MC_ASKAWR'), 	0,					('DMS_ASKAWR_FLAG_ART_ATLAS'),	2,				('DMS_MC_KANEM_BORNU_ATLAS')
FROM Units WHERE (Type = 'UNIT_KNIGHT');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_MC_ASKAWR'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_KNIGHT');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	('UNIT_DMS_MC_ASKAWR'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_KNIGHT');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,			Flavor)
SELECT	('UNIT_DMS_MC_ASKAWR'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_KNIGHT');

INSERT INTO Unit_Flavors
		(UnitType, 						FlavorType,				Flavor)
VALUES	('UNIT_DMS_MC_ASKAWR',			'FLAVOR_OFFENSE',		20);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	('UNIT_DMS_MC_ASKAWR'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_KNIGHT');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_DMS_MC_ASKAWR',		'PROMOTION_DMS_MC_PERFECT_PRINCE');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	('UNIT_DMS_MC_ASKAWR'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_KNIGHT');
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType)
SELECT	('UNIT_DMS_MC_ASKAWR'),	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_KNIGHT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
INSERT INTO UnitPromotions 	
		(Type, 									Description,									Help,												Sound,				MovesChange,	ExtraWithdrawal,	CombatPercent,	PortraitIndex,	IconAtlas,						PediaType,			PediaEntry,											CannotBeChosen)
VALUES	('PROMOTION_DMS_MC_PERFECT_PRINCE',		'TXT_KEY_PROMOTION_DMS_MC_PERFECT_PRINCE',		'TXT_KEY_PROMOTION_DMS_MC_PERFECT_PRINCE_HELP',		'AS2D_IF_LEVELUP',	0,				0,					0,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_PERFECT_PRINCE_HELP',		1),
		('PROMOTION_DMS_MC_EXTRA_MOVEMENT',		'TXT_KEY_PROMOTION_DMS_MC_EXTRA_MOVEMENT',		'TXT_KEY_PROMOTION_DMS_MC_EXTRA_MOVEMENT_HELP',		'AS2D_IF_LEVELUP',	1,				0,					0,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_EXTRA_MOVEMENT_HELP',		1),
		('PROMOTION_DMS_MC_RETREAT',			'TXT_KEY_PROMOTION_DMS_MC_RETREAT',				'TXT_KEY_PROMOTION_DMS_MC_RETREAT_HELP',			'AS2D_IF_LEVELUP',	0,				75,					0,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_RETREAT_HELP',			1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_1',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_1',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_1_HELP',	'AS2D_IF_LEVELUP',	0,				0,					5,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_1_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_2',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_2',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_2_HELP',	'AS2D_IF_LEVELUP',	0,				0,					10,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_2_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_3',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_3',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_3_HELP',	'AS2D_IF_LEVELUP',	0,				0,					15,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_3_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_4',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_4',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_4_HELP',	'AS2D_IF_LEVELUP',	0,				0,					20,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_4_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_5',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_5',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_5_HELP',	'AS2D_IF_LEVELUP',	0,				0,					25,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_5_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_6',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_6',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_6_HELP',	'AS2D_IF_LEVELUP',	0,				0,					30,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_6_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_7',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_7',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_7_HELP',	'AS2D_IF_LEVELUP',	0,				0,					35,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_7_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_8',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_8',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_8_HELP',	'AS2D_IF_LEVELUP',	0,				0,					40,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_8_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_9',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_9',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_9_HELP',	'AS2D_IF_LEVELUP',	0,				0,					45,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_9_HELP',	1),
		('PROMOTION_DMS_MC_ASKAWR_STRENGTH_10',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_10',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_10_HELP',	'AS2D_IF_LEVELUP',	0,				0,					50,				33,				'PROMOTION_ATLAS',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_MC_ASKAWR_STRENGTH_10_HELP',	1);
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType, 			UnitCombatType)
VALUES	('PROMOTION_DMS_TETU',		'UNITCOMBAT_RECON');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 							Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_DMS_MC_IDIRS_ALAUMA', 		'TXT_KEY_LEADER_DMS_MC_IDIRS_ALAUMA', 	'TXT_KEY_LEADER_DMS_MC_IDIRS_ALAUMA_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_DMS_MC_IDIRS_ALAUMA', 	'IdrisAlauma_Scene.xml',	7, 						4, 						4, 							7, 			5, 				4, 				7, 						7, 				6, 			4, 			5, 				6, 			7, 			'DMS_MC_KANEM_BORNU_ATLAS', 1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_OFFENSE', 					8),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_DEFENSE', 					9),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_RECON', 					5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_RANGED', 					5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_MOBILE', 					4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_NAVAL', 					2),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_AIR', 						6),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_EXPANSION', 				7),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_GROWTH', 					5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_INFRASTRUCTURE', 			10),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_PRODUCTION', 				5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_GOLD', 						7),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_SCIENCE', 					5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_CULTURE', 					5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_WONDER', 					4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_RELIGION', 					10),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_SPACESHIP', 				4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_NUKE', 						7),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_USE_NUKE', 					6),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_ESPIONAGE', 				5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_DMS_MC_IDIRS_ALAUMA', 		'FLAVOR_AIR_CARRIER', 				4);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_DMS_MC_IDIRS_ALAUMA', 		'TRAIT_DMS_MC_WITH_NONE_TO_FEAR_BUT_GOD');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 										Description, 										ShortDescription)
VALUES	('TRAIT_DMS_MC_WITH_NONE_TO_FEAR_BUT_GOD', 	'TXT_KEY_TRAIT_DMS_MC_WITH_NONE_TO_FEAR_BUT_GOD', 	'TXT_KEY_TRAIT_DMS_MC_WITH_NONE_TO_FEAR_BUT_GOD_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 									Description, 									ShortDescription,									Adjective,												CivilopediaTag,												DefaultPlayerColor,					ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,						AlphaIconAtlas,							SoundtrackTag, 	MapImage,					DawnOfManQuote,									DawnOfManImage)
SELECT	('CIVILIZATION_DMS_MC_KANEM_BORNU'), 	('TXT_KEY_CIVILIZATION_DMS_MC_KANEM_BORNU'), 	('TXT_KEY_CIVILIZATION_DMS_MC_KANEM_BORNU_SHORT'),	('TXT_KEY_CIVILIZATION_DMS_MC_KANEM_BORNU_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_DMS_MC_KANEM_BORNU'),	('PLAYERCOLOR_DMS_MC_KANEM_BORNU'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('DMS_MC_KANEM_BORNU_ATLAS'),	('DMS_MC_KANEM_BORNU_ALPHA_ATLAS'),		('Songhai'), 	('KanemBornuMap512.dds'),	('TXT_KEY_CIV5_DAWN_DMS_MC_KANEM_BORNU_TEXT'),	('IdrisAlauma_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SONGHAI');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,        CityName)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_1'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_2'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_3'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_4'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_5'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_6'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_7'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_8'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_9'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_10'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_11'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_12'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_13'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_14'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_15'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_16'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_17'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_18'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_19'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_20'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_21'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_22'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_23'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_24'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_25'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_26'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_27'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_28'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_29'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_30'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_31'),
        ('CIVILIZATION_DMS_MC_KANEM_BORNU',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU_32');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	('CIVILIZATION_DMS_MC_KANEM_BORNU'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SONGHAI');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	('CIVILIZATION_DMS_MC_KANEM_BORNU'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SONGHAI');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_DMS_MC_KANEM_BORNU'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SONGHAI');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',		'LEADER_DMS_MC_IDIRS_ALAUMA');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU', 	'UNITCLASS_KNIGHT',		'UNIT_DMS_MC_ASKAWR');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU', 	'BUILDINGCLASS_CARAVANSARY', 	'BUILDING_DMS_MC_WASILIRAM');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU', 	'RELIGION_ISLAM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_0'),	
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_1'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_2'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_3'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_4'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_5'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_6'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_7'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_8'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'TXT_KEY_SPY_NAME_DMS_MC_KANEM_BORNU_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 							RegionType)
VALUES		('CIVILIZATION_DMS_MC_KANEM_BORNU', 		'REGION_DESERT');
--==========================================================================================================================
--==========================================================================================================================