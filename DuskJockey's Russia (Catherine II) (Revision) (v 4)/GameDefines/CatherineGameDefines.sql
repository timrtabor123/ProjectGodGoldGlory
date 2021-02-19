--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_PUBLIC_SCHOOL', BuildingType = 'BUILDING_DJ_FINISHING_SCHOOL'
WHERE CivilizationType = 'CIVILIZATION_RUSSIA';	
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================		
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_0'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_1'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_2'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_3'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_4'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_5'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_6'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_7'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_8'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_9'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_10'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_11'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_12'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_13'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_14'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_15'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_16'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_17'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_18'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_19'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_20'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_21'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_22'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_23'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_24'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_25'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_26'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_27'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_28'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_29'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_30'),
		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_DJ_RUSSIA_31');
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================
UPDATE Leader_Traits
SET TraitType = 'TRAIT_DJ_NAKAZ'
WHERE LeaderType = 'LEADER_CATHERINE';
--==========================================================================================================================	
-- Traits
--==========================================================================================================================		
INSERT INTO Traits
		(Type,				Description,				ShortDescription)
VALUES	('TRAIT_DJ_NAKAZ',	'TXT_KEY_TRAIT_DJ_NAKAZ',	'TXT_KEY_TRAIT_DJ_NAKAZ_SHORT');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================
INSERT or REPLACE INTO BuildingClasses
		(Type,								DefaultBuilding,						Description)
VALUES	('BUILDINGCLASS_DJ_CATHERINE_II',	'BUILDING_DJ_CATHERINE_PRODUCTION',		'TXT_KEY_BUILDING_SEAPORT');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation,	SpecialistCount,	SpecialistType,	Happiness,	Description, 								Civilopedia, 									Help, 											Strategy,											ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_DJ_FINISHING_SCHOOL'),	BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation,	SpecialistCount,	SpecialistType,	1,			('TXT_KEY_BUILDING_DJ_FINISHING_SCHOOL'),	('TXT_KEY_CIV5_BUILDING_DJ_FINISHING_SCHOOL'),	('TXT_KEY_BUILDING_DJ_FINISHING_SCHOOL_HELP'),	('TXT_KEY_BUILDING_DJ_FINISHING_SCHOOL_STRATEGY'),	ArtDefineTag, 0,				('DJ_CATHERINE_II_COLOR_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_PUBLIC_SCHOOL';

INSERT INTO Buildings
		(Type,									BuildingClass,						Cost,	FaithCost,	GreatWorkCount,	Description,								ArtDefineTag,				GreatPeopleRateModifier,	NeverCapture,	BuildingProductionModifier,	FreeBuildingThisCity,			Happiness,	ConquestProb,	NukeImmune,	HurryCostModifier,	MinAreaSize)
VALUES	('BUILDING_DJ_CATHERINE_PRODUCTION',	'BUILDINGCLASS_DJ_CATHERINE_II',	-1,		-1,			-1,				'TXT_KEY_TRAIT_DJ_NAKAZ_SHORT',				'ART_DEF_BUILDING_GARDEN',	0,							1,				5,							null,							0,			0,				1,			-1,					-1),
		('BUILDING_DJ_FINISHING_GP',			'BUILDINGCLASS_DJ_CATHERINE_II',	-1,		-1,			-1,				'TXT_KEY_BUILDING_DJ_FINISHING_SCHOOL',		'ART_DEF_BUILDING_GARDEN',	10,							1,				0,							'BUILDINGCLASS_PUBLIC_SCHOOL',	1,			0,				1,			-1,					-1);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 						BuildingClassType)
SELECT	('BUILDING_DJ_FINISHING_SCHOOL'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,	Yield)
SELECT	('BUILDING_DJ_FINISHING_SCHOOL'),	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType, 						YieldType,	Yield)
SELECT	('BUILDING_DJ_FINISHING_SCHOOL'),	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================
INSERT INTO Building_Flavors
		(BuildingType, 						FlavorType,	Flavor)
SELECT	('BUILDING_DJ_FINISHING_SCHOOL'),	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';