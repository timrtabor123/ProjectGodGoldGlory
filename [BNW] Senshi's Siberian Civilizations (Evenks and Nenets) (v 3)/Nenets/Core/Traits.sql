--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)					
VALUES		('TRAIT_SENSHI_SAMBADABTS', 	'TXT_KEY_TRAIT_SENSHI_SAMBADABTS', 	'TXT_KEY_TRAIT_SENSHI_SAMBADABTS_SHORT');

INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SENSHI_NENETS', 	'BUILDING_SENSHI_DEERFAITH', 	'TXT_KEY_BUILDING_SENSHI_DEERFAITH');

INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 			 	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 							Help)
VALUES	('BUILDING_SENSHI_DEERFAITH', 	'BUILDINGCLASS_SENSHI_NENETS',	-1, 			-1,   -1, 		 null, 		 'TXT_KEY_TRAIT_SENSHI_SAMBADABTS_SHORT', 	'TXT_KEY_TRAIT_SENSHI_SAMBADABTS_SHORT');

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					ResourceType,		YieldType,		Yield)
VALUES	('BUILDING_SENSHI_DEERFAITH',	'RESOURCE_DEER',	'YIELD_FAITH',	1);