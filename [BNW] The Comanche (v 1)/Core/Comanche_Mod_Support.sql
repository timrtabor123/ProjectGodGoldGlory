--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);

INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
VALUES  ('LEADER_QUANAH_PARKER',	'POLICY_SPIRITUAL_X',	'POLICY_AGGRESSIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'QUANAH_PARKER [ICON_PEACE][ICON_WAR]'
WHERE Type = 'LEADER_QUANAH_PARKER'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SHOSHONE' )
	THEN '_SHOSHONE'
	ELSE '_AMER' END) 
WHERE Type = 'CIVILIZATION_S_COMANCHE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,							CultureType,		CultureEra)
VALUES	('CIVILIZATION_S_COMANCHE',	'AMERICAN',	'ANY');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23)
--==========================================================================================================================
/*
Tables (example below; replace Civilizations with MinorCivilizations where appropriate):
   
v22
    Civilizations_YagemRequestedResource (Earth Giant)
    Civilizations_YahemRequestedResource (Earth Huge)
    Civilizations_GreatestEarthRequestedResource 
    Civilizations_EuroLargeRequestedResource
     
v23
    Civilizations_EuroGiantRequestedResource 
    Civilizations_EastAsiaStartPosition 
    Civilizations_ApennineStartPosition
    Civilizations_BritishIslesStartPosition
    Civilizations_NorthEastAsiaStartPosition
    Civilizations_AegeanStartPosition
    Civilizations_NorthAtlanticStartPosition
    Civilizations_PacificStartPosition
    Civilizations_SouthPacificStartPosition
    Civilizations_NorthWestEuropeStartPosition
    Civilizations_CaribbeanStartPosition
    Civilizations_AsiaStartPosition
    Civilizations_MediterraneanStartPosition
    Civilizations_MesopotamiaStartPosition
    Civilizations_AfricaLargeStartPosition
    Civilizations_NileValleyStartPosition
    Civilizations_AmericasStartPosition
 
*/
 
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
        (Type,                          X,      Y)
VALUES  ('CIVILIZATION_S_COMANCHE',     139,     59);

CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
        (Type,                          X,      Y)
VALUES  ('CIVILIZATION_S_COMANCHE',     20,     51);

CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
        (Type,                          X,      Y)
VALUES  ('CIVILIZATION_S_COMANCHE',     10,     42);

CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
        (Type,                          X,      Y)
VALUES  ('CIVILIZATION_S_COMANCHE',     36,     51);
-------------------------------------
-- Civilizations_YagemRequestedResource (Earth Giant)
-------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_S_COMANCHE',  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_SHOSHONE';

CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_S_COMANCHE',  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_SHOSHONE';

CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_S_COMANCHE',  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_SHOSHONE';

CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_S_COMANCHE',  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);
 
--Any items entered into this table will not show into the Civilopedia. There is no technical limitation as to what can be hidden (I think).
INSERT INTO JFD_Civilopedia_HideFromPedia
        (Type)
VALUES  ('IMPROVEMENT_JFD_HATSHEPSUT_FRANKINCENSE'),
        ('IMPROVEMENT_JFD_HATSHEPSUT_MYRRH');
 
-- For a leader to appear as belonging to another civilization, fill in the tag: "DerivativeCiv" e.g.
UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_RUSSIA'
WHERE Type = 'CIVILIZATION_JFD_RUSSIA_PUTIN';   
-- Thanks to Sukritact, you can also fill this tag in with a text string, which will group this civ with others that also have this text string.
UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_JFD_RUSSIA_MASTER_RACE'
WHERE Type = 'CIVILIZATION_JFD_RUSSIA_PUTIN';   
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
/*
JFD_Germanic, JFD_Latinate, JFD_Tai_Khmer, JFD_Austronesian, JFD_Arabic, JFD_Slavic, JFD_Mesopotamian, JFD_Mesoamerican, JFD_Oriental,
JFD_Finno_Ugric, JFD_Semitic, JFD_Hellenic, JFD_Bantu, JFD_Songhay, JFD_Indo_Iranian, JFD_Altaic, JFD_Celtic, JFD_NorthAmerican, JFD_Quechumaran
*/
INSERT INTO Civilization_JFD_ColonialCityNames
        (CivilizationType,                      ColonyName,                             LinguisticType)
VALUES  ('CIVILIZATION_S_COMANCHE',             null,                                   'JFD_NorthAmerican'),
		('CIVILIZATION_S_COMANCHE',             null,                                   'JFD_Mesoamerican');
--==========================================================================================================================
-- JFD's CHARTERED VENTURES (34c6919a-fcb5-44cf-8a76-78380dbc39ab)
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(Type)  default null,
    CurrencyType                    text                                        default null);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,                  CurrencyType)
SELECT  'CIVILIZATION_S_COMANCHE', CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';    
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------   
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(Type)          default null,
    CultureType                                 text                                            default null,
    ArtDefineTag                                text                                            default null,
    IdealsTag                                   text                                            default null,
    SplashScreenTag                             text                                            default null,
    SoundtrackTag                               text                                            default null,
    UnitDialogueTag                             text                                            default null);
/*
CultureTypes:
  JFD_Andean, JFD_Bantu, JFD_Bharata, JFD_Central, JFD_Colonial, JFD_Eastern, JFD_Islamic, JFD_Katuje, JFD_Mandala, JFD_Mediterranean, JFD_Mesoamerican, JFD_Mesopotamic, JFD_Northern, JFD_Oceanic, JFD_Oriental, JFD_Polar, JFD_Sahul, JFD_Semitic, JFD_Steppe, JFD_Southern, JFD_TribalAmerican, JFD_Totalitarian, JFD_WestAfrican, JFD_Western
 
SplashScreenTags (As above, unless otherwise specified)
  JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SouthernPapal
   
SoundtrackTag (As above, unless otherwise specified)
  JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese
   
 UnitDialogueTag
    AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_NATIVE_AMERICAN (Mohawk), AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
     
    *Recommended to only use for Mercenary Units, as these have fewer tracks.
*/
 
-- This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_NORWAY' to the
-- tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,          ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_S_COMANCHE',  ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Plains'
WHERE Type = 'CIVILIZATION_S_COMANCHE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Plains');
--==========================================================================================================================    
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
--==========================================================================================================================
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-10 may be set. This value determines the likelihood that a leader will take out Mercenary Contracts (provided they have the funds).
--A value of 10 means this civilization will always take a Contract if available. A value of 0 means this civilization will never take out a contract.
INSERT INTO Leader_Flavors
        (LeaderType,                FlavorType,                 Flavor)
VALUES  ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_MERCENARY',     0);
--==========================================================================================================================    
-- JFD's PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================    
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 1-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
        (LeaderType,            FlavorType,                             Flavor)
VALUES  ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',     6);
--==========================================================================================================================    
-- JFD's SOVEREIGNTY (d99bf7aa-51ac-4bef-bd88-d765b28e260e)
--==========================================================================================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);
 
--This table determines a variety of things relating to your Government.
--The LegislatureName refers to the name of your Legislature (e.g. the Imperial Diet). 
--The OfficeTitle refers to the title of your Head of Government (if a Const. Monarchy) (e.g. Vizier. Default is Prime Minister)
--GovernmentType and Weight prefer to a Government preference (GOVERNMENT_JFD_MONARCHY or GOVERNMENT_JFD_REPUBLIC) and how strong that preference is.
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,                  LegislatureName,                                    OfficeTitle,                                                GovernmentType,             Weight)
VALUES  ('CIVILIZATION_S_COMANCHE',   'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_S_COMANCHE',  'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE',  'GOVERNMENT_JFD_REPUBLIC',  100);
------------------------------------------------------------    
-- Civilization_JFD_HeadsOfGovernment   
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);
 
--These are the Heads of your Government, which are randomly chosen when a new Legislature is formed.
--The standard number for each civ is 25. However, you may leave this table empty and your civ will call
--from a cultural list (so long as you have Cultural Diversity support).
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,                      HeadOfGovernmentName)
VALUES  ('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_1'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_2'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_3'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_4'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_5'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_6'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_7'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_8'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_9'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_10'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_11'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_12'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_13'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_14'),
		('CIVILIZATION_S_COMANCHE',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_S_COMANCHE_15');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 
 
--This lists all the unique titles that a civilization should use instead of a standard one. If left blank, a culture-specific title will be used instead (if CulDiv support).
--The default titles are as follows:
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT (Tribe)
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER (Chief/Chieftess)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER (Grand Prince)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT (Grand Principality)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER (King/Queen)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT (Kingdom)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER (Emperor/Empress)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT (Empire)
----TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT (Commonwealth)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER (Consul)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE (President)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT (Republic)
----TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER (Dictator)
----TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT (Federation)
 
--For 'LEADER' titles, just include the title in the text, e.g. "Pharoah." 
--For 'GOVERNMENT' titles, include a placeholder for your civ's short description, e.g. "Kingdom of {1_CivName}"
--Use 'UseAdjective' when you want the 'GOVERNMENT' title to read (e.g.): "{1_CivAdj} Kingdom" instead of "Kingdom of {1_CivName}"
INSERT INTO Civilization_JFD_Titles
        (CivilizationType,                  DefaultTitle,                                   UniqueTitle)
VALUES  ('CIVILIZATION_S_COMANCHE',   'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER',    'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);
 
--This lists all the unique names for a civ's political parties.
--Political Parties are as follows:
----PARTY_JFD_CLERGY
----PARTY_JFD_NOBILITY
----PARTY_JFD_REVOLUTIONARY
----PARTY_JFD_CONSERVATIVE
----PARTY_JFD_LIBERAL
----PARTY_JFD_REACTIONARY
----PARTY_JFD_SOCIALIST
----PARTY_JFD_COMMUNIST
----PARTY_JFD_FASCIST
----PARTY_JFD_LIBERTARIAN
INSERT INTO Civilization_JFD_Politics
        (CivilizationType,                  PoliticsType,               UniqueName)
VALUES  ('CIVILIZATION_S_COMANCHE',   'PARTY_JFD_NOBILITY',  'TXT_KEY_JFD_PARTY_JFD_NOBILITY_S_COMANCHE');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--Each flavour corresponds to one of the seven Reform Categories, and how likely a civ is to take a reform in either the Right, Centre, or Left column.
--A value of 1-3 will favour Left Reforms. A value of 4-6 will value Centre Reforms. A value of 7-10 will value Right Reforms. The strength of the value will determine how soon a Leader will implement that Reform.
INSERT INTO Leader_Flavors
        (LeaderType,            FlavorType,                         Flavor)
VALUES  ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_REFORM_GOVERNMENT',     5),
        ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_REFORM_CULTURE',        7),
        ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_REFORM_ECONOMIC',       6),
        ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_REFORM_FOREIGN',        5),
        ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_REFORM_INDUSTRY',       6),
        ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_REFORM_MILITARY',       7),
        ('LEADER_QUANAH_PARKER',    'FLAVOR_JFD_REFORM_RELIGION',       7);
------------------------------------------------------------   
--Historical Religions
------------------------------------------------------------   
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_POHAKANTENNA' )
		THEN 'RELIGION_POHAKANTENNA'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
	) WHERE CivilizationType = 'CIVILIZATION_S_COMANCHE';
--==========================================================================================================================        
--==========================================================================================================================  

