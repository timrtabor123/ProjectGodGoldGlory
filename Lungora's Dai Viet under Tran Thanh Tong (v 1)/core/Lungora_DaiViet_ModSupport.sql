--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LAW'),
		('FLAVOR_JFD_REFORM_DIPLOMACY'),
		('FLAVOR_JFD_REFORM_ECONOMY'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_REFORM_SOCIETY'),
		('FLAVOR_JFD_REFORM_WELFARE'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_DECOLONIZATION',		3),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_MERCENARY',				6),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	1),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_GOVERNMENT',		10),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_LAW',			9),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_DIPLOMACY',		4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_ECONOMY',		8),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_EDUCATION',		5),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_INDUSTRY',		4),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_MILITARY',		8),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_RELIGION',		3),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_SOCIETY',		7),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_REFORM_WELFARE',		7),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_SLAVERY',				2),
		('LEADER_LUNG_DAI_VIET',	'FLAVOR_JFD_STATE_RELIGION',		2);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName)
SELECT	'CIVILIZATION_LUNG_DAI_VIET',	MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName
FROM MinorCivilizations_YnAEMP WHERE MinorCivType = 'MINOR_CIV_HANOI';

DELETE FROM MinorCivilizations_YnAEMP WHERE MinorCivType = 'MINOR_CIV_HANOI';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_LUNG_DAI_VIET',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SIAM';

CREATE TRIGGER IF NOT EXISTS Lungora_DaiVietYnAEMPTrigger
AFTER INSERT ON MinorCivilizations_YnAEMP
WHEN NEW.MinorCivType = 'MINOR_CIV_HANOI'
BEGIN
	INSERT INTO Civilizations_YnAEMP
			(CivilizationType,			MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName)
	VALUES	('CIVILIZATION_LUNG_DAI_VIET',	NEW.MapPrefix, NEW.X, NEW.Y, NEW.CapitalName, NEW.AltX, NEW.AltY, NEW.AltCapitalName);
END;
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_CHINA'
WHERE Type = 'CIVILIZATION_LUNG_DAI_VIET'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_CHINA');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------  
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_LUNG_DAI_VIET',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------------------------------------
UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_MAHAYANA" )
THEN "RELIGION_MAHAYANA"
ELSE "RELIGION_BUDDHISM" END
) WHERE CivilizationType = "CIVILIZATION_LUNG_DAI_VIET";
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_CultureTypes(
	CivilizationType 					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType 						text											default null,
	SubCultureType 						text											default null,
	ArtDefineTag						text											default	null,
	DecisionsTag						text											default	null,
	DefeatScreenEarlyTag				text											default	null,
	DefeatScreenMidTag					text											default	null,
	DefeatScreenLateTag					text											default	null,
	IdealsTag							text											default	null,
	SplashScreenTag						text											default	null,
	SoundtrackTag						text											default	null,
	UnitDialogueTag						text											default null);
	
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_LUNG_DAI_VIET',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mandala'
WHERE Type = 'CIVILIZATION_LUNG_DAI_VIET'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mandala')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,			Weight)
SELECT	'CIVILIZATION_LUNG_DAI_VIET', 	GovernmentType,			Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Community Patch        
--==========================================================================================================================
-- Buildings
------------------------------
UPDATE Buildings SET CitySupplyFlat = '1'
WHERE Type = 'BUILDING_LUNG_VOMIEU' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges
		(BuildingType, 			YieldType,				 Yield)
VALUES	('BUILDING_LUNG_VOMIEU', 'YIELD_GREAT_GENERAL_POINTS', 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, 		ImprovementType, 		YieldType, Yield)
SELECT	'BUILDING_LUNG_VOMIEU', 'IMPROVEMENT_FORT',	 	Type, 1 FROM Yields WHERE Type IN ('YIELD_CULTURE', 'YIELD_SCIENCE') UNION ALL
SELECT	'BUILDING_LUNG_VOMIEU', 'IMPROVEMENT_CITADEL', 	Type, 1 FROM Yields WHERE Type IN ('YIELD_CULTURE', 'YIELD_SCIENCE');
--==========================================================================================================================
--==========================================================================================================================