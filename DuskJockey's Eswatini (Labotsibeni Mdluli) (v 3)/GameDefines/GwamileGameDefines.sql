--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 						Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_DJ_ESWATINI'), 	('TXT_KEY_CIV_DJ_ESWATINI_DESC'), 	('TXT_KEY_CIV_DJ_ESWATINI_SHORT_DESC'),	('TXT_KEY_CIV_DJ_ESWATINI_ADJECTIVE'),	('TXT_KEY_CIV5_DJ_ESWATINI_TEXT_1'),	('TXT_KEY_CIV5_DJ_ESWATINI'),	('PLAYERCOLOR_DJ_ESWATINI'), 	ArtDefineTag, ArtStyleType,	ArtStyleSuffix, ArtStylePrefix,	('DJ_ESWATINI_COLOR_ATLAS'), 	0, 				('DJ_ESWATINI_ALPHA_ATLAS'), 	SoundtrackTag, 	('GwamileMap.dds'), 	('TXT_KEY_CIV5_DOM_DJ_GWAMILE_TEXT'), 	('GwamileDoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ZULU');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ZULU' )
	THEN '_ZULU'
	ELSE '_AFRICA' END) 
WHERE Type = 'CIVILIZATION_DJ_ESWATINI';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_MBABANE'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_LOBAMBA'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_BIG_BEND'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_MALKERNS'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_NHLAGANO'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_MHLUME'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_HLUTI'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_SIMUNYE'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_SITEKI'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_PIGGS_PEAK'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_MANZINI'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_NGOMANE'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_VUVULANE'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_MPAKA'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_KWALUSENI'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_BHUNYA'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_MHLAMBANYATSI'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_TABANKULU'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_HLATIKULU'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_BULEMBU'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_KUBUTA'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_TJANENI'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_SIDVOKODVO'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_LAVUMISA'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_NGWENYA'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_NSOKO'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_CITY_NAME_DJ_MANKAYANE');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_DJ_ESWATINI'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_DJ_ESWATINI'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_DJ_ESWATINI'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_DJ_ESWATINI', 	'LEADER_DJ_GWAMILE');	
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			 BuildingType)
VALUES		('CIVILIZATION_DJ_ESWATINI', 	'BUILDINGCLASS_STABLE',	'BUILDING_DJ_ROYAL_KRAAL');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_DJ_ESWATINI', 	'UNITCLASS_GREAT_GENERAL',	'UNIT_DJ_NGWENYAMA');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		('CIVILIZATION_DJ_ESWATINI'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_0'),	
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_1'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_2'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_3'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_4'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_5'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_6'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_7'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_8'),
			('CIVILIZATION_DJ_ESWATINI', 	'TXT_KEY_SPY_NAME_DJ_ESWATINI_9');
--==========================================================================================================================	
-- Civilization_Start_Region_Avoid
--==========================================================================================================================		
INSERT INTO Civilization_Start_Region_Avoid 
			(CivilizationType, 				RegionType)
SELECT		('CIVILIZATION_DJ_ESWATINI'), 	RegionType
FROM Civilization_Start_Region_Avoid WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_DJ_ESWATINI_ICON', 			0.012,	0.102,	0.129,	1),
			('COLOR_PLAYER_DJ_ESWATINI_BACKGROUND',		0.570,	0.719,	0.863,	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_DJ_ESWATINI',	'COLOR_PLAYER_DJ_ESWATINI_ICON',	'COLOR_PLAYER_DJ_ESWATINI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_DJ_GWAMILE', 	'TXT_KEY_LEADER_DJ_GWAMILE', 	'TXT_KEY_LEADER_DJ_GWAMILE_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_DJ_GWAMILE', 	'Gwamile_Scene.xml',	7, 						3, 						6, 							8, 			6, 				7, 				6, 						5, 				9, 			7, 			6, 				5, 			3, 			'DJ_ESWATINI_COLOR_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 			Bias)
VALUES		('LEADER_DJ_GWAMILE', 		'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_DJ_GWAMILE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_DJ_GWAMILE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_DJ_GWAMILE', 		'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_DJ_GWAMILE', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_DJ_GWAMILE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_DJ_GWAMILE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 			Bias)
VALUES		('LEADER_DJ_GWAMILE', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_DJ_GWAMILE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_DJ_GWAMILE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_DJ_GWAMILE', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_DJ_GWAMILE', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_DJ_GWAMILE', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_RECON', 					8),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_RANGED', 					3),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_MOBILE', 					6),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_NAVAL', 					5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_AIR', 						5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_GROWTH', 					7),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_GOLD', 						5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_CULTURE', 					8),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_WONDER', 					4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_RELIGION', 					4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_NUKE', 						2),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_DJ_GWAMILE', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_DJ_GWAMILE',	'TRAIT_DJ_SIYINQABA');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================						
INSERT INTO Traits
			(Type,					Description,					ShortDescription)
VALUES		('TRAIT_DJ_SIYINQABA',	'TXT_KEY_TRAIT_DJ_SIYINQABA',	'TXT_KEY_TRAIT_DJ_SIYINQABA_SHORT');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 	DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_DJ_ESWATINI', 	'BUILDING_DJ_ESWATINI_BORDERS', 'TXT_KEY_TRAIT_DJ_SIYINQABA_SHORT');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
		(Type, 							BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation, Defense,	ExtraCityHitPoints,	NeverCapture,	Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_DJ_ROYAL_KRAAL'),	BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation, Defense,	ExtraCityHitPoints,	NeverCapture,	('TXT_KEY_BUILDING_DJ_ROYAL_KRAAL'),	('TXT_KEY_CIV5_DJ_ROYAL_KRAAL_TEXT'),	('TXT_KEY_BUILDING_DJ_ROYAL_KRAAL_HELP'),	('TXT_KEY_BUILDING_DJ_ROYAL_KRAAL_STRATEGY'),	ArtDefineTag, 3, 				('DJ_ESWATINI_COLOR_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_STABLE';

INSERT INTO Buildings 	
			(Type, 								BuildingClass, 					PrereqTech,	GreatWorkCount, Cost,	FaithCost,	NeverCapture,	ConquestProb,	Description,						ArtDefineTag,				NukeImmune,	HurryCostModifier,	MinAreaSize,	PlotCultureCostModifier,	PlotBuyCostModifier)
VALUES		('BUILDING_DJ_ESWATINI_MARKER',		'BUILDINGCLASS_DJ_ESWATINI',	null,		-1,				-1,		-1,			1,				0,				'TXT_KEY_TRAIT_DJ_SIYINQABA_SHORT',	'ART_DEF_BUILDING_GARDEN',	1,			-1,					-1,				0,							0),
			('BUILDING_DJ_ESWATINI_BORDERS',	'BUILDINGCLASS_DJ_ESWATINI',	null,		-1,				-1,		-1,			1,				0,				'TXT_KEY_TRAIT_DJ_SIYINQABA_SHORT',	'ART_DEF_BUILDING_GARDEN',	1,			-1,					-1,				-2,							-2),
			('BUILDING_DJ_KRAAL_CULTURE',		'BUILDINGCLASS_DJ_ESWATINI',	null,		-1,				-1,		-1,			1,				0,				'TXT_KEY_BUILDING_DJ_ROYAL_KRAAL',	'ART_DEF_BUILDING_GARDEN',	1,			-1,					-1,				0,							0);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
		(BuildingType, 					 FlavorType, Flavor)
SELECT	('BUILDING_DJ_ROYAL_KRAAL'),	 FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STABLE';
--==========================================================================================================================	
-- Building_LocalResourceOrs
--==========================================================================================================================	
INSERT INTO Building_LocalResourceOrs
			(BuildingType,					ResourceType)
SELECT		('BUILDING_DJ_ROYAL_KRAAL'),	ResourceType
FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_STABLE';
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================	
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					ResourceType,	YieldType,	Yield)
SELECT		('BUILDING_DJ_ROYAL_KRAAL'),	ResourceType,	YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STABLE';

INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					ResourceType,		YieldType,			Yield)
VALUES		('BUILDING_DJ_ROYAL_KRAAL',		'RESOURCE_HORSE',	'YIELD_CULTURE',	1),
			('BUILDING_DJ_ROYAL_KRAAL',		'RESOURCE_SHEEP',	'YIELD_CULTURE',	1),
			('BUILDING_DJ_ROYAL_KRAAL',		'RESOURCE_COW',		'YIELD_CULTURE',	1),
			('BUILDING_DJ_KRAAL_CULTURE',	'RESOURCE_HORSE',	'YIELD_CULTURE',	1),
			('BUILDING_DJ_KRAAL_CULTURE',	'RESOURCE_SHEEP',	'YIELD_CULTURE',	1),
			('BUILDING_DJ_KRAAL_CULTURE',	'RESOURCE_COW',		'YIELD_CULTURE',	1);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry,								RangedSupportFire)
VALUES	('PROMOTION_DJ_NGWENYAMA',		'TXT_KEY_PROMOTION_DJ_NGWENYAMA',		'TXT_KEY_PROMOTION_DJ_NGWENYAMA_HELP',		'AS2D_IF_LEVELUP',	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DJ_NGWENYAMA',		0),
		('PROMOTION_DJ_INCWALA',		'TXT_KEY_PROMOTION_DJ_INCWALA',			'TXT_KEY_PROMOTION_DJ_INCWALA_HELP',		'AS2D_IF_LEVELUP',	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DJ_INCWALA',			0),
		('PROMOTION_DJ_LION_SPIRIT',	'TXT_KEY_PROMOTION_DJ_LION_SPIRIT',		'TXT_KEY_PROMOTION_DJ_LION_SPIRIT_HELP',	'AS2D_IF_LEVELUP',	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DJ_LION_SPIRIT',		1);
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
		(Type, 					Class,						PrereqTech,	Special, Combat, CombatLimit, WorkRate, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo,						UnitFlagAtlas, UnitFlagIconOffset,	PortraitIndex,	IconAtlas)
SELECT	'UNIT_DJ_NGWENYAMA',	'UNITCLASS_GREAT_GENERAL',	PrereqTech, Special, Combat, CombatLimit, WorkRate, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_DJ_NGWENYAMA', 	'TXT_KEY_CIV5_DJ_NGWENYAMA_TEXT',	'TXT_KEY_UNIT_DJ_NGWENYAMA_STRATEGY',	'TXT_KEY_UNIT_DJ_NGWENYAMA_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_DJ_NGWENYAMA'),	UnitFlagAtlas, UnitFlagIconOffset,	2,				('DJ_ESWATINI_COLOR_ATLAS')
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DJ_NGWENYAMA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 				UnitAIType)
SELECT		('UNIT_DJ_NGWENYAMA'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds
			(UnitType, 				BuildType)
SELECT		('UNIT_DJ_NGWENYAMA'), 	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 				UnitClassType)
SELECT		('UNIT_DJ_NGWENYAMA'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_DJ_NGWENYAMA',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_DJ_NGWENYAMA', 	'PROMOTION_DJ_NGWENYAMA');
--==========================================================================================================================
-- Unit_UniqueNames 
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
		(UnitType,			  UniqueName)
VALUES	('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_1'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_2'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_3'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_4'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_5'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_6'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_7'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_8'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_9'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_10'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_11'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_12'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_13'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_14'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_15'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_16'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_17'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_18'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_19'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_20'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_21'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_22'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_23'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_24'),
		('UNIT_DJ_NGWENYAMA', 'TXT_KEY_GREAT_PERSON_DJ_NGWENYAMA_25');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,				FlavorType, Flavor)
SELECT		('UNIT_DJ_NGWENYAMA'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,								Response,														Bias)
VALUES  ('LEADER_DJ_GWAMILE',		'RESPONSE_AI_DOF_BACKSTAB',					'TXT_KEY_LEADER_DJ_GWAMILE_DENOUNCE_FRIEND%',					500),
        ('LEADER_DJ_GWAMILE',		'RESPONSE_ATTACKED_HOSTILE',				'TXT_KEY_LEADER_DJ_GWAMILE_ATTACKED_HOSTILE%',					500),
        ('LEADER_DJ_GWAMILE',		'RESPONSE_DEFEATED',						'TXT_KEY_LEADER_DJ_GWAMILE_DEFEATED%',							500),
        ('LEADER_DJ_GWAMILE',		'RESPONSE_DOW_GENERIC',						'TXT_KEY_LEADER_DJ_GWAMILE_DOW_GENERIC%',						500),
        ('LEADER_DJ_GWAMILE',		'RESPONSE_FIRST_GREETING',					'TXT_KEY_LEADER_DJ_GWAMILE_FIRSTGREETING%',						500),
        ('LEADER_DJ_GWAMILE',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		'TXT_KEY_LEADER_DJ_GWAMILE_RESPONSE_TO_BEING_DENOUNCED%',		500),
        ('LEADER_DJ_GWAMILE',		'RESPONSE_WORK_AGAINST_SOMEONE',			'TXT_KEY_LEADER_DJ_GWAMILE_DENOUNCE%',							500),
        ('LEADER_DJ_GWAMILE',		'RESPONSE_WORK_WITH_US',					'TXT_KEY_LEADER_DJ_GWAMILE_DEC_FRIENDSHIP%',					500);