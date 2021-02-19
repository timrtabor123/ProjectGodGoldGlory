--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('DMS_MC_KANEM_BORNU_ATLAS', 					256, 		'DMS_MC_KanemBornuAtlas_256.dds',		2, 				2),
		('DMS_MC_KANEM_BORNU_ATLAS', 					128, 		'DMS_MC_KanemBornuAtlas_128.dds',		2, 				2),
		('DMS_MC_KANEM_BORNU_ATLAS', 					80, 		'DMS_MC_KanemBornuAtlas_80.dds',		2, 				2),
		('DMS_MC_KANEM_BORNU_ATLAS', 					64, 		'DMS_MC_KanemBornuAtlas_64.dds',		2, 				2),
		('DMS_MC_KANEM_BORNU_ATLAS', 					45, 		'DMS_MC_KanemBornuAtlas_45.dds',		2, 				2),
		('DMS_MC_KANEM_BORNU_ATLAS', 					32, 		'DMS_MC_KanemBornuAtlas_32.dds',		2, 				2),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				128, 		'DMS_MC_KanemBornuAlphaAtlas_128.dds',	1,				1),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				80, 		'DMS_MC_KanemBornuAlphaAtlas_80.dds',	1, 				1),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				64, 		'DMS_MC_KanemBornuAlphaAtlas_64.dds',	1, 				1),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				48, 		'DMS_MC_KanemBornuAlphaAtlas_48.dds',	1, 				1),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				45, 		'DMS_MC_KanemBornuAlphaAtlas_45.dds',	1, 				1),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				32, 		'DMS_MC_KanemBornuAlphaAtlas_32.dds',	1, 				1),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				24, 		'DMS_MC_KanemBornuAlphaAtlas_24.dds',	1, 				1),
		('DMS_MC_KANEM_BORNU_ALPHA_ATLAS', 				16, 		'DMS_MC_KanemBornuAlphaAtlas_16.dds',	1, 				1),
		('DMS_ASKAWR_FLAG_ART_ATLAS', 					32, 		'UnitFlag_Askawr_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_DMS_MC_KANEM_BORNU_ICON',			0.004,	0.153,	0.208,	1),
		('COLOR_PLAYER_DMS_MC_KANEM_BORNU_BACKGROUND',		0.651,	0.569,	0.388,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_DMS_MC_KANEM_BORNU',		'COLOR_PLAYER_DMS_MC_KANEM_BORNU_ICON', 	'COLOR_PLAYER_DMS_MC_KANEM_BORNU_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_DMS_MC_IDIRS_ALAUMA_PEACE', 	'IdrisAlauma_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_DMS_MC_IDIRS_ALAUMA_WAR', 	'IdrisAlauma_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 										SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_DMS_MC_IDIRS_ALAUMA_PEACE', 'SND_LEADER_MUSIC_DMS_MC_IDIRS_ALAUMA_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_DMS_MC_IDIRS_ALAUMA_WAR', 	'SND_LEADER_MUSIC_DMS_MC_IDIRS_ALAUMA_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_DMS_MC_ASKAWR', 		'Unit', 	'sv_u_askawr.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_DMS_MC_ASKAWR'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_KNIGHT');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_DMS_MC_ASKAWR'),		('ART_DEF_UNIT_MEMBER_DMS_MC_ASKAWR'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_MC_ASKAWR'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_MC_ASKAWR'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_MC_ASKAWR'),	Scale,	ZOffset, Domain, 'SonghaiHorseman.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_KNIGHT');
--==========================================================================================================================	
--==========================================================================================================================	
