--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType,			ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_NENETS'), 		('TXT_KEY_CIV_SENSHI_NENETS_DESC'), 		('TXT_KEY_CIV_SENSHI_NENETS_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_NENETS_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_NENETS_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_NENETS'), 		('PLAYERCOLOR_SENSHI_NENETS'), 		ArtDefineTag, ArtStyleType,			('_ASIA'),	ArtStylePrefix,	('SENSHI_NENETS_ATLAS'), 		0, 				('SENSHI_NENETS_ALPHA_ATLAS'), 	('RUSSIA'), 	('NenetsMap.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_VAVLYO_TEXT'), 	('NenetsDOM.dds'),	('AS2D_DOM_SPEECH_SENSHI_VAVLYO')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
	THEN '_MONGOL'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_SENSHI_NENETS';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_01'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_02'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_03'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_04'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_05'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_06'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_07'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_08'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_09'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_10'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_11'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_12'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_13'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_14'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_15'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_16'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_17'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_18'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_19'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_CITY_NAME_SENSHI_NENETS_20');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_NENETS'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_NENETS'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_NENETS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SENSHI_NENETS', 		'REGION_TUNDRA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_NENETS', 	'LEADER_SENSHI_VAVLYO');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			 UnitType)
VALUES		('CIVILIZATION_SENSHI_NENETS', 	'UNITCLASS_MUSICIAN',	'UNIT_SENSHI_TADIBYA'),
			('CIVILIZATION_SENSHI_NENETS', 	'UNITCLASS_HORSEMAN',	'UNIT_SENSHI_SAMOYED');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_NENETS', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_0'),	
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_1'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_2'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_3'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_4'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_5'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_6'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_7'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_8'),
			('CIVILIZATION_SENSHI_NENETS', 	'TXT_KEY_SPY_NAME_SENSHI_NENETS_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

