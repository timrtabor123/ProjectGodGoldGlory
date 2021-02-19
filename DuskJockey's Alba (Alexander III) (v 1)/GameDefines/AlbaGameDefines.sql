--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 						Description, 					ShortDescription, 					Adjective, 							Civilopedia, 						CivilopediaTag, 			DefaultPlayerColor, 		ArtDefineTag, ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage,			DawnOfManQuote,							DawnOfManImage)
SELECT		('CIVILIZATION_DJ_ALBA'), 	('TXT_KEY_CIV_DJ_ALBA_DESC'), 	('TXT_KEY_CIV_DJ_ALBA_SHORT_DESC'),	('TXT_KEY_CIV_DJ_ALBA_ADJECTIVE'),	('TXT_KEY_CIV5_DJ_ALBA_TEXT_1'),	('TXT_KEY_CIV5_DJ_ALBA'),	('PLAYERCOLOR_DJ_ALBA'), 	ArtDefineTag, ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	('DJ_ALBA_COLOR_ATLAS'),	0,				('DJ_ALBA_ALPHA_ATLAS'),	SoundtrackTag,	('AlbaMap.dds'),	('TXT_KEY_CIV5_DOM_DJ_ALEX_III_TEXT'),	('AlbaDoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_CELTS');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_CELTS' )
	THEN '_CELTS'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_DJ_ALBA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			CityName)
VALUES		('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_PERTH'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_EDINBURGH'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_STIRLING'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_DUNFERMLINE'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_ARBROATH'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_ABERDEEN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_BERWICK'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_DUMFRIES'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_DUNDEE'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_MONTROSE'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_LINLITHGOW'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_ELGIN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_INVERKEITHING'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_ST_ANDREWS'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_CANONGATE'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_TAIN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_INVERNESS'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_KINGHORN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_AYR'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_DINGWALL'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_DUMBARTON'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_FORFAR'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_RUTHERGLEN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_NAIRN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_CULLEN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_BRECHIN'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_KELSO'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_STORNOWAY'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_CRAIL'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_GLASGOW'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_CITY_NAME_DJ_ALBA_LARGOWARD');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 			BuildingClassType)
SELECT		('CIVILIZATION_DJ_ALBA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_CELTS');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
SELECT		('CIVILIZATION_DJ_ALBA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_CELTS');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_DJ_ALBA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_CELTS');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_DJ_ALBA', 	'LEADER_DJ_ALEX_III');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			 UnitType)
VALUES		('CIVILIZATION_DJ_ALBA', 	'UNITCLASS_GALLEASS',	'UNIT_DJ_LYMPHAD'),
			('CIVILIZATION_DJ_ALBA', 	'UNITCLASS_SWORDSMAN',	'UNIT_DJ_GAISGEACH');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		('CIVILIZATION_DJ_ALBA'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 			StartAlongOcean)
VALUES		('CIVILIZATION_DJ_ALBA', 	1);
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_0'),	
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_1'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_2'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_3'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_4'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_5'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_6'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_7'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_8'),
			('CIVILIZATION_DJ_ALBA', 	'TXT_KEY_SPY_NAME_DJ_ALBA_9');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_DJ_ALBA_ICON', 			0.715,	0.238,	0.965,	1),
			('COLOR_PLAYER_DJ_ALBA_BACKGROUND',		0.137,	0.101,	0.305,	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 					PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_DJ_ALBA',	'COLOR_PLAYER_DJ_ALBA_ICON',	'COLOR_PLAYER_DJ_ALBA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_DJ_ALEX_III', 	'TXT_KEY_LEADER_DJ_ALEX_III', 	'TXT_KEY_LEADER_DJ_ALEX_III_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_DJ_ALEX_III', 	'AlexIII_Scene.xml',	8, 						3, 						4, 							8, 			6, 				7, 				5, 						5, 				7, 			5, 			3, 				5, 			2, 			'DJ_ALBA_COLOR_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_DJ_ALEX_III', 		'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_DJ_ALEX_III', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_DJ_ALEX_III', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_DJ_ALEX_III', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_DJ_ALEX_III', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_DJ_ALEX_III', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_DJ_ALEX_III', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_DJ_ALEX_III', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_DJ_ALEX_III', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_DJ_ALEX_III', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_DJ_ALEX_III', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_DJ_ALEX_III', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_DJ_ALEX_III', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_RECON', 					3),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_RANGED', 					4),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_MOBILE', 					6),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_NAVAL', 					8),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_NAVAL_GROWTH', 				7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_AIR', 						4),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_GROWTH', 					7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_GOLD', 						6),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_CULTURE', 					5),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_HAPPINESS', 				8),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_GREAT_PEOPLE', 				3),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_WONDER', 					5),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_RELIGION', 					6),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_NUKE', 						8),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_ARCHAEOLOGY', 				4),
			('LEADER_DJ_ALEX_III', 	'FLAVOR_AIR_CARRIER', 				3);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_DJ_ALEX_III',	'TRAIT_DJ_TREATY_OF_PERTH');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================						
INSERT INTO Traits
			(Type,							Description,								ShortDescription,								FreeBuildingOnConquest)
VALUES		('TRAIT_DJ_TREATY_OF_PERTH',	'TXT_KEY_TRAIT_DJ_TREATY_OF_PERTH_DESC',	'TXT_KEY_TRAIT_DJ_TREATY_OF_PERTH_SHORT_DESC',	'BUILDING_DJ_GA_MARKER');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================						
INSERT INTO BuildingClasses
		(Type,						DefaultBuilding,			Description)
VALUES	('BUILDINGCLASS_DJ_ALBA',	'BUILDING_DJ_GA_MARKER',	'TXT_KEY_TRAIT_DJ_TREATY_OF_PERTH_SHORT');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================						
INSERT INTO Buildings
		(Type,							BuildingClass,					Cost,	PrereqTech,	FaithCost,	GreatWorkCount,	MinAreaSize,	NeverCapture,	NukeImmune,	PortraitIndex,	IconAtlas,		Description)
VALUES	('BUILDING_DJ_GA_MARKER',		'BUILDINGCLASS_DJ_ALBA',		-1,		NULL,		-1,			-1,				-1,				1,				1,			19,				'BW_ATLAS_1',	'TXT_KEY_TRAIT_DJ_TREATY_OF_PERTH_SHORT'),
		('BUILDING_DJ_GAISGEACH_PROD',	'BUILDINGCLASS_DJ_ALBA',		-1,		NULL,		-1,			-1,				-1,				1,				1,			19,				'BW_ATLAS_1',	'TXT_KEY_UNIT_DJ_GAISGEACH');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType, 			Yield)
VALUES		('BUILDING_DJ_GAISGEACH_PROD',	'YIELD_PRODUCTION',	1);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
		(Type, 						Description, 							Help, 									Sound, 				LostWithUpgrade,	CanMoveAfterAttacking,	ExtraAttacks,	MovesChange,	CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_DJ_LYMPHAD',	'TXT_KEY_PROMOTION_DJ_LYMPHAD_DESC',	'TXT_KEY_PROMOTION_DJ_LYMPHAD_HELP',	'AS2D_IF_LEVELUP',	0,					1,						1, 				1,				1,				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DJ_LYMPHAD_DESC');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type, 				 Class, Cost, PrereqTech,	Combat, RangedCombat,	Range,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  Mechanized,	IgnoreBuildingDefense,	DefaultUnitAI, Description, 						Civilopedia, 						Help, 								Strategy,								AdvancedStartCost,	UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,			PortraitIndex, 	IconAtlas)
SELECT		('UNIT_DJ_LYMPHAD'), Class, Cost, PrereqTech,	Combat, RangedCombat,	Range,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  Mechanized,	IgnoreBuildingDefense,	DefaultUnitAI, ('TXT_KEY_UNIT_DJ_LYMPHAD_DESC'),	('TXT_KEY_CIV5_DJ_LYMPHAD_TEXT'), 	('TXT_KEY_UNIT_DJ_LYMPHAD_HELP'), 	('TXT_KEY_UNIT_DJ_LYMPHAD_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_DJ_LYMPHAD'),	0,					('DJ_LYMPHAD_FLAG'),	3,				('DJ_ALBA_COLOR_ATLAS')
FROM Units WHERE (Type = 'UNIT_GALLEASS');
	
INSERT INTO Units
			(Type,					Class, Cost, PrereqTech,	Combat, RangedCombat,	Range,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  Mechanized,	IgnoreBuildingDefense,	DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,								AdvancedStartCost,	UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,			PortraitIndex, 	IconAtlas)
SELECT		('UNIT_DJ_GAISGEACH'),	Class, Cost, PrereqTech,	Combat, RangedCombat,	Range,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  Mechanized,	IgnoreBuildingDefense,	DefaultUnitAI, ('TXT_KEY_UNIT_DJ_GAISGEACH_DESC'),	('TXT_KEY_CIV5_DJ_GAISGEACH_TEXT'), 	('TXT_KEY_UNIT_DJ_GAISGEACH_HELP'), 	('TXT_KEY_UNIT_DJ_GAISGEACH_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_DJ_GAISGEACH'),	0,					('DJ_GAISGEACH_FLAG'),	2,				('DJ_ALBA_COLOR_ATLAS')
FROM Units WHERE (Type = 'UNIT_SWORDSMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DJ_LYMPHAD'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GALLEASS');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_DJ_GAISGEACH',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 				UnitAIType)
SELECT		('UNIT_DJ_LYMPHAD'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GALLEASS');

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_DJ_GAISGEACH',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 				UnitClassType)
SELECT		('UNIT_DJ_LYMPHAD'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GALLEASS');

INSERT INTO Unit_ClassUpgrades
			(UnitType, 				UnitClassType)
SELECT		('UNIT_DJ_GAISGEACH'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SWORDSMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_DJ_LYMPHAD',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_DJ_GAISGEACH',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_DJ_GAISGEACH',	'PROMOTION_AMPHIBIOUS');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,				FlavorType, Flavor)
SELECT		('UNIT_DJ_LYMPHAD'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GALLEASS');

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	('UNIT_DJ_GAISGEACH'),		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 				ResourceType, Cost)
SELECT		('UNIT_DJ_GAISGEACH'), 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_SWORDSMAN');
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses
		(LeaderType,			ResponseType,							Response,													Bias)
VALUES  ('LEADER_DJ_ALEX_III',	'RESPONSE_AI_DOF_BACKSTAB',				'TXT_KEY_LEADER_DJ_ALEX_III_DENOUNCE_FRIEND%',				500),
        ('LEADER_DJ_ALEX_III',	'RESPONSE_ATTACKED_HOSTILE',			'TXT_KEY_LEADER_DJ_ALEX_III_ATTACKED_HOSTILE%',				500),
        ('LEADER_DJ_ALEX_III',	'RESPONSE_DEFEATED',					'TXT_KEY_LEADER_DJ_ALEX_III_DEFEATED%',						500),
        ('LEADER_DJ_ALEX_III',	'RESPONSE_DOW_GENERIC',					'TXT_KEY_LEADER_DJ_ALEX_III_DOW_GENERIC%',					500),
        ('LEADER_DJ_ALEX_III',	'RESPONSE_FIRST_GREETING',				'TXT_KEY_LEADER_DJ_ALEX_III_FIRSTGREETING%',				500),
        ('LEADER_DJ_ALEX_III',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',	'TXT_KEY_LEADER_DJ_ALEX_III_RESPONSE_TO_BEING_DENOUNCED%',	500),
        ('LEADER_DJ_ALEX_III',	'RESPONSE_WORK_AGAINST_SOMEONE',		'TXT_KEY_LEADER_DJ_ALEX_III_DENOUNCE%',						500),
        ('LEADER_DJ_ALEX_III',	'RESPONSE_WORK_WITH_US',				'TXT_KEY_LEADER_DJ_ALEX_III_DEC_FRIENDSHIP%',				500);