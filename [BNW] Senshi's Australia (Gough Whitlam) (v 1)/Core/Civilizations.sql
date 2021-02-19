--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_WHITLAM'), 		('TXT_KEY_CIV_SENSHI_WHITLAM_DESC'), 		('TXT_KEY_CIV_SENSHI_WHITLAM_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_WHITLAM_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_WHITLAM_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_WHITLAM'), 		('PLAYERCOLOR_SENSHI_WHITLAM'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_WHITLAM_ATLAS'), 		0, 				('SENSHI_WHITLAM_ALPHA_ATLAS'), 	('ENGLAND'), 	('Whitlamap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_WHITLAM_TEXT'), 	('WhitlamDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_WHITLAM')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND' )
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_SENSHI_WHITLAM';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_01'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_02'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_03'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_04'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_05'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_06'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_07'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_08'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_09'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_10'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_11'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_12'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_13'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_14'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_15'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_16'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_17'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_18'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_19'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_20'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_21'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_22'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_23'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_24'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_25'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_26'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_27'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_28'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_29'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_30'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_31'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_32'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_33'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_34'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_CITY_NAME_SENSHI_WHITLAM_35');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_WHITLAM'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_WHITLAM'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_WHITLAM'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_Start_Region_Avoid
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Avoid
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SENSHI_WHITLAM', 	'REGION_TUNDRA');	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_WHITLAM', 	'LEADER_SENSHI_WHITLAM');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SENSHI_WHITLAM', 	'UNITCLASS_FIGHTER',	'UNIT_SENSHI_GAF_NOMAD');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_SENSHI_WHITLAM', 	'BUILDINGCLASS_MUSEUM',	'BUILDING_SENSHI_NATIONAL_GALLERY');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_WHITLAM', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_0'),	
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_1'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_2'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_3'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_4'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_5'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_6'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_7'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_8'),
			('CIVILIZATION_SENSHI_WHITLAM', 	'TXT_KEY_SPY_NAME_SENSHI_WHITLAM_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

