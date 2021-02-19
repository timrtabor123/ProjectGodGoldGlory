--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- COMMUNITY
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_STOUDION_HELP_CBO'
WHERE Type = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------	
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_JFD_STOUDION',	ResourceType,	YieldType,  Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GARDEN';
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Buildings 	
		(Type, 						BuildingClass, Cost, GreatWorkSlotType,					GreatWorkCount, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech, Description, 						Civilopedia, 							Help, 										 Strategy,								 		  ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_STOUDION',	BuildingClass, Cost, 'GREAT_WORK_SLOT_ART_ARTIFACT',	1, 			 	SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_STOUDION',	'TXT_KEY_BUILDING_JFD_STOUDION_TEXT',	'TXT_KEY_BUILDING_JFD_STOUDION_HELP_JFDLC',  'TXT_KEY_BUILDING_JFD_STOUDION_STRATEGY_JFDLC',  ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				'JFD_BYZANTIUM_JUSTINIAN_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_JFD_STOUDION',	ResourceType,	YieldType,  Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_MONASTERY'
WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM' AND BuildingType = 'BUILDING_JFD_STOUDION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- LocalizedText
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'Each source of [ICON_RES_INCENSE] Incense and [ICON_RES_WINE] Wine worked by this City', 'Each source of [ICON_RES_INCENSE] Incense, [ICON_RES_JFD_SAFFRON] Saffron, and [ICON_RES_WINE] Wine worked by this City')
FROM LocalizedText WHERE Tag IN ('TXT_KEY_BUILDING_JFD_STOUDION_HELP', 'TXT_KEY_BUILDING_JFD_STOUDION_HELP_JFDLC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1);	

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'produce +1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture', 'produce +1 [ICON_PEACE] Faith, +1 [ICON_CULTURE] Culture, and +1 [ICON_JFD_HEALTH] Health')
FROM LocalizedText WHERE Tag IN ('TXT_KEY_BUILDING_JFD_STOUDION_HELP', 'TXT_KEY_BUILDING_JFD_STOUDION_HELP_JFDLC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================