INSERT INTO ArtDefine_LandmarkTypes
		(Type,	LandmarkType,	FriendlyName)
VALUES	('ART_DEF_RESOURCE_CS_CAVIAR',	'Resource',	'Caviar');

INSERT INTO ArtDefine_Landmarks
		(Era, State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,	Model,	TerrainContour,	Tech)
VALUES	('Any',			'Any',					0.07000000029802322,	'ART_DEF_IMPROVEMENT_NONE',						'ANIMATED',		'ART_DEF_RESOURCE_CS_CAVIAR', 	'feathers.fxsxml',	1,				null),
		('Any',			'Any',					0.07000000029802322,	'ART_DEF_IMPROVEMENT_CAMP',			'ANIMATED',		'ART_DEF_RESOURCE_CS_CAVIAR', 	'feathers.fxsxml',				1,				null);
		
INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_EW_YUGRA',	256,	'YugraAtlas256.dds',	2,	2),
		('ATLAS_EW_YUGRA',	128,	'YugraAtlas128.dds',	2,	2),
		('ATLAS_EW_YUGRA',	80,	'YugraAtlas80.dds',	2,	2),
		('ATLAS_EW_YUGRA',	64,	'YugraAtlas64.dds',	2,	2),
		('ATLAS_EW_YUGRA',	45,	'YugraAtlas45.dds',	2,	2),
		('ATLAS_EW_YUGRA',	32,	'YugraAtlas32.dds',	2,	2),
		('ALPHA_EW_YUGRA',	256,	'YugraAlpha256.dds',	1,	1),
		('ALPHA_EW_YUGRA',	128,	'YugraAlpha128.dds',	1,	1),
		('ALPHA_EW_YUGRA',	80,	'YugraAlpha80.dds',	1,	1),
		('ALPHA_EW_YUGRA',	64,	'YugraAlpha64.dds',	1,	1),
		('ALPHA_EW_YUGRA',	45,	'YugraAlpha45.dds',	1,	1),
		('ALPHA_EW_YUGRA',	32,	'YugraAlpha32.dds',	1,	1),
		('ALPHA_EW_YUGRA',	24,	'YugraAlpha24.dds',	1,	1),
		('ALPHA_EW_YUGRA',	16,	'YugraAlpha16.dds',	1,	1),
		('ICON_EW_YUGRA',	256,	'YugraIcon256.dds',	1,	1),
		('ICON_EW_YUGRA',	128,	'YugraIcon128.dds',	1,	1),
		('ICON_EW_YUGRA',	80,	'YugraIcon80.dds',	1,	1),
		('ICON_EW_YUGRA',	64,	'YugraIcon64.dds',	1,	1),
		('ICON_EW_YUGRA',	45,	'YugraIcon45.dds',	1,	1),
		('ICON_EW_YUGRA',	32,	'YugraIcon32.dds',	1,	1),
		('ALPHA_EW_MOOSE',	32,	'MooseFlag.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	256,	'caviarAtlas256.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	128,	'caviarAtlas128.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	80,	'caviarAtlas80.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	64,	'caviarAtlas64.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	48,	'caviarAtlas48.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	45,	'caviarAtlas45.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	32,	'caviarAtlas32.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	24,	'caviarAtlas24.dds',	1,	1),
		('ATLAS_EW_CAVIAR',	16,	'caviarAtlas16.dds',	1,	1);

-----


INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,	TileType,	Asset)
VALUES	('ART_DEF_UNIT_EW_MOOSE',	'Unit',	'MooseSV.dds'),
		('ART_DEF_RESOURCE_CS_CAVIAR',	'Resource',	'caviarAtlas_SV.dds');

INSERT INTO ArtDefine_UnitInfos
		(Type,	DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_EW_MOOSE'),	DamageStates,	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_MONGOLIAN_KESHIK');

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,	UnitMemberInfoType,	NumMembers)
SELECT	('ART_DEF_UNIT_EW_MOOSE'),	('ART_DEF_UNIT_MEMBER_EW_MOOSE'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_MONGOLIAN_KESHIK');

INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType,	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_EW_MOOSE'),	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
		(UnitMemberType,	"Index",	SubIndex,	ID,	VisKillStrengthMin,	VisKillStrengthMax,	ProjectileSpeed,	ProjectileTurnRateMin,	ProjectileTurnRateMax,	HitEffect,	HitEffectScale,	HitRadius,	ProjectileChildEffectScale,	AreaDamageDelay,	ContinuousFire,	WaitForEffectCompletion,	TargetGround,	IsDropped,	WeaponTypeTag,	WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_EW_MOOSE'),	"Index",	SubIndex,	ID,	VisKillStrengthMin,	VisKillStrengthMax,	ProjectileSpeed,	ProjectileTurnRateMin,	ProjectileTurnRateMax,	HitEffect,	HitEffectScale,	HitRadius,	ProjectileChildEffectScale,	AreaDamageDelay,	ContinuousFire,	WaitForEffectCompletion,	TargetGround,	IsDropped,	WeaponTypeTag,	WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK');

INSERT INTO ArtDefine_UnitMemberInfos
		(Type,	Scale,	ZOffset,	Domain,	Model,	MaterialTypeTag,	MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_EW_MOOSE'),	Scale,	ZOffset,	Domain,	('mooseCav.fxsxml'),	MaterialTypeTag,	MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK');

--Music

INSERT INTO Audio_Sounds
		(SoundID,	Filename,	LoadType)
VALUES	('SND_LEADER_MUSIC_CTCL_ALACH_PEACE',	'YugraPeace',	'DynamicResident'),
		('SND_LEADER_MUSIC_CTCL_ALACH_WAR',	'YugraWar',	'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,	SoundID,	SoundType,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_CTCL_ALACH_WAR',	'SND_LEADER_MUSIC_CTCL_ALACH_WAR',	'GAME_MUSIC',	60,	60,	1,	0),
		('AS2D_LEADER_MUSIC_CTCL_ALACH_PEACE',	'SND_LEADER_MUSIC_CTCL_ALACH_PEACE',	'GAME_MUSIC',	60,	60,	1,	0);