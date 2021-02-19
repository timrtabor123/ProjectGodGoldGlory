--Defines

UPDATE Defines
SET Value = 1
WHERE Name = 'UNHAPPINESS_PER_CAPTURED_CITY';

UPDATE Defines
SET Value = 1.5
WHERE Name = 'UNHAPPINESS_PER_OCCUPIED_POPULATION';

--New Building

INSERT INTO BuildingClasses
		(Type,							DefaultBuilding,			Description)
VALUES	('BUILDINGCLASS_EW_HOMESTEAD',	'BUILDING_EW_HOMESTEAD',	'TXT_KEY_BUILDING_EW_HOMESTEAD');

INSERT INTO Buildings
		(Type,						Description,						Civilopedia,							Strategy,								Help,									Cost,	BuildingClass,					ArtDefineTag,						PortraitIndex,	IconAtlas,				MinAreaSize)
VALUES	('BUILDING_EW_HOMESTEAD',	'TXT_KEY_BUILDING_EW_HOMESTEAD',	'TXT_KEY_BUILDING_EW_HOMESTEAD_PEDIA',	'TXT_KEY_BUILDING_EW_HOMESTEAD_STRAT',	'TXT_KEY_BUILDING_EW_HOMESTEAD_HELP',	60,		'BUILDINGCLASS_EW_HOMESTEAD',	'ART_DEF_BUILDING_EW_HOMESTEAD',	0,				'ATLAS_EW_HOMESTEAD',	-1);

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,			Flavor)
VALUES	('BUILDING_EW_HOMESTEAD',	'FLAVOR_EXPANSION',	5),
		('BUILDING_EW_HOMESTEAD',	'FLAVOR_GROWTH',	10);

--Art Defines

INSERT INTO IconTextureAtlases
		(Atlas,					IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_EW_HOMESTEAD',	256,		'homestead_256.dds',	1,				1),
		('ATLAS_EW_HOMESTEAD',	128,		'homestead_128.dds',	1,				1),
		('ATLAS_EW_HOMESTEAD',	80,			'homestead_80.dds',		1,				1),
		('ATLAS_EW_HOMESTEAD',	64,			'homestead_64.dds',		1,				1),
		('ATLAS_EW_HOMESTEAD',	45,			'homestead_45.dds',		1,				1);