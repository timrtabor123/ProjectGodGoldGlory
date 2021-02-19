--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--==========================================================================================================================
-- SUKRITACT'S DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('DMS_MC_KanemBornu_Decisions.lua');
------------------------------------------------------------
-- Policies
------------------------------------------------------------
INSERT INTO Policies 
		(Type,									Description) 
VALUES	('POLICY_DMS_APPOINT_ZANNA_ARJINAMA',	'TXT_KEY_DECISIONS_DMS_APPOINT_ZANNA_ARJINAMA');
-- Policy_BuildingClassHappiness
INSERT INTO Policy_BuildingClassHappiness 
		(PolicyType,							BuildingClassType,				Happiness) 
VALUES	('POLICY_DMS_APPOINT_ZANNA_ARJINAMA',	'BUILDINGCLASS_CARAVANSARY',	1);
-- Policy_BuildingClassYieldModifiers
INSERT INTO Policy_BuildingClassYieldModifiers 
		(PolicyType,							BuildingClassType,				YieldType,		YieldMod) 
VALUES	('POLICY_DMS_APPOINT_ZANNA_ARJINAMA',	'BUILDINGCLASS_CARAVANSARY',	'YIELD_GOLD',	10);
------------------------------------------------------------	
-- BUILDINGS
------------------------------------------------------------	
-- BuildingClasses
INSERT INTO BuildingClasses 
		(DefaultBuilding, 						Type, 										Description)
VALUES	('BUILDING_DMS_SUPPORT_THE_MALAMTI_1',	'BUILDINGCLASS_DMS_SUPPORT_THE_MALAMTI', 	'TXT_KEY_BUILDING_DMS_SUPPORT_THE_MALAMTI');
-- Buildings
INSERT INTO Buildings
		(Type, 						 			BuildingClass, 								GreatWorkCount,	Cost,	FaithCost,	PrereqTech,	MinAreaSize,	Description, 								Help)
VALUES	('BUILDING_DMS_SUPPORT_THE_MALAMTI_1',	'BUILDINGCLASS_DMS_SUPPORT_THE_MALAMTI',	-1,				-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_SUPPORT_THE_MALAMTI',	'TXT_KEY_BUILDING_DMS_SUPPORT_THE_MALAMTI_1_HELP'),
		('BUILDING_DMS_SUPPORT_THE_MALAMTI_2',	'BUILDINGCLASS_DMS_SUPPORT_THE_MALAMTI',	-1,				-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_SUPPORT_THE_MALAMTI',	'TXT_KEY_BUILDING_DMS_SUPPORT_THE_MALAMTI_2_HELP'),
		('BUILDING_DMS_SUPPORT_THE_MALAMTI_3',	'BUILDINGCLASS_DMS_SUPPORT_THE_MALAMTI',	-1,				-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_SUPPORT_THE_MALAMTI',	'TXT_KEY_BUILDING_DMS_SUPPORT_THE_MALAMTI_3_HELP');
-- Building_YieldChanges
INSERT INTO Building_YieldChanges
		(BuildingType, 						 	YieldType, 		Yield)
VALUES	('BUILDING_DMS_SUPPORT_THE_MALAMTI_1',	'YIELD_FAITH',	2),
		('BUILDING_DMS_SUPPORT_THE_MALAMTI_2',	'YIELD_FAITH',	4),
		('BUILDING_DMS_SUPPORT_THE_MALAMTI_3',	'YIELD_FAITH',	6);
--==========================================================================================================================
-- SUKRITACT'S EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('DMS_MC_KanemBornu_Events.lua');
------------------------------------------------------------
-- Policies
------------------------------------------------------------
-- Policies
INSERT INTO Policies 
		(Type,									Description) 
VALUES	('POLICY_DMS_SOKOTO_BOATMEN_DUMMY_1',	'TXT_KEY_DECISIONS_DMS_SOKOTO_BOATMEN_DUMMY_1'),
		('POLICY_DMS_SOKOTO_BOATMEN_DUMMY_2',	'TXT_KEY_DECISIONS_DMS_SOKOTO_BOATMEN_DUMMY_2');
------------------------------------------------------------	
-- PROMOTIONS
------------------------------------------------------------	
-- UnitPromotions
INSERT INTO UnitPromotions 	
		(Type, 											Description,										Help,														CombatPercent,	River,	MovesChange,	Sound,				PortraitIndex,	IconAtlas,			PediaType,			PediaEntry,													CannotBeChosen)
VALUES	('PROMOTION_DMS_SOKOTO_BOATMEN_KANEM_BORNU',	'TXT_KEY_PROMOTION_DMS_SOKOTO_BOATMEN_KANEM_BORNU',	'TXT_KEY_PROMOTION_DMS_SOKOTO_BOATMEN_KANEM_BORNU_HELP',	5,				1,		1,				'AS2D_IF_LEVELUP',	33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_SOKOTO_BOATMEN_KANEM_BORNU_HELP',	1),
		('PROMOTION_DMS_SOKOTO_BOATMEN',				'TXT_KEY_PROMOTION_DMS_SOKOTO_BOATMEN',				'TXT_KEY_PROMOTION_DMS_SOKOTO_BOATMEN_HELP',				15,				1,		2,				'AS2D_IF_LEVELUP',	33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_SOKOTO_BOATMEN_HELP',				1);
------------------------------------------------------------	
-- BUILDINGS
------------------------------------------------------------	
-- BuildingClasses
INSERT INTO BuildingClasses 
		(DefaultBuilding, 						Type, 										Description)
VALUES	('BUILDING_DMS_YERIMA_OR_KAYGHAMMA_1',	'BUILDINGCLASS_DMS_YERIMA_OR_KAYGHAMMA', 	'TXT_KEY_BUILDING_DMS_YERIMA_OR_KAYGHAMMA');
-- Buildings
INSERT INTO Buildings
		(Type, 						 			BuildingClass, 								GreatPeopleRateModifier,	MilitaryProductionModifier,	GreatWorkCount,		Cost,	FaithCost,	PrereqTech,	MinAreaSize,	Description, 								Help)
VALUES	('BUILDING_DMS_YERIMA_OR_KAYGHAMMA_1',	'BUILDINGCLASS_DMS_YERIMA_OR_KAYGHAMMA',	10,							0,							-1,					-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_YERIMA_OR_KAYGHAMMA',	'TXT_KEY_BUILDING_DMS_YERIMA_OR_KAYGHAMMA_1_HELP'),
		('BUILDING_DMS_YERIMA_OR_KAYGHAMMA_2',	'BUILDINGCLASS_DMS_YERIMA_OR_KAYGHAMMA',	0,							10,							-1,					-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_YERIMA_OR_KAYGHAMMA',	'TXT_KEY_BUILDING_DMS_YERIMA_OR_KAYGHAMMA_2_HELP'),
		('BUILDING_DMS_YERIMA_DUMMY',			'BUILDINGCLASS_DMS_YERIMA_OR_KAYGHAMMA',	0,							0,							-1,					-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_YERIMA_OR_KAYGHAMMA',	'TXT_KEY_BUILDING_DMS_YERIMA_DUMMY_HELP'),
		('BUILDING_DMS_KAYGHAMMA_DUMMY',		'BUILDINGCLASS_DMS_YERIMA_OR_KAYGHAMMA',	0,							0,							-1,					-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_YERIMA_OR_KAYGHAMMA',	'TXT_KEY_BUILDING_DMS_KAYGHAMMA_DUMMY_HELP');
--==========================================================================================================================
-- HAZEL'S MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,									CultureType,	CultureEra)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'AFRICAN',		'ANY');
--==========================================================================================================================
-- BRUTALSAMURAI'S ETHNIC UNITS / GEDEMON'S R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SONGHAI' )
	THEN '_SONGHAI'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_DMS_MC_KANEM_BORNU';
--==========================================================================================================================
-- BINGLE'S CIV IV TRAITS
--==========================================================================================================================
-- Leader_SharedTraits
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS  
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
         (LeaderType,					TraitOne,					TraitTwo)
VALUES  ('LEADER_DMS_MC_IDIRS_ALAUMA',	'POLICY_SPIRITUAL_X',		'POLICY_MERCANTILE_X');
------------------------------------------------------------	
-- Leaders
------------------------------------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Idris Alauma [ICON_PEACE][ICON_GOLD]'
	ELSE 'TXT_KEY_LEADER_DMS_MC_IDIRS_ALAUMA' END) 
WHERE Type = 'LEADER_DMS_MC_IDIRS_ALAUMA';

CREATE TRIGGER CivIVTraitsDMSMCKanemBornu
AFTER INSERT ON Leaders WHEN 'LEADER_DMS_MC_IDIRS_ALAUMA' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Idris Alauma [ICON_PEACE][ICON_GOLD]'
		ELSE 'TXT_KEY_LEADER_DMS_MC_IDIRS_ALAUMA' END) 
	WHERE Type = 'LEADER_DMS_MC_IDIRS_ALAUMA';
END;		
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24)
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
v24
	Civilizations_MesopotamiaGiantStartPosition
	Civilizations_AsiaSmallStartPosition
	Civilizations_EuroLargeNewStartPosition
	Civilizations_AdriaticStartPosition
	Civilizations_WestAfricaStartPosition
	Civilizations_CaucasusStartPosition
	Civilizations_AsiaSteppeGiantStartPosition
	Civilizations_CentralAsiaStartPosition
	Civilizations_EuroEasternStartPosition
	Civilizations_NorthSeaEuropeStartPosition
	Civilizations_AfriAsiaAustStartPosition
	Civilizations_AfriSouthEuroStartPosition
	Civilizations_AfriGiantStartPosition
	Civilizations_SouthAmericaGiantStartPosition
	Civilizations_AustralasiaGiantStartPosition
	Civilizations_IndianOceanStartPosition
	Civilizations_AmericasGiantStartPosition
	Civilizations_IndiaGiantStartPosition
	Civilizations_SouthAmericaCentralHugeStartPosition
	Civilizations_SouthAmericaCentralGiantStartPosition
	Civilizations_ScotlandIrelandHugeStartPosition
	Civilizations_SouthAmericaLargeStartPosition
	Civilizations_SouthAsiaHugeStartPosition
	Civilizations_SouthPacificGiantStartPosition
	Civilizations_NorthAmericaGiantStartPosition
	Civilizations_NorthAmericaHugeStartPosition 
*/
------------------------------------------------------------
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			22,	38);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			64,	37);
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			50,	25);
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			39,	14);
------------------------------------------------------------	
-- Civilizations_CordiformRequestedResource (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_AfricaLargeStartPosition (Africa Pangea)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			25,	49);
------------------------------------------------------------	
-- Civilizations_AfricaLargeRequestedResource (Africa Pangea)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_WestAfricaStartPosition (West Africa)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_WestAfricaStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			89,	26);
------------------------------------------------------------	
-- Civilizations_WestAfricaRequestedResource (West Africa)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_WestAfricaRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_AfriGiantStartPosition (Africa Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriGiantStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			59,	90);
------------------------------------------------------------	
-- Civilizations_AfriGiantRequestedResource (Africa Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriGiantRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_AfriSouthEuroStartPosition (Africa & Southern Europe)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			38,	42);
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroRequestedResource (Africa & Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
------------------------------------------------------------
-- Civilizations_AfriAsiaAustStartPosition (Africa, Asia & Australia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,										X,	Y)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			26,	47);
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustRequestedResource (Africa, Asia & Australia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriAsiaAustRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',			'RESOURCE_SHEEP',	null,	'RESOURCE_SALT',	null,	'RESOURCE_HORSE',	4);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

--Any items entered into this table will not show into the Civilopedia. There is no technical limitation as to what can be hidden (I think).
 
-- For a leader to appear as belonging to another civilization, fill in the tag: "DerivativeCiv" e.g.
UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_DMS_MC_KANEM_BORNU'
WHERE Type = 'CIVILIZATION_DMS_MC_KANEM_BORNU';
-- Thanks to Sukritact, you can also fill this tag in with a text string, which will group this civ with others that also have this text string.
--UPDATE Civilizations
--SET DerivativeCiv = 'TXT_KEY_JFD_RUSSIA_MASTER_RACE'
--WHERE Type = 'CIVILIZATION_DMS_MC_KANEM_BORNU';   
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
UPDATE Units
SET Help = 'TXT_KEY_UNIT_DMS_MC_ASKAWR_CID_HELP', Strategy = 'TXT_KEY_UNIT_DMS_MC_ASKAWR_CID_STRATEGY'
WHERE Type = 'UNIT_DMS_MC_ASKAWR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

UPDATE UnitPromotions
SET Help = 'TXT_KEY_PROMOTION_DMS_MC_PERFECT_PRINCE_CID_HELP'
WHERE Type = 'PROMOTION_DMS_MC_PERFECT_PRINCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------
-- BuildingClass_ConstructionAudio
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
BuildingClass_ConstructionAudio (
    BuildingClassType                           text    REFERENCES BuildingClasses(Type)        default null,
    ConstructionAudio                           text                                            default null);
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
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 								ColonyName,			LinguisticType)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',				null,				'JFD_Songhay');
------------------------------------------------------------		
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the proclivity a civ has toward annexing a colony, where 0 means never, and 10 means as soon as possible.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,						Flavor)
VALUES	('LEADER_DMS_MC_IDIRS_ALAUMA',	'FLAVOR_JFD_DECOLONIZATION',	6);
--==========================================================	
-- PROVINCES 
--==========================================================	
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null, -- ignore this
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	
	
/*
Default Titles:
TXT_KEY_PROVINCE_JFD_BARONY_DESC_MONARCHY -- Barony
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_MONARCHY -- County
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_MONARCHY -- Duchy
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_COLONY_DESC_MONARCHY -- Colony
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_MONARCHY_FEMININE 

(Generally, Republics do not have unique titles)
TXT_KEY_PROVINCE_JFD_BARONY_DESC_REPUBLIC -- Municipality
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_REPUBLIC_FEMININE
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC -- County
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC_MONARCHY
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_REPUBLIC -- State
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_REPUBLIC_FEMININE
TXT_KEY_PROVINCE_JFD_COLONY_DESC_REPUBLIC -- Colony
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_REPUBLIC_FEMININE 
*/	
--This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_SCOTLAND' to the
--tag of your custom civ. 
INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,					DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_DMS_MC_KANEM_BORNU',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--==========================================================================================================================    
-- JFD's CITIES IN DEVELOPMENT: SLAVERY (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
--==========================================================================================================================    
-- Flavors
------------------------------------------------------------
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------  
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
        (LeaderType,            		FlavorType,                 Flavor)
VALUES  ('LEADER_DMS_MC_IDIRS_ALAUMA',	'FLAVOR_JFD_SLAVERY',       8);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(Type)          default null,
    CultureType                                 text                                            default null,
    ArtDefineTag                                text                                            default null,
    DefeatScreenEarlyTag                        text                                            default null,
    DefeatScreenMidTag                          text                                            default null,
    DefeatScreenLateTag                         text                                            default null,
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
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,        			CultureType)
VALUES  ('CIVILIZATION_DMS_MC_KANEM_BORNU',	'CULTURE_JFD_SAHARAN');

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Saharan'
WHERE Type = 'CIVILIZATION_DMS_MC_KANEM_BORNU'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Saharan');
------------------------------------------------------------
-- MinorCivilization_JFD_CultureTypes
------------------------------------------------------------
--==========================================================================================================================
-- JFD's EXPLORATION CONTINUED EXPANDED (6676902b-b907-45f1-8db5-32dcb2135eee)
--==========================================================================================================================
--PROMOTION_JFD_SNOW_IMMUNITY, PROMOTION_JFD_DESERT_IMMUNITY, PROMOTION_JFD_DISEASE_IMMUNITY, PROMOTION_JFD_JUNGLE_IMMUNITY, PROMOTION_JFD_SCUVRY_IMMUNITY
INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
SELECT	'UNIT_DMS_MC_ASKAWR',		'PROMOTION_JFD_DESERT_IMMUNITY'
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_DESERT_IMMUNITY');
--===============================	===========================================================================================    
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
        (LeaderType,						FlavorType,                 Flavor)
VALUES  ('LEADER_DMS_MC_IDIRS_ALAUMA',		'FLAVOR_JFD_MERCENARY',     7);
--==========================================================================================================================    
-- JFD's RISE TO POWER: PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================    
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_DMS_MC_IDIRS_ALAUMA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		9),
		('LEADER_DMS_MC_IDIRS_ALAUMA',	'FLAVOR_JFD_STATE_RELIGION',			9);
--==========================================================================================================================    
-- JFD's RISE TO POWER: PROSPERITY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================    
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(Type)  default null,
    CurrencyType                    text                                        default null);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,                  	CurrencyType)
SELECT  'CIVILIZATION_DMS_MC_KANEM_BORNU',		CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_SONGHAI';  
--==========================================================================================================================    
-- JFD's RISE TO POWER: SOVEREIGNTY (eea66053-7579-481a-bb8d-2f3959b59974)
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
        (CivilizationType,					LegislatureName,												OfficeTitle,												GovernmentType,             Weight)
VALUES  ('CIVILIZATION_DMS_MC_KANEM_BORNU',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_DMS_MC_KANEM_BORNU',	'TXT_KEY_JFD_OFFICE_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU',	'GOVERNMENT_JFD_MONARCHY',  80);
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
		(CivilizationType,						HeadOfGovernmentName)
VALUES	('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_1'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_2'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_3'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_4'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_5'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_6'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_7'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_8'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_9'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_10'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_11'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_12'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_13'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_14'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_15'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_16'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_17'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_18'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_19'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_20'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_21'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_22'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_23'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_24'),
		('CIVILIZATION_DMS_MC_KANEM_BORNU',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_DMS_MC_KANEM_BORNU_25');
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
       (CivilizationType,						    DefaultTitle,									  UniqueTitle)
VALUES  ('CIVILIZATION_DMS_MC_KANEM_BORNU',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',    'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_DMS_MC_IDIRS_ALAUMA');
------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  				text 										 	default null,
	PolicyType  						text 	REFERENCES Policies(Type) 				default null,
	CivilizationType					text	REFERENCES Civilizations(Type) 			default	null,
	CultureType							text											default	null,
	GovernmentType  					text 	 										default null,
	ReligionType						text	REFERENCES Religions(Type) 				default	null,
	UniqueName							text											default	null);
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
		(CivilizationType, 			                    PoliticsType,	UniqueName)
SELECT	'CIVILIZATION_DMS_MC_KANEM_BORNU',				PoliticsType,	UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
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
        (LeaderType,            			FlavorType,                         Flavor)
VALUES  ('LEADER_DMS_MC_IDIRS_ALAUMA',    	'FLAVOR_JFD_REFORM_GOVERNMENT',     8),
		('LEADER_DMS_MC_IDIRS_ALAUMA',		'FLAVOR_JFD_REFORM_LEGAL',			7),
        ('LEADER_DMS_MC_IDIRS_ALAUMA',    	'FLAVOR_JFD_REFORM_CULTURE',        7),
        ('LEADER_DMS_MC_IDIRS_ALAUMA',    	'FLAVOR_JFD_REFORM_ECONOMIC',       5),
        ('LEADER_DMS_MC_IDIRS_ALAUMA',    	'FLAVOR_JFD_REFORM_FOREIGN',        7),
        ('LEADER_DMS_MC_IDIRS_ALAUMA',    	'FLAVOR_JFD_REFORM_INDUSTRY',       6),
        ('LEADER_DMS_MC_IDIRS_ALAUMA',    	'FLAVOR_JFD_REFORM_MILITARY',       8),
        ('LEADER_DMS_MC_IDIRS_ALAUMA',    	'FLAVOR_JFD_REFORM_RELIGION',       9);
--==========================================================================================================================	
-- The Enlightenment Era
--==========================================================================================================================	
UPDATE Units 
SET ObsoleteTech = 'TECH_EE_IMPERIALISM', GoodyHutUpgradeUnitClass = 'UNITCLASS_EE_CUIRASSIER'
WHERE Type = 'UNIT_DMS_MC_ASKAWR'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

UPDATE Unit_ClassUpgrades 
SET UnitClassType = 'UNITCLASS_EE_CUIRASSIER'
WHERE UnitType = 'UNIT_DMS_MC_ASKAWR'
AND EXISTS (SELECT * FROM Unit_ClassUpgrades WHERE UnitClassType = 'UNITCLASS_EE_CUIRASSIER');
--==========================================================================================================================        
--==========================================================================================================================