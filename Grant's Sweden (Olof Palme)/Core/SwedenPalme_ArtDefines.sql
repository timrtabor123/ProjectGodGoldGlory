--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_GT_UBATSJAGARE', 'Unit', 'Ubatsjagare_sv.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
  VALUES ('ART_DEF_UNIT_GT_UBATSJAGARE', 3);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_GT_UBATSJAGARE', 'ART_DEF_UNIT_MEMBER_GT_UBATSJAGARE', 1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
  VALUES ('ART_DEF_UNIT_MEMBER_GT_UBATSJAGARE', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', 1, 1, 0, 1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_GT_UBATSJAGARE', 0, 0, 25.0, 50.0, 'ART_DEF_VEFFECT_ARTILLERY_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION20POUND');
  
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_GT_UBATSJAGARE', 1, 0, 25.0, 50.0, 'ART_DEF_VEFFECT_ARTILLERY_IMPACT_$(TERRAIN)', 'BULLETHC', 'BULLETHC');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_GT_UBATSJAGARE', 0.109999999403954, 'Sea', 'BPK1155.fxsxml', 'METAL', 'METALLRG');
--==========================================================================================================================
-- Audio
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 									LoadType)
VALUES	('SND_LEADER_MUSIC_GT_OLOF_PALME_PEACE', 		'Sweden_Palme_Peace',						'DynamicResident'),
		('SND_LEADER_MUSIC_GT_OLOF_PALME_WAR', 			'Sweden_Palme_War', 						'DynamicResident');
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GT_OLOF_PALME_PEACE', 		'SND_LEADER_MUSIC_GT_OLOF_PALME_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GT_OLOF_PALME_WAR', 		'SND_LEADER_MUSIC_GT_OLOF_PALME_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 													Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GT_SWEDEN_PALME_ICON', 					0.722,	0.478,	0.192,	1),
		('COLOR_PLAYER_GT_SWEDEN_PALME_BACKGROUND',				0.114,	0.161,	0.231,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 									SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_GT_SWEDEN_PALME',				'COLOR_PLAYER_GT_SWEDEN_PALME_ICON', 				'COLOR_PLAYER_GT_SWEDEN_PALME_BACKGROUND',				'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- Icon Atlases
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('GT_SWEDEN_PALME_ATLAS', 						256, 		'Sweden_PalmeAtlas256.dds',			2, 				2),
		('GT_SWEDEN_PALME_ATLAS', 						128, 		'Sweden_PalmeAtlas128.dds',			2, 				2),
		('GT_SWEDEN_PALME_ATLAS', 						80, 		'Sweden_PalmeAtlas80.dds',			2, 				2),
		('GT_SWEDEN_PALME_ATLAS', 						64, 		'Sweden_PalmeAtlas64.dds',			2, 				2),
		('GT_SWEDEN_PALME_ATLAS', 						45, 		'Sweden_PalmeAtlas45.dds',			2, 				2),
		('GT_SWEDEN_PALME_ATLAS', 						32, 		'Sweden_PalmeAtlas32.dds',			2, 				2),
		('GT_SWEDEN_PALME_ATLAS', 						24, 		'Sweden_PalmeAtlas24.dds',			2, 				2),
		('GT_SWEDEN_PALME_ALPHA_ATLAS', 				128, 		'Sweden_PalmeAlphaAtlas128.dds',			1,				1),
		('GT_SWEDEN_PALME_ALPHA_ATLAS', 				80, 		'Sweden_PalmeAlphaAtlas80.dds',			1, 				1),
		('GT_SWEDEN_PALME_ALPHA_ATLAS', 				64, 		'Sweden_PalmeAlphaAtlas64.dds',			1, 				1),
		('GT_SWEDEN_PALME_ALPHA_ATLAS', 				48, 		'Sweden_PalmeAlphaAtlas48.dds',			1, 				1),
		('GT_SWEDEN_PALME_ALPHA_ATLAS',					45, 		'Sweden_PalmeAlphaAtlas45.dds',			1, 				1),
		('GT_SWEDEN_PALME_ALPHA_ATLAS', 				32, 		'Sweden_PalmeAlphaAtlas32.dds',			1, 				1),
		('GT_SWEDEN_PALME_ALPHA_ATLAS', 				24, 		'Sweden_PalmeAlphaAtlas24.dds',			1, 				1),
		('GT_SWEDEN_PALME_FLAG_ATLAS',					32,			'Ubatsjagare_flag.dds',				1,				1),
		('GT_SWEDEN_PALME_PROMOTION_ATLAS',				32,			'SwedenPalme_PromotionAtlas_32.dds', 5,				1);
--==========================================================================================================================	
--==========================================================================================================================