--The Yukaghir under Teki Odulok
--By ExplosiveWatermelon

-----

--Leader

INSERT INTO Leaders
		(Type,					Description,					Civilopedia,						CivilopediaTag,				ArtDefineTag,				VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_EW_ODULOK',	'TXT_KEY_LEADER_EW_ODULOK',		'TXT_KEY_LEADER_EW_ODULOK_PEDIA',	'TXT_KEY_PEDIA_EW_ODULOK',	'Teki_LS.xml',	8,						2,						3,							6,			6,				5,				3,						3,						3,						3,				5,			4,			3,				3,			4,			0,				'ATLAS_EW_ODULOK');

-----

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_EW_ODULOK',	'MAJOR_CIV_APPROACH_WAR',		4),
		('LEADER_EW_ODULOK',	'MAJOR_CIV_APPROACH_HOSTILE',	3),
		('LEADER_EW_ODULOK',	'MAJOR_CIV_APPROACH_DECEPTIVE',	5),
		('LEADER_EW_ODULOK',	'MAJOR_CIV_APPROACH_GUARDED',	3),
		('LEADER_EW_ODULOK',	'MAJOR_CIV_APPROACH_FRIENDLY',	3),
		('LEADER_EW_ODULOK',	'MAJOR_CIV_APPROACH_AFRAID',	1),
		('LEADER_EW_ODULOK',	'MAJOR_CIV_APPROACH_NEUTRAL',	5);
		
-----

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_EW_ODULOK',	'MINOR_CIV_APPROACH_IGNORE',		5),
		('LEADER_EW_ODULOK',	'MINOR_CIV_APPROACH_FRIENDLY',		6),
		('LEADER_EW_ODULOK',	'MINOR_CIV_APPROACH_PROTECTIVE',	3),
		('LEADER_EW_ODULOK',	'MINOR_CIV_APPROACH_CONQUEST',		2),
		('LEADER_EW_ODULOK',	'MINOR_CIV_APPROACH_BULLY',			2);
		
-----

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_EW_ODULOK',	'FLAVOR_OFFENSE',					8),
		('LEADER_EW_ODULOK',	'FLAVOR_DEFENSE',					8),
		('LEADER_EW_ODULOK',	'FLAVOR_CITY_DEFENSE',				5),
		('LEADER_EW_ODULOK',	'FLAVOR_MILITARY_TRAINING',			7),
		('LEADER_EW_ODULOK',	'FLAVOR_RECON',						4),
		('LEADER_EW_ODULOK',	'FLAVOR_RANGED',					5),
		('LEADER_EW_ODULOK',	'FLAVOR_MOBILE',					2),
		('LEADER_EW_ODULOK',	'FLAVOR_NAVAL',						4),
		('LEADER_EW_ODULOK',	'FLAVOR_NAVAL_RECON',				2),
		('LEADER_EW_ODULOK',	'FLAVOR_NAVAL_GROWTH',				2),
		('LEADER_EW_ODULOK',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	5),
		('LEADER_EW_ODULOK',	'FLAVOR_AIR',						5),
		('LEADER_EW_ODULOK',	'FLAVOR_EXPANSION',					7),
		('LEADER_EW_ODULOK',	'FLAVOR_GROWTH',					6),
		('LEADER_EW_ODULOK',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_EW_ODULOK',	'FLAVOR_INFRASTRUCTURE',			6),
		('LEADER_EW_ODULOK',	'FLAVOR_PRODUCTION',				4),
		('LEADER_EW_ODULOK',	'FLAVOR_GOLD',						5),
		('LEADER_EW_ODULOK',	'FLAVOR_SCIENCE',					10),
		('LEADER_EW_ODULOK',	'FLAVOR_CULTURE',					6),
		('LEADER_EW_ODULOK',	'FLAVOR_HAPPINESS',					4),
		('LEADER_EW_ODULOK',	'FLAVOR_GREAT_PEOPLE',				6),
		('LEADER_EW_ODULOK',	'FLAVOR_WONDER',					2),
		('LEADER_EW_ODULOK',	'FLAVOR_RELIGION',					2),
		('LEADER_EW_ODULOK',	'FLAVOR_DIPLOMACY',					4),
		('LEADER_EW_ODULOK',	'FLAVOR_SPACESHIP',					6),
		('LEADER_EW_ODULOK',	'FLAVOR_WATER_CONNECTION',			5),
		('LEADER_EW_ODULOK',	'FLAVOR_NUKE',						4),
		('LEADER_EW_ODULOK',	'FLAVOR_USE_NUKE',					6),
		('LEADER_EW_ODULOK',	'FLAVOR_ESPIONAGE',					6),
		('LEADER_EW_ODULOK',	'FLAVOR_ANTIAIR',					3),
		('LEADER_EW_ODULOK',	'FLAVOR_AIR_CARRIER',				3),
		('LEADER_EW_ODULOK',	'FLAVOR_I_LAND_TRADE_ROUTE',		4),
		('LEADER_EW_ODULOK',	'FLAVOR_I_SEA_TRADE_ROUTE',			4),
		('LEADER_EW_ODULOK',	'FLAVOR_ARCHAEOLOGY',				5),
		('LEADER_EW_ODULOK',	'FLAVOR_I_TRADE_ORIGIN',			4),
		('LEADER_EW_ODULOK',	'FLAVOR_I_TRADE_DESTINATION',		4),
		('LEADER_EW_ODULOK',	'FLAVOR_AIRLIFT',					3);
		
-----

INSERT INTO Traits
		(Type,				Description,				ShortDescription)
VALUES	('TRAIT_EW_ODULOK',	'TXT_KEY_TRAIT_EW_ODULOK',	'TXT_KEY_TRAIT_EW_ODULOK_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_EW_ODULOK',	'TRAIT_EW_ODULOK');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,						CivilopediaTag,					ShortDescription,							Adjective,								DefaultPlayerColor,				ArtDefineTag,			ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_PEDIA_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_SHORT',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_ADJ',	'PLAYERCOLOR_EW_YUKAGHIR',	'ART_DEF_EW_YUKAGHIR',	'ARTSTYLE_ASIAN',	'_ASIA',		'ASIAN',		0,				'ATLAS_EW_YUKAGHIR',	'ALPHA_EW_YUKAGHIR',	'yuka_Map.dds',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_DOM',	'yuka_DoM.dds');

-----

INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_1'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_2'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_3'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_4'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_5'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_6'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_7'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_8'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_9'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_10'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_11'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_12'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_13'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_14'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_15'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_16'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_17'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_18'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_19'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_20'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_21'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_22'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_23'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_24'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_25'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_26'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_27'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_28'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_29'),
		('CIVILIZATION_EW_YUKAGHIR',	'TXT_KEY_CIVILIZATION_EW_YUKAGHIR_CITY_30')
		;

--Units

INSERT INTO Units
		(Type,					Description,					Civilopedia,						Strategy,								Help,								Combat,	Cost,	Moves,	BaseSightRange,	Class,	Special,	Domain,	CivilianAttackPriority,	DefaultUnitAI,	MinAreaSize,	MoveRate,	PortraitIndex,	IconAtlas,			UnitFlagIconOffset,	UnitFlagAtlas,			WorkRate,	UnitArtInfo,					BaseBeakersTurnsToCount)
SELECT	'UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_PEDIA',	'TXT_KEY_UNIT_EW_SHOROMOKH_STRATEGY',	'TXT_KEY_UNIT_EW_SHOROMOKH_HELP',	Combat,	Cost,	Moves,	BaseSightRange,	Class,	Special,	Domain,	CivilianAttackPriority,	DefaultUnitAI,	MinAreaSize,	MoveRate,	1,				'ATLAS_EW_ODULOK',	0,					'ALPHA_EW_SHOROMOKH',	100,		'ART_DEF_UNIT_EW_SHOROMOKH',	BaseBeakersTurnsToCount
FROM Units WHERE (Type = 'UNIT_SCIENTIST');

-----

INSERT INTO Unit_Flavors
		(UnitType,				FlavorType,	Flavor)
SELECT	'UNIT_EW_SHOROMOKH',	FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SCIENTIST');

INSERT INTO Unit_Flavors
		(UnitType,				FlavorType,					Flavor)
VALUES	('UNIT_EW_SHOROMOKH',	'FLAVOR_TILE_IMPROVEMENT',	20);

-----

INSERT INTO Unit_AITypes
		(UnitType,				UnitAIType)
VALUES	('UNIT_EW_SHOROMOKH',	'UNITAI_SCIENTIST'),
		('UNIT_EW_SHOROMOKH',	'UNITAI_WORKER');

-----

INSERT INTO Unit_UniqueNames
		(UnitType,				UniqueName)
VALUES	('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_1'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_2'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_3'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_4'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_5'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_6'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_7'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_8'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_9'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_10'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_11'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_12'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_13'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_14'),
		('UNIT_EW_SHOROMOKH',	'TXT_KEY_UNIT_EW_SHOROMOKH_NAME_15');

--Buildings

INSERT INTO Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	PortraitIndex,	IconAtlas,			GreatWorkSlotType,				GreatWorkCount)
SELECT	'BUILDING_EW_SHAKHADIBE',	'TXT_KEY_BUILDING_EW_SHAKHADIBE',	'TXT_KEY_BUILDING_EW_SHAKHADIBE_PEDIA',	'TXT_KEY_BUILDING_EW_SHAKHADIBE_STRATEGY',	'TXT_KEY_BUILDING_EW_SHAKHADIBE_HELP',	Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	2,				'ATLAS_EW_ODULOK',	GreatWorkSlotType,				2
FROM Buildings WHERE (Type = 'BUILDING_AMPHITHEATER');

-----

INSERT INTO Building_ThemingBonuses
		(BuildingType,				Description,								Bonus,	UniqueEras,	MustBeArt,	MustBeArtifact,	AIPriority)
VALUES	('BUILDING_EW_SHAKHADIBE',	'TXT_KEY_BUILDING_EW_SHAKHADIBE_THEMING',	2,		1,			0,			0,				2);

-----

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_EW_SHAKHADIBE',	FlavorType,	Flavor + 5
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_AMPHITHEATER');

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	('BUILDING_EW_SHAKHADIBE',	'FLAVOR_SCIENCE',		20);

-----

INSERT INTO Building_YieldChanges
		(BuildingType,				YieldType,	Yield)
SELECT	'BUILDING_EW_SHAKHADIBE',	YieldType,	Yield
FROM Building_YieldChangesPerPop WHERE (BuildingType = 'BUILDING_AMPHITHEATER');

--Defines

INSERT INTO Civilization_FreeUnits
		(CivilizationType,				UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

-----

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,				BuildingClassType)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'BUILDINGCLASS_PALACE');

-----

INSERT INTO Civilization_FreeTechs
		(CivilizationType,				TechType)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'TECH_AGRICULTURE');

-----

INSERT INTO Civilization_Leaders
		(CivilizationType,				LeaderheadType)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'LEADER_EW_ODULOK');

-----

INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
SELECT	'CIVILIZATION_EW_YUKAGHIR',	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');

-----

INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,				RegionType)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'REGION_TUNDRA');

-----

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,				UnitClassType,				UnitType)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'UNITCLASS_SCIENTIST',		'UNIT_EW_SHOROMOKH');

-----

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,				BuildingClassType,		BuildingType)
VALUES	('CIVILIZATION_EW_YUKAGHIR',	'BUILDINGCLASS_AMPHITHEATER',	'BUILDING_EW_SHAKHADIBE');

--Archaeology

INSERT INTO Improvements
		(Type,						Description,	Civilopedia,	ArtDefineTag,	RemovesResource,	IgnoreOwnership,	PortraitIndex,	IconAtlas)
SELECT	'IMPROVEMENT_EW_YUKAGHIR',	Description,	Civilopedia,	ArtDefineTag,	1,					IgnoreOwnership,	PortraitIndex,	IconAtlas
FROM Improvements WHERE (Type = 'IMPROVEMENT_ACADEMY');

-----

INSERT INTO Improvement_Yields
		(ImprovementType,			YieldType,	Yield)
SELECT	'IMPROVEMENT_EW_YUKAGHIR',	YieldType,	Yield
FROM Improvement_Yields WHERE (ImprovementType = 'IMPROVEMENT_ACADEMY');

-----

INSERT INTO Improvement_ResourceTypes
		(ImprovementType,			ResourceType,	ResourceMakesValid,	ResourceTrade)
SELECT	'IMPROVEMENT_EW_YUKAGHIR',	ResourceType,	ResourceMakesValid,	ResourceTrade
FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_CAMP');

-----

INSERT INTO Builds
		(Type,					Description,	Help,	Recommendation,	OrderPriority,	CtrlDown,	Time,	ImprovementType,			EntityEvent,	IconIndex,	IconAtlas,	ShowInPedia,	ShowInTechTree)
SELECT	'BUILD_EW_YUKAGHIR',	Description,	Help,	Recommendation,	OrderPriority,	CtrlDown,	Time,	'IMPROVEMENT_EW_YUKAGHIR',	EntityEvent,	IconIndex,	IconAtlas,	0,				0
FROM Builds WHERE (Type = 'BUILD_ACADEMY');

-----

INSERT INTO Unit_Builds
		(UnitType,				BuildType)
VALUES	('UNIT_EW_SHOROMOKH',	'BUILD_EW_YUKAGHIR');	

--Dummies

INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,				Description)
VALUES	('BUILDINGCLASS_EW_YUKAGHIR_BORDER',	'BUILDING_EW_YUKAGHIR_BORDER',	'TXT_KEY_BUILDING_EW_YUKAGHIR_BORDER');

INSERT INTO Buildings
		(Type,								BuildingClass,							Description,							NukeImmune,	Cost,	FaithCost,	MinAreaSize,	NeverCapture,	PortraitIndex,	IconAtlas,		GreatWorkCount,	PlotBuyCostModifier,	PlotCultureCostModifier)
VALUES	('BUILDING_EW_YUKAGHIR_BORDER',		'BUILDINGCLASS_EW_YUKAGHIR_BORDER',		'TXT_KEY_BUILDING_EW_YUKAGHIR_BORDER',	1,			-1,		-1,			-1,				1,				19,				'BW_ATLAS_1',	-1,				5,						5);

--Diplomacy

INSERT INTO Diplomacy_Responses
			(LeaderType,			ResponseType,                                    Response,                                                       Bias)
VALUES		('LEADER_EW_ODULOK',     'RESPONSE_ATTACKED_HOSTILE',                   'TXT_KEY_LEADER_EW_ODULOK_ATTACKED_GENERIC',                     500),
			('LEADER_EW_ODULOK',     'RESPONSE_DEFEATED',                           'TXT_KEY_LEADER_EW_ODULOK_DEFEATED',                             500),
			('LEADER_EW_ODULOK',     'RESPONSE_DOW_GENERIC',						'TXT_KEY_LEADER_EW_ODULOK_DOW_GENERIC',                          500),
			('LEADER_EW_ODULOK',     'RESPONSE_EXPANSION_SERIOUS_WARNING',          'TXT_KEY_LEADER_EW_ODULOK_EXPANSION_SERIOUS_WARNING',            500),
			('LEADER_EW_ODULOK',     'RESPONSE_FIRST_GREETING',                     'TXT_KEY_LEADER_EW_ODULOK_FIRSTGREETING_%',                      500),
			('LEADER_EW_ODULOK',     'RESPONSE_GREETING_AT_WAR_HOSTILE',			'TXT_KEY_LEADER_EW_ODULOK_GREETING_AT_WAR_HOSTILE',              500),
			('LEADER_EW_ODULOK',     'RESPONSE_GREETING_POLITE_HELLO',              'TXT_KEY_LEADER_EW_ODULOK_GREETING_POLITE_HELLO',                500),
			('LEADER_EW_ODULOK',     'RESPONSE_GREETING_NEUTRAL_HELLO',             'TXT_KEY_LEADER_EW_ODULOK_GREETING_NEUTRAL_HELLO',               500),
			('LEADER_EW_ODULOK',     'RESPONSE_GREETING_HOSTILE_HELLO',             'TXT_KEY_LEADER_EW_ODULOK_GREETING_HOSTILE_HELLO',               500),
			('LEADER_EW_ODULOK',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',	 'TXT_KEY_LEADER_EW_ODULOK_HOSTILE_AGGRESSIVE_MILITARY_WARNING',  500),
			('LEADER_EW_ODULOK',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_EW_ODULOK_LUXURY_TRADE',                         500),
			('LEADER_EW_ODULOK',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_EW_ODULOK_NO_PEACE',                             500),
			('LEADER_EW_ODULOK',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                'TXT_KEY_LEADER_EW_ODULOK_OPEN_BORDERS_EXCHANGE',                500),
			('LEADER_EW_ODULOK',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_EW_ODULOK_LOSEWAR',                              500),
			('LEADER_EW_ODULOK',     'RESPONSE_REPEAT_NO',                            'TXT_KEY_LEADER_EW_ODULOK_REPEAT_NO',                            500),
			('LEADER_EW_ODULOK',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_EW_ODULOK_RESPONSE_REQUEST',                     500),
			('LEADER_EW_ODULOK',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		     'TXT_KEY_LEADER_EW_ODULOK_RESPONSE_TO_BEING_DENOUNCED',          500),
			('LEADER_EW_ODULOK',     'RESPONSE_TOO_SOON_NO_PEACE',                    'TXT_KEY_LEADER_EW_ODULOK_TOO_SOON_NO_PEACE',                    500),
			('LEADER_EW_ODULOK',     'RESPONSE_WINNER_PEACE_OFFER',                   'TXT_KEY_LEADER_EW_ODULOK_WINWAR',                               500),
			('LEADER_EW_ODULOK',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_EW_ODULOK_DENOUNCE',                             500),
			('LEADER_EW_ODULOK',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_EW_ODULOK_DEC_FRIENDSHIP',                       500);

--Religion

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_ANGAKKUQISM' )
		THEN 'RELIGION_ANGAKKUQISM'
		ELSE 'RELIGION_TENGRIISM' END
	) WHERE CivilizationType = 'CIVILIZATION_EW_YUKAGHIR';

CREATE TRIGGER ReligionYukaTestTrigger
AFTER INSERT ON Religions WHEN 'RELIGION_ANGAKKUQISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_ANGAKKUQISM'
	WHERE CivilizationType IN ('CIVILIZATION_EW_YUKAGHIR');
END;