--==========================================
-- Karen under Saw Ba U Gyi
-- EmeraldRange
-- Full credits on Steam
--==========================================
-- Mod Supports
-- None yet
--==========================================

--==========================================================================================================================	
-- CIVILIZATION COLOUR
--==========================================================================================================================	
INSERT INTO Colors (Type,						Red,  	 Green,   Blue,  Alpha)
VALUES ('COLOR_PLAYER_ER_KAREN_BACKGROUND',		0.54902, 0.70196, 0.80784, 1.0), --Background is the main colour
	   ('COLOR_PLAYER_ER_KAREN_ICON',			0.47843, 0.01569, 0.08627, 1.0); --Icon is the colour of the borders and the image in the middle of your icon.

INSERT INTO PlayerColors (Type,		PrimaryColor,					SecondaryColor,							TextColor)
VALUES ('PLAYERCOLOR_ER_KAREN', 	'COLOR_PLAYER_ER_KAREN_ICON',	'COLOR_PLAYER_ER_KAREN_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- CIVILIZATION BASE DEFINES
--==========================================================================================================================	
INSERT INTO Civilizations																																																			
		(Type, 						Description, 					ShortDescription, 					Adjective, 						  Civilopedia,				CivilopediaTag, 					DefaultPlayerColor, 		ArtDefineTag, 	ArtStyleType, 	ArtStyleSuffix, ArtStylePrefix, PortraitIndex, 	IconAtlas, 	AlphaIconAtlas, 		MapImage, 				DawnOfManQuote, 					DawnOfManImage,		DawnOfManAudio,				SoundtrackTag)					 
SELECT 	'CIVILIZATION_ER_KAREN', 	'TXT_KEY_CIV_ER_KAREN_DESC', 	'TXT_KEY_CIV_ER_KAREN_SHORT_DESC', 'TXT_KEY_CIV_ER_KAREN_ADJECTIVE',  'TXT_KEY_ER_KAREN_PEDIA',	'TXT_KEY_CIVILOPEDIA_ER_KAREN', 	'PLAYERCOLOR_ER_KAREN', 	ArtDefineTag, 	ArtStyleType, 	ArtStyleSuffix, ArtStylePrefix,	0,		 'ER_KAREN_ATLAS',  'ER_ALPHA_KAREN_ATLAS',	'KarenCartography.dds', 'TXT_KEY_CIV_DAWN_ER_KAREN_TEXT', 	'KarenDoM.dds',		'AS2D_DOM_SPEECH_ER_KAREN',	SoundtrackTag					 
FROM Civilizations WHERE Type = 'CIVILIZATION_SIAM';

-- Free Techs, Units and Buildings
INSERT INTO Civilization_FreeTechs(CivilizationType, TechType)
SELECT						'CIVILIZATION_ER_KAREN',TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SIAM';
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ER_KAREN',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SIAM';
INSERT INTO Civilization_FreeBuildingClasses(CivilizationType, BuildingClassType)
SELECT								 'CIVILIZATION_ER_KAREN', BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SIAM';

-- Civ Biases 
INSERT INTO Civilization_Start_Region_Priority  (CivilizationType, 		 	RegionType)
VALUES											('CIVILIZATION_ER_KAREN',  'REGION_JUNGLE');
INSERT INTO Civilization_Religions(CivilizationType, ReligionType)
VALUES				   	   ('CIVILIZATION_ER_KAREN', 'RELIGION_PROTESTANTISM'); 
--==========================================================================================================================	
-- LEADER
--==========================================================================================================================
--Undefined arts.
INSERT INTO Leaders(Type, 						Description, 					Civilopedia, 								CivilopediaTag, 					ArtDefineTag, 	PortraitIndex,  IconAtlas, 	VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, Boldness,  Diplobalance,	WarmongerHate,  DenounceWillingness, 	DoFWillingness, Loyalty, Neediness, Forgiveness, Chattiness, Meanness,  WorkAgainstWillingness, WorkWithWillingness)
VALUES			   ('LEADER_ER_SAW_BA_U_GYI',	'TKT_KEY_ER_SAW_BA_U_GYI_DESC', 'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_PEDIA',		'TXT_KEY_LEADER_ER_SAW_BA_U_GYI',	'Karen_scene.xml',	1,	 'ER_KAREN_ATLAS',			3, 				3, 						4, 						 8, 		2, 			 	8, 				8, 						4, 				2, 		 7, 		2, 			 4,			 5, 	   	8,						5);

INSERT INTO Civilization_Leaders
VALUES ('CIVILIZATION_ER_KAREN', 'LEADER_ER_SAW_BA_U_GYI');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType, 				MajorCivApproachType, 			Bias)
VALUES	('LEADER_ER_SAW_BA_U_GYI', 'MAJOR_CIV_APPROACH_WAR', 		5),
		('LEADER_ER_SAW_BA_U_GYI', 'MAJOR_CIV_APPROACH_HOSTILE',	6),
		('LEADER_ER_SAW_BA_U_GYI', 'MAJOR_CIV_APPROACH_DECEPTIVE',  3),
		('LEADER_ER_SAW_BA_U_GYI', 'MAJOR_CIV_APPROACH_GUARDED', 	7),
		('LEADER_ER_SAW_BA_U_GYI', 'MAJOR_CIV_APPROACH_AFRAID', 	2),
		('LEADER_ER_SAW_BA_U_GYI', 'MAJOR_CIV_APPROACH_FRIENDLY', 	6),
		('LEADER_ER_SAW_BA_U_GYI', 'MAJOR_CIV_APPROACH_NEUTRAL', 	3);
		
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType, 				MinorCivApproachType, 			Bias)
VALUES 	('LEADER_ER_SAW_BA_U_GYI', 	'MINOR_CIV_APPROACH_IGNORE', 	4),
		('LEADER_ER_SAW_BA_U_GYI', 	'MINOR_CIV_APPROACH_FRIENDLY',  6),
		('LEADER_ER_SAW_BA_U_GYI', 	'MINOR_CIV_APPROACH_PROTECTIVE',3),
		('LEADER_ER_SAW_BA_U_GYI', 	'MINOR_CIV_APPROACH_CONQUEST',  3);
		
INSERT INTO Leader_Flavors
		(LeaderType, 				FlavorType, 					Flavor)
VALUES  ('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_OFFENSE',				7),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_DEFENSE', 				8),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_CITY_DEFENSE', 	 		5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_MILITARY_TRAINING',		6),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_RECON', 				6),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_RANGED',				5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_MOBILE',				4),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_NAVAL',					3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_NAVAL_RECON',			2),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_NAVAL_GROWTH',			3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_AIR', 					8),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_EXPANSION', 			7),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_GROWTH', 				5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_TILE_IMPROVEMENT',		2),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_INFRASTRUCTURE',		4),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_PRODUCTION',			8),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_GOLD',					5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_SCIENCE',				5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_CULTURE',				6),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_HAPPINESS',				5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_GREAT_PEOPLE',			4),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_WONDER',				3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_RELIGION',				3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_DIPLOMACY',				6),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_SPACESHIP',				3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_WATER_CONNECTION', 		2),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_NUKE',					7),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_USE_NUKE',				6),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_ESPIONAGE',				7),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_ANTIAIR',				12),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_AIR_CARRIER',			5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_ARCHAEOLOGY',			2),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_I_LAND_TRADE_ROUTE', 	8),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_I_SEA_TRADE_ROUTE',		4),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_I_TRADE_ORIGIN', 		7),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_I_TRADE_DESTINATION',	5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_AIRLIFT',				7);
		
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,							Response,										 Bias)
VALUES	('LEADER_ER_SAW_BA_U_GYI',	'RESPONSE_FIRST_GREETING',				'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_FIRSTGREETING%',	1),
		('LEADER_ER_SAW_BA_U_GYI',	'RESPONSE_DEFEATED',					'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_DEFEATED%',			1),
		('LEADER_ER_SAW_BA_U_GYI',	'RESPONSE_DOW_LEADER_ER_SAW_BA_U_GYI',	'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_DECLAREWAR%',		1),
		('LEADER_ER_SAW_BA_U_GYI',	'RESPONSE_ATTACKED_BETRAYED',			'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_ATTACKED%',			1),
		('LEADER_ER_SAW_BA_U_GYI',	'RESPONSE_ATTACKED_STRONG_HOSTILE',		'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_ATTACKED%',			1),
		('LEADER_ER_SAW_BA_U_GYI',	'RESPONSE_ATTACKED_WEAK_HOSTILE',		'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_ATTACKED%',			1),
		('LEADER_ER_SAW_BA_U_GYI',	'RESPONSE_ATTACKED_HOSTILE',			'TXT_KEY_LEADER_ER_SAW_BA_U_GYI_ATTACKED%',			1);

--==========================================================================================================================	
-- Unique Ability: Land with Blemish (Kawthoolei)
--==========================================================================================================================
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_ER_KAWTHOOLEI',	'TXT_KEY_TRAIT_ER_KAWTHOOLEI', 	'TXT_KEY_TRAIT_ER_KAWTHOOLEI_SHORT');	

INSERT INTO Leader_Traits(LeaderType, 	TraitType)
VALUES		('LEADER_ER_SAW_BA_U_GYI',	'TRAIT_ER_KAWTHOOLEI');


INSERT INTO UnitPromotions 
		(Type, 						Description,						Help, AdjacentTileHealChange, OrderPriority, Sound, PortraitIndex,	LostWithUpgrade,  IconAtlas,	IgnoreZOC,	PediaType,	PediaEntry)
SELECT	'PROMOTION_ER_KAREN_MEDIC',	'TXT_KEY_PROMOTION_ER_KAREN_MEDIC',	Help, AdjacentTileHealChange, OrderPriority, Sound, PortraitIndex,	LostWithUpgrade,  IconAtlas,	IgnoreZOC,	PediaType,	'TXT_KEY_PROMOTION_ER_KAREN_MEDIC_HELP'
FROM UnitPromotions WHERE (Type = 'PROMOTION_MEDIC');

--==========================================================================================================================	
-- Unique Building: Buphaw
--==========================================================================================================================	--UNDEFINED ARTS
INSERT INTO Buildings (Type, 		BuildingClass, 	Cost, 	PrereqTech, 	Help, 								Description,					 	Civilopedia, 					  Strategy, 								ArtDefineTag, 	MinAreaSize, 	HurryCostModifier, NeverCapture, GoldMaintenance,	FreeStartEra,	IconAtlas,		PortraitIndex,	DisplayPosition, 	ConquestProb,	AllowsRangeStrike)
SELECT     'BUILDING_ER_BUPHAW',  	BuildingClass, 	Cost, 	PrereqTech, 	'TXT_KEY_BUILDING_ER_BUPHAW_HELP', 	'TXT_KEY_BUILDING_ER_BUPHAW_DESC', 	'TXT_KEY_BUILDING_ER_BUPHAW_TEXT', 'TXT_KEY_BUILDING_ER_BUPHAW_STRATEGY', 	ArtDefineTag,	MinAreaSize,	HurryCostModifier,		 0,		 GoldMaintenance,	FreeStartEra,	'ER_KAREN_ATLAS',		3,		0,					100,			AllowsRangeStrike
FROM Buildings WHERE (Type = 'BUILDING_WATERMILL');

INSERT INTO Building_Flavors
		(BuildingType, 			FlavorType, 		 Flavor)
VALUES	('BUILDING_ER_BUPHAW',	'FLAVOR_GROWTH',		 25),
		('BUILDING_ER_BUPHAW',	'FLAVOR_SCIENCE',		  5),
		('BUILDING_ER_BUPHAW',	'FLAVOR_PRODUCTION',	 20),
		('BUILDING_ER_BUPHAW',	'FLAVOR_CULTURE',		 10),
		('BUILDING_ER_BUPHAW',	'FLAVOR_RELIGION',		 10);
		
INSERT INTO Building_YieldChanges
		(BuildingType,			YieldType,		Yield)
SELECT  'BUILDING_ER_BUPHAW',	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_WATERMILL');

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,		   BuildingClassType, 	  	  BuildingType)
VALUES 	('CIVILIZATION_ER_KAREN', 'BUILDINGCLASS_WATERMILL', 'BUILDING_ER_BUPHAW');

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType, YieldType,	Yield)
SELECT	'BUILDING_ER_BUPHAW',	ResourceType, 'YIELD_CULTURE',	1
FROM Resource_YieldChanges WHERE (YieldType = 'YIELD_FOOD' AND Yield > 0);
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType, YieldType,	Yield)
SELECT	'BUILDING_ER_BUPHAW',	ResourceType, 'YIELD_FAITH',	1
FROM Resource_YieldChanges WHERE (YieldType = 'YIELD_FOOD' AND Yield > 0);
--==========================================================================================================================	
-- Unique Unit: Thukay
--==========================================================================================================================	
INSERT INTO Units 
			(Type, 				Combat,		RangedCombat, Class, Cost, FaithCost, RequiresFaithPurchaseEnabled, NoMaintenance, CombatClass, Moves, CivilianAttackPriority, Range, Special, PrereqTech,	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Domain, DefaultUnitAI, WorkRate, CombatLimit, DontShowYields, WorkRate, MoveRate, Description, 				Civilopedia, 					Strategy,							Help,							AdvancedStartCost,	UnitArtInfo,		UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex,    IconAtlas)
SELECT		'UNIT_ER_THUKAY',	Combat-5,	RangedCombat, Class, Cost, FaithCost, RequiresFaithPurchaseEnabled, NoMaintenance, CombatClass, Moves, CivilianAttackPriority, Range, Special, PrereqTech,  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Domain, DefaultUnitAI, WorkRate, CombatLimit, DontShowYields, WorkRate, MoveRate, 'TXT_KEY_UNIT_ER_THUKAY', 'TXT_KEY_CIV5_UNIT_ER_THUKAY',   'TXT_KEY_UNIT_ER_THUKAY_STRATEGY', 'TXT_KEY_UNIT_ER_THUKAY_HELP',	AdvancedStartCost,	'ART_DEF_UNIT_ER_THUKAY',	 0,			'ER_THUKAY_FLAG',	2, 		'ER_KAREN_ATLAS'
FROM Units WHERE (Type = 'UNIT_ANTI_AIRCRAFT_GUN');

INSERT INTO UnitGameplay2DScripts
		(UnitType, 			SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_ER_THUKAY',	SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');
INSERT INTO Unit_Builds
		(UnitType,				BuildType)
SELECT 	'UNIT_ER_THUKAY',		BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');
INSERT INTO Unit_AITypes
		(UnitType,				UnitAIType)
SELECT	'UNIT_ER_THUKAY', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ANTI_AIRCRAFT_GUN';

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,			Flavor)
VALUES	('UNIT_ER_THUKAY',	'FLAVOR_ANTIAIR',	25),
		('UNIT_ER_THUKAY',	'FLAVOR_DEFENSE',	15),
		('UNIT_ER_THUKAY',	'FLAVOR_OFFENSE',	15);

INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help,										Sound,		 PortraitIndex,	LostWithUpgrade,  IconAtlas,	IgnoreZOC,	PediaType,			PediaEntry)
VALUES	('PROMOTION_ER_KAREN_BRIGADE',	'TXT_KEY_PROMOTION_ER_KAREN_BRIGADE',	'TXT_KEY_PROMOTION_ER_KAREN_BRIGADE_HELP',	'AS2D_IF_LEVELUP',		59,		0,		'ABILITY_ATLAS',	1,			'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_ER_KAREN_BRIGADE_HELP');
INSERT INTO Unit_FreePromotions
		   (UnitType,			PromotionType)
SELECT		'UNIT_ER_THUKAY',	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');
INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
VALUES	('UNIT_ER_THUKAY',	'PROMOTION_ER_KAREN_BRIGADE'),
		('UNIT_ER_THUKAY',	'PROMOTION_FREE_PILLAGE_MOVES');

INSERT INTO Unit_ClassUpgrades
			  (UnitType, UnitClassType)
SELECT 'UNIT_ER_THUKAY', UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');


INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 		   UnitClassType,					UnitType)
VALUES	('CIVILIZATION_ER_KAREN',  'UNITCLASS_ANTI_AIRCRAFT_GUN',	'UNIT_ER_THUKAY');
--==========================================================================================================================
--Spy Names
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_0'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_1'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_2'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_3'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_4'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_5'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_6'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_7'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_8'),
		('CIVILIZATION_ER_KAREN',	'TXT_KEY_SPY_NAME_ER_KAREN_9');
		
--City Names
INSERT INTO Civilization_CityNames (CivilizationType, CityName) 
VALUES						('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_1'),
							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_2'),
							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_3'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_4'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_5'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_6'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_7'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_8'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_9'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_10'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_11'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_12'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_13'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_14'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_15'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_16'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_17'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_18'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_19'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_20'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_21'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_22'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_23'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_24'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_25'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_26'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_27'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_28'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_29'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_30'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_31'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_32'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_33'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_34'),
 							('CIVILIZATION_ER_KAREN', 'TXT_KEY_CITY_NAME_CIVILIZATION_ER_KAREN_35');