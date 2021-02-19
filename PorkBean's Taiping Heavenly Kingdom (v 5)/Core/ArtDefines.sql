-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
		  (Type,                                            Red,					Green,					Blue,					Alpha)
VALUES	  ('COLOR_PLAYER_PB_TAIPING_ICON',					0.10980392156862745,	0.45098039215686275,	0.28627450980392155,	1),
		  ('COLOR_PLAYER_PB_TAIPING_BACKGROUND',			0.7098039215686275,		1.8627450980392157,		0.8901960784313725,		1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_PB_TAIPING',        'COLOR_PLAYER_PB_TAIPING_ICON',     'COLOR_PLAYER_PB_TAIPING_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                            IconSize,    Filename,                       IconsPerRow,     IconsPerColumn)
VALUES
('TAIPING_ALPHA_ATLAS',         128,        'Taiping_Alpha128.dds',        1,                 1),
('TAIPING_ALPHA_ATLAS',         80,         'Taiping_Alpha80.dds',         1,                 1),
('TAIPING_ALPHA_ATLAS',         64,         'Taiping_Alpha64.dds',         1,                 1),
('TAIPING_ALPHA_ATLAS',         48,         'Taiping_Alpha48.dds',         1,                 1),
('TAIPING_ALPHA_ATLAS',         32,         'Taiping_Alpha32.dds',         1,                 1),
('TAIPING_ALPHA_ATLAS',         24,         'Taiping_Alpha24.dds',         1,                 1),
('TAIPING_ALPHA_ATLAS',         16,         'Taiping_Alpha16.dds',         1,                 1),

('TAIPING_ICON_ATLAS',         256,        'Taiping_Atlas_256.dds',        2,                 2),
('TAIPING_ICON_ATLAS',         128,        'Taiping_Atlas_128.dds',        2,                 2),
('TAIPING_ICON_ATLAS',         80,         'Taiping_Atlas_80.dds',         2,                 2),
('TAIPING_ICON_ATLAS',         64,         'Taiping_Atlas_64.dds',         2,                 2),
('TAIPING_ICON_ATLAS',         45,         'Taiping_Atlas_45.dds',         2,                 2),
('TAIPING_ICON_ATLAS',         32,         'Taiping_Atlas_32.dds',         2,                 2),

('TAIPING_RELIGION_ATLAS',         256,        'TaipingReligion_Atlas256.dds',        1,                 1),
('TAIPING_RELIGION_ATLAS',         214,        'TaipingReligion_Atlas214.dds',        1,			     1),
('TAIPING_RELIGION_ATLAS',         128,        'TaipingReligion_Atlas128.dds',        1,                 1),
('TAIPING_RELIGION_ATLAS',         80,         'TaipingReligion_Atlas80.dds',         1,                 1),
('TAIPING_RELIGION_ATLAS',         64,         'TaipingReligion_Atlas64.dds',         1,                 1),
('TAIPING_RELIGION_ATLAS',         48,         'TaipingReligion_Atlas48.dds',         1,                 1),
('TAIPING_RELIGION_ATLAS',         32,         'TaipingReligion_Atlas32.dds',         1,                 1),
('TAIPING_RELIGION_ATLAS',         24,         'TaipingReligion_Atlas24.dds',         1,                 1),
('TAIPING_RELIGION_ATLAS',         16,         'TaipingReligion_Atlas16.dds',         1,                 1),

('PB_CHANGMAO_FLAG',         32,         'Flag_Changmao.dds',         1,                 1);

INSERT INTO IconFontTextures
(IconFontTexture,                            IconFontTextureFile)
VALUES
('ICON_FONT_TEXTURE_PB_GOD_WORSHIPPING', 'TaipingFontIcons_22');

INSERT INTO IconFontMapping
(IconName,                            IconMapping,	IconFontTexture)
VALUES
('ICON_RELIGION_PB_GOD_WORSHIPPING', 1, 'ICON_FONT_TEXTURE_PB_GOD_WORSHIPPING');

--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_PB_HONG_PEACE', 		'HongPeace',		'DynamicResident'),
		('SND_LEADER_MUSIC_PB_HONG_WAR',			'HongWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_PB_HONG_PEACE', 		'SND_LEADER_MUSIC_PB_HONG_PEACE', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_PB_HONG_WAR', 			'SND_LEADER_MUSIC_PB_HONG_WAR', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_PB_CHANGMAO', 		'Unit', 		'changmao_sv.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_PB_CHANGMAO',			DamageStates, 	'UnFormed'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_PB_CHANGMAO', 		'ART_DEF_UNIT_MEMBER_PB_CHANGMAO',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_PB_CHANGMAO',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_CHANGMAO',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_CHANGMAO',	Scale,	ZOffset, Domain, 'changmao.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';