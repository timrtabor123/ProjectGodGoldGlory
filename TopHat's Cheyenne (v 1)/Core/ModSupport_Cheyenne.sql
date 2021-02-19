--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);
--==========================================================================================================================
-- Bingle's Civ IV Traits
--==========================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,		TraitOne,                  	TraitTwo)
SELECT      'LEADER_THP_WOQINI',	'POLICY_AGGRESSIVE_X',		'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Woqini [ICON_WAR][ICON_PEACE]'
WHERE Type = 'LEADER_THP_WOQINI'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilizations 
SET ArtStyleSuffix = '_SHOSHONE'
WHERE Type = 'CIVILIZATION_THP_CHEYENNE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_SHOSHONE');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23-25)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
	(CivilizationType,		MapPrefix,		X,	Y)
VALUES	('CIVILIZATION_THP_CHEYENNE',	'Yagem',		138,	69),
	('CIVILIZATION_THP_CHEYENNE',	'Yahem',		21,	57),
	('CIVILIZATION_THP_CHEYENNE',	'GreatestEarth',	8,	53),
	('CIVILIZATION_THP_CHEYENNE',	'Cordiform',		12,	37),
	('CIVILIZATION_THP_CHEYENNE',	'Americas',		36,	57),
	('CIVILIZATION_THP_CHEYENNE',	'AmericasGiant',	42,	125),
	('CIVILIZATION_THP_CHEYENNE',	'NorthAmericaGiant',	62,	62),
	('CIVILIZATION_THP_CHEYENNE',	'NorthAmericaHuge',	64,	48),
	('CIVILIZATION_THP_CHEYENNE',	'EarthMk3',		134,	75);
-----------------------------------------
-- Civilizations_YnAEMPRequestedResources
-----------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YnAEMPRequestedResources
	(CivilizationType, 	 	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_THP_CHEYENNE',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
	(CivType,			CultureType, CultureEra)
SELECT	'CIVILIZATION_THP_CHEYENNE',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- LEADER FLAVOURS
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

INSERT INTO Leader_Flavors
	(LeaderType,		FlavorType,				 Flavor)
VALUES	('LEADER_THP_WOQINI',	'FLAVOR_JFD_DECOLONIZATION',		 10),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_MERCENARY',			 6),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 8),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 5), --Scale of Liberal to Authoritarian.
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_LEGAL',		 8), 	
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_CULTURE',		 7),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_ECONOMIC',		 2),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 4),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_FOREIGN',		 8),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_MILITARY',		 9),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_REFORM_RELIGION',		 7),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_SLAVERY',			 2),
	('LEADER_THP_WOQINI',	'FLAVOR_JFD_STATE_RELIGION',		 6);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 		text 			default null,
	CultureType 			text			default null,
	SubCultureType 			text			default null,
	ArtDefineTag			text			default	null,
	DecisionsTag			text			default null,
	DefeatScreenEarlyTag		text			default	null,
	DefeatScreenMidTag		text			default	null,
	DefeatScreenLateTag		text			default	null,
	IdealsTag			text			default	null,
	SplashScreenTag			text			default	null,
	SoundtrackTag			text			default	null,
	UnitDialogueTag			text			default null);

INSERT INTO Civilization_JFD_CultureTypes
	(CivilizationType,		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_THP_CHEYENNE',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_GreatPlains'
WHERE Type = 'CIVILIZATION_THP_CHEYENNE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_GreatPlains');
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_WAKAN_TANKA" )
THEN "RELIGION_WAKAN_TANKA"
ELSE "RELIGION_PROTESTANTISM" END
) WHERE CivilizationType = "CIVILIZATION_THP_CHEYENNE";
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
-- AdditionalAchievements_Mods
------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  				integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text					default	null,
	ModName				text					default null,
	ModID				text					default	null,	
	Authors				text					default	null);

INSERT INTO AdditionalAchievements_Mods
	(Type,		    ModName,			   ModID,			    Authors)
VALUES	('MOD_THP_CHEYENNE', 'TXT_KEY_MOD_THP_CHEYENNE_NAME', 'TXT_KEY_MOD_THP_CHEYENNE_ID_STEAM', 'TXT_KEY_MOD_THP_CHEYENNE_AUTHORS');
-------------------------
-- AdditionalAchievements
-------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  			integer 	PRIMARY KEY		AUTOINCREMENT,
	Type			text					default	null,
	Achievopedia		text					default null,
	Header			text					default	null,	
	IconAtlas		text					default	null,	
	PortraitIndex		integer					default	0,
	ModType			text					default	null,	
	ModVersion		integer					default	0,
	Unlocked		boolean					default	0,
	LockedIconAtlas		text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex	integer					default	23,
	UnlockSound		text					default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration		integer					default	-1,
	Hidden			boolean					default	0,
	HiddenBorder		boolean					default	0,
	RequiredCivWin		text					default	null,
	RequiredCivLoss		text					default	null,
	RequiredCivKill		text					default	null);

INSERT INTO AdditionalAchievements
		(Type,			Header,			Achievopedia,		ModType,	ModVersion,		RequiredCivWin,				IconAtlas,		PortraitIndex)
VALUES	('AA_THP_CHEYENNE_SPECIAL',	'TXT_KEY_AA_THP_CHEYENNE_SPECIAL_HEADER',	'TXT_KEY_AA_THP_CHEYENNE_SPECIAL_TEXT',	'MOD_THP_CHEYENNE',	1,				null,				'THP_CHEYENNE_ATLAS',	0),
		('AA_THP_CHEYENNE_VICTORY',	'TXT_KEY_AA_THP_CHEYENNE_VICTORY_HEADER',	'TXT_KEY_AA_THP_CHEYENNE_VICTORY_TEXT',	'MOD_THP_CHEYENNE',	1,				'CIVILIZATION_THP_CHEYENNE',	'THP_CHEYENNE_ATLAS',	0);
--==========================================================================================================================
--==========================================================================================================================