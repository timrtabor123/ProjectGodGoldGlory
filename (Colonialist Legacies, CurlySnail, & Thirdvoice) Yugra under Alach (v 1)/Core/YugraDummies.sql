INSERT OR REPLACE INTO BuildingClasses
(Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_CTCL_YUGRA_'||Type, 'BUILDING_CTCL_YUGRA_'||Type, 'TXT_KEY_CTCL_YUGRA_DUMMY_BUILDING'
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT OR REPLACE INTO Buildings
(Type, BuildingClass, SpecialistCount, GreatWorkCount, Cost, FaithCost, Description, Help, NeverCapture)
SELECT 'BUILDING_CTCL_YUGRA_'||Type, 'BUILDINGCLASS_CTCL_YUGRA_'||Type, 0, -1, -1, -1, 'TXT_KEY_CTCL_YUGRA_DUMMY_BUILDING', 'TXT_KEY_CTCL_YUGRA_DUMMY_BUILDING', 1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT OR REPLACE INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
SELECT 'BUILDING_CTCL_YUGRA_'||Type, Type, 'YIELD_FAITH', 2
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

CREATE TRIGGER IF NOT EXISTS THP_YugraFaithDummies_Insert
AFTER INSERT ON Resources
WHEN (NEW.ResourceClassType = 'RESOURCECLASS_LUXURY')
BEGIN
INSERT OR REPLACE INTO BuildingClasses
(Type, DefaultBuilding, Description)
VALUES ('BUILDINGCLASS_CTCL_YUGRA_'||NEW.Type, 'BUILDING_CTCL_YUGRA_'||NEW.Type, 'TXT_KEY_CTCL_YUGRA_DUMMY_BUILDING');

INSERT OR REPLACE INTO Buildings
(Type, BuildingClass, SpecialistCount, GreatWorkCount, Cost, FaithCost, Description, Help, NeverCapture)
VALUES ('BUILDING_CTCL_YUGRA_'||NEW.Type, 'BUILDINGCLASS_CTCL_YUGRA_'||NEW.Type, 0, -1, -1, -1, 'TXT_KEY_CTCL_YUGRA_DUMMY_BUILDING', 'TXT_KEY_CTCL_YUGRA_DUMMY_BUILDING', 1);

INSERT OR REPLACE INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield)
VALUES ('BUILDING_CTCL_YUGRA_'||NEW.Type, NEW.Type, 'YIELD_FAITH', 2);
END;

CREATE TRIGGER IF NOT EXISTS THP_YugraFaithDummies_Delete
AFTER DELETE ON Resources
WHEN (OLD.ResourceClassType = 'RESOURCECLASS_LUXURY')
BEGIN
DELETE FROM BuildingClasses WHERE Type = ('BUILDINGCLASS_CTCL_YUGRA_'||OLD.Type);

DELETE FROM Buildings WHERE Type = ('BUILDING_CTCL_YUGRA_'||OLD.Type);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = ('BUILDING_CTCL_YUGRA_'||OLD.Type);
END;