-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                         IconSize,     Filename,                             IconsPerRow,     IconsPerColumn)
VALUES    ('THP_PALA_ATLAS',     256,        'THP_PalaAtlas256.dds',        2,                 2),
('THP_PALA_ATLAS',               128,        'THP_PalaAtlas128.dds',        2,                 2),
('THP_PALA_ATLAS',               80,         'THP_PalaAtlas80.dds',         2,                 2),
('THP_PALA_ATLAS',               64,         'THP_PalaAtlas64.dds',         2,                 2),
('THP_PALA_ATLAS',               45,         'THP_PalaAtlas45.dds',         2,                 2),
('THP_PALA_ATLAS',               32,         'THP_PalaAtlas32.dds',         2,                 2),
('THP_PALA_ALPHA_ATLAS',         128,        'THP_PalaAlpha128.dds',        1,                 1),
('THP_PALA_ALPHA_ATLAS',         80,         'THP_PalaAlpha80.dds',         1,                 1),
('THP_PALA_ALPHA_ATLAS',         64,         'THP_PalaAlpha64.dds',         1,                 1),
('THP_PALA_ALPHA_ATLAS',         48,         'THP_PalaAlpha48.dds',         1,                 1),
('THP_PALA_ALPHA_ATLAS',         32,         'THP_PalaAlpha32.dds',         1,                 1),
('THP_PALA_ALPHA_ATLAS',         24,         'THP_PalaAlpha24.dds',         1,                 1),
('THP_PALA_ALPHA_ATLAS',         16,         'THP_PalaAlpha16.dds',         1,                 1),
('THP_UNIT_PALA_ELEPHANT_FLAG_ATLAS',     32,         'Unit_Pala_Elephant_Flag_32.dds',       1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                     Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_PALA_ICON',   0.580,   0.157,    0.129,    1),
('COLOR_PLAYER_THP_PALA_BACKGROUND',       0.941,   0.565,    0.255,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_PALA',        'COLOR_PLAYER_THP_PALA_ICON',     'COLOR_PLAYER_THP_PALA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
--------------------------
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		    		 TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_PALA_ELEPHANT',		'Unit', 		'sv_pala_elephant.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								        DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_THP_PALA_ELEPHANT',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_SIAMESE_WARELEPHANT';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					     UnitMemberInfoType,				         NumMembers)
SELECT	'ART_DEF_UNIT_THP_PALA_ELEPHANT', 	'ART_DEF_UNIT_MEMBER_THP_PALA_ELEPHANT',	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_SIAMESE_WARELEPHANT';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_THP_PALA_ELEPHANT',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_THP_PALA_ELEPHANT',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_THP_PALA_ELEPHANT',	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 									     Filename, 		     LoadType)
VALUES	('SND_LEADER_MUSIC_THP_DHARMAPALA_PEACE', 		'Pala_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_THP_DHARMAPALA_WAR', 		'Pala_War', 		'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_DHARMAPALA_PEACE', 		'SND_LEADER_MUSIC_THP_DHARMAPALA_PEACE', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_DHARMAPALA_WAR', 			'SND_LEADER_MUSIC_THP_DHARMAPALA_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);


-- ======================================================================================================
-- ======================================================================================================
