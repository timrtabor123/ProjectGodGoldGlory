--==========================================================================================================================
-- STANDARD MOD SUPPORT
--==========================================================================================================================
--As of June 9 2019, the standard mod support structure has changed. Please see immediately below for the new standard featured 

--The following mod supports have been dropped:
---JFDLC Titles; to be replaced with Culture-specific Titles.
---JFDLC Inventions; to be replaced with Culture-wide preferences.
---JFDLC Construction Audios. These will remain defaulted to Building Class.
---Decisions; to be replaced with Culture-specific Decisions.
---Map Labels, Civ IV Traits, R.E.D., and Ethnic Units; to be replaced with Culture-wide supports.

--The following mod supports have been preserved:
---Cultural Diversity. This is the most important one to support (at a minimum, the Culture Type) because other supports will draw from it.
---YnAEMP v25. Recommend only bother with AltXY/AltCapital when your civ's Capital is the exact same as another's (e.g. Byzantium and Constantinople).
---JFDLC Leader Flavours.
---Colony names (where applicable). Linguistic type should be omitted.

--Please note these are the STANDARD mod supports, that is, they are supported by every custom civ.
--This list does not include mod support for mods like Enlightenment Era. The support required for these are case-sensitive.
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
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
/*
Map Prefixes:
   
v22
	Cordiform 
    GreatestEarth 
    Yagem
    Yahem 
     
v23
    Asia 
    EastAsia 
    Pacific
v24
    AfriAsiaAust
    AsiaSmall 
    AustralasiaGiant 
    SouthAsiaHuge 
    IndianOcean 
v25
    EarthMk3
    India 
    Indonesia 
*/

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,			X,	Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_ER_KAREN',	'Cordiform',		63,	24,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'GreatestEarth',	82,	38,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'Yagem',			74,	42,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'Yahem',			99,	39,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'Asia',				52,	24,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'EastAsia',			21,	37,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'Pacific',			22,	43,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'AfriAsiaAust',		92,	51,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'AsiaSmall',		5,	9,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'AustralasiaGiant',	4,	129,	null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'SouthAsiaHuge',	90,	48,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'IndianOcean',		69,	576,	null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'EarthMk3',			77,	44,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'India',			90,	48,		null,	null,	null),
		('CIVILIZATION_ER_KAREN',	'Indonesia',		13,	75,		null,	null,	null);
--CapitalName and AltCapitalName set a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 			 MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_ER_KAREN', MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CELTS';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
--Standard
--GOVERNMENT_JFD_MONARCHY
--GOVERNMENT_JFD_PRINCIPALITY
--GOVERNMENT_JFD_REPUBLIC
--Special
--GOVERNMENT_JFD_IMPERIAL (Imperial Dynasty)
--GOVERNMENT_JFD_MILITARY (Military Dictatorship)
--GOVERNMENT_JFD_MERCHANT (Merchant League)
--GOVERNMENT_JFD_MONASTIC (Monastic Order)
--GOVERNMENT_JFD_NOMADIC (Nomadic Horde)
--GOVERNMENT_JFD_REVOLUTIONARY (Revolutionary Republic)
--GOVERNMENT_JFD_THEOCRATIC (Theocratic State - works with GOVERNMENT_JFD_THEOCRACY too)
--GOVERNMENT_JFD_TOTALITARIAN (Totalitarian Dictatorship - works with GOVERNMENT_JFD_DICTATORSHIP too)
--GOVERNMENT_JFD_TRIBAL (Tribal Confederacy)
--Unique
--GOVERNMENT_JFD_CALIPHATE
--GOVERNMENT_JFD_HOLY_ROMAN  (Holy Roman Empire - works with GOVERNMENT_JFD_HOLY_ROMAN_EMPIRE)
--GOVERNMENT_JFD_MANDATE (Mandate of Heaven - works with GOVERNMENT_JFD_MANDATE_OF_HEAVEN)
--GOVERNMENT_JFD_MAMLUKE (Mamluke Sultanate)
--GOVERNMENT_JFD_PAPACY
--GOVERNMENT_JFD_SHOGUNATE
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 			GovernmentType,				Weight)
VALUES	('CIVILIZATION_ER_KAREN', 	'GOVERNMENT_JFD_REPUBLIC',		35),
		('CIVILIZATION_ER_KAREN', 	'GOVERNMENT_JFD_REVOLUTIONARY',	15),
		('CIVILIZATION_ER_KAREN', 	'GOVERNMENT_JFD_TRIBAL',		20);

--Note that multiple entries are valid.
------------------------------------------------------------------------------------
-- LEADER FLAVOURS
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'), --0-10. Determines likelihood for annexing a colony, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_MERCENARY'), --0-10. Determines likelihood of taking out Mercenary Contracts, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_REFORM_GOVERNMENT'), --0-10. Determines Reform preference; corresponding to Left>Centre>Right/Liberal to Authoritarian continuum. 1-4=Left, 5-6=Centre, 7-10=Right. For government issues.
		('FLAVOR_JFD_REFORM_LEGAL'), --same as above for legal issues. 
		('FLAVOR_JFD_REFORM_CULTURE'), --same as above for cultural issues.
		('FLAVOR_JFD_REFORM_ECONOMIC'), --same as above for economic issues. 
		('FLAVOR_JFD_REFORM_EDUCATION'), --same as above for educational issues.
		('FLAVOR_JFD_REFORM_FOREIGN'), --same as above for diplomatic/international issues.
		('FLAVOR_JFD_REFORM_INDUSTRY'), --same as above for industrial/labour issues.
		('FLAVOR_JFD_REFORM_MILITARY'), --same as above for military issues.
		('FLAVOR_JFD_REFORM_RELIGION'), --same as above for religious issues.
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'), --0-12. Determines the diplomatic penalty/bonus with leaders of a different/same state religion
		('FLAVOR_JFD_SLAVERY'), --0-10. Determines likelihood of enslaving Cities and spending Shackles on Slave Units, where 0 means never, and 10 as much as possible.
		('FLAVOR_JFD_STATE_RELIGION'); --0-12. Determines chance to adopt a State Religion, where 0 means never. 9+ also means this leader will never secularize.

INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_DECOLONIZATION',		 3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_MERCENARY',				 9),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 2),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 2), 
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_LEGAL',			 3), 	
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_CULTURE',		 5),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_ECONOMIC',		 7),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 4),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_MILITARY',		 4),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_REFORM_RELIGION',		 2),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_SLAVERY',				 3),
		('LEADER_ER_SAW_BA_U_GYI',	'FLAVOR_JFD_STATE_RELIGION',		 2);
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
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_ER_KAREN',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_CHINESE'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SIAM';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ER_KAREN')
WHERE Type = 'CIVILIZATION_ER_KAREN';
--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- Tomatekh's Historical Religions and Protestant Denominations
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
    ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_BAPTIST' )
	THEN 'RELIGION_PROTESTANT_BAPTIST'
	ELSE 'RELIGION_PROTESTANTISM' END
	) WHERE CivilizationType = 'CIVILIZATION_ER_KAREN';
--==========================================================================================================================		
--==========================================================================================================================		