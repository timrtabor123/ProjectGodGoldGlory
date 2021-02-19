-------------------------------------------
--Building (Copra Smallholding)
-------------------------------------------
INSERT INTO Buildings
		(Type,								Description,								Civilopedia,											Strategy,											Help,											NeverCapture,	GoldMaintenance,	MutuallyExclusiveGroup,	FreshWater,	Cost,	HurryCostModifier,	MinAreaSize,	BuildingClass,	ArtDefineTag,	ArtInfoEraVariation,	PrereqTech,		PortraitIndex,	WonderSplashAnchor,	IconAtlas)
SELECT	'BUILDING_JWW_COPRA_SMALLHOLDING',	'TXT_KEY_BUILDING_JWW_COPRA_SMALLHOLDING',	'TXT_KEY_CIV5_BUILDINGS_JWW_COPRA_SMALLHOLDING_TEXT',	'TXT_KEY_BUILDING_JWW_COPRA_SMALLHOLDING_STRATEGY',	'TXT_KEY_BUILDING_JWW_COPRA_SMALLHOLDING_HELP',	1,				GoldMaintenance,	MutuallyExclusiveGroup,	0,			Cost,	HurryCostModifier,	MinAreaSize,	BuildingClass,	ArtDefineTag,	ArtInfoEraVariation,	PrereqTech,		4,				WonderSplashAnchor,	'JWW_ABEMAMA_COLOR_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GARDEN';

INSERT INTO	Building_Flavors
		(BuildingType,						FlavorType,		Flavor)
SELECT	'BUILDING_JWW_COPRA_SMALLHOLDING',	FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GARDEN';

INSERT INTO Building_ResourceQuantity
		(BuildingType,							ResourceType,			Quantity)
VALUES	('BUILDING_JWW_COPRA_SMALLHOLDING',		'RESOURCE_JWW_COPRAS',	1),
		('BUILDING_JWW_ABEMAMA_COPRA_DUMMY',	'RESOURCE_JWW_COPRAS',	1);

INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_JWW_ABEMAMA_COPRA_DUMMY', 	'BUILDING_JWW_ABEMAMA_COPRA_DUMMY', 	'TXT_KEY_JWW_ABEMAMA_COPRA_DUMMY');

INSERT INTO Buildings      
        (TYPE,									BuildingClass,								Cost,  FaithCost, GreatWorkCount,  NeverCapture,  Description)
VALUES  ('BUILDING_JWW_ABEMAMA_COPRA_DUMMY',	'BUILDINGCLASS_JWW_ABEMAMA_COPRA_DUMMY',	-1,    -1,        -1,               1,             'TXT_KEY_JWW_ABEMAMA_COPRA_DUMMY');

-------------------------------------------
--Resource (Copras)
-------------------------------------------
INSERT INTO Resources
		(Type,					Description,					Civilopedia,								Help,								ResourceClassType,		CivilizationType,			ArtDefineTag,			Happiness,	ResourceUsage,	IconString,					PortraitIndex,	IconAtlas)
VALUES	('RESOURCE_JWW_COPRAS',	'TXT_KEY_RESOURCE_JWW_COPRAS',	'TXT_KEY_CIV5_RESOURCE_JWW_COPRAS_TEXT',	'TXT_KEY_RESOURCE_JWW_COPRAS_HELP',	'RESOURCECLASS_LUXURY',	'CIVILIZATION_JWW_ABEMAMA',	'ART_DEF_RESOURCE_FUR',	4,			2,				'[ICON_RES_JWW_COPRAS]',	5,				'JWW_ABEMAMA_COLOR_ATLAS');

INSERT INTO Resource_YieldChanges
		(ResourceType,			YieldType,		Yield)
VALUES	('RESOURCE_JWW_COPRAS',	'YIELD_FOOD',	2),
		('RESOURCE_JWW_COPRAS',	'YIELD_GOLD',	1);

INSERT INTO Resource_Flavors
		(ResourceType,			FlavorType,			Flavor)
VALUES	('RESOURCE_JWW_COPRAS',	'FLAVOR_GROWTH',	25),
		('RESOURCE_JWW_COPRAS',	'FLAVOR_GOLD',		15);

-------------------------------------------
--Unit (Shark-Tooth Swordsman)
-------------------------------------------
INSERT OR REPLACE INTO Units
		(Type,								Description,								Civilopedia,										Strategy,											Help,											Combat,		Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,		CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	Pillage,	PrereqTech,		ObsoleteTech,				GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	UnitArtInfo,								ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,					UnitFlagAtlas)
SELECT	'UNIT_JWW_SHARK_TOOTH_SWORDSMAN',	'TXT_KEY_UNIT_JWW_SHARK_TOOTH_SWORDSMAN',	'TXT_KEY_CIV5_UNIT_JWW_SHARK_TOOTH_SWORDSMAN_TEXT',	'TXT_KEY_UNIT_JWW_SHARK_TOOTH_SWORDSMAN_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_SHARK_TOOTH_SWORDSMAN',	Combat,		Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,		CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	Pillage,	PrereqTech,		'TECH_REPLACEABLE_PARTS',	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	'ART_DEF_UNIT_JWW_SHARK_TOOTH_SWORDSMAN',	ShowInPedia,	MoveRate,	0,					2,				'JWW_ABEMAMA_COLOR_ATLAS',	'JWW_ABEMAMA_UNIT_ALPHA_ATLAS'
FROM Units WHERE Type = 'UNIT_SWORDSMAN';

INSERT INTO UnitGameplay2DScripts
		(UnitType,							SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_SHARK_TOOTH_SWORDSMAN',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_AITypes
		(UnitType,							UnitAIType)
SELECT	'UNIT_JWW_SHARK_TOOTH_SWORDSMAN',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_ClassUpgrades
		(UnitType,							UnitClassType)
VALUES	('UNIT_JWW_SHARK_TOOTH_SWORDSMAN',	'UNITCLASS_GREAT_WAR_INFANTRY');

INSERT INTO Unit_Flavors
		(UnitType,								FlavorType,			Flavor)
SELECT	'UNIT_JWW_SHARK_TOOTH_SWORDSMAN',		FlavorType,			Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType,								ResourceType,	Cost)
SELECT	'UNIT_JWW_SHARK_TOOTH_SWORDSMAN',		ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SWORDSMAN';

-------------------------------------------
--Leader (Tembinok')
-------------------------------------------

INSERT INTO Leaders
		(Type,					Description,					Civilopedia,							CivilopediaTag,								ArtDefineTag,				VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_JWW_TEMBINOK',	'TXT_KEY_LEADER_JWW_TEMBINOK',	'TXT_KEY_LEADER_JWW_TEMBINOK_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JWW_TEMBINOK',	'TembinokScene.xml',		5,						3,						8,							10,			4,				5,				10,						2,						8,						1,				1,			4,			2,				1,			7,			0,				'JWW_ABEMAMA_COLOR_ATLAS');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,				Bias)
VALUES	('LEADER_JWW_TEMBINOK',	'MAJOR_CIV_APPROACH_WAR',			6),
		('LEADER_JWW_TEMBINOK',	'MAJOR_CIV_APPROACH_HOSTILE',		8),
		('LEADER_JWW_TEMBINOK',	'MAJOR_CIV_APPROACH_DECEPTIVE',		9),
		('LEADER_JWW_TEMBINOK',	'MAJOR_CIV_APPROACH_GUARDED',		10),
		('LEADER_JWW_TEMBINOK',	'MAJOR_CIV_APPROACH_AFRAID',		6),
		('LEADER_JWW_TEMBINOK',	'MAJOR_CIV_APPROACH_FRIENDLY',		1),
		('LEADER_JWW_TEMBINOK',	'MAJOR_CIV_APPROACH_NEUTRAL',		0);

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_JWW_TEMBINOK',	'MINOR_CIV_APPROACH_IGNORE',		2),
		('LEADER_JWW_TEMBINOK',	'MINOR_CIV_APPROACH_FRIENDLY',		3),
		('LEADER_JWW_TEMBINOK',	'MINOR_CIV_APPROACH_PROTECTIVE',	4),
		('LEADER_JWW_TEMBINOK',	'MINOR_CIV_APPROACH_CONQUEST',		7),
		('LEADER_JWW_TEMBINOK',	'MINOR_CIV_APPROACH_BULLY',			8);

INSERT INTO	Leader_Flavors
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JWW_TEMBINOK',	'FLAVOR_OFFENSE',					6),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_DEFENSE',					9),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_CITY_DEFENSE',				8),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_MILITARY_TRAINING',			6),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_RECON',						7),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_RANGED',					3),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_MOBILE',					1),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_NAVAL',						9),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_NAVAL_RECON',				8),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_NAVAL_GROWTH',				9),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	9),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_AIR',						2),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_EXPANSION',					7),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_GROWTH',					4),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_TILE_IMPROVEMENT',			5),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_PRODUCTION',				5),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_GOLD',						7),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_SCIENCE',					2),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_CULTURE',					8),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_HAPPINESS',					4),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_GREAT_PEOPLE',				2),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_WONDER',					4),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_RELIGION',					4),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_DIPLOMACY',					2),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_SPACESHIP',					3),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_WATER_CONNECTION',			8),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_NUKE',						3),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_USE_NUKE',					4),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_ESPIONAGE',					5),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_ANTIAIR',					6),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_AIR_CARRIER',				7),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_ARCHAEOLOGY',				6),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_I_LAND_TRADE_ROUTE',		1),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_I_SEA_TRADE_ROUTE',			9),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_I_TRADE_ORIGIN',			9),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_I_TRADE_DESTINATION',		2),
		('LEADER_JWW_TEMBINOK',	'FLAVOR_AIRLIFT',					5);

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_JWW_TEMBINOK',	'TRAIT_JWW_THE_LAST_TYRANT');

-------------------------------------------
--Trait (The Last Tyrant)
-------------------------------------------

INSERT INTO Traits
		(Type,							Description,							ShortDescription)
VALUES	('TRAIT_JWW_THE_LAST_TYRANT',	'TXT_KEY_TRAIT_JWW_THE_LAST_TYRANT',	'TXT_KEY_TRAIT_JWW_THE_LAST_TYRANT_SHORT');
-------------------------------------------
--Diplomacy Responses
-------------------------------------------

INSERT INTO Diplomacy_Responses
		(LeaderType,			ResponseType,									Response,																Bias)
VALUES	('LEADER_JWW_TEMBINOK',	'RESPONSE_DEFEATED',							'TXT_KEY_LEADER_JWW_TEMBINOK_DEFEATED%',								1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_EXPANSION_SERIOUS_WARNING',			'TXT_KEY_LEADER_JWW_TEMBINOK_EXPANSION_SERIOUS_WARNING%',				1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_FIRST_GREETING',						'TXT_KEY_LEADER_JWW_TEMBINOK_FIRSTGREETING%',							1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_GREETING_HOSTILE_HELLO',				'TXT_KEY_LEADER_JWW_TEMBINOK_GREETING_HOSTILE_HELLO%',					1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_GREETING_NEUTRAL_HELLO',				'TXT_KEY_LEADER_JWW_TEMBINOK_GREETING_NEUTRAL_HELLO%',					1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_GREETING_POLITE_HELLO',				'TXT_KEY_LEADER_JWW_TEMBINOK_GREETING_POLITE_HELLO%',					1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',	'TXT_KEY_LEADER_JWW_TEMBINOK_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',		1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_REQUEST',								'TXT_KEY_LEADER_JWW_TEMBINOK_REQUEST%',									1),
		('LEADER_JWW_TEMBINOK',	'RESPONSE_DECLAREWAR',							'TXT_KEY_LEADER_JWW_TEMBINOK_DECLAREWAR%',								1);

-------------------------------------------
--Civilization (Abemama)
-------------------------------------------

INSERT INTO Civilizations
		(Type,							Description,					Civilopedia,						CivilopediaTag,				Playable,	AIPlayable,		ShortDescription,						Adjective,								DefaultPlayerColor,			ArtDefineTag,					ArtStyleType,			ArtStyleSuffix,		ArtStylePrefix,		PortraitIndex,	IconAtlas,					AlphaIconAtlas,				MapImage,			DawnOfManQuote,							DawnOfManImage)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CIV_JWW_ABEMAMA_DESC',	'TXT_KEY_CIV_JWW_ABEMAMA_PEDIA',	'TXT_KEY_CIV5_JWW_ABEMAMA',	1,			1,				'TXT_KEY_CIV_JWW_ABEMAMA_SHORT_DESC',	'TXT_KEY_CIV_JWW_ABEMAMA_ADJECTIVE',	'PLAYERCOLOR_JWW_ABEMAMA',	'ART_DEF_CIVILIZATION_AMERICA',	'ARTSTYLE_POLYNESIAN',	'_MED',				'ASIAN',			1,				'JWW_ABEMAMA_COLOR_ATLAS',	'JWW_ABEMAMA_ALPHA_ATLAS',	'AbemamaMap.dds',	'TXT_KEY_CIV5_DAWN_JWW_ABEMAMA_TEXT',	'TembinokDOM.dds');

INSERT INTO Civilization_Leaders
		(CivilizationType,				LeaderheadType)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'LEADER_JWW_TEMBINOK');

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,				BuildingClassType,			BuildingType)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'BUILDINGCLASS_GARDEN',		'BUILDING_JWW_COPRA_SMALLHOLDING');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,				UnitClassType,			UnitType)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'UNITCLASS_SWORDSMAN',	'UNIT_JWW_SHARK_TOOTH_SWORDSMAN');

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,				BuildingClassType)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'BUILDINGCLASS_PALACE');

INSERT INTO Civilization_FreeTechs
		(CivilizationType,				TechType)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'TECH_AGRICULTURE');

INSERT INTO Civilization_FreeUnits
		(CivilizationType,				UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType,				StartAlongOcean)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	1);

INSERT INTO Civilization_Religions
		(CivilizationType,				ReligionType)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'RELIGION_CHRISTIANITY');

INSERT INTO	Civilization_CityNames
		(CivilizationType,					CityName)
VALUES	('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_0'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_1'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_2'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_3'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_4'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_5'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_6'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_7'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_8'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_9'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_10'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_11'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_12'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_13'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_14'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_15'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_16'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_17'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_18'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_19'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_20'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_21'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_22'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_23'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_24'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_25'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_26'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_27'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_28'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_29'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_30'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_31'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_32'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_33'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_34'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_35'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_36'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_37'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_38'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_39'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_40'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_41'),
		('CIVILIZATION_JWW_ABEMAMA',	'TXT_KEY_CITY_NAME_JWW_ABEMAMA_42');
				
INSERT INTO Civilization_SpyNames
		(CivilizationType,						SpyName)
VALUES	('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_0'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_1'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_2'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_3'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_4'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_5'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_6'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_7'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_8'),
		('CIVILIZATION_JWW_ABEMAMA',		'TXT_KEY_SPY_NAME_JWW_ABEMAMA_9');

--================================================================
--================================================================
