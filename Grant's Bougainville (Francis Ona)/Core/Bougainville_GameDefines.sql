--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 								Description, 						ShortDescription,						Adjective,									CivilopediaTag,									DefaultPlayerColor,			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			SoundtrackTag, 		MapImage,			DawnOfManQuote,						DawnOfManImage)
SELECT	('CIVILIZATION_GT_BOUGAINVILLE'), 	('TXT_KEY_CIVILIZATION_GT_BOUGAINVILLE'), 	('TXT_KEY_CIVILIZATION_GT_BOUGAINVILLE_SHORT'),	('TXT_KEY_CIVILIZATION_GT_BOUGAINVILLE_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_GT_BOUGAINVILLE'),	('PLAYERCOLOR_GT_BOUGAINVILLE'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('GT_BOUGAINVILLE_ATLAS'),	('GT_BOUGAINVILLE_ALPHA_ATLAS'),	('Polynesia'), 		('Bougainville_Map.dds'),	('TXT_KEY_CIV5_DAWN_GT_BOUGAINVILLE_TEXT'),	('BougainvilleDOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_POLYNESIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_1'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_2'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_3'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_4'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_5'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_6'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_7'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_8'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_9'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_10'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_11'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_12'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_13'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_14'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_15'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_16'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_17'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_18'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_19'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_20'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_21'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_22'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_23'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_24'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_25'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_26'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_27'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_28'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_29'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_30'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_31'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_32'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_33'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_34'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_35'),
        ('CIVILIZATION_GT_BOUGAINVILLE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_BOUGAINVILLE_36');		
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	('CIVILIZATION_GT_BOUGAINVILLE'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	('CIVILIZATION_GT_BOUGAINVILLE'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_GT_BOUGAINVILLE'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE',	'LEADER_GT_FRANCIS_ONA');
--------------------------------	
-- Civilization_Religions
--------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE',	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE', 	'UNITCLASS_MARINE',		'UNIT_GT_MEKEMAUI_DEFENCE_FORCE');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 					BuildingType)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE', 	'BUILDINGCLASS_STOCK_EXCHANGE',		'BUILDING_GT_U_VISTRACT');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_0'),	
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_1'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_2'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_3'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_4'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_5'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_6'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_7'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_8'),
		('CIVILIZATION_GT_BOUGAINVILLE', 	'TXT_KEY_SPY_NAME_GT_BOUGAINVILLE_9');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE',	'REGION_JUNGLE'),
		('CIVILIZATION_GT_BOUGAINVILLE',	'REGION_HILLS');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType,					StartAlongOcean)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE',	1);
--------------------------------	
-- Civilization_Start_Region_Avoid
--------------------------------	
INSERT INTO Civilization_Start_Region_Avoid 
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_GT_BOUGAINVILLE',	'REGION_TUNDRA');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 		DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_GT_FRANCIS_ONA', 	'TXT_KEY_LEADER_GT_FRANCIS_ONA', 	'TXT_KEY_LEADER_GT_FRANCIS_ONA_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_GT_FRANCIS_ONA',	'Francis_Ona_Leaderscene.xml',	9, 						1, 						6, 							10, 			1, 				9, 				10, 					3, 				6, 			4, 			1, 				4, 			9, 			'GT_BOUGAINVILLE_ATLAS',		1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_GT_FRANCIS_ONA', 		'MAJOR_CIV_APPROACH_WAR', 			10),
		('LEADER_GT_FRANCIS_ONA', 		'MAJOR_CIV_APPROACH_HOSTILE', 		11),
		('LEADER_GT_FRANCIS_ONA', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
		('LEADER_GT_FRANCIS_ONA', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_GT_FRANCIS_ONA', 		'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_GT_FRANCIS_ONA', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_GT_FRANCIS_ONA', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		1);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 			Bias)
VALUES	('LEADER_GT_FRANCIS_ONA', 		'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_GT_FRANCIS_ONA', 		'MINOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_GT_FRANCIS_ONA', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_GT_FRANCIS_ONA', 		'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_GT_FRANCIS_ONA', 		'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_OFFENSE', 					8),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_DEFENSE', 					10),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_RECON', 					6),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_RANGED', 					4),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_MOBILE', 					9),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_NAVAL', 					5),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_AIR', 						5),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_EXPANSION', 				6),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_GROWTH', 					9),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_GOLD', 						11),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_SCIENCE', 					2),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_CULTURE', 					6),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_GREAT_PEOPLE', 				1),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_WONDER', 					1),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_RELIGION', 					5),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_DIPLOMACY', 				2),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_SPACESHIP', 				4),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_NUKE', 						4),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_USE_NUKE', 					9),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_ESPIONAGE', 				9),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_AIRLIFT', 					7),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_GT_FRANCIS_ONA', 		'FLAVOR_AIR_CARRIER', 				4);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_GT_FRANCIS_ONA', 		'TRAIT_GT_COCONUT_REVOLUTION');
--==========================================================================================================================    
-- DIPLOMACY
--==========================================================================================================================    
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
        (LeaderType,                 ResponseType,                              Response,                                                     	Bias)
VALUES  ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_AI_DOF_BACKSTAB',                'TXT_KEY_LEADER_GT_FRANCIS_ONA_DENOUNCE_FRIEND%',                500),
        ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_ATTACKED_HOSTILE',               'TXT_KEY_LEADER_GT_FRANCIS_ONA_ATTACKED_HOSTILE%',               500),
        ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_DEFEATED',                       'TXT_KEY_LEADER_GT_FRANCIS_ONA_DEFEATED%',                       500),
        ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_DOW_GENERIC',                    'TXT_KEY_LEADER_GT_FRANCIS_ONA_DOW_GENERIC%',                    500),
        ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_FIRST_GREETING',                 'TXT_KEY_LEADER_GT_FRANCIS_ONA_FIRSTGREETING%',                  500),
        ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',    'TXT_KEY_LEADER_GT_FRANCIS_ONA_RESPONSE_TO_BEING_DENOUNCED%',    500),
        ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_WORK_AGAINST_SOMEONE',           'TXT_KEY_LEADER_GT_FRANCIS_ONA_DENOUNCE%',                       500),
        ('LEADER_GT_FRANCIS_ONA',     'RESPONSE_WORK_WITH_US',                   'TXT_KEY_LEADER_GT_FRANCIS_ONA_DEC_FRIENDSHIP%',                 500);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_GT_COCONUT_REVOLUTION', 	'TXT_KEY_TRAIT_GT_COCONUT_REVOLUTION',	'TXT_KEY_TRAIT_GT_COCONUT_REVOLUTION_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 					CannotBeChosen, MovesChange, 	LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_GT_COCONUT_REVOLUTION', 	'TXT_KEY_PROMOTION_GT_COCONUT_REVOLUTION',			'TXT_KEY_PROMOTION_GT_COCONUT_REVOLUTION_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_COCONUT_REVOLUTION'),
		('PROMOTION_GT_MEEKEMAUI', 				'TXT_KEY_PROMOTION_GT_MEEKEMAUI',				'TXT_KEY_PROMOTION_GT_MEEKEMAUI_HELP',				'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_MEEKEMAUI'),
		('PROMOTION_GT_ATTACKING_MERCENARY', 	'TXT_KEY_PROMOTION_GT_ATTACKING_MERCENARY',				'TXT_KEY_PROMOTION_GT_ATTACKING_MERCENARY_HELP',				'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_ATTACKING_MERCENARY'),
		('PROMOTION_GT_PURCHASED_WITH_GOLD', 	'TXT_KEY_PROMOTION_GT_PURCHASED_WITH_GOLD',				'TXT_KEY_PROMOTION_GT_PURCHASED_WITH_GOLD_HELP',				'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_PURCHASED_WITH_GOLD');
		
UPDATE UnitPromotions
SET AttackMod = 50
WHERE (Type = 'PROMOTION_GT_ATTACKING_MERCENARY');

INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType,							UnitCombatType,			Modifier)
VALUES 	('PROMOTION_GT_MEEKEMAUI',		'UNITCOMBAT_MELEE',		-50);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 								Class, PrereqTech,		Combat,	Cost,	WorkRate,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	Description,							Civilopedia,								Strategy,										Help,										MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,								PortraitIndex,	IconAtlas,					MoveRate)
SELECT	('UNIT_GT_MEKEMAUI_DEFENCE_FORCE'),	Class, 'TECH_RADIO',	Combat,	Cost,	WorkRate,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	('TXT_KEY_UNIT_GT_MEKEMAUI_DEFENCE_FORCE'),	('TXT_KEY_UNIT_GT_MEKEMAUI_DEFENCE_FORCE_TEXT'),	('TXT_KEY_UNIT_GT_MEKEMAUI_DEFENCE_FORCE_STRATEGY'),	('TXT_KEY_UNIT_GT_MEKEMAUI_DEFENCE_FORCE_HELP'),	MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		('ART_DEF_UNIT_GT_MEKEMAUI_DEFENCE_FORCE'),	0,					('GT_MEKEMAUI_DEFENCE_FORCE_FLAG_ATLAS'),	2,				('GT_BOUGAINVILLE_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_MARINE');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_GT_MEKEMAUI_DEFENCE_FORCE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MARINE');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_GT_MEKEMAUI_DEFENCE_FORCE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MARINE');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,			Flavor)
SELECT	('UNIT_GT_MEKEMAUI_DEFENCE_FORCE'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MARINE');

INSERT INTO Unit_Flavors 
		(UnitType, 							FlavorType,					Flavor)
VALUES	('UNIT_GT_MEKEMAUI_DEFENCE_FORCE', 		'FLAVOR_INFRASTRUCTURE', 	10),
		('UNIT_GT_MEKEMAUI_DEFENCE_FORCE', 		'FLAVOR_GOLD',				10);
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	('UNIT_GT_MEKEMAUI_DEFENCE_FORCE'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_MARINE');

--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	('UNIT_GT_MEKEMAUI_DEFENCE_FORCE'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MARINE');
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_GT_COCONUT_REVOLUTION', 	'BUILDING_GT_COCONUT_REVOLUTION', 	'TXT_KEY_BUILDING_GT_COCONUT_REVOLUTION');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass,	Cost,	FreeStartEra,	SpecialistType,	SpecialistCount,	HurryCostModifier,	PrereqTech,	Description, 						Civilopedia, 								Help, 										Strategy,								 		ArtDefineTag, 	MinAreaSize,	ConquestProb,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_GT_U_VISTRACT'),	BuildingClass,	Cost,	FreeStartEra,	SpecialistType,	SpecialistCount,	HurryCostModifier,	PrereqTech,	('TXT_KEY_BUILDING_GT_U_VISTRACT'),	('TXT_KEY_BUILDING_GT_U_VISTRACT_TEXT'),	('TXT_KEY_BUILDING_GT_U_VISTRACT_HELP'),	('TXT_KEY_BUILDING_GT_U_VISTRACT_STRATEGY'),	ArtDefineTag,	MinAreaSize,	0,				3, 				('GT_BOUGAINVILLE_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_STOCK_EXCHANGE');

INSERT INTO Buildings		
		(Type, 								BuildingClass, 			  			UnmoddedHappiness,	Cost, 	FaithCost,	GreatWorkCount,	Happiness, 				Description, 									Help,									NeverCapture)
VALUES	('BUILDING_GT_COCONUT_REVOLUTION', 	'BUILDINGCLASS_GT_COCONUT_REVOLUTION', 	0,					-1, 	-1,			-1,				0,						 'TXT_KEY_BUILDING_GT_COCONUT_REVOLUTION', 		'TXT_KEY_BUILDING_GT_COCONUT_REVOLUTION_HELP',	1),
		('BUILDING_GT_UVISTRACT_TOURISM', 		'BUILDINGCLASS_GT_COCONUT_REVOLUTION', 	0,					-1, 	-1,			-1,				0,						 'TXT_KEY_BUILDING_GT_UVISTRACT_TOURISM', 		'TXT_KEY_BUILDING_GT_UVISTRACT_TOURISM_HELP',	1),
		('BUILDING_GT_UVISTRACT_WLTKD', 		'BUILDINGCLASS_GT_COCONUT_REVOLUTION', 	0,					-1, 	-1,			-1,				0,						 'TXT_KEY_BUILDING_GT_UVISTRACT_WLTKD', 		'TXT_KEY_BUILDING_GT_UVISTRACT_WLTKD_HELP',	1);
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
SELECT	('BUILDING_GT_U_VISTRACT'),	FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_STOCK_EXCHANGE');

INSERT INTO Building_Flavors
		(BuildingType, 				FlavorType,				Flavor)
VALUES	('BUILDING_GT_U_VISTRACT',	'FLAVOR_GOLD',			10);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	('BUILDING_GT_U_VISTRACT'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_STOCK_EXCHANGE');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,		Yield)
SELECT	('BUILDING_GT_U_VISTRACT'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_STOCK_EXCHANGE');
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 				YieldType,		Yield)
SELECT	('BUILDING_GT_U_VISTRACT'),	YieldType,		Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_STOCK_EXCHANGE');
--==========================================================================================================================
--==========================================================================================================================