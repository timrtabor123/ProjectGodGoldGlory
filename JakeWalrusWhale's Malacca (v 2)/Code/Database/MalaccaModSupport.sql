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
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_DECOLONIZATION',		4),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_MERCENARY',				9),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	5),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		9),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_LAW',			2),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_DIPLOMACY',		10),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_ECONOMY',		8),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_EDUCATION',		0),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_INDUSTRY',		3),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_MILITARY',		2),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_RELIGION',		6),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_SOCIETY',		0),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_REFORM_WELFARE',		1),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_SLAVERY',				3),
		('LEADER_JWW_PARAMESWARA',	'FLAVOR_JFD_STATE_RELIGION',		7);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_JWW_MALACCA',	'Yagem',				77,		32),
		('CIVILIZATION_JWW_MALACCA',	'Yahem',				100,	33),
		('CIVILIZATION_JWW_MALACCA',	'Cordiform',			63,		19),
		('CIVILIZATION_JWW_MALACCA',	'GreatestEarth',		83,		33),
		('CIVILIZATION_JWW_MALACCA',	'EarthMk3',				82,		33),
		('CIVILIZATION_JWW_MALACCA',	'Asia',					57,		1),
		('CIVILIZATION_JWW_MALACCA',	'AfriAsiaAust',			94,		37),
		('CIVILIZATION_JWW_MALACCA',	'AustralasiaGiant',		11,		99),
		('CIVILIZATION_JWW_MALACCA',	'IndianOcean',			71,	    41),
		('CIVILIZATION_JWW_MALACCA',	'Indonesia',			24,  	35),
		('CIVILIZATION_JWW_MALACCA',	'EastAsia',				25,		22),
		('CIVILIZATION_JWW_MALACCA',	'SouthAsiaHuge',		112,	14),
		('CIVILIZATION_JWW_MALACCA',	'Pacific',				23,	    33);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JWW_MALACCA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
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
SELECT	'CIVILIZATION_JWW_MALACCA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SIAM';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JWW_MALACCA')
WHERE Type = 'CIVILIZATION_JWW_MALACCA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
--GOVERNMENT_JFD_MONARCHY
--GOVERNMENT_JFD_PRINCIPALITY
--GOVERNMENT_JFD_REPUBLIC
--GOVERNMENT_JFD_THEOCRACY
--GOVERNMENT_JFD_DICTATORSHIP
--GOVERNMENT_JFD_SHOGUNATE
--GOVERNMENT_JFD_HOLY_ROMAN_EMPIRE
--GOVERNMENT_JFD_PAPACY
--GOVERNMENT_JFD_MANDATE_OF_HEAVEN
--GOVERNMENT_JFD_CALIPHATE

INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_JWW_MALACCA', 	'GOVERNMENT_JFD_MONARCHY',	75);
--==========================================================================================================================
-- UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================

INSERT INTO Diplomacy_Responses
		(LeaderType,					ResponseType,					Response,													Bias)
VALUES	('LEADER_JWW_PARAMESWARA',		'RESPONSE_INFLUENTIAL_ON_AI',	'TXT_KEY_LEADER_JWW_PARAMESWARA_INFLUENTIAL_ON_AI%',		1),
		('LEADER_JWW_PARAMESWARA',		'RESPONSE_INFLUENTIAL_ON_HUMAN','TXT_KEY_LEADER_JWW_PARAMESWARA_INFLUENTIAL_ON_HUMAN%',		1);
--=========================================================================================================================
-- BINGLES CIV IV TRAITS
--=========================================================================================================================
--POLICY_AGGRESSIVE_X [ICON_WAR] (Military)
--POLICY_CHARISMATIC_X [ICON_HAPPINESS_1] (Happiness)
--POLICY_CREATIVE_X [ICON_CULTURE] (Culture)
--POLICY_DIPLOMATIC_X [ICON_INFLUENCE] (City States)
--POLICY_EXPANSIVE_X [ICON_FOOD] (Food)
--POLICY_FINANCIAL_X [ICON_GOLD] (City Connections, Domestic Trade Routes)
--POLICY_IMPERIALISTIC_X [ICON_CITY_STATE] (Admirals, Generals)
--POLICY_INDUSTRIOUS_X [ICON_PRODUCTION] (Production)
--POLICY_INVENTIVE_X [ICON_RESEARCH] (Science)
--POLICY_MERCANTILE_X [ICON_TRADE] (Gold)
--POLICY_PHILOSOPHICAL_X [ICON_GREAT_PEOPLE] (Great People)
--POLICY_PROTECTIVE_X [ICON_STRENGTH] (Defense)
--POLICY_SEAFARING_X [ICON_MOVES] (Navy)
--POLICY_SPIRITUAL_X [ICON_PEACE] (Faith)
------------------------------	
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_JWW_PARAMESWARA',	'POLICY_MERCANTILE_X',	'POLICY_IMPERIALISTIC_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Parameswara [ICON_TRADE][ICON_CITY_STATE]'
WHERE Type = 'LEADER_JWW_PARAMESWARA'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
--==========================================================================================================================
