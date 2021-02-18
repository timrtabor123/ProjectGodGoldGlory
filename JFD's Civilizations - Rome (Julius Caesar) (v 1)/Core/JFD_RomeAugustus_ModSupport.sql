--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 	text 	  default null,
	Value 	integer   default 1);
--==========================================================
-- JFD CIVILOPEDIA
--==========================================================
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_JFD_LEGION_ACTIVE');
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Building_ConstructionAudio
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Building_ConstructionAudio (
    BuildingType								text		REFERENCES Buildings(Type)      default null,
    ConstructionAudio							text										default null);
	
INSERT INTO Building_ConstructionAudio
		(BuildingType, 				ConstructionAudio)
SELECT	'BUILDING_JFD_FORUM',		ConstructionAudio
FROM Building_ConstructionAudio WHERE BuildingType = 'BUILDING_MARKET'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--==========================================================================================================================	
-- JFD DYNAMIC TOP PANEL
--==========================================================================================================================			
-- JFD_TopPanelIncludes
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_RomeAugustus_DTP.lua');
--------------------------------------------------------------------------------------------------------------------------		
-- JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------------------------------		
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default null,
	YieldType  				text 										default null,
	YieldSourceFunction 	text										default null,
	YieldSourceToolTip		text										default	null,
	MiscToolTipFunction		text										default	null);
	
INSERT INTO JFD_TopPanelAdditions
		(CivilizationType,		YieldType,			 YieldSourcefunction,					 YieldSourceToolTip)
SELECT	'CIVILIZATION_ROME',	'YIELD_GOLDEN_AGE',	 'JFD_RomeAugustus_GetGAPFromBuildings', 'TXT_KEY_JFD_ROME_AUGUSTUS_GAP_FROM_BUILDINGS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_ROME_UA_CHANGE' AND Value = 1);	
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD CLAIMS
--====================================	
-- BuildingClasses
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 									DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_FORUM_MAGISTRATE',	'BUILDING_JFD_FORUM_MAGISTRATE',	'TXT_KEY_BUILDING_JFD_FORUM'
WHERE EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MAGISTRATE');
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
UPDATE BuildingClasses
SET DefaultBuilding = 'BUILDING_JFD_FORUM_MAGISTRATE'
WHERE Type = 'BUILDINGCLASS_JFD_FORUM'
AND EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MAGISTRATE');	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 																 
		(Type, 								BuildingClass,							SpecialistType,					SpecialistCount,	GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,					 Help, 									NeverCapture,	IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_FORUM_MAGISTRATE', 	'BUILDINGCLASS_JFD_FORUM_MAGISTRATE',	'SPECIALIST_JFD_MAGISTRATE',	1,					-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_FORUM',	 'TXT_KEY_BUILDING_JFD_FORUM_HELP',		1,				'JFD_ROME_JULIUS_ATLAS',	3
WHERE EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MAGISTRATE');

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_FORUM_HELP_CLAIMS', Strategy = 'TXT_KEY_BUILDING_JFD_FORUM_STRATEGY_CLAIMS', FreeBuildingThisCity = 'BUILDINGCLASS_JFD_FORUM_MAGISTRATE', SpecialistCount = SpecialistCount-1
WHERE Type = 'BUILDING_JFD_FORUM'
AND EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MAGISTRATE');
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_District
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Building_JFD_District (
	BuildingType  		text 		REFERENCES Buildings(Type)					default null,
	DistrictType		text										 			default null);	
	
INSERT INTO Building_JFD_District
		(BuildingType,						DistrictType)
SELECT	'BUILDING_JFD_FORUM_MAGISTRATE',	'DISTRICT_JFD_GOVERNMENT'
WHERE EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MAGISTRATE');
--====================================	
-- JFD PRESTIGE
--====================================	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_FORUM_HELP_PRESTIGE', Strategy = 'TXT_KEY_BUILDING_JFD_FORUM_STRATEGY_PRESTIGE'
WHERE Type = 'BUILDING_JFD_FORUM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PRESTIGE_CORE' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_FORUM_HELP_CLAIMS_PRESTIGE', Strategy = 'TXT_KEY_BUILDING_JFD_FORUM_STRATEGY_CLAIMS_PRESTIGE'
WHERE Type = 'BUILDING_JFD_FORUM'
AND EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_JFD_MAGISTRATE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PRESTIGE_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------
UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_ROME_AUGUSTUS_PRESTIGE'
WHERE Type = 'TRAIT_JFD_ROME_AUGUSTUS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PRESTIGE_CORE' AND Value = 1);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Civs_RomeAugustus_Decisions.lua');
----------------------------------------------------------------------------------------------------------------------------
-- Resources
----------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Resources 
		(Type,									Description,									Civilopedia, 											ResourceClassType, 		 ArtDefineTag, 									Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					IconAtlas, 					PortraitIndex)
VALUES	('RESOURCE_DECISIONS_JFD_ROMAN_WINE',	'TXT_KEY_RESOURCE_DECISIONS_JFD_ROMAN_WINE',	'TXT_KEY_CIV5_RESOURCE_DECISIONS_JFD_ROMAN_WINE_TEXT',	'RESOURCECLASS_LUXURY',	 'ART_DEF_RESOURCE_DECISIONS_JFD_ROMAN_WINE',	4,			3,				50,					10,					25, 		25, 		2,				0,				1500,			90,				2, 			0, 			0, 		1, 			1, 			67,		'[ICON_RES_JFD_ROMAN_WINE]',	'JFD_ROME_JULIUS_ATLAS',	5);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_Flavors 	
		(ResourceType, 							FlavorType, 			Flavor)
VALUES	('RESOURCE_DECISIONS_JFD_ROMAN_WINE',	'FLAVOR_HAPPINESS',		10);
--==========================================================================================================================
--==========================================================================================================================

