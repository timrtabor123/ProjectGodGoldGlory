-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                            IconSize,    Filename,                       IconsPerRow,     IconsPerColumn)
VALUES    ('THP_RASHTRAKUTA_ATLAS',     256,        'THP_RashtrakutaAtlas256.dds',        2,                 2),
('THP_RASHTRAKUTA_ATLAS',               128,        'THP_RashtrakutaAtlas128.dds',        2,                 2),
('THP_RASHTRAKUTA_ATLAS',               80,         'THP_RashtrakutaAtlas80.dds',         2,                 2),
('THP_RASHTRAKUTA_ATLAS',               64,         'THP_RashtrakutaAtlas64.dds',         2,                 2),
('THP_RASHTRAKUTA_ATLAS',               45,         'THP_RashtrakutaAtlas45.dds',         2,                 2),
('THP_RASHTRAKUTA_ATLAS',               32,         'THP_RashtrakutaAtlas32.dds',         2,                 2),
('THP_RASHTRAKUTA_ALPHA_ATLAS',         128,        'THP_RashtrakutaAlpha128.dds',        1,                 1),
('THP_RASHTRAKUTA_ALPHA_ATLAS',         80,         'THP_RashtrakutaAlpha80.dds',         1,                 1),
('THP_RASHTRAKUTA_ALPHA_ATLAS',         64,         'THP_RashtrakutaAlpha64.dds',         1,                 1),
('THP_RASHTRAKUTA_ALPHA_ATLAS',         48,         'THP_RashtrakutaAlpha48.dds',         1,                 1),
('THP_RASHTRAKUTA_ALPHA_ATLAS',         32,         'THP_RashtrakutaAlpha32.dds',         1,                 1),
('THP_RASHTRAKUTA_ALPHA_ATLAS',         24,         'THP_RashtrakutaAlpha24.dds',         1,                 1),
('THP_RASHTRAKUTA_ALPHA_ATLAS',         16,         'THP_RashtrakutaAlpha16.dds',         1,                 1),
('THP_BASADI_ATLAS',                    256,        'BasadiIcon256.dds',                  1,                 2),
('THP_BASADI_ATLAS',                    64,         'BasadiIcon64.dds',                   1,                 2),
('THP_BASADI_ATLAS',                    45,         'BasadiIcon45.dds',                   1,                 2),
('THP_UNIT_STHIRABHUTA_FLAG_ATLAS',     32,         'Unit_Sthirabhuta_Flag_32.dds',       1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                            Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_RASHTRAKUTA_ICON',   0.902,   0.447,    0.298,    1),
('COLOR_PLAYER_THP_RASHTRAKUTA_BACKGROUND',       0.137,   0.290,    0.282,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_RASHTRAKUTA',        'COLOR_PLAYER_THP_RASHTRAKUTA_ICON',     'COLOR_PLAYER_THP_RASHTRAKUTA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		    	     TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_STHIRABHUTA',		'Unit', 		'sv_sthirabhuta.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								    DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_THP_STHIRABHUTA',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					     UnitMemberInfoType,				     NumMembers)
SELECT	'ART_DEF_UNIT_THP_STHIRABHUTA', 	'ART_DEF_UNIT_MEMBER_THP_STHIRABHUTA',	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
    (UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_THP_STHIRABHUTA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_THP_STHIRABHUTA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                              Scale,    ZOffset, Domain, Model,                         MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_STHIRABHUTA',    Scale,    ZOffset, Domain, 'Spearman_India.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
-- ======================================================================================================
-- UNIQUE TILE IMPROVEMENT
-- ======================================================================================================
-- ArtDefine_LandmarkTypes
--------------------------
INSERT INTO ArtDefine_LandmarkTypes
          (Type,                                LandmarkType,     FriendlyName)
VALUES    ('ART_DEF_IMPROVEMENT_THP_BASADI',    'Improvement',    'THP_BASADI');
----------------------
-- ArtDefine_Landmarks
----------------------
INSERT INTO ArtDefine_Landmarks
(Era,    State,                Scale,    ImprovementType,                    LayoutHandler,    ResourceType,            Model,                        TerrainContour)
SELECT    'Any', 'UnderConstruction', 0.8,    'ART_DEF_IMPROVEMENT_THP_BASADI',    'SNAPSHOT',        'ART_DEF_RESOURCE_ALL', 'Basadi_hb.fxsxml',        1 UNION ALL
SELECT    'Any', 'Constructed',        0.8,    'ART_DEF_IMPROVEMENT_THP_BASADI',    'SNAPSHOT',        'ART_DEF_RESOURCE_ALL', 'Basadi_main.fxsxml',    1 UNION ALL
SELECT    'Any', 'Pillaged',            0.8,    'ART_DEF_IMPROVEMENT_THP_BASADI',    'SNAPSHOT',        'ART_DEF_RESOURCE_ALL', 'Basadi_pl.fxsxml',    1;
--------------------------
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView
          (StrategicViewType,                        TileType,         Asset)
VALUES    ('ART_DEF_IMPROVEMENT_THP_BASADI',        'Improvement',    'sv_basadi.dds');
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 									         Filename, 		          LoadType)
VALUES	('SND_LEADER_MUSIC_THP_AMOGHAVARSHA_PEACE', 		'Rashtrakuta_Peace',    'DynamicResident'),
		('SND_LEADER_MUSIC_THP_AMOGHAVARSHA_WAR', 	   	    'Rashtrakuta_War',      'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_AMOGHAVARSHA_PEACE', 		'SND_LEADER_MUSIC_THP_AMOGHAVARSHA_PEACE', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_AMOGHAVARSHA_WAR', 			'SND_LEADER_MUSIC_THP_AMOGHAVARSHA_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);

-- ======================================================================================================
-- ======================================================================================================
