--================================================================
-- Audio
--================================================================

INSERT INTO Audio_Sounds
		(SoundID,								Filename,		LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_TEMBINOK_PEACE',	'AbemamaPeace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_TEMBINOK_WAR',	'AbemamaWar',	'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,												SoundID,						SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_TEMBINOK_PEACE',		'SND_LEADER_MUSIC_JWW_TEMBINOK_PEACE',	'GAME_MUSIC',	-1.0,					40,			40,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_TEMBINOK_WAR',			'SND_LEADER_MUSIC_JWW_TEMBINOK_WAR',	'GAME_MUSIC',	-1.0,					20,			20,			1,			0);

--================================================================
-- Colors
--================================================================

INSERT INTO PlayerColors
		(Type,						PrimaryColor,						SecondaryColor,							TextColor)
VALUES	('PLAYERCOLOR_JWW_ABEMAMA',	'COLOR_PLAYER_JWW_ABEMAMA_ICON',	'COLOR_PLAYER_JWW_ABEMAMA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,									Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_ABEMAMA_ICON',		0.667,		0.835,		0.867,		1.0),
		('COLOR_PLAYER_JWW_ABEMAMA_BACKGROUND',	0.055,		0.102,		0.220,		1.0);

--================================================================
-- Atlases
--================================================================

INSERT INTO IconTextureAtlases
		(Atlas,								IconSize,		Filename,							IconsPerRow,	IconsPerColumn)
VALUES	('JWW_ABEMAMA_COLOR_ATLAS',			'256',			'AbemamaIconAtlas256.dds',			3,				2),
		('JWW_ABEMAMA_COLOR_ATLAS',			'128',			'AbemamaIconAtlas128.dds',			3,				2),
		('JWW_ABEMAMA_COLOR_ATLAS',			'80',			'AbemamaIconAtlas80.dds',			3,				2),
		('JWW_ABEMAMA_COLOR_ATLAS',			'64',			'AbemamaIconAtlas64.dds',			3,				2),
		('JWW_ABEMAMA_COLOR_ATLAS',			'48',			'AbemamaIconAtlas48.dds',			3,				2),
		('JWW_ABEMAMA_COLOR_ATLAS',			'45',			'AbemamaIconAtlas45.dds',			3,				2),
		('JWW_ABEMAMA_COLOR_ATLAS',			'32',			'AbemamaIconAtlas32.dds',			3,				2),
		('JWW_ABEMAMA_COLOR_ATLAS',			'24',			'AbemamaIconAtlas24.dds',			3,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'256',			'AbemamaIconAtlas256.dds',			1,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'128',			'AbemamaIconAtlas128.dds',			1,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'80',			'AbemamaIconAtlas80.dds',			1,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'64',			'AbemamaIconAtlas64.dds',			1,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'48',			'AbemamaIconAtlas48.dds',			1,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'45',			'AbemamaIconAtlas45.dds',			1,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'32',			'AbemamaIconAtlas32.dds',			1,				2),
		('JWW_ABEMAMA_ALPHA_ATLAS',			'24',			'AbemamaIconAtlas24.dds',			1,				2),
		('JWW_ABEMAMA_UNIT_ALPHA_ATLAS',	'32',			'SharkToothSwordsmanAlpha32.dds',	1,				1);

--================================================================
-- Art Defines
--================================================================
 
INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_SHARK_TOOTH_SWORDSMAN', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_SWORDSMAN');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,                 NumMembers)
SELECT  'ART_DEF_UNIT_JWW_SHARK_TOOTH_SWORDSMAN', 'ART_DEF_UNIT_MEMBER_JWW_SHARK_TOOTH_SWORDSMAN',  NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN');
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SHARK_TOOTH_SWORDSMAN',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SHARK_TOOTH_SWORDSMAN',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,             MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SHARK_TOOTH_SWORDSMAN',  Scale,  ZOffset, DOMAIN, 'sharktoothswordsman.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,								TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_SHARK_TOOTH_SWORDSMAN',		'Unit',     'SharkToothSwordsman_sv.dds');
 
--================================================================
--================================================================