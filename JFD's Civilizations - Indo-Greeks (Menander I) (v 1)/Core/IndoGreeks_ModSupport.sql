--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
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
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JFD_MENANDER',	'FLAVOR_JFD_DECOLONIZATION',		2),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_MERCENARY',				8),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	2),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_LEGAL',			5),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_CULTURE',		2),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_ECONOMIC',		3),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_EDUCATION',		3),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_FOREIGN',		7),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_MILITARY',		6),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_REFORM_RELIGION',		8),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_SLAVERY',				4),
		('LEADER_JFD_MENANDER',	'FLAVOR_JFD_STATE_RELIGION',		8);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================			
-- JFD_TopPanelIncludes
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_TopPanelIncludes (FileName);
INSERT INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_Civs_IndoGreeks_DTP.lua');
--------------------------------------------------------------------------------------------------------------------------		
-- JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS JFD_TopPanelAdditions (CivilizationType, YieldType, YieldSourceFunction, YieldSourceToolTip, MiscToolTipFunction);									
INSERT INTO JFD_TopPanelAdditions
		(CivilizationType,					YieldType,					YieldSourcefunction,							YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS',	'YIELD_GOLDEN_AGE_POINTS',	'Player_GetGoldenAgePointsFromCultureAndFaith',	'TXT_KEY_JFD_DTP_INDO_GREEKS_GAP_FROM_CULTURE_AND_FAITH');	
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType,				Weight)
VALUES  ('CIVILIZATION_JFD_INDO_GREEKS',	'GOVERNMENT_JFD_THEOCRACY',	80);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,			X,		Y)
VALUES	('CIVILIZATION_JFD_INDO_GREEKS',	'AfriAsiaAust',		74,		64),
		('CIVILIZATION_JFD_INDO_GREEKS',	'Asia',				21,		43),
		('CIVILIZATION_JFD_INDO_GREEKS',	'CentralAsia',		102,	35),
		('CIVILIZATION_JFD_INDO_GREEKS',	'Cordiform',		57,		23),
		('CIVILIZATION_JFD_INDO_GREEKS',	'EarthMk3',			65,		60),
		('CIVILIZATION_JFD_INDO_GREEKS',	'EuroGiant',		85,		94),
		('CIVILIZATION_JFD_INDO_GREEKS',	'EuroLargeNew',		45,		66),
		('CIVILIZATION_JFD_INDO_GREEKS',	'EuroLarge',		40,		63),
		('CIVILIZATION_JFD_INDO_GREEKS',	'GreatestEarth',	75,		40),
		('CIVILIZATION_JFD_INDO_GREEKS',	'India',			24,		69),
		('CIVILIZATION_JFD_INDO_GREEKS',	'IndiaGiant',		30,		102),
		('CIVILIZATION_JFD_INDO_GREEKS',	'IndianOcean',		43,		71),
		('CIVILIZATION_JFD_INDO_GREEKS',	'Orient',			104,	51),
		('CIVILIZATION_JFD_INDO_GREEKS',	'SouthAsiaHuge',	21,		43),
		('CIVILIZATION_JFD_INDO_GREEKS',	'Yagem',			58,		53),
		('CIVILIZATION_JFD_INDO_GREEKS',	'Yahem',			87,		48);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_INDO_GREEKS',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_INDIA';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag,	   SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_INDO_GREEKS',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, 'JFD_Bharata', SplashScreenTag, 'JFD_Bharata', UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_GREECE';
	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bharata'
WHERE Type = 'CIVILIZATION_JFD_INDO_GREEKS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bharata')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================