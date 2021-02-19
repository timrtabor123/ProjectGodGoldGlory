--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('LUNG_DAIVIET_ICON_ATLAS', 		256, 		'LUNG_DAI_VIETAtlas_256.dds',			2, 				2),
			('LUNG_DAIVIET_ICON_ATLAS', 		128, 		'LUNG_DAI_VIETAtlas_128.dds',			2, 				2),
			('LUNG_DAIVIET_ICON_ATLAS', 		80, 		'LUNG_DAI_VIETAtlas_80.dds',			2, 				2),
			('LUNG_DAIVIET_ICON_ATLAS', 		64, 		'LUNG_DAI_VIETAtlas_64.dds',			2, 				2),
			('LUNG_DAIVIET_ICON_ATLAS', 		45, 		'LUNG_DAI_VIETAtlas_45.dds',			2, 				2),
			('LUNG_DAIVIET_ICON_ATLAS', 		32, 		'LUNG_DAI_VIETAtlas_32.dds',			2, 				2),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		128, 		'LUNG_DAI_VIETAlpha_128.dds',			1,				1),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		80, 		'LUNG_DAI_VIETAlpha_80.dds',			1, 				1),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		64, 		'LUNG_DAI_VIETAlpha_64.dds',			1, 				1),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		48, 		'LUNG_DAI_VIETAlpha_48.dds',			1, 				1),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		45, 		'LUNG_DAI_VIETAlpha_45.dds',			1, 				1),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		32, 		'LUNG_DAI_VIETAlpha_32.dds',			1, 				1),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		24, 		'LUNG_DAI_VIETAlpha_24.dds',			1, 				1),
			('LUNG_DAIVIET_ALPHA_ATLAS', 		16, 		'LUNG_DAI_VIETAlpha_16.dds',			1, 				1),
			('UNIT_FLAG_LUNG_CAMQUAN', 			32, 		'LUNG_CAMQUANALPHA_32.dds',				1, 				1);
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_LUNG_CAMQUAN',	'Unit', 	'LUNG_CAMQUANALPHA_128.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_LUNG_CAMQUAN'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_BYZANTIUM_CATAPHRACT');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,	NumMembers)
SELECT		('ART_DEF_UNIT_LUNG_CAMQUAN'),	UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_BYZANTIUM_CATAPHRACT');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_LUNG_DAI_VIET_ICON', 			0.855,	0.855,	0.427,	1),
			('COLOR_PLAYER_LUNG_DAI_VIET_BACKGROUND',		0.145,	0.274,	0.188,	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_LUNG_DAI_VIET',	'COLOR_PLAYER_LUNG_DAI_VIET_ICON', 	'COLOR_PLAYER_LUNG_DAI_VIET_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 		LoadType)
VALUES	('SND_LEADER_MUSIC_LUNG_DAIVIET_PEACE', 	'DaiViet_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_LUNG_DAIVIET_WAR', 		'DaiViet_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_LUNG_DAIVIET_PEACE',	'SND_LEADER_MUSIC_LUNG_DAIVIET_PEACE', 	'GAME_MUSIC', 						0,					0,					-1.0,			60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_LUNG_DAIVIET_WAR', 		'SND_LEADER_MUSIC_LUNG_DAIVIET_WAR', 	'GAME_MUSIC', 						0,					0,					-1.0,			60, 		60, 		1,		 0);
--==========================================================================================================================
--==========================================================================================================================