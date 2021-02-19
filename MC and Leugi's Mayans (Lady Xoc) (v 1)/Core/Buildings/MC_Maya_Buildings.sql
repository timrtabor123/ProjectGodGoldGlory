--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,									Help,											Strategy,											ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	Happiness,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_MC_MAYAN_DZIB_ACTUN'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_MC_MAYAN_DZIB_ACTUN'),	('TXT_KEY_BUILDING_MC_MAYAN_DZIB_ACTUN_PEDIA'),	('TXT_KEY_BUILDING_MC_MAYAN_DZIB_ACTUN_HELP'),	('TXT_KEY_BUILDING_MC_MAYAN_DZIB_ACTUN_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	Happiness,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	'MC_MAYA_ATLAS',		3
FROM Buildings WHERE (Type = 'BUILDING_OBSERVATORY');

--Dummy Building
INSERT INTO Buildings
		(Type,								BuildingClass,							Description,								Cost,	PrereqTech,	GreatWorkCount,	FaithCost,	NeverCapture)
VALUES	('BUILDING_MC_EKNAH_BONUS_SCI',	'BUILDINGCLASS_MC_EKNAH_BONUS_SCI',	'TXT_KEY_BUILDING_MC_EKNAH_BONUS_SCI',		-1,		null,		-1,				-1,			1);

--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type,										DefaultBuilding,					Description)
VALUES	('BUILDINGCLASS_MC_EKNAH_BONUS_SCI',		'BUILDING_MC_EKNAH_BONUS_SCI',		'TXT_KEY_BUILDING_MC_EKNAH_BONUS_SCI');

--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
SELECT	('BUILDING_MC_MAYAN_DZIB_ACTUN'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_OBSERVATORY');

--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 						YieldType,			Yield)
VALUES	('BUILDING_MC_MAYAN_DZIB_ACTUN',	'YIELD_SCIENCE',	25),
		('BUILDING_MC_EKNAH_BONUS_SCI',		'YIELD_SCIENCE',	10);
		


