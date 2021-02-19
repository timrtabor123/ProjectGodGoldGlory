--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_TCM_ILKHANATE', 	'BUILDING_TCM_ILKHANATE_CITYCAPTURED', 	'TXT_KEY_BUILDING_TCM_ILKHANATE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 					    BuildingClass, Cost, GoldMaintenance, PrereqTech,	Description,						Help,									Civilopedia,						Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	NoOccupiedUnhappiness, IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_TCM_RUZNAMCE'),	BuildingClass, 80,	 2,				  PrereqTech,	('TXT_KEY_BUILDING_TCM_RUZNAMCE'),	('TXT_KEY_BUILDING_TCM_RUZNAMCE_HELP'),	('TXT_KEY_CIV5_TCM_RUZNAMCE_TEXT'),	('TXT_KEY_BUILDING_TCM_RUZNAMCE_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	NoOccupiedUnhappiness, ('TCM_ILKHANATE_ATLAS'),	0, 				2
FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE';		

INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 					GreatWorkCount, Cost, FaithCost, NukeImmune, ConquestProb, PrereqTech, Description, 						Help)
VALUES		('BUILDING_TCM_ILKHANATE_PROD', 			'BUILDINGCLASS_TCM_ILKHANATE', 	-1, 			-1,   -1, 		 1,			100,			NULL, 		 'TXT_KEY_BUILDING_TCM_ILKHANATE', 	'TXT_KEY_BUILDING_TCM_ILKHANATE_HELP'),
			('BUILDING_TCM_ILKHANATE_FOOD', 			'BUILDINGCLASS_TCM_ILKHANATE',	-1, 			-1,   -1, 		 1,			100,			NULL, 		 'TXT_KEY_BUILDING_TCM_ILKHANATE', 	'TXT_KEY_BUILDING_TCM_ILKHANATE_HELP'),
			('BUILDING_TCM_ILKHANATE_GOLD', 			'BUILDINGCLASS_TCM_ILKHANATE', 	-1, 			-1,   -1, 		 1,			100,			NULL, 		 'TXT_KEY_BUILDING_TCM_ILKHANATE', 	'TXT_KEY_BUILDING_TCM_ILKHANATE_HELP'),
			('BUILDING_TCM_ILKHANATE_CITYCAPTURED', 	'BUILDINGCLASS_TCM_ILKHANATE', 	-1, 			-1,   -1, 		 1,			0,				NULL, 		 'TXT_KEY_BUILDING_TCM_ILKHANATE', 	'TXT_KEY_BUILDING_TCM_ILKHANATE_HELP');
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,						Flavor)
VALUES		('BUILDING_TCM_RUZNAMCE', 	'FLAVOR_HAPPINESS',				180),
			('BUILDING_TCM_RUZNAMCE', 	'FLAVOR_GROWTH',				40),
			('BUILDING_TCM_RUZNAMCE', 	'FLAVOR_PRODUCTION',			40),
			('BUILDING_TCM_RUZNAMCE', 	'FLAVOR_GOLD',					40),
			('BUILDING_TCM_RUZNAMCE', 	'FLAVOR_CULTURE',				40);
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_TCM_ILKHANATE_PROD',	'YIELD_PRODUCTION',	1),
			('BUILDING_TCM_ILKHANATE_FOOD',	'YIELD_FOOD',		1),
			('BUILDING_TCM_ILKHANATE_GOLD',	'YIELD_GOLD',		1);
--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 						  Adjective, 								Civilopedia, 							CivilopediaTag, 					DefaultPlayerColor,			   ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				 AlphaIconAtlas, 				 PortraitIndex,		SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_TCM_ILKHANATE'), 	('TXT_KEY_CIV_TCM_ILKHANATE_DESC'), 	('TXT_KEY_CIV_TCM_ILKHANATE_SHORT_DESC'), ('TXT_KEY_CIV_TCM_ILKHANATE_ADJECTIVE'), 	('TXT_KEY_CIV5_TCM_ILKHANATE_TEXT_1'),	('TXT_KEY_CIV5_TCM_ILKHANATE'), 	('PLAYERCOLOR_TCM_ILKHANATE'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_ILKHANATE_ATLAS'),  ('TCM_ILKHANATE_ALPHA_ATLAS'),  0, 				('MONGOL'), 	('tcmIlkhanateMap.dds'), 	('TXT_KEY_CIV5_DOM_TCM_ILKHANATE_TEXT'), ('tcmIlkhanateDOM.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_01'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_02'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_03'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_04'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_05'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_06'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_07'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_08'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_09'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_10'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_11'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_12'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_13'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_14'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_15'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_16'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_17'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_18'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_19'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_20'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_21'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_22'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_23'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_24'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_25'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_26'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_27'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_28'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_29'),
			('CIVILIZATION_TCM_ILKHANATE', 		'TXT_KEY_CITY_NAME_TCM_ILKHANATE_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
VALUES		('CIVILIZATION_TCM_ILKHANATE', 		'BUILDINGCLASS_PALACE'),
			('CIVILIZATION_TCM_ILKHANATE', 		'BUILDINGCLASS_TCM_ILKHANATE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_TCM_ILKHANATE'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_ILKHANATE'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_TCM_ILKHANATE', 	'LEADER_TCM_GHAZAN');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 		UnitType)
VALUES		('CIVILIZATION_TCM_ILKHANATE', 	'UNITCLASS_KNIGHT', 	'UNIT_TCM_ILDUCHI');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_TCM_ILKHANATE', 	'BUILDINGCLASS_COURTHOUSE', 	'BUILDING_TCM_RUZNAMCE');
--===============================================================================i===========================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		('CIVILIZATION_TCM_ILKHANATE'), 	ReligionType			
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SIAM';
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_0'),	
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_1'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_2'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_3'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_4'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_5'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_6'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_7'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_8'),
			('CIVILIZATION_TCM_ILKHANATE', 	'TXT_KEY_SPY_NAME_TCM_ILKHANATE_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_TCM_ILKHANATE', 	'REGION_PLAINS');	
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_ILKHANATE_ICON',				0.561,	0.196,	0,		1),
			('COLOR_PLAYER_TCM_ILKHANATE_BACKGROUND',		0.729,	0.682,	0.286,	1); 
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 									PrimaryColor, 							SecondaryColor, 									TextColor)
VALUES		('PLAYERCOLOR_TCM_ILKHANATE',			'COLOR_PLAYER_TCM_ILKHANATE_ICON', 		'COLOR_PLAYER_TCM_ILKHANATE_BACKGROUND', 			'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 								CivilopediaTag, 					ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_TCM_GHAZAN', 		'TXT_KEY_LEADER_TCM_GHAZAN', 		'TXT_KEY_LEADER_TCM_GHAZAN_PEDIA_TEXT', 	'TXT_KEY_LEADER_TCM_GHAZAN_PEDIA', 'tcmGhazanScene.xml',	7, 						6, 						7, 							7, 			5, 				4, 				4, 						6, 				6, 			5, 			1, 				6, 			7, 			'TCM_ILKHANATE_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_GHAZAN', 	'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_TCM_GHAZAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_TCM_GHAZAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_TCM_GHAZAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		1),
			('LEADER_TCM_GHAZAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
			('LEADER_TCM_GHAZAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_TCM_GHAZAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_GHAZAN', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_TCM_GHAZAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_TCM_GHAZAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_TCM_GHAZAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
			('LEADER_TCM_GHAZAN', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_TCM_GHAZAN', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_RECON', 					5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_RANGED', 					7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_MOBILE', 					7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_NAVAL', 					3),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_AIR', 						5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_GROWTH', 					7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_GOLD', 						7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_CULTURE', 					7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_WONDER', 					6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_RELIGION', 					5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_DIPLOMACY', 				7),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_SPACESHIP', 				6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_NUKE', 						6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_USE_NUKE', 					5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_GHAZAN', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_TCM_GHAZAN', 	'TRAIT_TCM_GHAZAN_ILKHANATE');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 							Description, 							ShortDescription)
VALUES		('TRAIT_TCM_GHAZAN_ILKHANATE', 	'TXT_KEY_TRAIT_TCM_GHAZAN_ILKHANATE', 	'TXT_KEY_TRAIT_TCM_GHAZAN_ILKHANATE_SHORT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 				LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_GHAZAN_PEACE', 	'tcmIlkhanatePeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_GHAZAN_WAR',		'tcmIlkhanateWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_GHAZAN_PEACE', 			'SND_LEADER_MUSIC_TCM_GHAZAN_PEACE', 	'GAME_MUSIC', 	70, 		70, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_GHAZAN_WAR', 			'SND_LEADER_MUSIC_TCM_GHAZAN_WAR', 		'GAME_MUSIC', 	80, 		80, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 					PrereqTech,		  Combat,	Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 				  Civilopedia, 												Strategy, 								Help, 								MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 							UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 		IconAtlas,				MoveRate)
SELECT		Class,		('UNIT_TCM_ILDUCHI'), 	('TECH_CHIVALRY'), 20,		Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, 4,		CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_ILDUCHI'), ('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TCM_ILDUCHI_TEXT'), 	('TXT_KEY_UNIT_TCM_ILDUCHI_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_ILDUCHI'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_ILKHANID_ILDUCHI'),	0,					('TCM_UNIT_FLAG_ILDUCHI_ATLAS'),	3, 					('TCM_ILKHANATE_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_KNIGHT');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_ILDUCHI'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_TCM_ILDUCHI'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
VALUES		('UNIT_TCM_ILDUCHI', 	'UNITCLASS_CAVALRY');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,			  Flavor)
VALUES		('UNIT_TCM_ILDUCHI', 	'FLAVOR_OFFENSE',	  13),
			('UNIT_TCM_ILDUCHI', 	'FLAVOR_DEFENSE',	  4),
			('UNIT_TCM_ILDUCHI', 	'FLAVOR_MOBILE',	  8);
--==========================================================================================================================	
-- Unit_FreePromotions
--==========================================================================================================================		
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
VALUES		('UNIT_TCM_ILDUCHI', 	'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_TCM_ILDUCHI', 	'PROMOTION_CAN_MOVE_AFTER_ATTACKING');
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
VALUES		('UNIT_TCM_ILDUCHI', 	'RESOURCE_HORSE');
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_GHAZAN','RESPONSE_FIRST_GREETING','TXT_KEY_LEADER_TCM_GHAZAN_FIRSTGREETING%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_GHAZAN','RESPONSE_DEFEATED',		 'TXT_KEY_LEADER_TCM_GHAZAN_DEFEATED%','1');
--==========================================================================================================================	
--==========================================================================================================================	
