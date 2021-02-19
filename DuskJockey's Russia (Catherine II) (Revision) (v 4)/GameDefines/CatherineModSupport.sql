--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- ENLIGHTENMENT ERA
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_EE_ACADEMY'
WHERE CivilizationType = 'CIVILIZATION_RUSSIA' AND EXISTS (SELECT ID FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--------------------------------------------------------------------------------------------------------------------------	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Buildings 	
			(Type, 								BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, ArtInfoEraVariation, NeverCapture, 	SpecialistCount,	SpecialistType,	MutuallyExclusiveGroup,	Description, 									Civilopedia, 									Help, 												Strategy,												ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_DJ_FINISHING_SCHOOL'),	BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, ArtInfoEraVariation, NeverCapture, 	SpecialistCount,	SpecialistType, MutuallyExclusiveGroup,	('TXT_KEY_BUILDING_DJ_FINISHING_SCHOOL_DESC'),	('TXT_KEY_CIV5_BUILDING_DJ_FINISHING_SCHOOL'),	('TXT_KEY_BUILDING_DJ_FINISHING_SCHOOL_HELP_EE'),	('TXT_KEY_BUILDING_DJ_FINISHING_SCHOOL_STRATEGY_EE'),	ArtDefineTag, 0,				('DJ_CATHERINE_II_COLOR_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_EE_ACADEMY';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_ClassesNeededInCity
WHERE BuildingType = 'BUILDING_DJ_FINISHING_SCHOOL' AND EXISTS (SELECT ID FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_YieldChanges
			(BuildingType,	YieldType,	Yield)
SELECT		('BUILDING_DJ_FINISHING_SCHOOL'),	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_EE_ACADEMY';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_YieldModifiers
			(BuildingType,	YieldType,	Yield)
SELECT		('BUILDING_DJ_FINISHING_SCHOOL'),	YieldType,	Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_EE_ACADEMY';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChangesPerPop
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChangesPerPop
WHERE BuildingType = 'BUILDING_DJ_FINISHING_SCHOOL' AND EXISTS (SELECT ID FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- ENLIGHTENMENT ERA
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Civilizations_YnAEMP WHERE CivlizationType = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_RUSSIA',	'AfriAsiaAust',			31,     74,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'AfriSouthEuro',		36,		68,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'Cordiform',			45,		36,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'EarthMk3',				32,		76,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'EastAsia',				0,		0,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'EuroLarge',			60,		53,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'EuroLargeNew',			59,		64,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'GreatestEarth',		63,		56,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'Mediterranean',		46,		39,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'Mesopotamia',			68,		35,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'NorthAtlantic',		103,	46,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'NorthEastAsia',		0,		0,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'NorthWestEurope',		52,		44,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'Orient',				14,		68,		null,	null,	null),
		-- ('CIVILIZATION_RUSSIA',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'Yagem',				38,		72,		null,	null,	null),
		('CIVILIZATION_RUSSIA',		'Yahem',				75,		63,		null,	null,	null);