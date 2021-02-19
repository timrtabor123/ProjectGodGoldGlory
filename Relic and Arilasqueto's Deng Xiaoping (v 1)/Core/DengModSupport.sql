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
/*
Map Prefixes:
   
v22
	Cordiform 
    GreatestEarth 
    EuroLarge 
    Yagem
    Yahem 
     
v23
    Aegean 
    AfricaLarge 
    Americas
    Apennine 
    Asia 
    Caribbean
    BritishIsles
    EastAsia 
    EuroGiant 
    Mediterranean 
    Mesopotamia
    NileValley 
    NorthAtlantic
    NorthEastAsia 
    NorthWestEurope
    Pacific
    SouthPacific 
v24
    Adriatic 
    AfriAsiaAust
    AfriGiant 
    AfriSouthEuro 
    AmericasGiant 
    AsiaSmall 
    AsiaSteppeGiant 
    AustralasiaGiant 
    Caucasus 
    CentralAsia
    EuroEastern 
    EuroLargeNew
    IndiaGiant 
    MesopotamiaGiant 
    NorthAmericaGiant 
    NorthAmericaHuge 
    NorthSeaEurope 
    ScotlandIrelandHuge 
    SouthAmericaGiant 
    SouthAmericaLarge 
    SouthAmericaCentralHuge 
    SouthAmericaCentralGiant 
    SouthAsiaHuge 
    SouthPacificGiant 
    WestAfrica 
    IndianOcean 
v25
    AtlanticGiant 
    Australia 
    CaribbeanHuge 
    CentralAfricaLarge 
    Denmark
    EarthMk3
    GermanyHuge	
    Iberia 
    India 
    Indonesia 
    JapanHuge 
    MediterraneanHuge 
    Netherlands
    NorthSeaGiant 
    Orient 
    RussiaLarge
    Patagonia 
    SeaOfJapan
    SouthernAfrica
    Texcoco
    Vietnam 
    Wales 
v26 (Lite)
	AfriAsiaAust
	AfricaLarge
	AfriSouthEuro
	Americas
	Asia
	Cordiform 
    EarthMk3
	EastAsia
	EuroLarge
	EuroLargeNew 
    GreatestEarth 
    IndianOcean
	Mediterranean
	Mesopotamia
	NorthAtlantic
	NorthEastAsia
	NorthWestEurope
	Orient
	SouthPacific
	Yagem
    Yahem 
*/
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA',		'AfriAsiaAust',			106,	77,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'Americas',				0,		0,		null,	null,	null),
		('CIVILIZATION_RELIC_DENG_CHINA',		'Asia',					67,		55,		null,	null,	null),
		('CIVILIZATION_RELIC_DENG_CHINA',		'Cordiform',			60,		35,		null,	null,	null),
		('CIVILIZATION_RELIC_DENG_CHINA',		'EarthMk3',				86,		68,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_RELIC_DENG_CHINA',		'GreatestEarth',		87,		54,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'NorthAtlantic',		0,		0,		null,	null,	null),
		('CIVILIZATION_RELIC_DENG_CHINA',		'NorthEastAsia',		6,		40,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_RELIC_DENG_CHINA',		'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_RELIC_DENG_CHINA',		'Yagem',				83,		65,		null,	null,	null),
		('CIVILIZATION_RELIC_DENG_CHINA',		'Yahem',				105,	52,		null,	null,	null);

--CapitalName and AltCapitalName set a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 			 MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_RELIC_DENG_CHINA', MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------
--This table operates the same as Civilizations_YnAEMP, merely substitute CivilizationType for MinorCivType.
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================

--The Civilopedia can also support Leaders be linked under a shared Civilization (e.g. Napoleon and Louis are linked to the France article).
--To do this, specify the shared Civilization as the 'DerivativeCiv' for your Civilization.
UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_CHINA'
WHERE Type = 'CIVILIZATION_RELIC_DENG_CHINA';	

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
--GOVERNMENT_JFD_MERCHANT (Merchant League)
--GOVERNMENT_JFD_MILITARY (Military Dictatorship)
--GOVERNMENT_JFD_NOMADIC (Nomadic Horde)
--GOVERNMENT_JFD_MONASTIC (Monastic Order)
--GOVERNMENT_JFD_REVOLUTIONARY (Revolutionary State)
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
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_RELIC_DENG_CHINA', 	'GOVERNMENT_JFD_MANDATE',	100),
		('CIVILIZATION_RELIC_DENG_CHINA', 	'GOVERNMENT_JFD_DICTATORSHIP',	80);

--Note that multiple entries are valid.
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
/*
CultureTypes:
  CULTURE_JFD_ABORIGINAL, CULTURE_JFD_ANDEAN, CULTURE_JFD_BANTU, CULTURE_JFD_BHARATA, CULTURE_JFD_CENTRAL, CULTURE_JFD_CLASSICAL, CULTURE_JFD_COLONIAL, CULTURE_JFD_EASTERN, CULTURE_JFD_EAST_INDIES, CULTURE_JFD_GREAT_PLAINS, CULTURE_JFD_HIMALAYAN, CULTURE_JFD_IRANIAN, CULTURE_JFD_ISLAMIC, CULTURE_JFD_KATUJE, CULTURE_JFD_MANDALA, CULTURE_JFD_MESOAMERICAN, CULTURE_JFD_MESOPOTAMIC, CULTURE_JFD_NORTHERN, CULTURE_JFD_OCEANIC, CULTURE_JFD_ORIENTAL, CULTURE_JFD_PACIFIC, CULTURE_JFD_POLAR, CULTURE_JFD_SAHARAN, CULTURE_JFD_SEMITIC, CULTURE_JFD_STEPPE, CULTURE_JFD_SOUTHERN, CULTURE_JFD_TOTALITARIAN, CULTURE_JFD_WEST_AFRICAN, CULTURE_JFD_WESTERN, CULTURE_JFD_WOODLANDS

 SubCultureType:
  CULTURE_SUB_JFD_CLASSICAL_ROMAN, CULTURE_SUB_JFD_COLONIAL_LATIN, CULTURE_SUB_JFD_EASTERN_BYZANTINE, CULTURE_SUB_JFD_ISLAMIC_TURKIC, CULTURE_SUB_JFD_MESOPOTAMIC_EGYPTIAN, CULTURE_SUB_JFD_NORTHERN_CELTIC, CULTURE_SUB_JFD_ORIENTAL_CHINAESE, CULTURE_SUB_JFD_SEMITIC_ETHIOPIC, CULTURE_SUB_JFD_SOUTHERN_PAPAL, CULTURE_SUB_JFD_WESTERN_BRITISH
  
SplashScreenTags (As above, unless otherwise specified):
   As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
   JFD_ClassicalRoman, JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
SoundtrackTag (As above, unless otherwise specified):
  As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
  JFD_ClassicalRoman, JFD_ColonialLatin, JFD_EasternByzantine, JFD_IslamicTurkic, JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal, JFD_WesternBritish
  
 UnitDialogueTag:
	AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_CHINAESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_LATINO, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAPUDUNGUN, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MOHAWK, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SIOUX, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
	
	*Not recommended as these have few tracks.
*/

--This is an example of support which copies all attributes from an existing civ. 
--For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_I' to the tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_RELIC_DENG_CHINA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_RELIC_DENG_CHINA')
WHERE Type = 'CIVILIZATION_RELIC_DENG_CHINA'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
MinorCivilization_JFD_CultureTypes (
	MinorCivilizationType 			text 	REFERENCES MinorCivilizations(Type) default null,
	CultureType 					text										default null);
	
DELETE FROM MinorCivilization_JFD_CultureTypes WHERE MinorCivilizationType = 'MINOR_CIV_SAMARKAND';
INSERT INTO MinorCivilization_JFD_CultureTypes
		(MinorCivilizationType,		CultureType)
VALUES	('MINOR_CIV_SAMARKAND',		'CULTURE_JFD_ISLAMIC');
--==========================================================================================================================		
--==========================================================================================================================	