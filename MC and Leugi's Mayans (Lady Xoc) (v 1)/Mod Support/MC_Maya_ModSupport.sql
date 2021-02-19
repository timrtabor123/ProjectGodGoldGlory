------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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
-- Leader_SharedTraits
------------------------------  
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(TYPE)        DEFAULT NULL,
    TraitOne            text    REFERENCES Policies(TYPE)       DEFAULT NULL,
    TraitTwo            text    REFERENCES Policies(TYPE)       DEFAULT NULL);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_MC_LADY_XOC',	'POLICY_INVENTIVE_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders
SET Description = 'Edai Siabo [ICON_RESEARCH][ICON_PEACE]'
WHERE TYPE = 'LEADER_MC_LADY_XOC'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');

--==========================================================================================================================
-- Events & Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
--CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
--INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Aceh_Decisions.lua');
--==========================================================================================================================
-- ENLIGHTENMENT ERA
--==========================================================================================================================
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--====================================
-- Miscellanenous
--====================================
--INSERT INTO JFD_Civilopedia_HideFromPedia
--		(Type)
--VALUES	('BUILDING_DMS_PRAZOS_DA_COROA_GOLD');
--====================================
-- JFD's Cultural Diversity
--====================================
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
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_MC_MAYA',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MAYA';

------------------------------  
-- Flavours
------------------------------  
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),			--0-10. Determines likelihood for annexing a colony, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_MERCENARY'),				--0-10. Determines likelihood of taking out Mercenary Contracts, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),	--0-12. Determines the diplomatic penalty/bonus with leaders of a different/same state religion
		('FLAVOR_JFD_REFORM_GOVERNMENT'),		--0-10. Determines Reform preference; corresponding to Left>Centre>Right/Liberal to Authoritarian continuum. 1-4=Left, 5-6=Centre, 7-10=Right. For government issues.
		('FLAVOR_JFD_REFORM_LEGAL'),			--same as above for legal issues. 
		('FLAVOR_JFD_REFORM_CULTURE'),			--same as above for cultural issues.
		('FLAVOR_JFD_REFORM_ECONOMIC'),			--same as above for economic issues. 
		('FLAVOR_JFD_REFORM_EDUCATION'),		--same as above for educational issues.
		('FLAVOR_JFD_REFORM_FOREIGN'),			--same as above for diplomatic/international issues.
		('FLAVOR_JFD_REFORM_INDUSTRY'),			--same as above for industrial/labour issues.
		('FLAVOR_JFD_REFORM_MILITARY'),			--same as above for military issues.
		('FLAVOR_JFD_REFORM_RELIGION'),			--same as above for religious issues.
		('FLAVOR_JFD_SLAVERY'),					--0-10. Determines likelihood of enslaving Cities and spending Shackles on Slave Units, where 0 means never, and 10 as much as possible.
		('FLAVOR_JFD_STATE_RELIGION');			--0-12. Determines chance to adopt a State Religion, where 0 means never. 9+ also means this leader will never secularize.

INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_DECOLONIZATION',		 7),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_MERCENARY',				 4),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 6),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_GOVERNMENT',		 2), --Scale of Liberal to Authoritarian.
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_LEGAL',			 4), 	
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_CULTURE',		 3),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_ECONOMIC',		 2),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_EDUCATION',	 	 4),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_FOREIGN',		 4),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_INDUSTRY',		 3),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_MILITARY',		 4),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_REFORM_RELIGION',		 4),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_SLAVERY',				 7),
		('LEADER_MC_LADY_XOC',		'FLAVOR_JFD_STATE_RELIGION',		 7);
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
------------------------------
-- Civilization_Religions
------------------------------
/*UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_MALAGAN'
WHERE CivilizationType = 'CIVILIZATION_MC_MAYA'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_MALAGAN');*/
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------  
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,						CultureType,    CultureEra)
VALUES  ('CIVILIZATION_MC_MAYA',		'AMERICAN',      'ANY');
--==========================================================================================================================
-- R.E.D. / Ethnic Units
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
    THEN '_MAYA'
    ELSE '_AMER' END)
WHERE TYPE = 'CIVILIZATION_MC_MAYA';
--==========================================================================================================================
-- YnAEMP v25
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,					X,		Y)
VALUES	('CIVILIZATION_MC_MAYA',	'Yagem',						145,	46),
		('CIVILIZATION_MC_MAYA',	'Yahem',						24,		42),
		('CIVILIZATION_MC_MAYA',	'Cordiform',					5,		25),
		('CIVILIZATION_MC_MAYA',	'GreatestEarth',				15,		31),
		('CIVILIZATION_MC_MAYA',	'EarthMk3',						139,	50),
		('CIVILIZATION_MC_MAYA',	'AmericasGiant',				55,		91),
		('CIVILIZATION_MC_MAYA',	'Americas',						40,		42),
		('CIVILIZATION_MC_MAYA',	'AtlanticGiant',				42,		56),
		('CIVILIZATION_MC_MAYA',	'CaribbeanHuge',				0,		36),
		('CIVILIZATION_MC_MAYA',	'Caribbean',					25,		30),
		('CIVILIZATION_MC_MAYA',	'NorthAmericaGiant',			80,		18),
		('CIVILIZATION_MC_MAYA',	'NorthAmericaHuge',				74,		4),
		('CIVILIZATION_MC_MAYA',	'SouthAmericaCentralGiant',		32,		127),
		('CIVILIZATION_MC_MAYA',	'SouthAmericaCentralHuge',		25,		96);
--==========================================================================================================================
--==========================================================================================================================