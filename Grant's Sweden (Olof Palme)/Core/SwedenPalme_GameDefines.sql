---==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 										DerivativeCiv,		Description, 	ShortDescription,	Adjective,	CivilopediaTag,	DefaultPlayerColor,					ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,					AlphaIconAtlas,				SoundtrackTag, 	MapImage,					DawnOfManQuote,								DawnOfManImage)
SELECT	('CIVILIZATION_GT_SWEDEN_PALME'), 	('CIVILIZATION_SWEDEN'),	Description, 	ShortDescription,	Adjective,	CivilopediaTag,	('PLAYERCOLOR_GT_SWEDEN_PALME'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('GT_SWEDEN_PALME_ATLAS'),	('GT_SWEDEN_PALME_ALPHA_ATLAS'),	SoundtrackTag, 	('SwedenPalme_Map.dds'),	('TXT_KEY_CIV5_DAWN_GT_SWEDEN_PALME_TEXT'),	('Olof_DoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SWEDEN');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,						CityName)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_1'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_2'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_3'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_4'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_5'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_6'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_7'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_8'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_9'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_10'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_11'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_12'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_13'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_14'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_15'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_16'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_17'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_18'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_19'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_20'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_21'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_22'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_23'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_24'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_25'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_26'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_27'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_28'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_29'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_30'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_31'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_32'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_33'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_34'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_35'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_36'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_37'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_38'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_39'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_40'),
		('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_41'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_42'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_43'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_44'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_45'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_46'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_47'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_48'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_49'),
        ('CIVILIZATION_GT_SWEDEN_PALME',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_SWEDEN_PALME_50');	
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	('CIVILIZATION_GT_SWEDEN_PALME'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	('CIVILIZATION_GT_SWEDEN_PALME'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_GT_SWEDEN_PALME'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME',	'LEADER_GT_OLOF_PALME');
--------------------------------	
-- Civilization_Religions
--------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME',	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME', 	'UNITCLASS_MISSILE_CRUISER',	'UNIT_GT_UBATSJAGARE');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 					BuildingType)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME', 	'BUILDINGCLASS_NUCLEAR_PLANT',		'BUILDING_GT_AGESTA');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_0'),	
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_1'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_2'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_3'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_4'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_5'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_6'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_7'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_8'),
		('CIVILIZATION_GT_SWEDEN_PALME', 	'TXT_KEY_SPY_NAME_GT_SWEDEN_PALME_9');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 						RegionType)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME',	'REGION_FOREST'),
		('CIVILIZATION_GT_SWEDEN_PALME',	'REGION_GRASS');
--------------------------------	
-- Civilization_Start_Along_River
--------------------------------	
INSERT INTO Civilization_Start_Along_River
		(CivilizationType,						StartAlongRiver)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME',	1);
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType,						StartAlongOcean)
VALUES	('CIVILIZATION_GT_SWEDEN_PALME',	1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 							PortraitIndex)
VALUES	('LEADER_GT_OLOF_PALME', 	'TXT_KEY_LEADER_GT_OLOF_PALME', 	'TXT_KEY_LEADER_GT_OLOF_PALME_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_GT_OLOF_PALME',	'Olof_Diplo.xml',	5, 						3, 						6, 							8, 			9, 				11, 				10, 						8, 				6, 			4, 			5, 				6, 			2, 			'GT_SWEDEN_PALME_ATLAS',		1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 			Bias)
VALUES	('LEADER_GT_OLOF_PALME', 		'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_GT_OLOF_PALME', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_GT_OLOF_PALME', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_GT_OLOF_PALME', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_GT_OLOF_PALME', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_GT_OLOF_PALME', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_GT_OLOF_PALME', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		9);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 			Bias)
VALUES	('LEADER_GT_OLOF_PALME', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_GT_OLOF_PALME', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_GT_OLOF_PALME', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_GT_OLOF_PALME', 		'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_GT_OLOF_PALME', 		'MINOR_CIV_APPROACH_BULLY', 		1);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_GT_OLOF_PALME', 		'FLAVOR_OFFENSE', 					5),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_DEFENSE', 					8),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_CITY_DEFENSE', 				8),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_RECON', 					7),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_RANGED', 					6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_MOBILE', 					5),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_NAVAL', 					9),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_NAVAL_RECON', 				10),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_NAVAL_GROWTH', 				8),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_AIR', 						5),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_EXPANSION', 				6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_GROWTH', 					7),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_GOLD', 						6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_SCIENCE', 					9),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_CULTURE', 					6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_HAPPINESS', 				8),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_WONDER', 					2),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_RELIGION', 					1),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_DIPLOMACY', 				9),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_SPACESHIP', 				6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_NUKE', 						7),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_USE_NUKE', 					1),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_ESPIONAGE', 				6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_AIRLIFT', 					7),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_I_TRADE_DESTINATION', 		6),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		10),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_GT_OLOF_PALME', 		'FLAVOR_AIR_CARRIER', 				7);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_GT_OLOF_PALME', 	'TRAIT_GT_SWEDEN_PALME');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_GT_SWEDEN_PALME', 	'TXT_KEY_TRAIT_GT_SWEDEN_PALME',	'TXT_KEY_TRAIT_GT_SWEDEN_PALME_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 										Description, 									Help, 												Sound, 					CannotBeChosen, LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_GT_UBATSJAGARE_HEAL', 			'TXT_KEY_PROMOTION_GT_UBATSJAGARE_HEAL',		'TXT_KEY_PROMOTION_GT_UBATSJAGARE_HEAL_HELP',		'AS2D_IF_LEVELUP', 		1, 				0, 				 26, 				'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_UBATSJAGARE_HEAL'),
		('PROMOTION_GT_UBATSJAGARE_FOCUS_FOOD', 	'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_FOOD',		'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_FOOD_HELP',		'AS2D_IF_LEVELUP', 		1, 				0, 				 1, 				'GT_SWEDEN_PALME_PROMOTION_ATLAS', 	null, null),
		('PROMOTION_GT_UBATSJAGARE_FOCUS_GOLD', 	'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_GOLD',		'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_GOLD_HELP',		'AS2D_IF_LEVELUP', 		1, 				0, 				 4, 				'GT_SWEDEN_PALME_PROMOTION_ATLAS', 	null, null),
		('PROMOTION_GT_UBATSJAGARE_FOCUS_CULTURE', 	'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_CULTURE',		'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_CULTURE_HELP',		'AS2D_IF_LEVELUP', 		1, 				0, 				 3, 				'GT_SWEDEN_PALME_PROMOTION_ATLAS', 	null, null),
		('PROMOTION_GT_UBATSJAGARE_FOCUS_SCIENCE', 	'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_SCIENCE',		'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_SCIENCE_HELP',		'AS2D_IF_LEVELUP', 		1, 				0, 				 0, 				'GT_SWEDEN_PALME_PROMOTION_ATLAS', 	null, null),
		('PROMOTION_GT_UBATSJAGARE_FOCUS_PRODUCTION', 	'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_PRODUCTION',		'TXT_KEY_PROMOTION_GT_UBATSJAGARE_FOCUS_PRODUCTION_HELP',		'AS2D_IF_LEVELUP', 		1, 				0, 				 2, 				'GT_SWEDEN_PALME_PROMOTION_ATLAS', 	null, null);

UPDATE UnitPromotions
SET CaptureDefeatedEnemy = 1
WHERE (Type = 'PROMOTION_GT_UBATSJAGARE_CAPTURE');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
------------------------------	
INSERT INTO Units 	
		(Type, 						Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 						Help, 									Strategy, 									Civilopedia, 							ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					 UnitFlagAtlas, 					UnitFlagIconOffset,  IconAtlas,						PortraitIndex)
SELECT	'UNIT_GT_UBATSJAGARE',		Class,	CombatClass, 'TECH_COMPUTERS', Cost, Combat-22, RangedCombat-50, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves-2, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_GT_UBATSJAGARE',		'TXT_KEY_UNIT_GT_UBATSJAGARE_HELP', 	'TXT_KEY_UNIT_GT_UBATSJAGARE_STRATEGY',  	'TXT_KEY_UNIT_GT_UBATSJAGARE_TEXT',		ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_GT_UBATSJAGARE',	 'GT_SWEDEN_PALME_FLAG_ATLAS',		0,					 'GT_SWEDEN_PALME_ATLAS',		2
FROM Units WHERE Type = 'UNIT_MISSILE_CRUISER';  
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_UBATSJAGARE',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MISSILE_CRUISER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 			
		(UnitType, 					UnitAIType)
SELECT	'UNIT_GT_UBATSJAGARE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSILE_CRUISER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_GT_UBATSJAGARE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MISSILE_CRUISER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_GT_UBATSJAGARE',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MISSILE_CRUISER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_GT_UBATSJAGARE',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_MISSILE_CRUISER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GT_UBATSJAGARE',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSILE_CRUISER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_GT_UBATSJAGARE',	'PROMOTION_GT_UBATSJAGARE_HEAL'),
		('UNIT_GT_UBATSJAGARE',	'PROMOTION_GT_UBATSJAGARE_CAPTURE');
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_GT_SWEDEN_PALME', 	'BUILDING_GT_SWEDEN_PALME', 	'TXT_KEY_BUILDING_GT_SWEDEN_PALME_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings		
		(Type, 								BuildingClass, 			  			UnmoddedHappiness,	Cost, 	FaithCost,	GreatWorkCount,	Happiness, 				Description, 									Help,									NeverCapture)
VALUES	('BUILDING_GT_SWEDEN_PALME', 		'BUILDINGCLASS_GT_SWEDEN_PALME', 	0,					-1, 	-1,			-1,				0,						 'TXT_KEY_BUILDING_GT_SWEDEN_PALME', 		'TXT_KEY_BUILDING_GT_SWEDEN_PALME_HELP',	1),
		('BUILDING_GT_AGESTA_SCIENCE', 		'BUILDINGCLASS_GT_SWEDEN_PALME', 	0,					-1, 	-1,			-1,				0,						 'TXT_KEY_BUILDING_GT_AGESTA_SCIENCE', 		'TXT_KEY_BUILDING_GT_AGESTA_SCIENCE_HELP',	1),
		('BUILDING_GT_AGESTA_FOOD', 		'BUILDINGCLASS_GT_SWEDEN_PALME', 	0,					-1, 	-1,			-1,				0,						 'TXT_KEY_BUILDING_GT_AGESTA_FOOD', 		'TXT_KEY_BUILDING_GT_AGESTA_FOOD_HELP',		1),
		('BUILDING_GT_KALLAR_MODS', 		'BUILDINGCLASS_GT_SWEDEN_PALME', 	0,					-1, 	-1,			-1,				1,						 'TXT_KEY_BUILDING_GT_KALLAR_MODS', 		'TXT_KEY_BUILDING_GT_KALLAR_MODS_HELP',		1);


INSERT INTO Buildings 	
		(Type, 					BuildingClass,	Cost,	FreeStartEra,	HurryCostModifier, FreshWater,	GoldMaintenance,	PrereqTech,	Description, 					Civilopedia, 						Help, 									Strategy,									ArtDefineTag, 	MinAreaSize,	ConquestProb,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_GT_AGESTA'),	BuildingClass,	Cost,	FreeStartEra,	HurryCostModifier, 1, 	        GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_GT_AGESTA'),('TXT_KEY_BUILDING_GT_AGESTA_TEXT'),	('TXT_KEY_BUILDING_GT_AGESTA_HELP'),	('TXT_KEY_BUILDING_GT_AGESTA_STRATEGY'),	ArtDefineTag,	MinAreaSize,	0,				3, 				('GT_SWEDEN_PALME_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_NUCLEAR_PLANT');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,				Flavor)
SELECT	('BUILDING_GT_AGESTA'),	FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_RECYCLING_CENTER');

INSERT INTO Building_Flavors 
		(BuildingType, 			FlavorType,					Flavor)
VALUES	('BUILDING_GT_AGESTA', 	'FLAVOR_GROWTH', 			10),
		('BUILDING_GT_AGESTA', 	'FLAVOR_WATER_CONNECTION',	10);
------------------------------	
-- Building_ResourceQuantityRequirements
------------------------------		
INSERT INTO Building_ResourceQuantityRequirements 	
		(BuildingType, 			ResourceType,				Quantity)
SELECT	('BUILDING_GT_AGESTA'),	ResourceType,				Quantity
FROM Building_ResourceQuantityRequirements WHERE (BuildingType = 'BUILDING_NUCLEAR_PLANT');
------------------------------	
-- Building_YieldModfiers
------------------------------						
INSERT INTO Building_YieldModfiers 	
		(BuildingType, 			YieldType,				Yield)
SELECT	('BUILDING_GT_AGESTA'),	YieldType,				Yield
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_NUCLEAR_PLANT');

INSERT INTO Building_YieldModfiers 
		(BuildingType, 					YieldType,					Yield)
VALUES	('BUILDING_GT_SWEDEN_PALME', 	'YIELD_PRODUCTION', 			5),
		('BUILDING_GT_AGESTA_SCIENCE', 	'YIELD_SCIENCE', 				1),
		('BUILDING_GT_AGESTA_FOOD', 	'YIELD_FOOD', 					1);
------------------------------------------------------------------------------------------------------------------------	
-- Building_CityToolTipYieldFromOther
------------------------------------------------------------------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS Building_CityToolTipYieldFromOther (BuildingType, YieldType, Yield);
INSERT INTO Building_CityToolTipYieldFromOther
		(BuildingType, 							YieldType,			Yield)
VALUES	('BUILDING_GT_KALLAR_MODS',	'YIELD_HAPPINESS',	1);
--==========================================================================================================================
--==========================================================================================================================