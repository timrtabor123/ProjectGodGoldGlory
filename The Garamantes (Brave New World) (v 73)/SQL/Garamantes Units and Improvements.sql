---------------------------
--Units
---------------------------

INSERT INTO Units 
		(Class,									Type,	Combat,		Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,			CombatClass,				Domain,				DefaultUnitAI,							Description,								Civilopedia,										Strategy,										Help,		NoBadGoodies,		Pillage,	MilitarySupport,	MilitaryProduction,						ObsoleteTech,		GoodyHutUpgradeUnitClass,		NoMaintenance,		AdvancedStartCost,		XPValueAttack,		XPValueDefense,											UnitArtInfo,						UnitFlagAtlas,		UnitFlagIconOffset,					IconAtlas,		PortraitIndex)
VALUES	('UNITCLASS_SCOUT',  'UNIT_LIBYAN_NOMAD_MOD',        5,       25,          50,                             1,       2,   'UNITCOMBAT_RECON',         'DOMAIN_LAND',          'UNITAI_EXPLORE',      'TXT_KEY_UNIT_LIBYAN_NOMAD_MOD',       'TXT_KEY_UNIT_LIBYAN_NOMAD_MOD_TEXT',        'TXT_KEY_UNIT_LIBYAN_NOMAD_MOD_STRATEGY',       'TXT_KEY_UNIT_LIBYAN_NOMAD_MOD_HELP',                  1,             1,                  1,                     1,         'TECH_SCIENTIFIC_THEORY',		      'UNITCLASS_ARCHER',                   1,                     10,                  3,                   3,         'ART_DEF_UNIT_ANCIENT_LIBYAN_MOD_SCOUT_ALT',     'ANCIENT_LIBYA_UNIT_ALPHA_ATLAS',                       0,		'ANCIENT_LIBYA_ATLAS',                  2);

INSERT INTO Unit_AITypes 
		(UnitType,							UnitAIType)
VALUES	('UNIT_LIBYAN_NOMAD_MOD',     'UNITAI_EXPLORE');

INSERT INTO Unit_Flavors 
		(UnitType,							FlavorType,				Flavor)
VALUES	('UNIT_LIBYAN_NOMAD_MOD',       'FLAVOR_RECON',                  8);

INSERT INTO Unit_FreePromotions 
		(UnitType,											PromotionType)
VALUES	('UNIT_LIBYAN_NOMAD_MOD',         'PROMOTION_IGNORE_TERRAIN_COST'), 
		('UNIT_LIBYAN_NOMAD_MOD',                'PROMOTION_LIBYAN_NOMAD'),
		('UNIT_LIBYAN_NOMAD_MOD',        'PROMOTION_LIBYAN_DESERT_RAIDER');

--Dummy
---------------------------

INSERT INTO Units 
		(Class,										       Type,	Cost,	Moves,              Capture,                CivilianAttackPriority,		       Domain,        DefaultUnitAI,                            Description,                                           Civilopedia,                                         Strategy,                                           Help,		AdvancedStartCost,		WorkRate,		CombatLimit,			                    UnitArtInfo,        UnitArtInfoEraVariation,                     UnitFlagIconOffset,              IconAtlas,		   PortraitIndex,        ShowInPedia)
VALUES	('UNITCLASS_GARAMA_DUMMY',			'UNIT_GARAMA_DUMMY',	  -1,	    2,	 'UNITCLASS_WORKER',		'CIVILIAN_ATTACK_PRIORITY_LOW',     'DOMAIN_LAND',		'UNITAI_WORKER',	              'TXT_KEY_UNIT_WORKER',		          'TXT_KEY_CIV5_ANTIQUITY_WORKER_TEXT',		              'TXT_KEY_UNIT_WORKER_STRATEGY',		              'TXT_KEY_UNIT_HELP_WORKER',		               20,           100,                 0,		             'ART_DEF_UNIT__WORKER',		                      1,		                              1,			'UNIT_ATLAS_1',                    1,                  0);

INSERT INTO Unit_AITypes
		(UnitType,															 UnitAIType)
Values	('UNIT_GARAMA_DUMMY',								            'UNITAI_WORKER');

INSERT INTO Unit_Flavors
		(UnitType,															 FlavorType,						Flavor)
Values	('UNIT_GARAMA_DUMMY',					              'FLAVOR_TILE_IMPROVEMENT',							30);

INSERT INTO UnitClasses
		(Type,											  Description,						DefaultUnit)
Values	('UNITCLASS_GARAMA_DUMMY',				'TXT_KEY_UNIT_WORKER',				'UNIT_GARAMA_DUMMY');

---------------------------
--Promotions
---------------------------

--UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_LIBYAN_CHARIOT_ROUTE_HELP' WHERE Type = 'PROMOTION_IGNORE_TERRAIN_COST';

INSERT INTO UnitPromotions 
		(Type, 												                           Description, 	                                                  Help, 	             Sound, 	CannotBeChosen,		LostWithUpgrade,	RivalTerritory,		PortraitIndex,		                       IconAtlas,				 PediaType,		                                   PediaEntry)
VALUES	('PROMOTION_LIBYAN_NOMAD', 				                  'TXT_KEY_PROMOTION_LIBYAN_NOMAD', 		             'TXT_KEY_PROMOTION_LIBYAN_NOMAD_HELP',		 'AS2D_IF_LEVELUP', 				 1,                   1,                 1,                33,			           'PROMOTION_ATLAS',		'PEDIA_ATTRIBUTES',			         'TXT_KEY_PROMOTION_LIBYAN_NOMAD'),
		('PROMOTION_LIBYAN_DESERT_RAIDER', 				  'TXT_KEY_PROMOTION_LIBYAN_DESERT_RAIDER', 		     'TXT_KEY_PROMOTION_LIBYAN_DESERT_RAIDER_HELP',		 'AS2D_IF_LEVELUP', 				 1,                   0,                 0,                 1,			'EXPANSION2_PROMOTION_ATLAS',		'PEDIA_ATTRIBUTES',			 'TXT_KEY_PROMOTION_LIBYAN_DESERT_RAIDER');
		
INSERT INTO UnitPromotions_Terrains 
		(PromotionType,									TerrainType,				   DoubleMove)
VALUES	('PROMOTION_LIBYAN_DESERT_RAIDER',         'TERRAIN_DESERT',				            1);

INSERT INTO UnitPromotions_Features 
		(PromotionType,									                          FeatureType,				   DoubleMove)
VALUES	('PROMOTION_LIBYAN_DESERT_RAIDER',                             'FEATURE_FLOOD_PLAINS',				            1),
		('PROMOTION_LIBYAN_DESERT_RAIDER',                                    'FEATURE_OASIS',				            1),
		('PROMOTION_LIBYAN_DESERT_RAIDER',          'FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER',				            1);

--Dummy
---------------------------

INSERT INTO UnitPromotions 
		(Type, 												                           Description, 	                                                  Help, 	             Sound, 	CannotBeChosen,		LostWithUpgrade,	IgnoreTerrainCost,		PortraitIndex,		                  IconAtlas,				 PediaType,		                                   PediaEntry)
VALUES	('PROMOTION_LIBYAN_CHARIOT_ROUTE', 				  'TXT_KEY_PROMOTION_LIBYAN_CHARIOT_ROUTE', 		     'TXT_KEY_PROMOTION_LIBYAN_CHARIOT_ROUTE_HELP',		 'AS2D_IF_LEVELUP', 				 1,                   1,                    1,                 59,			        'ABILITY_ATLAS',		              NULL,			 'TXT_KEY_PROMOTION_LIBYAN_CHARIOT_ROUTE');

---------------------------
--Improvements
---------------------------

INSERT INTO Improvements 
		(Type,														          Description,                                    Civilopedia,									             Help,			                       ArtDefineTag,		SpecificCivRequired,			          CivilizationType,		HillsMakesValid,		PillageGold,	PortraitIndex,			    IconAtlas,		DestroyedWhenPillaged)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',   'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA',	'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_TEXT',		'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_HELP',		'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS',                          1,      'CIVILIZATION_ANCIENT_LIBYA_MOD',			          0,	             18,	            3,	'ANCIENT_LIBYA_ATLAS',                          1);

INSERT INTO Improvement_Flavors 
		(ImprovementType,							      FlavorType,				 Flavor)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',       'FLAVOR_GROWTH',                    10);

INSERT INTO Improvement_ValidTerrains 
		(ImprovementType,							    TerrainType)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',     'TERRAIN_DESERT');

INSERT INTO Improvement_Yields 
		(ImprovementType,							       YieldType,		      Yield)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',          'YIELD_FOOD',                 3);

INSERT INTO Improvement_TechYieldChanges 
		(ImprovementType,							        TechType,          YieldType,		 Yield)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',     'TECH_FERTILIZER',       'YIELD_GOLD',            1);

INSERT INTO Builds 
		(Type,                              PrereqTech,        Time,                             ImprovementType,                          Description,                                        Help,                            Recommendation,                     EntityEvent,	OrderPriority,		CtrlDown,	IconIndex,             IconAtlas)
VALUES	('BUILD_GARAMA_FOGGORA',	'TECH_ENGINEERING',			700,		'IMPROVEMENT_GARAMANTES_MOD_FOGGORA',		'TXT_KEY_BUILD_GARAMA_FOGGORA',			'TXT_KEY_BUILD_GARAMA_FOGGORA_HELP',		'TXT_KEY_BUILD_GARAMA_FOGGORA_REC',			'ENTITY_EVENT_IRRIGATE',		        1,             1,           0,	'GARAMA_BUILD_ATLAS');

INSERT INTO BuildFeatures 
		(BuildType,                      FeatureType,              PrereqTech,  Time,	Production,    Remove)
VALUES	('BUILD_GARAMA_FOGGORA',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	 700,	         0,         1),
		('BUILD_GARAMA_FOGGORA',	'FEATURE_FOREST',	        'TECH_MINING',	 400,	        20,         1),
		('BUILD_GARAMA_FOGGORA',	 'FEATURE_MARSH',	       'TECH_MASONRY',	 600,	         0,         1);

--INSERT INTO Unit_Builds 
--			(UnitType,			                 BuildType)
--VALUES	('UNIT_WORKER',			'BUILD_GARAMA_FOGGORA');

--Dummy
---------------------------

INSERT INTO Improvements 
		(Type,														                Description,                                      Civilopedia,									             Help,			                       ArtDefineTag,		PillageGold,	PortraitIndex,			    IconAtlas,	GraphicalOnly,	DestroyedWhenPillaged)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',   'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA',	'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_TEXT',		'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_HELP',		'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS',                 18,	            3,	'ANCIENT_LIBYA_ATLAS',              1,                      1);

INSERT INTO Improvement_Flavors 
		(ImprovementType,							            FlavorType,			     Flavor)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',       'FLAVOR_GROWTH',                  10);

INSERT INTO Improvement_ValidTerrains 
		(ImprovementType,							          TerrainType)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',     'TERRAIN_DESERT');

INSERT INTO Improvement_Yields 
		(ImprovementType,							             YieldType,		        Yield)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',          'YIELD_FOOD',                 3);

INSERT INTO Builds 
		(Type,                                  PrereqTech,        Time,                                   ImprovementType,                        Description,                                        Help,                            Recommendation,                     EntityEvent,	OrderPriority,		CtrlDown,	IconIndex,             IconAtlas,	ShowInPedia,		ShowInTechTree)
VALUES	('BUILD_GARAMA_FOGGORA_DUMMY',	'TECH_ENGINEERING',			700,		'IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',		'TXT_KEY_BUILD_GARAMA_FOGGORA',			'TXT_KEY_BUILD_GARAMA_FOGGORA_HELP',		'TXT_KEY_BUILD_GARAMA_FOGGORA_REC',			'ENTITY_EVENT_IRRIGATE',		        1,             1,           0,	'GARAMA_BUILD_ATLAS',             0,                     0);

INSERT INTO BuildFeatures 
		(BuildType,                          FeatureType,              PrereqTech,  Time,	Production,    Remove)
VALUES	('BUILD_GARAMA_FOGGORA_DUMMY',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	 700,	         0,         1),
		('BUILD_GARAMA_FOGGORA_DUMMY',	'FEATURE_FOREST',	        'TECH_MINING',	 400,	        20,         1),
		('BUILD_GARAMA_FOGGORA_DUMMY',	 'FEATURE_MARSH',	       'TECH_MASONRY',	 600,	         0,         1);

INSERT INTO Unit_Builds 
	    (UnitType,			                              BuildType)
VALUES	('UNIT_GARAMA_DUMMY',		   'BUILD_GARAMA_FOGGORA_DUMMY'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_ROAD'),
		('UNIT_GARAMA_DUMMY',                      'BUILD_RAILROAD'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_FARM'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_MINE'),
		('UNIT_GARAMA_DUMMY',                  'BUILD_TRADING_POST'),
		('UNIT_GARAMA_DUMMY',                    'BUILD_LUMBERMILL'),
		('UNIT_GARAMA_DUMMY',                       'BUILD_PASTURE'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_CAMP'),
		('UNIT_GARAMA_DUMMY',                    'BUILD_PLANTATION'),
		('UNIT_GARAMA_DUMMY',                        'BUILD_QUARRY'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_WELL'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_FORT'),
		('UNIT_GARAMA_DUMMY',                 'BUILD_REMOVE_JUNGLE'),
		('UNIT_GARAMA_DUMMY',                  'BUILD_REMOVE_MARSH'),
		('UNIT_GARAMA_DUMMY',                 'BUILD_REMOVE_FOREST'),
		('UNIT_GARAMA_DUMMY',                 'BUILD_SCRUB_FALLOUT'),
		('UNIT_GARAMA_DUMMY',                        'BUILD_REPAIR'),
		('UNIT_GARAMA_DUMMY',				   'BUILD_REMOVE_ROUTE');

--Misc.
INSERT INTO Policies 
		(Type,														                          Description,								                      Civilopedia,                                                   Help,	    GridX,	GridY,	PortraitIndex,			 IconAtlas,		   IconAtlasAchieved)
VALUES	('POLICY_GARAMA_FIX_UI_BASE_YIELD',			               'TXT_KEY_POLICY_GARAMANTES_UI_FIX_MOD',			          'TXT_KEY_POLICY_GARAMANTES_UI_FIX_MOD_TEXT',		      'TXT_KEY_POLICY_GARAMANTES_UI_FIX_MOD_HELP',	     1000,	 1000,		       47,		'POLICY_ATLAS',			'POLICY_A_ATLAS');

INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,														                             ImprovementType,		                          YieldType,                       Yield)
Values	('POLICY_GARAMA_FIX_UI_BASE_YIELD',                                   'IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',                              'YIELD_GOLD',                           1);