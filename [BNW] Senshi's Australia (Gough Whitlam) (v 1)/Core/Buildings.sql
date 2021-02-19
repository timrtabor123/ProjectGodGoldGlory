--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	GreatWorkSlotType,	GreatWorkCount,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_NATIONAL_GALLERY'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_NATIONAL_GALLERY'),	('TXT_KEY_CIV5_BUILDING_SENSHI_NATIONAL_GALLERY_TEXT'),	('TXT_KEY_BUILDING_SENSHI_NATIONAL_GALLERY_HELP'),	('TXT_KEY_BUILDING_SENSHI_NATIONAL_GALLERY_STRATEGY'),	ArtDefineTag,	('SPECIALIST_ARTIST'),	1,	MinAreaSize,	0,				HurryCostModifier,	GreatWorkSlotType,	GreatWorkCount,	'SENSHI_WHITLAM_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_MUSEUM');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_NATIONAL_GALLERY'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_MUSEUM');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_NATIONAL_GALLERY'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_MUSEUM');
------------------------------	
-- Building_ThemingBonuses
------------------------------		
INSERT INTO Building_ThemingBonuses 	
		(BuildingType, 					Description,		Bonus,	SameEra,	MustBeArt,	RequiresOwner,	RequiresAnyButOwner,	MustBeArtifact,	AIPriority)
SELECT	('BUILDING_SENSHI_NATIONAL_GALLERY'),	Description,		Bonus,	SameEra,	MustBeArt,	RequiresOwner,	RequiresAnyButOwner,	MustBeArtifact,	AIPriority
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_MUSEUM');