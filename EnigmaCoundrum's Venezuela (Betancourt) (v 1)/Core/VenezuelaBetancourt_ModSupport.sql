--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_EC_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_EC_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_EC_ColonialCityNames 
		(CivilizationType, 							LinguisticType)
SELECT	'CIVILIZATION_EC_VENEZUELA_BETANCOURT',	LinguisticType
FROM Civilization_EC_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','AfriSouthEuro',		0,		0,		null,	null,	null),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'Americas',				49,		38,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','Asia',					17,		42,		null,	null,	null),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'Cordiform',			14,		19,		null,	null,	null),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'EarthMk3',				155,	43,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'GreatestEarth',		26,		24,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_EC_VENEZUELA_BETANCOURT','SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'Yagem',				158,	41,		null,	null,	null),
		('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'Yahem',				33,		38,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,							MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_EC_VENEZUELA_BETANCOURT',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_EC_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_EC_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_EC_CultureTypes
		(CivilizationType,							ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_EC_VENEZUELA_BETANCOURT',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_EC_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_EC_CultureTypes WHERE CivilizationType = 'CIVILIZATION_EC_VENEZUELA_BETANCOURT')
WHERE Type = 'CIVILIZATION_EC_VENEZUELA_BETANCOURT'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_EC_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_EC_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_EC_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_EC_Governments
		(CivilizationType, 							GovernmentType,				 Weight)
VALUES	('CIVILIZATION_EC_VENEZUELA_BETANCOURT',	'GOVERNMENT_EC_REPUBLIC',	 80);
--=======================================================================================================================
--=======================================================================================================================

