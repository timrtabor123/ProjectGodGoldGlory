-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                              IconSize,    Filename,                     IconsPerRow,       IconsPerColumn)
VALUES    ('THP_CHEYENNE_ATLAS',     256,        'THP_CheyenneAtlas256.dds',        2,                 2),
('THP_CHEYENNE_ATLAS',               128,        'THP_CheyenneAtlas128.dds',        2,                 2),
('THP_CHEYENNE_ATLAS',               80,         'THP_CheyenneAtlas80.dds',         2,                 2),
('THP_CHEYENNE_ATLAS',               64,         'THP_CheyenneAtlas64.dds',         2,                 2),
('THP_CHEYENNE_ATLAS',               45,         'THP_CheyenneAtlas45.dds',         2,                 2),
('THP_CHEYENNE_ATLAS',               32,         'THP_CheyenneAtlas32.dds',         2,                 2),
('THP_CHEYENNE_ALPHA_ATLAS',         128,        'THP_CheyenneAlpha128.dds',        1,                 1),
('THP_CHEYENNE_ALPHA_ATLAS',         64,         'THP_CheyenneAlpha64.dds',         1,                 1),
('THP_CHEYENNE_ALPHA_ATLAS',         48,         'THP_CheyenneAlpha48.dds',         1,                 1),
('THP_CHEYENNE_ALPHA_ATLAS',         32,         'THP_CheyenneAlpha32.dds',         1,                 1),
('THP_CHEYENNE_ALPHA_ATLAS',         24,         'THP_CheyenneAlpha24.dds',         1,                 1),
('THP_CHEYENNE_ALPHA_ATLAS',         16,         'THP_CheyenneAlpha16.dds',         1,                 1),
('THP_UNIT_DOG_SOLDIER_FLAG_ATLAS',  32,         'Unit_DogSoldier_Flag_32.dds',     1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                         Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_CHEYENNE_ICON',   0.871,   0.776,    0.573,    1),
('COLOR_PLAYER_THP_CHEYENNE_BACKGROUND',       0.227,   0.400,    0.612,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_CHEYENNE',        'COLOR_PLAYER_THP_CHEYENNE_ICON',     'COLOR_PLAYER_THP_CHEYENNE_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		             TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_DOG_SOLDIER',		'Unit', 		'sv_dogsoldier.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                                  DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_THP_DOG_SOLDIER',         DamageStates,    Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_LANCER';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                       UnitMemberInfoType,                       NumMembers)
SELECT    'ART_DEF_UNIT_THP_DOG_SOLDIER',     'ART_DEF_UNIT_MEMBER_THP_DOG_SOLDIER',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_LANCER';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_DOG_SOLDIER',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_DOG_SOLDIER',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                              Scale,    ZOffset, Domain, Model,                    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_DOG_SOLDIER',    Scale,    ZOffset, Domain, 'Sioux_Knight.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_LANCER';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 									 Filename, 		      LoadType)
VALUES	('SND_LEADER_MUSIC_THP_WOQINI_PEACE', 		'Cheyenne_Peace',    'DynamicResident'),
		('SND_LEADER_MUSIC_THP_WOQINI_WAR', 		'Cheyenne_War', 	 'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_WOQINI_PEACE', 		'SND_LEADER_MUSIC_THP_WOQINI_PEACE', 		'GAME_MUSIC', 	-1.0,					90, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_WOQINI_WAR', 			'SND_LEADER_MUSIC_THP_WOQINI_WAR', 		'GAME_MUSIC', 	-1.0,					80, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
