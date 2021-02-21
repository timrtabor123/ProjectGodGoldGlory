
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('C15_Nenets_Decisions.lua');

INSERT INTO BuildingClasses
		(Type,						DefaultBuilding,	Description)
VALUES	('BUILDINGCLASS_C15_MYA',	'BUILDING_C15_MYA',	'TXT_KEY_DECISIONS_C15_NENETS_MYA');

INSERT INTO Buildings
		(Type,								BuildingClass,								Description,						Cost,	FaithCost,	GreatWorkCount,		PrereqTech,		NeverCapture,	NukeImmune,		PortraitIndex,	IconAtlas)
VALUES	('BUILDING_C15_MYA',				'BUILDINGCLASS_C15_MYA',					'TXT_KEY_BUILDING_C15_MYA',			-1,		-1,			-1,					NULL,			1,				1,				19,				'BW_ATLAS_1');

INSERT INTO Building_TerrainYieldChanges
		(BuildingType,			TerrainType,		YieldType,			Yield)
VALUES	('BUILDING_C15_MYA',	'TERRAIN_SNOW',		'YIELD_PRODUCTION',	1),
		('BUILDING_C15_MYA',	'TERRAIN_TUNDRA',	'YIELD_PRODUCTION',	1);
		
