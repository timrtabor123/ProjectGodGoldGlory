--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,						Civilopedia,									Help,									Strategy,								ArtDefineTag,	MinAreaSize,	NeverCapture,	HurryCostModifier,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_LUNG_VOMIEU'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_LUNG_VOMIEU'),	('TXT_KEY_CIV5_BUILDING_LUNG_VOMIEU_TEXT'),	('TXT_KEY_BUILDING_LUNG_VOMIEU_HELP'),	('TXT_KEY_BUILDING_LUNG_VOMIEU_STRATEGY'),	ArtDefineTag,	MinAreaSize,	1,				HurryCostModifier,	'LUNG_DAIVIET_ICON_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_ARMORY');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_LUNG_VOMIEU'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_ARMORY');
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	('BUILDING_LUNG_VOMIEU'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_ARMORY');
------------------------------	
-- Building_DomainFreeExperiences
------------------------------		
INSERT INTO Building_DomainFreeExperiences 	
		(BuildingType, 				DomainType,	Experience)
SELECT	('BUILDING_LUNG_VOMIEU'),	DomainType,	Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_ARMORY');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,		Yield)
SELECT	('BUILDING_LUNG_VOMIEU'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_ARMORY');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 					Description, 					Help, 								Sound, 			LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_CQATTACK',	 'TXT_KEY_PROMOTION_CQATTACK', 	'TXT_KEY_PROMOTION_CQATTACK_HELP',	'AS2D_IF_LEVELUP',	0,				 0, 			1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CQATTACK'),
		('PROMOTION_CAMQUAN',	 'TXT_KEY_PROMOTION_CAMQUAN', 	'TXT_KEY_PROMOTION_CAMQUAN_HELP',	'AS2D_IF_LEVELUP',	1,				 0, 			1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CAMQUAN');

INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType, 		UnitCombatType, Modifier)
VALUES	('PROMOTION_CAMQUAN',	'UNITCOMBAT_MOUNTED', 33);

-- Stuff needed to allow to rename the first Great General
INSERT OR REPLACE INTO UnitPromotions
		(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen,	PortraitIndex, 	IconAtlas,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_CREATED',	 		 'TXT_KEY_PROMOTION_CREATED', 			'TXT_KEY_PROMOTION_CREATED_HELP',			'AS2D_IF_LEVELUP',		1,			26, 			'ABILITY_ATLAS', 	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_CREATED'),
		('PROMOTION_MARKED_FOR_DEATH',	 'TXT_KEY_PROMOTION_MARKED_FOR_DEATH', 	'TXT_KEY_PROMOTION_MARKED_FOR_DEATH_HELP',	'AS2D_IF_LEVELUP',		1,			26, 			'ABILITY_ATLAS', 	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_MARKED_FOR_DEATH');		

INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_PROMOTION_CREATED', 'Created'),
		('TXT_KEY_PROMOTION_CREATED_HELP', ' '),
		('TXT_KEY_PROMOTION_MARKED_FOR_DEATH', 'Marked for death'),
		('TXT_KEY_PROMOTION_MARKED_FOR_DEATH_HELP', ' ');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class, PrereqTech,	Combat,	Cost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	Description,					Civilopedia,						Strategy,								Help,								MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex,	IconAtlas,					MoveRate)
SELECT	('UNIT_LUNG_CAMQUAN'),	Class, PrereqTech,	Combat,	Cost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	('TXT_KEY_UNIT_LUNG_CAMQUAN'),	('TXT_KEY_UNIT_LUNG_CAMQUAN_TEXT'),	('TXT_KEY_UNIT_LUNG_CAMQUAN_STRATEGY'),	('TXT_KEY_UNIT_LUNG_CAMQUAN_HELP'),	MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		('ART_DEF_UNIT_LUNG_CAMQUAN'),	0,					('UNIT_FLAG_LUNG_CAMQUAN'),	2,				('LUNG_DAIVIET_ICON_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_KNIGHT');
------------------------------
-- UnitGameplay2DScripts
------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_LUNG_CAMQUAN', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';
------------------------------
-- Unit_AITypes
------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_LUNG_CAMQUAN', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
------------------------------
-- Unit_Flavors
------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_LUNG_CAMQUAN', FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	('UNIT_LUNG_CAMQUAN'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_KNIGHT');
------------------------------
-- Unit_FreePromotions
------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_LUNG_CAMQUAN', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_LUNG_CAMQUAN', 'PROMOTION_CAMQUAN'),
		('UNIT_LUNG_CAMQUAN', 'PROMOTION_AMPHIBIOUS');

DELETE from Unit_FreePromotions WHERE UnitType = 'UNIT_LUNG_CAMQUAN' and PromotionType = 'PROMOTION_NO_DEFENSIVE_BONUSES';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_LUNG_DAI_VIET',	'TXT_KEY_LEADER_LUNG_DAI_VIET',	'TXT_KEY_LEADER_LUNG_DAI_VIET_PEDIA',		'TXT_KEY_LEADER_LUNG_DAI_VIET_PEDIA',	 'Lung_DaiVietScene.xml',	6, 						3, 						7, 							4, 			8, 				6, 				6, 						6, 				7, 			5, 			4, 				6, 			4, 			'LUNG_DAIVIET_ICON_ATLAS',	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				 MajorCivApproachType, 				Bias)
VALUES	('LEADER_LUNG_DAI_VIET',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_LUNG_DAI_VIET',	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_LUNG_DAI_VIET',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_LUNG_DAI_VIET',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_LUNG_DAI_VIET',	'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_LUNG_DAI_VIET',	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_LUNG_DAI_VIET',	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				 MinorCivApproachType, 				Bias)
VALUES	('LEADER_LUNG_DAI_VIET',	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_LUNG_DAI_VIET',	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_LUNG_DAI_VIET',	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
		('LEADER_LUNG_DAI_VIET',	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_LUNG_DAI_VIET',	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_LUNG_DAI_VIET',	'FLAVOR_OFFENSE', 					4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_DEFENSE', 					9),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_CITY_DEFENSE', 				10),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_RECON', 					3),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_RANGED', 					5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_MOBILE', 					6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_NAVAL', 					7),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_NAVAL_RECON', 				5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_AIR', 						4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_EXPANSION', 				6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_GROWTH', 					8),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_PRODUCTION', 				5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_GOLD', 						4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_SCIENCE', 					8),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_CULTURE', 					8),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_HAPPINESS', 				6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_WONDER', 					6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_RELIGION', 					5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_SPACESHIP', 				5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_NUKE', 						4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_USE_NUKE', 					7),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_AIRLIFT', 					5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_I_TRADE_DESTINATION', 		4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_I_TRADE_ORIGIN', 			6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_ARCHAEOLOGY', 				8),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_AIR_CARRIER', 				4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_LUNG_DAI_VIET',	'TRAIT_LUNG_DAIVIET');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits
			(Type,					Description,					ShortDescription)
VALUES		('TRAIT_LUNG_DAIVIET',	'TXT_KEY_TRAIT_LUNG_DAIVIET',	'TXT_KEY_TRAIT_LUNG_DAIVIET_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses 
			(LeaderType, 			ResponseType, 											Response, 																	Bias)
VALUES		('LEADER_LUNG_DAI_VIET', 	'RESPONSE_FIRST_GREETING', 								'TXT_KEY_LEADER_LUNG_DAI_VIET_FIRSTGREETING%', 									2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_DEFEATED', 									'TXT_KEY_LEADER_LUNG_DAI_VIET_DEFEATED%', 											2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_REPEAT_TOO_MUCH', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_REPEAT_TOO_MUCH%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_REPEAT_TRADE_TOO_MUCH', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_REPEAT_TRADE_TOO_MUCH%', 							2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_REPEAT', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_REPEAT_TOO_MUCH%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_HELLO', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HOSTILE_HELLO%', 							2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_POLITE_HELLO', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_POLITE_HELLO%', 							2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_HUMAN_AT_WAR', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HOSTILE_HUMAN_AT_WAR%', 					2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HUMAN_AT_WAR', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HUMAN_AT_WAR%', 							2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 		'TXT_KEY_LEADER_LUNG_DAI_VIET_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 				2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_AGGRESSIVE_MILITARY', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_AGGRESSIVE_MILITARY_WARNING%', 						2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING', 	'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING%', 			2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_AGGRESSIVE_PLOT_BUYING', 			'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_AGGRESSIVE_PLOT_BUYING%', 					2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_EXPANSION', 		'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HOSTILE_AGGRESSIVE_EXPANSION%', 			2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_AGGRESSIVE_EXPANSION', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_AGGRESSIVE_EXPANSION%', 					2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_FRIENDLY_STRONG_MILITARY', 			'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_FRIENDLY_STRONG_MILITARY%', 				2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_FRIENDLY_STRONG_ECONOMY', 			'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_FRIENDLY_STRONG_ECONOMY%', 					2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_HUMAN_FEW_CITIES', 			'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HOSTILE_HUMAN_FEW_CITIES%', 				2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_HUMAN_SMALL_ARMY', 			'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HOSTILE_HUMAN_SMALL_ARMY%', 				2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_GREETING_HOSTILE_HUMAN_IS_WARMONGER', 		'TXT_KEY_LEADER_LUNG_DAI_VIET_GREETING_HOSTILE_HUMAN_IS_WARMONGER%', 				2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_TOO_SOON_FOR_DOF', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_TOO_SOON_FOR_DOF%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_RESPONSE_TO_BEING_DENOUNCED%', 						2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_WORK_AGAINST_SOMEONE', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_DENOUNCE%', 											2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_AI_DOF_BACKSTAB', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_DENOUNCE%', 											2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_RESPONSE_TO_BEING_DENOUNCED%', 						2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_DOFED_FRIEND', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_HUMAN_DOFED_FRIEND%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_DOFED_ENEMY', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_HUMAN_DOFED_ENEMY%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_DENOUNCED_ENEMY', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_HUMAN_DENOUNCED_ENEMY%', 							2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_DENOUNCED_FRIEND', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_HUMAN_DENOUNCED_FRIEND%', 							2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_DOF_SO_AI_DOF', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_HUMAN_DOF_SO_AI_DOF%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_DENOUNCE_SO_AI_DENOUNCE', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_HUMAN_DENOUNCE_SO_AI_DENOUNCE%', 					2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_DOF_SO_AI_DENOUNCE', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_HUMAN_DOF_SO_AI_DENOUNCE%', 							2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_WORK_WITH_US', 								'TXT_KEY_LEADER_LUNG_DAI_VIET_DEC_FRIENDSHIP%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_PLOT_BUYING_WARNING', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_PLOT_BUYING_WARNING%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_PLOT_BUYING_SERIOUS_WARNING%', 						2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_EXPANSION_SERIOUS_WARNING', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_EXPANSION_SERIOUS_WARNING%', 						2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_EXPANSION_WARNING', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_EXPANSION_WARNING%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_AGGRESSIVE_MILITARY_WARNING%', 						2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_RETURNED_CIVILIAN', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_RETURNED_CIVILIAN%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_DECLARATION_PROTECT_CITY_STATE', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_DECLARATION_PROTECT_CITY_STATE%', 					2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_DECLARATION_ABANDON_CITY_STATE', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_DECLARATION_ABANDON_CITY_STATE%', 					2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_DONT_SETTLE_YES', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_DONT_SETTLE_YES%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_DONT_SETTLE_NO', 								'TXT_KEY_LEADER_LUNG_DAI_VIET_DONT_SETTLE_NO%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_LUXURY_TRADE', 								'TXT_KEY_LEADER_LUNG_DAI_VIET_LUXURY_TRADE%', 										2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_OPEN_BORDERS_EXCHANGE', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_OPEN_BORDERS_EXCHANGE%', 							2),	
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_REQUEST', 									'TXT_KEY_LEADER_LUNG_DAI_VIET_RESPONSE_REQUEST%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_HOSTILE', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_HOSTILE%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_WEAK_HOSTILE', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_HOSTILE%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_STRONG_HOSTILE', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_HOSTILE%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_EXCITED', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_EXCITED%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_WEAK_EXCITED', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_EXCITED%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_STRONG_EXCITED', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_EXCITED%', 									2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_SAD', 								'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_SAD%', 										2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_ATTACKED_BETRAYED', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_ATTACKED_BETRAYED%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_TOO_SOON_NO_PEACE', 							'TXT_KEY_LEADER_LUNG_DAI_VIET_TOO_SOON_NO_PEACE%', 								2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_GOOD',	'TXT_KEY_LEADER_LUNG_DAI_VIET_GOOD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING_BAD',				'TXT_KEY_LEADER_LUNG_DAI_VIET_GOOD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_BAD',				'TXT_KEY_LEADER_LUNG_DAI_VIET_GOOD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_WE_ATTACKED_MINOR_BAD',						'TXT_KEY_LEADER_LUNG_DAI_VIET_GOOD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_BAD', 	'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_ATTACKED_MINOR_BAD', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_BAD', 		'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_BAD', 		'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_PLOT_BUYING_WARNING_BAD', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_AGGRESSIVE_MILITARY_WARNING_GOOD', 			'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_GOOD', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_WE_ATTACKED_MINOR_GOOD', 						'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_ATTACKED_MINOR_GOOD', 					'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_GOOD', 		'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_GOOD', 		'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2),
			('LEADER_LUNG_DAI_VIET', 	'RESPONSE_HUMAN_PLOT_BUYING_WARNING_GOOD', 				'TXT_KEY_LEADER_LUNG_DAI_VIET_BAD%', 												2);			
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description,						 ShortDescription,							Adjective,								Civilopedia, 							CivilopediaTag, 				 DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,  MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_LUNG_DAI_VIET',		'TXT_KEY_CIV_LUNG_DAI_VIET_DESC',	 'TXT_KEY_CIV_LUNG_DAI_VIET_SHORT_DESC',	'TXT_KEY_CIV_LUNG_DAI_VIET_ADJECTIVE',	'TXT_KEY_CIV5_LUNG_DAI_VIET_TEXT_1', 	'TXT_KEY_CIV5_LUNG_DAI_VIET',	 'PLAYERCOLOR_LUNG_DAI_VIET',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'LUNG_DAIVIET_ICON_ATLAS',	0,				'LUNG_DAIVIET_ALPHA_ATLAS',	'Siam', 		'Lung_DaiVietMap.dds',		'TXT_KEY_CIV5_DAWN_LUNG_DAI_VIET_TEXT',	'Lung_DaiVietDOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_01'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_02'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_03'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_04'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_05'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_06'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_07'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_08'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_09'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_10'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_11'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_12'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_13'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_14'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_15'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_16'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_17'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_18'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_19'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_20'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_21'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_22'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_23'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_24'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_25'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_26'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_27'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_28'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_29'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_30'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_31'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_32'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_33'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_34'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_35'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_36'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_37'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_38'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_39'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_40'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_41'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_42'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_43'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_44'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_45'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_46'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_47'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_CITY_NAME_LUNG_DAI_VIET_48');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_LUNG_DAI_VIET', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_LUNG_DAI_VIET', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_LUNG_DAI_VIET', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_LUNG_DAI_VIET',	'LEADER_LUNG_DAI_VIET');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_LUNG_DAI_VIET',	'BUILDINGCLASS_ARMORY',	'BUILDING_LUNG_VOMIEU');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 		UnitType)
VALUES	('CIVILIZATION_LUNG_DAI_VIET',	'UNITCLASS_KNIGHT',	'UNIT_LUNG_CAMQUAN');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT 	'CIVILIZATION_LUNG_DAI_VIET',	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Along_River 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Along_River 
		(CivilizationType, 					StartAlongRiver)
VALUES	('CIVILIZATION_LUNG_DAI_VIET', 		1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Avoid
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_LUNG_DAI_VIET', 		'REGION_TUNDRA'),
		('CIVILIZATION_LUNG_DAI_VIET', 		'REGION_DESERT');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_0'),	
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_1'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_2'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_3'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_4'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_5'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_6'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_7'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_8'),
		('CIVILIZATION_LUNG_DAI_VIET',	'TXT_KEY_SPY_NAME_LUNG_DAI_VIET_9');
--==========================================================================================================================
--==========================================================================================================================