--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_UC_SUGUBA_DUMMY',  		'BUILDING_UC_SUGUBA_DUMMY', 		null),
		('BUILDINGCLASS_UC_ASKIA_DUMMY',  		'BUILDING_UC_ASKIA_DUMMY', 		null);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
-- Buildings
-----------------------------	
INSERT INTO Buildings 
		(Type, 											BuildingClass, 				 	Cost, FaithCost, UnlockedByBelief, GoldMaintenance,  FreeStartEra,	 PrereqTech,			Help, 												Description,							Civilopedia, 							 Strategy, 										 ArtDefineTag, MinAreaSize, HurryCostModifier,	IconAtlas,						ConquestProb, PortraitIndex, TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, SpecialistType, SpecialistCount)
SELECT	'BUILDING_UC_SUGUBA',			BuildingClass,			 	Cost, FaithCost, UnlockedByBelief, GoldMaintenance,				 FreeStartEra,	 PrereqTech,			'TXT_KEY_BUILDING_HELP_UC_SUGUBA',		'TXT_KEY_BUILDING_UC_SUGUBA',	'TXT_KEY_UC_SUGUBA_TEXT',  'TXT_KEY_BUILDING_UC_SUGUBA_STRATEGY', ArtDefineTag, MinAreaSize, HurryCostModifier,	'UC_SONGHAI_ATLAS',	0, 3, 100, 200, 'SPECIALIST_MERCHANT', 1
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	

INSERT INTO Buildings		
		(Type, 								BuildingClass, 			  	Cost,  FaithCost, GreatWorkCount,  Description, 				 Help,								NeverCapture,	TradeRouteLandGoldBonus)
VALUES	('BUILDING_UC_SUGUBA_DUMMY', 				'BUILDINGCLASS_UC_SUGUBA_DUMMY', 	-1,    -1,		  -1,			   null,  null,	1, 200);

INSERT INTO Buildings		
		(Type, 								BuildingClass, 			  	Cost,  FaithCost, GreatWorkCount,  Description, 				 Help,								NeverCapture,	TradeRouteRecipientBonus,	TradeRouteTargetBonus)
VALUES	('BUILDING_UC_ASKIA_DUMMY', 				'BUILDINGCLASS_UC_ASKIA_DUMMY', 	-1,    -1,		  -1,			   null,  null,	1, 1, 1);

UPDATE Buildings
SET  GreatWorkCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', Description = 'TXT_KEY_BUILDING_UC_MPM', Help = 'TXT_KEY_BUILDING_HELP_UC_MPM', Strategy = 'TXT_KEY_BUILDING_STRATEGY_UC_MPM'
WHERE Type = 'BUILDING_MUD_PYRAMID_MOSQUE';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,			Flavor)
SELECT	'BUILDING_UC_SUGUBA', 	FlavorType,			Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CARAVANSARY';
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 							Help, 										Sound, 				CityAttack, CannotBeChosen, LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_UC_SONGHAI_SIEGE', 		Description, 							Help, 										Sound, 	CityAttack,			1, 				0, 				 PortraitIndex, 				IconAtlas, 			PediaType, 			PediaEntry
FROM UnitPromotions WHERE Type = 'PROMOTION_SIEGE';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	                                                                                                                                                                                                                                                            
		(Type, 						Class,	WorkRate,	Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		Description,						Help,									Strategy,									Civilopedia,							 AdvancedStartCost, WorkRate, CombatLimit,  DontShowYields,  UnitArtInfo,						UnitFlagAtlas,							UnitFlagIconOffset, IconAtlas,			PortraitIndex,	MoveRate)
SELECT	'UNIT_UC_HI_KOI',	Class,	WorkRate, Cost, Moves, CivilianAttackPriority, Special, Domain, 'UNITAI_ADMIRAL',	'TXT_KEY_UNIT_UC_HI_KOI',	'TXT_KEY_UNIT_UC_HI_KOI_HELP',	'TXT_KEY_UNIT_UC_HI_KOI_STRATEGY',	'TXT_KEY_CIV5_UC_HI_KOI_TEXT', AdvancedStartCost, WorkRate, CombatLimit,  DontShowYields,  'ART_DEF_UNIT_UC_HI_KOI',	'UC_HI_KOI_ATLAS',	0,					'UC_SONGHAI_ATLAS',	2,				MoveRate
FROM Units WHERE Type = 'UNIT_GREAT_ADMIRAL';							 
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_UC_HI_KOI', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_ADMIRAL';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_UC_HI_KOI', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_ADMIRAL';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_UC_HI_KOI', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_ADMIRAL';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_UC_HI_KOI', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_ADMIRAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 					UniqueName)
VALUES	('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_01'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_02'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_03'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_04'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_05'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_06'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_08'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_09'),
		('UNIT_UC_HI_KOI',	'TXT_KEY_GREAT_PERSON_UC_HI_KOI_10');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 									Description, 							Civilopedia, 								 CivilopediaTag, 										ArtDefineTag, 							VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 							PortraitIndex)
VALUES	('LEADER_UC_SONNI_ALI', 			'TXT_KEY_LEADER_UC_SONNI_ALI',	'TXT_KEY_CIVILOPEDIA_LEADERS_UC_SONNI_ALI',	 'TXT_KEY_CIVILOPEDIA_LEADERS_UC_SONNI_ALI', 	'SonniAli.xml',	7, 						7, 						4, 							6, 			8, 				3, 				3, 						6, 				6, 			3, 			3, 				4, 			3, 			'UC_SONGHAI_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 							MajorCivApproachType, 				Bias)
VALUES	('LEADER_UC_SONNI_ALI', 			'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_UC_SONNI_ALI', 			'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_UC_SONNI_ALI', 			'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_UC_SONNI_ALI', 			'MAJOR_CIV_APPROACH_GUARDED', 		3),
		('LEADER_UC_SONNI_ALI', 			'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_UC_SONNI_ALI', 			'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_UC_SONNI_ALI', 			'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------								
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 							MinorCivApproachType, 				Bias)
VALUES	('LEADER_UC_SONNI_ALI', 			'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_UC_SONNI_ALI', 			'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_UC_SONNI_ALI', 			'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_UC_SONNI_ALI', 			'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_UC_SONNI_ALI', 			'MINOR_CIV_APPROACH_BULLY', 		8);
--------------------------------		
-- Leader_Flavors
--------------------------------									
INSERT INTO Leader_Flavors 
		(LeaderType, 							FlavorType, 						Flavor)
VALUES	('LEADER_UC_SONNI_ALI', 			'FLAVOR_OFFENSE', 					9),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_DEFENSE', 					5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_RECON', 					8),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_RANGED', 					5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_MOBILE', 					5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_NAVAL', 					10),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_NAVAL_RECON', 				10),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_NAVAL_GROWTH', 				9),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_AIR', 						7),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_EXPANSION', 				9),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_GROWTH', 					5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_PRODUCTION', 				5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_GOLD', 						8),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_SCIENCE', 					5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_CULTURE', 					5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_HAPPINESS', 				6),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_WONDER', 					4),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_RELIGION', 					4),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_DIPLOMACY', 				5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_SPACESHIP', 				5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_WATER_CONNECTION', 			9),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_NUKE', 						8),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_USE_NUKE', 					7),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_ESPIONAGE', 				8),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_AIRLIFT', 					5),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_I_TRADE_DESTINATION', 		7),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_UC_SONNI_ALI', 			'FLAVOR_AIR_CARRIER', 				6);
--------------------------------		
-- Leader_Traits
--------------------------------		
UPDATE Leader_Traits 
SET TraitType = 'TRAIT_UC_TIMBUKTU'
WHERE LeaderType = 'LEADER_ASKIA';

INSERT INTO Leader_Traits 
		(LeaderType, 							TraitType)
VALUES	('LEADER_UC_SONNI_ALI', 			'TRAIT_AMPHIB_WARLORD');

INSERT INTO Traits 
			(Type, 									Description, 									ShortDescription)
VALUES		('TRAIT_UC_TIMBUKTU', 		'TXT_KEY_TRAIT_UC_TIMBUKTU', 		'TXT_KEY_TRAIT_UC_TIMBUKTU_SHORT');

UPDATE Traits 
SET Description = 'TXT_KEY_TRAIT_UC_AMPHIB_WARLORD'
WHERE Type = 'TRAIT_AMPHIB_WARLORD';	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 									 Description,	ShortDescription,  Adjective,  DerivativeCiv,			Civilopedia, CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas,							SoundtrackTag,  MapImage, 							DawnOfManQuote, 									DawnOfManImage)
SELECT	'CIVILIZATION_UC_SONGHAI',  Description,	ShortDescription,  Adjective,  'CIVILIZATION_SONGHAI',	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_UC_SONGHAI', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'UC_SONGHAI_ATLAS',	0,				'UC_SONGHAI_ALPHA_ATLAS',	SoundtrackTag, 		'SonniMap.dds',	'TXT_KEY_CIV5_DAWN_UC_SONGHAI_TEXT',	'SonniDoM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
SELECT 'CIVILIZATION_UC_SONGHAI', CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	'CIVILIZATION_UC_SONGHAI', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	'CIVILIZATION_UC_SONGHAI', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_UC_SONGHAI', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_UC_SONGHAI',	'LEADER_UC_SONNI_ALI');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_UC_SONGHAI', 	'UNITCLASS_GREAT_ADMIRAL',		'UNIT_UC_HI_KOI');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_UC_SONGHAI', 	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_UC_SUGUBA');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
VALUES	('CIVILIZATION_UC_SONGHAI', 	'RELIGION_ISLAM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
SELECT 'CIVILIZATION_UC_SONGHAI', SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------
INSERT INTO Civilization_Start_Along_River
		(CivilizationType,	StartAlongRiver)
VALUES ('CIVILIZATION_UC_SONGHAI',	1);
--==========================================================================================================================	
-- GREAT WORKS
--==========================================================================================================================
--------------------------------	
-- GreatWorkClasses
--------------------------------
INSERT INTO GreatWorkClasses
		(Type,	SlotType)
VALUES ('GREAT_WORK_UC_MANUSCRIPT', 'GREAT_WORK_SLOT_LITERATURE');
--==========================================================================================================================
-- UC_Songhai_GreatWorks
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS UC_Songhai_GreatWorks(numWorks INTEGER DEFAULT 0);
INSERT INTO UC_Songhai_GreatWorks(numWorks) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50);	
--------------------------------	
-- GreatWorks
--------------------------------
INSERT INTO GreatWorks
		(Type,		Description,	GreatWorkClassType,		Image)
SELECT	'GREAT_WORK_UC_SONGHAI_MANUSCRIPT_'||numWorks, 'TXT_KEY_TRAIT_UC_TIMBUKTU_SHORT', 'GREAT_WORK_UC_MANUSCRIPT',	'SonghaiManuscript.dds'
FROM UC_Songhai_GreatWorks;