--==========================================================================================================================	
-- Atlas Defines
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 		Filename, 			  IconsPerRow, 	IconsPerColumn)
VALUES 	('ER_KAREN_ATLAS',			256, 		'KarenIconAtlas256.dds',		2,				2),
		('ER_KAREN_ATLAS',			128, 		'KarenIconAtlas128.dds',		2,				2),
		('ER_KAREN_ATLAS',			80, 		'KarenIconAtlas80.dds',			2,				2),
		('ER_KAREN_ATLAS',			64, 		'KarenIconAtlas64.dds',			2,				2),
		('ER_KAREN_ATLAS',			45, 		'KarenIconAtlas45.dds',			2,				2),
		('ER_KAREN_ATLAS',			32, 		'KarenIconAtlas32.dds',			2,				2),
		('ER_ALPHA_KAREN_ATLAS',	64,			'KarenAlphaIconAtlas64.dds',	1,				1),
		('ER_ALPHA_KAREN_ATLAS',	48,			'KarenAlphaIconAtlas48.dds',	1,				1),
		('ER_ALPHA_KAREN_ATLAS',	32,			'KarenAlphaIconAtlas32.dds',	1,				1),
		('ER_ALPHA_KAREN_ATLAS',	24,			'KarenAlphaIconAtlas24.dds',	1,				1),
		('ER_THUKAY_FLAG',			32,			'unitflag_er_thukay.dds',		1,				1);
--==========================================================================================================================	
-- Sound Defines
--==========================================================================================================================	
INSERT INTO Audio_Sounds
		(SoundID,									Filename,		LoadType)
VALUES	('SND_LEADER_MUSIC_ER_SAW_BA_U_GYI_PEACE',	'Karen_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ER_SAW_BA_U_GYI_WAR',	'Karen_War',	'DynamicResident'),
		('SND_DOM_SPEECH_SAW_BA_U_GYI',				'Karen_DoM',	'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID, 									SoundID,										SoundType,	TaperSoundtrackVolume,	MinVolume,	MaxVolume, 	IsMusic,	Looping)
VALUES 	('AS2D_LEADER_MUSIC_ER_SAW_BA_U_GYI_PEACE',	'SND_LEADER_MUSIC_ER_SAW_BA_U_GYI_PEACE',	'GAME_MUSIC',	-1.0,					76,		76,			1,			0),
		('AS2D_LEADER_MUSIC_ER_SAW_BA_U_GYI_WAR',	'SND_LEADER_MUSIC_ER_SAW_BA_U_GYI_WAR',		'GAME_MUSIC',	-1.0,					63,		63,			1,			0),
		('AS2D_DOM_SPEECH_ER_KAREN',				'SND_DOM_SPEECH_SAW_BA_U_GYI',				'GAME_SPEECH',	-1.0,					88,		88,			1,			0);
--==========================================================================================================================	
-- Unit Defines
-- grrr Firaxis 
--==========================================================================================================================
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_ER_THUKAY'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_BAZOOKA_INFANTRY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,						NumMembers)
VALUES	('ART_DEF_UNIT_ER_THUKAY',	'ART_DEF_UNIT_MEMBER_ER_THUKAY',		3),
		('ART_DEF_UNIT_ER_THUKAY',	'ART_DEF_UNIT_MEMBER_ANTIAIRCRAFTGUN',	1);
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_ER_THUKAY'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ER_THUKAY'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, 1,				 WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 										--this is where you add fxsml
		(Type, 								Scale,		ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ER_THUKAY'),	Scale+0.01,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_ER_THUKAY',	'Unit', 	'SV_er_thukay.dds');
