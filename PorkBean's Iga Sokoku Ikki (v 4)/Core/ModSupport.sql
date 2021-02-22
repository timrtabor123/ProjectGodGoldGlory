--==========================================================================================================================
-- STANDARD MOD SUPPORT
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--Below are the tables required for standard mod support.

CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
--List of traits: https://forums.civfanatics.com/threads/civ-iv-traits-in-civ-v.530701/
------------------------------
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,            TraitOne,                TraitTwo)
SELECT  'LEADER_PB_MOMOCHI_TAMBA',		'POLICY_AGGRESSIVE_X',	 'POLICY_PHILOSOPHICAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Momochi Tamba [ICON_WAR][ICON_GREAT_PEOPLE]'
WHERE Type = 'LEADER_PB_MOMOCHI_TAMBA'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,		MapPrefix,			X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_PB_IGA',	'AfriAsiaAust',		121,	73,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'Asia',				91,		51,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'AsiaSmall',		47,		31,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'Cordiform',		60,		45,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'EarthMk3',			100,	65,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'EastAsia',			60,		60,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'GreatestEarth',	97,		46,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'JapanHuge',		62,		30,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'NorthEastAsia',	44,		26,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'Pacific',			43,		56,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'SeaOfJapan',		78,		21,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'Yagem',			94,		57,		null,	null,	null),
		('CIVILIZATION_PB_IGA',	'Yahem',			113,	49,		null,	null,	null);
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,		GovernmentType,				Weight)
VALUES	('CIVILIZATION_PB_IGA',	'GOVERNMENT_JFD_REPUBLIC',	100);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_PB_IGA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JAPAN';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_PB_IGA')
WHERE Type = 'CIVILIZATION_PB_IGA';