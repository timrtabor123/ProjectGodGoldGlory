-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                            Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_PB_LANFANG_ICON',			 0.12941176470588237,   0.12549019607843137,    0.12156862745098039,    1),
		  ('COLOR_PLAYER_PB_LANFANG_BACKGROUND',       0.6980392156862745,   0.6745098039215687,    0.10980392156862745,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_PB_LANFANG',        'COLOR_PLAYER_PB_LANFANG_ICON',     'COLOR_PLAYER_PB_LANFANG_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');

-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                            IconSize,    Filename,                       IconsPerRow,     IconsPerColumn)
VALUES    
('LANFANG_ICON_ATLAS',         256,        'Lanfang_Atlas256.dds',        8,                 8),
('LANFANG_ICON_ATLAS',         214,         'Lanfang_Atlas214.dds',         8,                 8),
('LANFANG_ICON_ATLAS',         128,         'Lanfang_Atlas128.dds',         8,                 8),
('LANFANG_ICON_ATLAS',         80,         'Lanfang_Atlas80.dds',         8,                 8),
('LANFANG_ICON_ATLAS',         64,         'Lanfang_Atlas64.dds',         8,                 8),
('LANFANG_ICON_ATLAS',         45,         'Lanfang_Atlas45.dds',         8,                 8),
('LANFANG_ICON_ATLAS',         32,         'Lanfang_Atlas32.dds',         4,                 4),

('LANFANG_ALPHA_ATLAS',         128,        'LanfangAlpha128.dds',        1,                 1),
('LANFANG_ALPHA_ATLAS',         80,         'LanfangAlpha80.dds',         1,                 1),
('LANFANG_ALPHA_ATLAS',         64,         'LanfangAlpha64.dds',         1,                 1),
('LANFANG_ALPHA_ATLAS',         48,         'LanfangAlpha48.dds',         1,                 1),
('LANFANG_ALPHA_ATLAS',         32,         'LanfangAlpha32.dds',         1,                 1),
('LANFANG_ALPHA_ATLAS',         24,         'LanfangAlpha24.dds',         1,                 1),
('LANFANG_ALPHA_ATLAS',         16,         'LanfangAlpha16.dds',         1,                 1),

('LANFANG_LANSAAI_FLAG_ATLAS',		32,			'Flag_Lansaai.dds',			1,					1);


--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_LF_LANSAAI', 			'Unit', 		'lansaai_sv.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LF_LANSAAI', 			DamageStates, 	'UnFormed'
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_LF_LANSAAI', 			'ART_DEF_UNIT_MEMBER_LF_LANSAAI', 	5
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_LF_LANSAAI', 			'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V2', 	2
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_LF_LANSAAI', 			'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V3', 	2
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V2',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V3',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V2',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V3',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI',		Scale, ZOffset, Domain, 'lansaai1.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V2',		Scale, ZOffset, Domain, 'lansaai2.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LF_LANSAAI_V3',		Scale, ZOffset, Domain, 'lansaai3.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--==========================================================================================================================	
--==========================================================================================================================	