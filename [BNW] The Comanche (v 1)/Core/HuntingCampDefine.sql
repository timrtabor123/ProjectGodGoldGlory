
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 								LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_COMANCHE_HUNTING_CAMP',	'Improvement', 	'HuntingCamp');

--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_COMANCHE_HUNTING_CAMP',		'Any', 	'UnderConstruction', 0.5,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 2 HB.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_COMANCHE_HUNTING_CAMP',		'Any', 	'Constructed',		 0.5,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 2 B.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_COMANCHE_HUNTING_CAMP',		'Any', 	'Pillaged',			 0.5,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 2  PL.fxsxml', 1);