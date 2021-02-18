--=======================================================================================================================
-- BUILDINGS
--=======================================================================================================================
-- BuildingClasses
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 										DefaultBuilding, 					 Description)
VALUES	('BUILDINGCLASS_JFD_FORUM_GREAT_PEOPLE',	'BUILDING_JFD_FORUM_GREAT_PEOPLE',	 'TXT_KEY_BUILDING_JFD_FORUM_GREAT_PEOPLE');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	SpecialistType, SpecialistCount,	TradeRouteRecipientBonus, TradeRouteTargetBonus, PrereqTech, Cost,	FaithCost,	GreatWorkCount,	GoldMaintenance, MinAreaSize,	Description, 					Help, 								 Strategy,								Civilopedia, 					ArtDefineTag, IconAtlas,				PortraitIndex)
SELECT	'BUILDING_JFD_FORUM',				BuildingClass,	SpecialistType, SpecialistCount+1,	TradeRouteRecipientBonus, TradeRouteTargetBonus, PrereqTech, Cost,	-1,			0,				GoldMaintenance, MinAreaSize,	'TXT_KEY_BUILDING_JFD_FORUM',	'TXT_KEY_BUILDING_JFD_FORUM_HELP',	 'TXT_KEY_BUILDING_JFD_FORUM_STRATEGY',	'TXT_KEY_CIV5_JFD_FORUM_TEXT',	ArtDefineTag, 'JFD_ROME_JULIUS_ATLAS',	3
FROM Buildings WHERE Type = 'BUILDING_MARKET';					 
																					 
INSERT INTO Buildings 																 
		(Type, 								BuildingClass,							 GreatPeopleRateModifier,	SpecialistCount,	GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,								Help, 											NeverCapture)
VALUES	('BUILDING_JFD_FORUM_GREAT_PEOPLE', 'BUILDINGCLASS_JFD_FORUM_GREAT_PEOPLE',	 25,						0,					-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_FORUM_GREAT_PEOPLE',	'TXT_KEY_BUILDING_JFD_FORUM_GREAT_PEOPLE_HELP',	1);											 
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,			Yield)
SELECT	'BUILDING_JFD_FORUM',		YieldType,			Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MARKET';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 				YieldType,			Yield)
SELECT	'BUILDING_JFD_FORUM',		YieldType,			Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_MARKET';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType,			Flavor)
SELECT	'BUILDING_JFD_FORUM',		FlavorType,			Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MARKET';	

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, 		Flavor)
VALUES	('BUILDING_JFD_FORUM', 		'FLAVOR_CULTURE', 	20);	
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 								ExperiencePercent,	NearbyEnemyCombatMod,		NearbyEnemyCombatRange,		Description, 								Help, 											Sound, 				CannotBeChosen, LostWithUpgrade,	IconAtlas, 							PortraitIndex,	PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_LEGION_ACTIVE', 	20,					0,							0,							'TXT_KEY_PROMOTION_JFD_LEGION_ACTIVE',		'TXT_KEY_PROMOTION_JFD_LEGION_ACTIVE_HELP',		'AS2D_IF_LEVELUP', 	1, 				1, 					'JFD_ROME_JULIUS_PROMOTION_ATLAS', 	0, 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEGION'),
		('PROMOTION_JFD_LEGION_INACTIVE', 	0,					0,							0,							'TXT_KEY_PROMOTION_JFD_LEGION_INACTIVE',	'TXT_KEY_PROMOTION_JFD_LEGION_INACTIVE_HELP',	'AS2D_IF_LEVELUP', 	1, 				1, 					'ABILITY_ATLAS', 					58, 			'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEGION');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Units
SET Description = 'TXT_KEY_UNIT_JFD_MILITES', Help = 'TXT_KEY_UNIT_HELP_JFD_MILITES', Strategy = 'TXT_KEY_UNIT_JFD_MILITES_STRATEGY', Civilopedia = 'TXT_KEY_UNIT_JFD_MILITES_TEXT', Combat = Combat-3
WHERE Type = 'UNIT_ROMAN_LEGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_UNITS_LEGION_CHANGE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_ROMAN_LEGION',	'PROMOTION_JFD_LEGION_INACTIVE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_UNITS_LEGION_CHANGE' AND Value = 1);	

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_ROMAN_LEGION',	'PROMOTION_MARCH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_UNITS_LEGION_CHANGE' AND Value = 1);	
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription,							CapitalBuildingModifier)
VALUES	('TRAIT_JFD_ROME_AUGUSTUS', 'TXT_KEY_TRAIT_JFD_ROME_AUGUSTUS',	'TXT_KEY_TRAIT_JFD_ROME_AUGUSTUS_SHORT',	15);
--------------------------------------------------------------------------------------------------------------------------
-- Trait_YieldChangesFromBuildingsAllCitiesUI
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Trait_YieldChangesFromBuildingsAllCitiesUI (
	TraitType 						text 		REFERENCES Traits(Type)			default null,
	BuildingType					text 		REFERENCES Buildings(Type)		default null,	
	YieldType 						text		REFERENCES Yields(Type)			default null,
	Yield							integer										default	0);

INSERT INTO Trait_YieldChangesFromBuildingsAllCitiesUI 
		(TraitType, 				YieldType, 			 Yield)
VALUES	('TRAIT_JFD_ROME_AUGUSTUS', 'YIELD_GOLDEN_AGE',	 2);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Leader_Traits WHERE LeaderType = 'LEADER_AUGUSTUS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_ROME_UA_CHANGE' AND Value = 1);	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
SELECT	'LEADER_AUGUSTUS', 		'TRAIT_JFD_ROME_AUGUSTUS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_ROME_UA_CHANGE' AND Value = 1);	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 		BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_ROME', 	'BUILDINGCLASS_MARKET', 'BUILDING_JFD_FORUM');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_ROME';
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 		UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_ROME', 	'UNITCLASS_SWORDSMAN',  'UNIT_ROMAN_LEGION');
--==========================================================================================================================
--==========================================================================================================================