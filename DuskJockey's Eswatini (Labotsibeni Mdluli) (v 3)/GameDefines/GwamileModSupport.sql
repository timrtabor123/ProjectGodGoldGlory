--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
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
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix, 			X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_DJ_ESWATINI',	'AfricaLarge',		42,		9,		null,	null),
		('CIVILIZATION_DJ_ESWATINI',	'AfriAsiaAust',		41,		12,		null,	null),
		('CIVILIZATION_DJ_ESWATINI',	'AfriGiant',		94,		27,		null,	null),
		('CIVILIZATION_DJ_ESWATINI',	'AfriSouthEuro',	49,		12,		null,	null),
		('CIVILIZATION_DJ_ESWATINI',	'EarthMk3',			35,		11,		null,	null),
		('CIVILIZATION_DJ_ESWATINI',	'SouthernAfrica',	92,		51,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_DJ_ESWATINI',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_ZULU';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- CIVILOPEDIA
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('POLICY_DJ_ESWATINI_CHORBADZHII'),
		('POLICY_DJ_ESWATINI_ROSEOTTO');
--------------------------------------------------------------------------------------------------------------------------
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
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_DECOLONIZATION',			9),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_MERCENARY',					4),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_GOVERNMENT',			6),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_LEGAL',				5),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_CULTURE',			8),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_ECONOMIC',			7),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_FOREIGN',			7),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_INDUSTRY',			6),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_MILITARY',			5),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_REFORM_RELIGION',			4),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_SLAVERY',					3),
		('LEADER_DJ_GWAMILE',	'FLAVOR_JFD_STATE_RELIGION',			3);
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
		(CivilizationType,			CultureType, SubCultureType,	ArtDefineTag,	DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_DJ_ESWATINI', CultureType, SubCultureType,	ArtDefineTag,	DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ZULU';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bantu'
WHERE Type = 'CIVILIZATION_DJ_ESWATINI'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bantu');