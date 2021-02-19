--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)					
VALUES		('TRAIT_SENSHI_WHITLAM', 	'TXT_KEY_TRAIT_SENSHI_WHITLAM', 	'TXT_KEY_TRAIT_SENSHI_WHITLAM_SHORT');

INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SENSHI_WHITLAM', 		'BUILDING_SENSHI_WHITLAM_GOLDEN_AGE',	'TXT_KEY_TRAIT_SENSHI_WHITLAM_SHORT');

INSERT INTO Buildings 		
		(Type, 						 			BuildingClass, 					SpecialistCount, SpecialistType,		Happiness,	PrereqTech, Cost, FaithCost, GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 									Help, 												Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_SENSHI_WHITLAM_GOLDEN_AGE', 			'BUILDINGCLASS_SENSHI_WHITLAM',	0,				 null,			0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_WHITLAM_SHORT',			'TXT_KEY_TRAIT_SENSHI_WHITLAM',			null,											null,									null,		  0, 			 'SENSHI_WHITLAM_ATLAS'),
		('BUILDING_SENSHI_WHITLAM_PLANE_DUMMY', 		'BUILDINGCLASS_SENSHI_WHITLAM',	0,				 null,			0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_WHITLAM_SHORT',			'TXT_KEY_TRAIT_SENSHI_WHITLAM',			null,											null,									null,		  0, 			 'SENSHI_WHITLAM_ATLAS'),
		('BUILDING_SENSHI_GALLERY_HAPPINESS', 			'BUILDINGCLASS_SENSHI_WHITLAM',	0,				 null,			1,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_WHITLAM_SHORT',			'TXT_KEY_TRAIT_SENSHI_WHITLAM',			null,											null,									null,		  0, 			 'SENSHI_WHITLAM_ATLAS');

INSERT INTO Building_SpecialistYieldChanges
        (BuildingType,                                SpecialistType,        YieldType,        Yield)
SELECT    'BUILDING_SENSHI_WHITLAM_GOLDEN_AGE',        SpecialistType,     YieldType,         Yield)
FROM SpecialistYields WHERE SpecialistType != 'SPECIALIST_CITIZEN';

INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,								SpecialistType,		YieldType,			Yield)
SELECT	'BUILDING_SENSHI_WHITLAM_GOLDEN_AGE',		Type,				'YIELD_CULTURE',	CulturePerTurn
FROM Specialists WHERE CulturePerTurn != 0 AND NOT EXISTS (SELECT 1 FROM Building_SpecialistYieldChanges WHERE SpecialistType = Type AND YieldType = 'YIELD_CULTURE' and BuildingType = 'BUILDING_SENSHI_WHITLAM_GOLDEN_AGE');

INSERT INTO Building_YieldChanges 	
		(BuildingType, 						 		YieldType, 		Yield)
VALUES	('BUILDING_SENSHI_WHITLAM_PLANE_DUMMY', 	'YIELD_FOOD',	1);