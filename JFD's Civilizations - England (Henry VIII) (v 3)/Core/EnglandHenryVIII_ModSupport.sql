--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 						ColonyName)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'TXT_KEY_COLONY_NAME_JFD_ENGLAND_HENRY_VIII_01');

INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 						ColonyName, LinguisticType)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	ColonyName, LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,	X,	Y,	AltX, AltY,	AltCapitalName)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	MapPrefix,	X,	Y,	AltX, AltY,	AltCapitalName
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_ENGLAND_HENRY_VIII')
WHERE Type = 'CIVILIZATION_JFD_ENGLAND_HENRY_VIII';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_ENGLAND_HENRY_VIII',	'GOVERNMENT_JFD_MONARCHY',	 80);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_CHRISTIAN_ANGLICANISM'
WHERE CivilizationType = 'CIVILIZATION_JFD_ENGLAND_HENRY_VIII'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ANGLICANISM');
--=======================================================================================================================
--=======================================================================================================================

