INSERT INTO Colors
		(Type,						Red,	Green,	Blue,	Alpha)
VALUES	('COLOR_EW_YUKAGHIR_ICON',	0.89,	0.898,	0.82,	1),
		('COLOR_EW_YUKAGHIR_BG',	0.369,	0.047,	0.153,	1);

INSERT INTO PlayerColors
		(Type,						PrimaryColor,			SecondaryColor,			TextColor)
VALUES	('PLAYERCOLOR_EW_YUKAGHIR',	'COLOR_EW_YUKAGHIR_ICON',	'COLOR_EW_YUKAGHIR_BG',	'COLOR_PLAYER_WHITE_TEXT');

-----

INSERT INTO IconTextureAtlases
		(Atlas,					IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_EW_YUKAGHIR',	256,		'yukaPlate_256.dds',	1,				1),
		('ATLAS_EW_YUKAGHIR',	128,		'yukaPlate_128.dds',	1,				1),
		('ATLAS_EW_YUKAGHIR',	80,			'yukaPlate_80.dds',		1,				1),
		('ATLAS_EW_YUKAGHIR',	64,			'yukaPlate_64.dds',		1,				1),
		('ATLAS_EW_YUKAGHIR',	45,			'yukaPlate_45.dds',		1,				1),
		('ATLAS_EW_YUKAGHIR',	32,			'yukaPlate_32.dds',		1,				1),
		('ALPHA_EW_YUKAGHIR',	64,			'yuka_Alpha64.dds',		1,				1),
		('ALPHA_EW_YUKAGHIR',	48,			'yuka_Alpha48.dds',		1,				1),
		('ALPHA_EW_YUKAGHIR',	32,			'yuka_Alpha32.dds',		1,				1),
		('ALPHA_EW_YUKAGHIR',	24,			'yuka_Alpha24.dds',		1,				1),
		('ATLAS_EW_ODULOK',		256,		'tekiPlate_256.dds',	3,				1),
		('ATLAS_EW_ODULOK',		128,		'tekiPlate_128.dds',	3,				1),
		('ATLAS_EW_ODULOK',		80,			'tekiPlate_80.dds',		3,				1),
		('ATLAS_EW_ODULOK',		64,			'tekiPlate_64.dds',		3,				1),
		('ATLAS_EW_ODULOK',		48,			'tekiPlate_48.dds',		3,				1),
		('ATLAS_EW_ODULOK',		45,			'tekiPlate_45.dds',		3,				1),
		('ATLAS_EW_ODULOK',		32,			'tekiPlate_32.dds',		3,				1),
		('ALPHA_EW_SHOROMOKH',	32,			'ligee_Alpha.dds',		1,				1)
		;

--UU

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,				TileType,	Asset)
VALUES	('ART_DEF_UNIT_EW_SHOROMOKH',	'Unit',		'ligee_SV.dds');	

INSERT INTO ArtDefine_UnitInfos
		(Type,							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_EW_SHOROMOKH',	DamageStates,	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SCOUT');

INSERT INTO ArtDefine_UnitMemberInfos
		(Type,								Scale,	ZOffset,	Domain,	Model,				MaterialTypeTag,	MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_EW_SHOROMOKH',	0.16,	ZOffset,	Domain,	'ligeeSkin.fxsxml',	MaterialTypeTag,	MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_SCOUT');

INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
VALUES	('ART_DEF_UNIT_EW_SHOROMOKH',	'ART_DEF_UNIT_MEMBER_EW_SHOROMOKH',	1);

INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType,					EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation,	LastToDie)
SELECT	'ART_DEF_UNIT_MEMBER_EW_SHOROMOKH',	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation,	LastToDie
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
		(UnitMemberType,					"Index",	SubIndex,	ID,	VisKillStrengthMin,	VisKillStrengthMax,	ProjectileSpeed,	ProjectileTurnRateMin,	ProjectileTurnRateMax,	HitEffect,	HitEffectScale,	HitRadius,	ProjectileChildEffectScale,	AreaDamageDelay,	ContinuousFire,	WaitForEffectCompletion,	TargetGround,	IsDropped,	WeaponTypeTag,	WeaponTypeSoundOverrideTag,	MissTargetSlopRadius)
SELECT	'ART_DEF_UNIT_MEMBER_EW_SHOROMOKH',	"Index",	SubIndex,	ID,	VisKillStrengthMin,	VisKillStrengthMax,	ProjectileSpeed,	ProjectileTurnRateMin,	ProjectileTurnRateMax,	HitEffect,	HitEffectScale,	HitRadius,	ProjectileChildEffectScale,	AreaDamageDelay,	ContinuousFire,	WaitForEffectCompletion,	TargetGround,	IsDropped,	WeaponTypeTag,	WeaponTypeSoundOverrideTag,	MissTargetSlopRadius
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT');

--Music

INSERT INTO Audio_Sounds
		(SoundID,	Filename,	LoadType)
VALUES	('SND_LEADER_MUSIC_EW_ODULOK_WAR',	'Yuka_War',	'DynamicResident'),
		('SND_LEADER_MUSIC_EW_ODULOK_PEACE',	'Yuka_Peace',	'DynamicResident');

-----

INSERT INTO Audio_2DSounds
		(ScriptID,	SoundID,	SoundType,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_EW_ODULOK_WAR',	'SND_LEADER_MUSIC_EW_ODULOK_WAR',	'GAME_MUSIC',	60,	60,	1,	0),
		('AS2D_LEADER_MUSIC_EW_ODULOK_PEACE',	'SND_LEADER_MUSIC_EW_ODULOK_PEACE',	'GAME_MUSIC',	60,	60,	1,	0);
		