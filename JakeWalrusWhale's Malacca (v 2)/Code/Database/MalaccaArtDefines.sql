--================================================================
-- Audio
--================================================================

INSERT INTO Audio_Sounds
		(SoundID,									Filename,			LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_PARAMESWARA_PEACE',	'Malacca_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_PARAMESWARA_WAR',	'Malacca_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,										SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_PARAMESWARA_PEACE',		'SND_LEADER_MUSIC_JWW_PARAMESWARA_PEACE',	'GAME_MUSIC',	-1.0,					60,			60,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_PARAMESWARA_WAR',		'SND_LEADER_MUSIC_JWW_PARAMESWARA_WAR',		'GAME_MUSIC',	-1.0,					90,			90,			1,			0);

--================================================================
-- Colors
--================================================================

INSERT INTO PlayerColors
		(Type,						PrimaryColor,						SecondaryColor,							TextColor)
VALUES	('PLAYERCOLOR_JWW_MALACCA',	'COLOR_PLAYER_JWW_MALACCA_ICON',	'COLOR_PLAYER_JWW_MALACCA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,									Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_MALACCA_ICON',		0.757,		0.522,		0.063,		1.0),
		('COLOR_PLAYER_JWW_MALACCA_BACKGROUND',	0.051,		0.145,		0.298,		1.0);

--================================================================
-- Atlases
--================================================================

INSERT INTO IconTextureAtlases
		(Atlas,								IconSize,		Filename,					IconsPerRow,	IconsPerColumn)
VALUES	('JWW_MALACCA_COLOR_ATLAS',			'256',			'MalaccaAtlas256.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'128',			'MalaccaAtlas128.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'80',			'MalaccaAtlas80.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'64',			'MalaccaAtlas64.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'48',			'MalaccaAtlas48.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'45',			'MalaccaAtlas45.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'32',			'MalaccaAtlas32.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'24',			'MalaccaAtlas24.dds',		3,				2),
		('JWW_MALACCA_COLOR_ATLAS',			'16',			'MalaccaAtlas16.dds',		3,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'256',			'MalaccaAtlas256.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'128',			'MalaccaAtlas128.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'80',			'MalaccaAtlas80.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'64',			'MalaccaAtlas64.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'48',			'MalaccaAtlas48.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'45',			'MalaccaAtlas45.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'32',			'MalaccaAtlas32.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'24',			'MalaccaAtlas24.dds',		1,				2),
		('JWW_MALACCA_ALPHA_ATLAS',			'16',			'MalaccaAtlas16.dds',		1,				2),
		('JWW_MALACCA_UNIT_ALPHA_ATLAS',	'32',			'OrangeLautAlpha32.dds',	1,				1),
		('JWW_MALACCA_UNIT_ALPHA_ATLAS_2',	'32',			'HulubalangAlpha32.dds',	1,				1);

--================================================================
-- Art Defines
--================================================================

INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_ORANG_LAUT', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_GALLEASS');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,						NumMembers)
SELECT  'ART_DEF_UNIT_JWW_ORANG_LAUT', 'ART_DEF_UNIT_MEMBER_JWW_ORANG_LAUT',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GALLEASS');
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ORANG_LAUT',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ORANG_LAUT',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,             MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ORANG_LAUT',  Scale,  ZOffset, DOMAIN, 'Coracle.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_GALLEASS');
 

INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_HULUBALANG', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_GENERAL');
INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation, IconAtlas, PortraitIndex)
SELECT  'ART_DEF_UNIT_JWW_HULUBALANG_LATE', DamageStates,   Formation, 'JWW_MALACCA_COLOR_ATLAS',	4
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_GENERAL_LATE');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,						NumMembers)
SELECT  'ART_DEF_UNIT_JWW_HULUBALANG', 'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL');
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,						NumMembers)
SELECT  'ART_DEF_UNIT_JWW_HULUBALANG_LATE', 'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG_LATE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_LATE');
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY');
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG_LATE',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY');
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG_LATE',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,             MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG',  Scale,  ZOffset, DOMAIN, 'hulubalang.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY');
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,             MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_HULUBALANG_LATE',  Scale,  ZOffset, DOMAIN, 'hulubalang.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE');

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,					TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_ORANG_LAUT',     'Unit',     'OrangLautSV.dds'),
		('ART_DEF_UNIT_JWW_HULUBALANG',     'Unit',     'HulubalangSV.dds'),
		('ART_DEF_UNIT_JWW_HULUBALANG_LATE',     'Unit',     'HulubalangSV.dds');

--================================================================
--================================================================