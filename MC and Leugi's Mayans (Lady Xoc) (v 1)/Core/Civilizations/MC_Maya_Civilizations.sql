--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 						Description,				ShortDescription, 			Adjective, 						CivilopediaTag, 				DefaultPlayerColor, 		ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 				DawnOfManQuote, 			DawnOfManImage,			DawnOfManAudio)
SELECT		('CIVILIZATION_MC_MAYA'), 	('TXT_KEY_MC_MAYA_DESC'), 	('TXT_KEY_MC_MAYA'),		('TXT_KEY_MC_MAYA_ADJECTIVE'), 	('TXT_KEY_CIVLOPEDIA_MC_MAYA'),	('PLAYERCOLOR_MC_MAYA'), 	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	('MC_MAYA_ATLAS'), 	0, 				('MC_MAYA_ALPHA_ATLAS'),	('Polynesia'), 	('MC_MAYA_Map.dds'), 	('TXT_KEY_MC_MAYA_DOM'), 	('MC_MAYA_DoM.dds'),	('AS2D_DOM_SPEECH_MC_MAYA')
FROM Civilizations WHERE (Type = 'CIVILIZATION_MAYA');

--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_MC_MAYA', 	'LEADER_MC_LADY_XOC');

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 			BuildingClassType)
VALUES		('CIVILIZATION_MC_MAYA', 	'BUILDINGCLASS_PALACE');
			
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
VALUES		('CIVILIZATION_MC_MAYA', 	'TECH_AGRICULTURE');
			
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType,			Count,		UnitAIType)
VALUES		('CIVILIZATION_MC_MAYA', 	'UNITCLASS_SETTLER',	1,			'UNITAI_SETTLE');
	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType,			UnitType)
VALUES		('CIVILIZATION_MC_MAYA', 	'UNITCLASS_SWORDSMAN',	'UNIT_MC_MAYAN_HADZAB');
			
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType,				BuildingType)
VALUES		('CIVILIZATION_MC_MAYA', 	'BUILDINGCLASS_OBSERVATORY',	'BUILDING_MC_MAYAN_DZIB_ACTUN');
			
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		'CIVILIZATION_MC_MAYA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_MAYA');

--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors
			(Type, 									Red, 		Green,		Blue,		Alpha)
VALUES		('COLOR_PLAYER_MC_MAYA_ICON', 			0.494,		0.745,		0.682,		1),
			('COLOR_PLAYER_MC_MAYA_BACKGROUND',		0.561,		0.012,		0.024,		1);

--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 					PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES		('PLAYERCOLOR_MC_MAYA',	'COLOR_PLAYER_MC_MAYA_ICON',	'COLOR_PLAYER_MC_MAYA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 						
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_YAXCHILAN'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_PALENQUE'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_TONINA'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_XUNANTUNICH'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_COPAN'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_TIKAL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_CHICHEN_ITZA'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_UXMAL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_COBA'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_EL_MIRADOR'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_CALAKMUL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_YOKIB'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_QUIRIGUA'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_UAXACTUN'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_KAMINALJUYU'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_UCANAL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_IZAPA'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_COMALCALCO'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_LAMANAI'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_DZIBILCHALTUN'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_EDZNA'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_SACUL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_BECAN'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_SAYIL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_MAYAPAN'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_DOS_PILAS'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_BONAMPAK'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_KABAH'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_SEIBAL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_IZAMAL'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_ALTAR_DE_SACRIFICIOS'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_RIO_BEC'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_MACHAQUILA'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_XTAMPAK'),
		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_CITY_NAME_MC_MAYA_CHINKULTIC');

--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_0'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_1'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_2'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_3'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_4'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_5'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_6'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_7'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_8'),
			('CIVILIZATION_MC_MAYA', 	'TXT_KEY_SPY_NAME_MC_MAYA_9');
--==========================================================================================================================	
--==========================================================================================================================	
