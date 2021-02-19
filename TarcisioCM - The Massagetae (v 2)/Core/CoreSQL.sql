--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		DefaultBuilding, 					Description)
VALUES		('BUILDINGCLASS_TCM_MASSAGETAE', 	'BUILDING_TCM_MASSAGETAE', 	'TXT_KEY_BUILDING_TCM_MASSAGETAE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 					    BuildingClass, Cost, GoldMaintenance, PrereqTech,	Description,						Help,										Civilopedia,							Strategy,										ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,					ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_TCM_GOLDSMITH'),	BuildingClass, Cost, GoldMaintenance, PrereqTech,	('TXT_KEY_BUILDING_TCM_GOLDSMITH'),	('TXT_KEY_BUILDING_TCM_GOLDSMITH_HELP'),	('TXT_KEY_CIV5_TCM_GOLDSMITH_TEXT'),	('TXT_KEY_BUILDING_TCM_GOLDSMITH_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('TCM_MASSAGETAE_ATLAS'),	66, 			2
FROM Buildings WHERE Type = 'BUILDING_STABLE';		

INSERT INTO Buildings 	
			(Type, 						 		BuildingClass, 						GreatWorkCount, Cost, FaithCost, NukeImmune, PrereqTech, Description, 									Help)
VALUES		('BUILDING_TCM_MASSAGETAE', 		'BUILDINGCLASS_TCM_MASSAGETAE', 	-1, 			-1,   -1, 		 1,		 NULL, 		 'TXT_KEY_BUILDING_TCM_MASSAGETAE', 		'TXT_KEY_BUILDING_TCM_MASSAGETAE_HELP');
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,						Flavor)
VALUES		('BUILDING_TCM_GOLDSMITH', 	'FLAVOR_MILITARY_TRAINING',		6),
			('BUILDING_TCM_GOLDSMITH', 	'FLAVOR_MOBILE',				15),
			('BUILDING_TCM_GOLDSMITH', 	'FLAVOR_PRODUCTION',			25),
			('BUILDING_TCM_GOLDSMITH', 	'FLAVOR_CULTURE',				10);
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================					
INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 				ResourceType,		YieldType,			Yield)
VALUES		('BUILDING_TCM_GOLDSMITH',	'RESOURCE_COW',		'YIELD_PRODUCTION',	1),
			('BUILDING_TCM_GOLDSMITH',	'RESOURCE_SHEEP',	'YIELD_PRODUCTION',	1),
			('BUILDING_TCM_GOLDSMITH',	'RESOURCE_CATTLE',	'YIELD_PRODUCTION',	1),
			('BUILDING_TCM_GOLDSMITH',	'RESOURCE_HORSE',	'YIELD_PRODUCTION',	1),
			('BUILDING_TCM_GOLDSMITH',	'RESOURCE_GOLD',	'YIELD_PRODUCTION',	1),
			('BUILDING_TCM_GOLDSMITH',	'RESOURCE_HORSE',	'YIELD_CULTURE',	1),
			('BUILDING_TCM_GOLDSMITH',	'RESOURCE_GOLD',	'YIELD_CULTURE',	1);
--==========================================================================================================================	
-- Building_UnitCombatProductionModifiers
--==========================================================================================================================		
INSERT INTO Building_UnitCombatProductionModifiers 
			(BuildingType, 				UnitCombatType,			Modifier)
VALUES		('BUILDING_TCM_GOLDSMITH',	'UNITCOMBAT_MOUNTED',	15);
--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor,  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,		  AlphaIconAtlas, 		      PortraitIndex,									SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'), 	('TXT_KEY_CIV_TCM_MASSAGETAE_DESC'), 	('TXT_KEY_CIV_TCM_MASSAGETAE_SHORT_DESC'), ('TXT_KEY_CIV_TCM_MASSAGETAE_ADJECTIVE'), 	('TXT_KEY_CIV5_TCM_MASSAGETAE_TEXT_1'),	('TXT_KEY_CIV5_TCM_MASSAGETAE'), 	('PLAYERCOLOR_TCM_MASSAGETAE'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_MASSAGETAE_ATLAS'),   ('TCM_MASSAGETAE_ALPHA_ATLAS'), 	0, 				('PERSIA'), 	('tcm_map_massagetae.dds'), 	('TXT_KEY_CIV5_DOM_TCM_MASSAGETAE_TEXT'), ('tcm_dawnofman_tomyris.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_01'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_02'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_03'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_04'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_05'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_06'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_07'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_08'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_09'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_10'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_11'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_12'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_13'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_14'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_15'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_16'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_17'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_18'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_19'),
			('CIVILIZATION_TCM_MASSAGETAE', 		'TXT_KEY_CITY_NAME_TCM_MASSAGETAE_20');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_TCM_MASSAGETAE', 	'LEADER_TCM_TOMYRIS');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_TCM_MASSAGETAE', 	'UNITCLASS_SWORDSMAN', 	'UNIT_TCM_BATTLEAXEMAN');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_TCM_MASSAGETAE', 	'BUILDINGCLASS_STABLE', 	'BUILDING_TCM_GOLDSMITH');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'), 	ReligionType			
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MOLGOL';
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_0'),	
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_1'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_2'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_3'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_4'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_5'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_6'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_7'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_8'),
			('CIVILIZATION_TCM_MASSAGETAE', 	'TXT_KEY_SPY_NAME_TCM_MASSAGETAE_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_TCM_MASSAGETAE', 	'REGION_PLAINS');	
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_MASSAGETAE_ICON',			0.416,		0.518,	0.141,		1),
			('COLOR_PLAYER_TCM_MASSAGETAE_BACKGROUND',		1,	0.588,	0,	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES		('PLAYERCOLOR_TCM_MASSAGETAE',			'COLOR_PLAYER_TCM_MASSAGETAE_ICON', 		'COLOR_PLAYER_TCM_MASSAGETAE_BACKGROUND', 			'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_TCM_TOMYRIS', 		'TXT_KEY_LEADER_TCM_TOMYRIS', 		'TXT_KEY_LEADER_TCM_TOMYRIS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_TCM_TOMYRIS', 'tcmTomyrisScene.xml',	3, 						4, 						6, 							7, 			4, 				7, 				5, 						5, 				8, 			4, 			5, 				6, 			3, 			'TCM_MASSAGETAE_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_TOMYRIS', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_TCM_TOMYRIS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_TCM_TOMYRIS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_TCM_TOMYRIS', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_TCM_TOMYRIS', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_TCM_TOMYRIS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_TCM_TOMYRIS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_TOMYRIS', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_TCM_TOMYRIS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_TCM_TOMYRIS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_TCM_TOMYRIS', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_TCM_TOMYRIS', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_TCM_TOMYRIS', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_RECON', 					5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_RANGED', 					6),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_MOBILE', 					8),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_NAVAL', 					3),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_AIR', 						5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_GROWTH', 					7),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_GOLD', 						6),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_CULTURE', 					7),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_WONDER', 					5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_RELIGION', 					3),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_NUKE', 						7),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_TOMYRIS', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_TCM_TOMYRIS', 	'TRAIT_TCM_TOMYRIS_MASSAGETAE');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 								Description, 								ShortDescription)
VALUES		('TRAIT_TCM_TOMYRIS_MASSAGETAE', 	'TXT_KEY_TRAIT_TCM_TOMYRIS_MASSAGETAE', 	'TXT_KEY_TRAIT_TCM_TOMYRIS_MASSAGETAE_SHORT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 					LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_TOMYRIS_PEACE', 	'tcmMassagetaePeace', 		'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_TOMYRIS_WAR',	'tcmMassagetaeWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_TOMYRIS_PEACE', 		'SND_LEADER_MUSIC_TCM_TOMYRIS_PEACE', 		'GAME_MUSIC', 	70, 		70, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_TOMYRIS_WAR', 			'SND_LEADER_MUSIC_TCM_TOMYRIS_WAR', 		'GAME_MUSIC', 	70, 		70, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen, RangedDefenseMod, AttackMod, DefenseMod, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_TCM_MASSAGETAE',	'TXT_KEY_PROMOTION_TCM_MASSAGETAE',		'TXT_KEY_PROMOTION_TCM_MASSAGETAE_HELP', 	'AS2D_IF_LEVELUP', 	1, 				25,				25,			 25,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_MASSAGETAE');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech,				   Combat,	Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					   Civilopedia, 													Strategy, 										Help, 										MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						   UnitFlagIconOffset,	UnitFlagAtlas,							PortraitIndex, 		IconAtlas)
SELECT		Class,		('UNIT_TCM_BATTLEAXEMAN'), 	('TECH_HORSEBACK_RIDING'), 12,		Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, 2,		CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_BATTLEAXEMAN'), ('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TCM_BATTLEAXEMAN_TEXT'), 	('TXT_KEY_UNIT_TCM_BATTLEAXEMAN_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_BATTLEAXEMAN'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_TCM_BATTLEAXEMAN'),	0,					('TCM_UNIT_FLAG_BATTLEAXEMAN_ATLAS'),	3, 					('TCM_MASSAGETAE_ATLAS')
FROM Units WHERE (Type = 'UNIT_SWORDSMAN');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_BATTLEAXEMAN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_BATTLEAXEMAN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
VALUES		('UNIT_TCM_BATTLEAXEMAN', 	'UNITCLASS_LONGSWORDSMAN');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,			  Flavor)
VALUES		('UNIT_TCM_BATTLEAXEMAN', 	'FLAVOR_OFFENSE',	  7),
			('UNIT_TCM_BATTLEAXEMAN', 	'FLAVOR_DEFENSE',	  8);
--==========================================================================================================================	
--==========================================================================================================================	
