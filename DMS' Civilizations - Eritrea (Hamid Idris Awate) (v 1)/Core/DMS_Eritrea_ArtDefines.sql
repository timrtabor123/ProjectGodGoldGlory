--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('DMS_ERITREA_ATLAS', 					256, 		'DMS_EritreaAtlas_256.dds',			2, 				2),
		('DMS_ERITREA_ATLAS', 					128, 		'DMS_EritreaAtlas_128.dds',			2, 				2),
		('DMS_ERITREA_ATLAS', 					80, 		'DMS_EritreaAtlas_80.dds',			2, 				2),
		('DMS_ERITREA_ATLAS', 					64, 		'DMS_EritreaAtlas_64.dds',			2, 				2),
		('DMS_ERITREA_ATLAS', 					45, 		'DMS_EritreaAtlas_45.dds',			2, 				2),
		('DMS_ERITREA_ATLAS', 					32, 		'DMS_EritreaAtlas_32.dds',			2, 				2),
		('DMS_ERITREA_ALPHA_ATLAS', 			128, 		'DMS_EritreaAlphaAtlas_128.dds',	1,				1),
		('DMS_ERITREA_ALPHA_ATLAS', 			80, 		'DMS_EritreaAlphaAtlas_80.dds',		1, 				1),
		('DMS_ERITREA_ALPHA_ATLAS', 			64, 		'DMS_EritreaAlphaAtlas_64.dds',		1, 				1),
		('DMS_ERITREA_ALPHA_ATLAS', 			48, 		'DMS_EritreaAlphaAtlas_48.dds',		1, 				1),
		('DMS_ERITREA_ALPHA_ATLAS', 			45, 		'DMS_EritreaAlphaAtlas_45.dds',		1, 				1),
		('DMS_ERITREA_ALPHA_ATLAS', 			32, 		'DMS_EritreaAlphaAtlas_32.dds',		1, 				1),
		('DMS_ERITREA_ALPHA_ATLAS', 			24, 		'DMS_EritreaAlphaAtlas_24.dds',		1, 				1),
		('DMS_ERITREA_ALPHA_ATLAS', 			16, 		'DMS_EritreaAlphaAtlas_16.dds',		1, 				1),
		('DMS_UNIT_FLAG_PENNE_DI_FALCO_ATLAS', 	32, 		'UnitFlag_PenneDiFalco_32.dds',		1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_DMS_ERITREA_ICON', 		0.404,	0.733,	0.478,	1),
		('COLOR_PLAYER_DMS_ERITREA_BACKGROUND',	0.561,	0.247,	0.09,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_DMS_ERITREA',		'COLOR_PLAYER_DMS_ERITREA_ICON', 	'COLOR_PLAYER_DMS_ERITREA_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_DMS_AWATE_PEACE', 	'DMS_Awate_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_DMS_AWATE_WAR', 		'DMS_Awate_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_DMS_AWATE_PEACE', 	'SND_LEADER_MUSIC_DMS_AWATE_PEACE',		'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_DMS_AWATE_WAR', 	'SND_LEADER_MUSIC_DMS_AWATE_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_DMS_PENNE_DI_FALCO', 	'Unit', 	'sv_penne_di_falco.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_DMS_PENNE_DI_FALCO'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_CAVALRY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,								NumMembers)
SELECT	('ART_DEF_UNIT_DMS_PENNE_DI_FALCO'),	('ART_DEF_UNIT_MEMBER_DMS_PENNE_DI_FALCO'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_PENNE_DI_FALCO'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_PENNE_DI_FALCO'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_PENNE_DI_FALCO'),	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CAVALRY');
--==========================================================================================================================	
--==========================================================================================================================