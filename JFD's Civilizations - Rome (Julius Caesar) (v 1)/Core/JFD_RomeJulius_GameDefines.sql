--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 									GoldenAgeValueFromKills,	NearbyEnemyCombatMod,		NearbyEnemyCombatRange,		Description, 									Help, 												Sound, 				CannotBeChosen, LostWithUpgrade,	IconAtlas, 							PortraitIndex,	PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_BALLISTA', 				0,							10,							1,							'TXT_KEY_PROMOTION_JFD_BALLISTA',				'TXT_KEY_PROMOTION_JFD_BALLISTA_HELP',				'AS2D_IF_LEVELUP', 	1, 				0, 					'ABILITY_ATLAS', 					59, 			'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BALLISTA'),
		('PROMOTION_JFD_PRAETORIAN_ACTIVE', 	100,						0,							0,							'TXT_KEY_PROMOTION_JFD_PRAETORIAN_ACTIVE',		'TXT_KEY_PROMOTION_JFD_PRAETORIAN_ACTIVE_HELP',		'AS2D_IF_LEVELUP', 	1, 				0, 					'JFD_ROME_JULIUS_PROMOTION_ATLAS', 	0,				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PRAETORIAN'),
		('PROMOTION_JFD_PRAETORIAN_INACTIVE', 	0,							0,							0,							'TXT_KEY_PROMOTION_JFD_PRAETORIAN_INACTIVE',	'TXT_KEY_PROMOTION_JFD_PRAETORIAN_INACTIVE_HELP',	'AS2D_IF_LEVELUP', 	1, 				0, 					'ABILITY_ATLAS', 					58,				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PRAETORIAN');

INSERT INTO UnitPromotions 
		(Type, 									GoldenAgeValueFromKills,	NearbyEnemyCombatMod,		NearbyEnemyCombatRange,		Description, 									Help, 												Sound, 				CannotBeChosen, LostWithUpgrade,	IconAtlas, 							PortraitIndex,	PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_DICTATOR_PERPETUO',		0,							0,							0,							'TXT_KEY_PROMOTION_JFD_DICTATOR_PERPETUO',		'TXT_KEY_PROMOTION_JFD_DICTATOR_PERPETUO_HELP',		'AS2D_IF_LEVELUP', 	1, 				0, 					'ABILITY_ATLAS', 					59, 			'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DICTATOR_PERPETUO'
WHERE NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombatMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType, 				UnitCombatType,			Modifier)
VALUES	('PROMOTION_JFD_BALLISTA',		'UNITCOMBAT_ARCHER',	25),
		('PROMOTION_JFD_BALLISTA',		'UNITCOMBAT_GUN',		25),
		('PROMOTION_JFD_BALLISTA',		'UNITCOMBAT_MELEE',		25),
		('PROMOTION_JFD_BALLISTA',		'UNITCOMBAT_MOUNTED',	25),
		('PROMOTION_JFD_BALLISTA',		'UNITCOMBAT_RECON',		25);
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					PrereqTech,	Class, Combat,	 RangedCombat, CombatClass, Cost,    Moves, Range, Domain, DefaultUnitAI, Description, 					Help, 								Strategy, 								Civilopedia, 						SpecialCargo,			DomainCargo,	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagAtlas,					UnitFlagIconOffset, IconAtlas,					 PortraitIndex,  MoveRate)
SELECT	'UNIT_JFD_PRAETORIAN',	PrereqTech,	Class, Combat+3, RangedCombat, CombatClass, Cost+10, Moves, Range, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_PRAETORIAN', 'TXT_KEY_UNIT_HELP_JFD_PRAETORIAN', 'TXT_KEY_UNIT_JFD_PRAETORIAN_STRATEGY', 'TXT_KEY_UNIT_JFD_PRAETORIAN_TEXT', 'SPECIALUNIT_FIGHTER',	'DOMAIN_AIR',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JFD_PRAETORIAN', 	'JFD_ROME_JULIUS_FLAG_ATLAS',	0,					'JFD_ROME_JULIUS_ATLAS',	 4, 			 MoveRate
FROM Units WHERE Type = 'UNIT_SWORDSMAN';

UPDATE Units
SET Help = 'TXT_KEY_UNIT_HELP_JFD_BALLISTA', Strategy = 'TXT_KEY_UNIT_JFD_BALLISTA_STRATEGY', Combat = Combat-1, RangedCombat = RangedCombat-2
WHERE Type = 'UNIT_ROMAN_BALLISTA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_UNITS_BALLISTA_CHANGE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_PRAETORIAN', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';	
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_PRAETORIAN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_JFD_PRAETORIAN',	ResourceType, 2
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_PRAETORIAN',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ROMAN_BALLISTA' AND PromotionType = 'PROMOTION_CITY_ASSAULT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_UNITS_BALLISTA_CHANGE' AND Value = 1);	
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_ROMAN_BALLISTA',	'PROMOTION_JFD_BALLISTA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_UNITS_BALLISTA_CHANGE' AND Value = 1);	

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_ROMAN_BALLISTA',	'PROMOTION_CITY_SIEGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_UNITS_BALLISTA_CHANGE' AND Value = 1);	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_PRAETORIAN',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_PRAETORIAN', 'PROMOTION_JFD_PRAETORIAN_INACTIVE'),
		('UNIT_JFD_PRAETORIAN', 'PROMOTION_GENERAL_STACKING');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_ROME_JULIUS', 	'TXT_KEY_TRAIT_JFD_ROME_JULIUS',	'TXT_KEY_TRAIT_JFD_ROME_JULIUS_SHORT');
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policies
		(Type, 						Description,							BarbarianCombatBonus)
VALUES	('POLICY_JFD_ROME_JULIUS', 	'TXT_KEY_TRAIT_JFD_ROME_JULIUS_SHORT',	25);
--------------------------------------------------------------------------------------------------------------------------
--Civilization_FreePolicies
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_FreePolicies (
	CivilizationType  				text 	REFERENCES Civilizations(Type) 	default null,
	PolicyType						text 	REFERENCES Policies(Type) 		default null);	

INSERT INTO Civilization_FreePolicies
		(CivilizationType,					PolicyType)
VALUES	('CIVILIZATION_JFD_ROME_JULIUS',	'POLICY_JFD_ROME_JULIUS');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			 VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_JULIUS', 		'TXT_KEY_LEADER_JFD_JULIUS', 	'TXT_KEY_LEADER_JFD_JULIUS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_JULIUS', 	'JFD_Julius_Scene.xml',	 8, 					 4, 						4, 							7, 			6, 				3, 				3, 						4, 				6, 			5, 			4, 				3, 			2, 			'JFD_ROME_JULIUS_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_JULIUS', 		'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_JULIUS', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_JULIUS', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_JFD_JULIUS', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_JULIUS', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_JFD_JULIUS', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_JULIUS', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_JULIUS', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_JULIUS', 		'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_JFD_JULIUS', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_JULIUS', 		'MINOR_CIV_APPROACH_CONQUEST', 		7);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_JULIUS', 		'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_JULIUS', 		'FLAVOR_DEFENSE', 					3),
		('LEADER_JFD_JULIUS', 		'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_JULIUS', 		'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_JULIUS', 		'FLAVOR_RECON', 					5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_RANGED', 					4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_JULIUS', 		'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_AIR', 						4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_JULIUS', 		'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_JFD_JULIUS', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_JULIUS', 		'FLAVOR_GOLD', 						6),
		('LEADER_JFD_JULIUS', 		'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_WONDER', 					3),
		('LEADER_JFD_JULIUS', 		'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_JULIUS', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_JULIUS', 		'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_JULIUS', 		'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_JFD_JULIUS', 		'FLAVOR_NUKE', 						2),
		('LEADER_JFD_JULIUS', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_JULIUS', 		'FLAVOR_ESPIONAGE', 				6),
		('LEADER_JFD_JULIUS', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_JULIUS', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_JULIUS', 		'TRAIT_JFD_ROME_JULIUS');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 				ResponseType, 									Response, 															Bias)
VALUES 	('LEADER_JFD_JULIUS', 		'RESPONSE_ATTACKED_HOSTILE', 					'TXT_KEY_LEADER_JFD_JULIUS_ATTACKED_GENERIC%', 						500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_DEFEATED', 							'TXT_KEY_LEADER_JFD_JULIUS_DEFEATED%', 								500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_DOW_GENERIC', 						'TXT_KEY_LEADER_JFD_JULIUS_DOW_GENERIC%', 							500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_DOW_LAND',							'TXT_KEY_LEADER_JFD_JULIUS_DOW_LAND%',	 							500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_DOW_WORLD_CONQUEST',					'TXT_KEY_LEADER_JFD_JULIUS_DOW_WORLD_CONQUEST%',	 				500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_EXPANSION_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_JULIUS_EXPANSION_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_FIRST_GREETING', 						'TXT_KEY_LEADER_JFD_JULIUS_FIRSTGREETING%', 						500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_GREETING_AT_WAR_HOSTILE', 			'TXT_KEY_LEADER_JFD_JULIUS_GREETING_AT_WAR_HOSTILE%', 				500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_GREETING_POLITE_HELLO', 				'TXT_KEY_LEADER_JFD_JULIUS_GREETING_POLITE_HELLO%', 				500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_GREETING_NEUTRAL_HELLO', 				'TXT_KEY_LEADER_JFD_JULIUS_GREETING_NEUTRAL_HELLO%', 				500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_GREETING_HOSTILE_HELLO', 				'TXT_KEY_LEADER_JFD_JULIUS_GREETING_HOSTILE_HELLO%', 				500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_JFD_JULIUS_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_INFLUENTIAL_ON_AI', 					'TXT_KEY_LEADER_JFD_JULIUS_INFLUENTIAL_ON_AI%', 					500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_INFLUENTIAL_ON_HUMAN', 				'TXT_KEY_LEADER_JFD_JULIUS_INFLUENTIAL_ON_HUMAN%', 					500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_INSULT_GENERIC', 						'TXT_KEY_LEADER_JFD_JULIUS_INSULT_GENERIC%', 						500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_INSULT_MILITARY', 					'TXT_KEY_LEADER_JFD_JULIUS_INSULT_MILITARY%', 						500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_LETS_HEAR_IT', 						'TXT_KEY_LEADER_JFD_JULIUS_LETS_HEAR_IT%', 							500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_LUXURY_TRADE', 						'TXT_KEY_LEADER_JFD_JULIUS_LUXURY_TRADE%', 							500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_NO_PEACE', 							'TXT_KEY_LEADER_JFD_JULIUS_NO_PEACE%', 								500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_OPEN_BORDERS_EXCHANGE', 				'TXT_KEY_LEADER_JFD_JULIUS_OPEN_BORDERS_EXCHANGE%', 				500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS', 		'TXT_KEY_LEADER_JFD_JULIUS_LOSEWAR%', 								500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_REPEAT_NO', 							'TXT_KEY_LEADER_JFD_JULIUS_REPEAT_NO%', 							500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_RESPONSE_REQUEST', 					'TXT_KEY_LEADER_JFD_JULIUS_RESPONSE_REQUEST%', 						500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 		'TXT_KEY_LEADER_JFD_JULIUS_RESPONSE_TO_BEING_DENOUNCED%', 			500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_TOO_SOON_NO_PEACE', 					'TXT_KEY_LEADER_JFD_JULIUS_TOO_SOON_NO_PEACE_1%', 					500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_WINNER_PEACE_OFFER', 					'TXT_KEY_LEADER_JFD_JULIUS_WINWAR%', 								500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_WORK_AGAINST_SOMEONE', 				'TXT_KEY_LEADER_JFD_JULIUS_DENOUNCE%', 								500),
		('LEADER_JFD_JULIUS', 		'RESPONSE_WORK_WITH_US', 						'TXT_KEY_LEADER_JFD_JULIUS_DEC_FRIENDSHIP%', 						500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 							DerivativeCiv,		 Description, ShortDescription, Adjective, Civilopedia, CivilopediaTag, DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				 PortraitIndex,  AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JFD_ROME_JULIUS', 'CIVILIZATION_ROME', Description, ShortDescription,	Adjective, Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_ROME_JULIUS',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_ROME_JULIUS_ATLAS',  0, 			 'JFD_ROME_JULIUS_ALPHA_ATLAS',  'Japan', 		'JFD_MapRomeJulius512.dds',	'TXT_KEY_CIV_JFD_ROME_JULIUS_DAWN', 'JFD_DOM_RomeJulius.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ROME';

UPDATE Civilizations 
SET AIPlayable = 0, Playable = 0
WHERE Type = 'CIVILIZATION_ROME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_ROME_DISABLE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
SELECT	'CIVILIZATION_JFD_ROME_JULIUS', 	CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_ROME_JULIUS',		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_ROME_JULIUS',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_ROME_JULIUS',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_ROME_JULIUS', 	'LEADER_JFD_JULIUS');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_ROME_JULIUS', 	'UNITCLASS_SWORDSMAN', 	'UNIT_JFD_PRAETORIAN'),
		('CIVILIZATION_JFD_ROME_JULIUS', 	'UNITCLASS_CATAPULT',	'UNIT_ROMAN_BALLISTA');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
SELECT	'CIVILIZATION_JFD_ROME_JULIUS',		ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
SELECT	'CIVILIZATION_JFD_ROME_JULIUS',		SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_ROME';
--==========================================================================================================================
--==========================================================================================================================