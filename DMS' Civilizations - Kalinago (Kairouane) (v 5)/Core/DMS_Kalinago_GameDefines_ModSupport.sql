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
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('DMS_Kalinago_Decisions.lua');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 				Type, 								Description)
VALUES	('BUILDING_DMS_THE_SNAKE_KING',	'BUILDINGCLASS_DMS_THE_SNAKE_KING', 'TXT_KEY_BUILDING_DMS_THE_SNAKE_KING');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO Buildings
		(Type, 						 	BuildingClass, 						Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	Happiness,	MinAreaSize,	Description, 							Help)
VALUES	('BUILDING_DMS_THE_SNAKE_KING', 'BUILDINGCLASS_DMS_THE_SNAKE_KING',	-1,		-1,			-1,				null,		0,			-1,				'TXT_KEY_BUILDING_DMS_THE_SNAKE_KING',	'TXT_KEY_BUILDING_DMS_THE_SNAKE_KING_HELP');
------------------------------
-- Building_TerrainYieldChanges
------------------------------	
INSERT OR REPLACE INTO Building_TerrainYieldChanges 
		(BuildingType, 					TerrainType, 		YieldType,			Yield)
VALUES	('BUILDING_DMS_THE_SNAKE_KING',	'TERRAIN_COAST',	'YIELD_CULTURE',	1),
		('BUILDING_DMS_THE_SNAKE_KING',	'TERRAIN_MOUNTAIN',	'YIELD_CULTURE',	1);
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 	
		(Type, 									Description,								Help,												Sound,				PortraitIndex,	IconAtlas,			PediaType,			PediaEntry,											CannotBeChosen)
VALUES	('PROMOTION_DMS_SPIRIT_OF_THE_ROCK',	'TXT_KEY_PROMOTION_DMS_SPIRIT_OF_THE_ROCK',	'TXT_KEY_PROMOTION_DMS_SPIRIT_OF_THE_ROCK_HELP',	'AS2D_IF_LEVELUP',	33,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_SPIRIT_OF_THE_ROCK_HELP',	1);
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType, 						UnitCombatType)
VALUES	('PROMOTION_DMS_SPIRIT_OF_THE_ROCK',	'UNITCOMBAT_RECON'),
		('PROMOTION_DMS_SPIRIT_OF_THE_ROCK',	'UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_SPIRIT_OF_THE_ROCK',	'UNITCOMBAT_GUN');
--==========================================================================================================================
-- HAZEL'S MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,		CultureEra)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'FIRST_AMERICANS',	'ANY');
--==========================================================================================================================
-- BRUTALSAMURAI'S ETHNIC UNITS / GEDEMON'S R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_AZTEC' )
	THEN '_AZTEC'
	ELSE '_AMER' END) 
WHERE Type = 'CIVILIZATION_DMS_KALINAGO';
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
         (LeaderType,				TraitOne,					TraitTwo)
VALUES  ('LEADER_DMS_KAIROUANE',	'POLICY_SEAFARING_X',		'POLICY_FINANCIAL_X');
------------------------------------------------------------	
-- Leaders
------------------------------------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Kairouane [ICON_GREAT_EXPLORER][ICON_TRADE]'
	ELSE 'TXT_KEY_LEADER_DMS_KAIROUANE' END) 
WHERE Type = 'LEADER_DMS_KAIROUANE';

CREATE TRIGGER CivIVTraitsDMSkalinago
AFTER INSERT ON Leaders WHEN 'LEADER_DMS_KAIROUANE' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Kairouane [ICON_GREAT_EXPLORER][ICON_TRADE]'
		ELSE 'TXT_KEY_LEADER_DMS_KAIROUANE' END) 
	WHERE Type = 'LEADER_DMS_KAIROUANE';
END;		
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------------------------------------
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = "RELIGION_ZEMIISM" )
		THEN "RELIGION_ZEMIISM"
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = "RELIGION_ORTHODOXY" )
		THEN "RELIGION_ORTHODOXY" 
		ELSE "RELIGION_CHRISTIANITY" END ) END
	) WHERE CivilizationType = "CIVILIZATION_DMS_KALINAGO";

CREATE TRIGGER CivilizationDMSKalinago
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_KALINAGO' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEMIISM' )
			THEN 'RELIGION_ZEMIISM'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ORTHODOXY' )
			THEN 'RELIGION_ORTHODOXY'
			ELSE 'RELIGION_CHRISTIANITY' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_DMS_KALINAGO';
END;
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
		(Type,									X,		Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			161,	46);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			36,	42);
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			30,	30);
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			14,	24);
------------------------------------------------------------	
-- Civilizations_CordiformRequestedResource (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			6,	5);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);

------------------------------------------------------------
-- Civilizations_AmericasGiantStartPosition (Americas Giant
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasGiantStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			91,	90);
------------------------------------------------------------	
-- Civilizations_AmericasGiantRequestedResource (Americas Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasGiantRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_AmericasStartPosition (Americas Standard)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			52,	40);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (Americas Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_CaribbeanStartPosition (Caribbean Large)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			89,	24);
------------------------------------------------------------	
-- Civilizations_CaribbeanRequestedResource (Caribbean Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaribbeanRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_NorthAmericaGiantStartPosition (North America Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaGiantStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			127,	14);
------------------------------------------------------------	
-- Civilizations_NorthAmericaGiantRequestedResource (North America Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaGiantRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_NorthAmericaHugeStartPosition (North America Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaHugeStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			110,	3);
------------------------------------------------------------	
-- Civilizations_NorthAmericaHugeRequestedResource (North America Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaHugeRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_SouthAmericaCentralGiantStartPosition (South & Central America Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaCentralGiantStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			79,	120);
------------------------------------------------------------	
-- Civilizations_SouthAmericaCentralGiantRequestedResource (South & Central America Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaCentralGiantRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_SouthAmericaCentralHugeStartPosition (South & Central America Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaCentralHugeStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			61,	91);
------------------------------------------------------------	
-- Civilizations_SouthAmericaCentralHugeRequestedResource (South & Central America Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaCentralHugeRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
------------------------------------------------------------
-- Civilizations_SouthAmericaLargeStartPosition (South America Large)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaLargeStartPosition
		(Type,									X,	Y)
VALUES	('CIVILIZATION_DMS_KALINAGO',			45,	87);
------------------------------------------------------------	
-- Civilizations_SouthAmericaLargeRequestedResource (South America Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaLargeRequestedResource
		(Type, 									Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_DMS_KALINAGO',			'RESOURCE_SILVER',	null,	'RESOURCE_FISH',	null,	'RESOURCE_PEARLS',	null);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

--Any items entered into this table will not show into the Civilopedia. There is no technical limitation as to what can be hidden (I think).
 INSERT INTO JFD_Civilopedia_HideFromPedia
        (Type)
VALUES  ('BUILDING_DMS_KALINAGO_GROWTH'),
		('BUILDING_DMS_KALINAGO_CITY_DAMAGE'),
		('BUILDING_DMS_KALINAGO_BUYEIS_HAPPINESS');
-- For a leader to appear as belonging to another civilization, fill in the tag: "DerivativeCiv" e.g.
UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_DMS_KALINAGO'
WHERE Type = 'CIVILIZATION_DMS_KALINAGO';
-- Thanks to Sukritact, you can also fill this tag in with a text string, which will group this civ with others that also have this text string.
--UPDATE Civilizations
--SET DerivativeCiv = 'TXT_KEY_JFD_RUSSIA_MASTER_RACE'
--WHERE Type = 'CIVILIZATION_DMS_KALINAGO';   
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
-- BuildingClass_ConstructionAudio
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
BuildingClass_ConstructionAudio (
    BuildingClassType                           text    REFERENCES BuildingClasses(Type)        default null,
    ConstructionAudio                           text											default null);
	
--The following will override any entries for the above.
CREATE TABLE IF NOT EXISTS
Building_ConstructionAudio (
    BuildingType                                text    REFERENCES Buildings(Type)              default null,
    ConstructionAudio                           text											default null);
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
		(CivilizationType, 							ColonyName,			LinguisticType)
VALUES	('CIVILIZATION_DMS_KALINAGO',				null,				'JFD_Mesoamerican');
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
VALUES	('LEADER_DMS_KAIROUANE',		'FLAVOR_JFD_DECOLONIZATION',	5);
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
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_DMS_KALINAGO',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_AZTEC';
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
VALUES  ('LEADER_DMS_KAIROUANE',		'FLAVOR_JFD_SLAVERY',       7);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);
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
        (CivilizationType,        			ArtDefineTag, CultureType,	IdealsTag,		SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_DMS_KALINAGO',		'JFD_Katuje', 'JFD_Katuje', 'JFD_Katuje',	'JFD_Katuje',	 'JFD_Katuje',	UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AZTEC';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Katuje'
WHERE Type = 'CIVILIZATION_DMS_KALINAGO'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Katuje');
------------------------------------------------------------
-- MinorCivilization_JFD_CultureTypes
------------------------------------------------------------
--==========================================================================================================================
-- JFD's EXPLORATION CONTINUED EXPANDED (6676902b-b907-45f1-8db5-32dcb2135eee)
--==========================================================================================================================
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
        (LeaderType,					FlavorType,                 Flavor)
VALUES  ('LEADER_DMS_KAIROUANE',		'FLAVOR_JFD_MERCENARY',     5);
--==========================================================================================================================    
-- JFD's RISE TO POWER: PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================    
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_DMS_KAIROUANE',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_DMS_KAIROUANE',		'FLAVOR_JFD_STATE_RELIGION',			8);
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
        (CivilizationType,                  CurrencyType)
SELECT  ('CIVILIZATION_DMS_KALINAGO'),		CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_AZTEC';  
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
        (CivilizationType,				LegislatureName,							OfficeTitle,	GovernmentType,					Weight)
SELECT  ('CIVILIZATION_DMS_KALINAGO'),	('TXT_KEY_JFD_LEGISLATURE_DMS_KALINAGO'),	OfficeTitle,	('GOVERNMENT_JFD_MONARCHY'),	65
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_AZTEC'; 
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
		(CivilizationType,				DefaultTitle,	UniqueTitle)
SELECT	('CIVILIZATION_DMS_KALINAGO'),	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_AZTEC';
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
		(CivilizationType, 			                PoliticsType,	UniqueName)
SELECT	'CIVILIZATION_DMS_KALINAGO',				PoliticsType,	UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_AZTEC';
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
        (LeaderType,            		FlavorType,                         Flavor)
VALUES  ('LEADER_DMS_KAIROUANE',    	'FLAVOR_JFD_REFORM_GOVERNMENT',     5),
		('LEADER_DMS_KAIROUANE',		'FLAVOR_JFD_REFORM_LEGAL',			4),
        ('LEADER_DMS_KAIROUANE',    	'FLAVOR_JFD_REFORM_CULTURE',        4),
        ('LEADER_DMS_KAIROUANE',    	'FLAVOR_JFD_REFORM_ECONOMIC',       5),
        ('LEADER_DMS_KAIROUANE',    	'FLAVOR_JFD_REFORM_FOREIGN',        6),
        ('LEADER_DMS_KAIROUANE',    	'FLAVOR_JFD_REFORM_INDUSTRY',       4),
        ('LEADER_DMS_KAIROUANE',    	'FLAVOR_JFD_REFORM_MILITARY',       7),
        ('LEADER_DMS_KAIROUANE',    	'FLAVOR_JFD_REFORM_RELIGION',       7);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  												text 	REFERENCES Leaders(Type) 				default	null,
	ReformType													text											default	null);
	
--Although Leader_Flavors will support, the following table will allow you to assign Reforms to leaders that they will be more likely to take. 
--For specific Reforms, see My Games\Sid Meier's Civilization 5\MODS\JFD's Rise to Power\Components\Sovereignty\Core\Sovereignty_Reforms.sql
--==========================================================================================================================	
-- JFD's DYNAMIC TOP PANEL
--==========================================================================================================================	
-- The Enlightenment Era
--==========================================================================================================================	
--==========================================================================================================================        
--==========================================================================================================================