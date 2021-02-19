--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('DMS_KALINAGO_ATLAS', 					256, 		'DMS_KalinagoAtlas_256.dds',		2, 				2),
		('DMS_KALINAGO_ATLAS', 					128, 		'DMS_KalinagoAtlas_128.dds',		2, 				2),
		('DMS_KALINAGO_ATLAS', 					80, 		'DMS_KalinagoAtlas_80.dds',			2, 				2),
		('DMS_KALINAGO_ATLAS', 					64, 		'DMS_KalinagoAtlas_64.dds',			2, 				2),
		('DMS_KALINAGO_ATLAS', 					45, 		'DMS_KalinagoAtlas_45.dds',			2, 				2),
		('DMS_KALINAGO_ATLAS', 					32, 		'DMS_KalinagoAtlas_32.dds',			2, 				2),
		('DMS_KALINAGO_ALPHA_ATLAS', 			128, 		'DMS_KalinagoAlphaAtlas_128.dds',	1,				1),
		('DMS_KALINAGO_ALPHA_ATLAS', 			80, 		'DMS_KalinagoAlphaAtlas_80.dds',	1, 				1),
		('DMS_KALINAGO_ALPHA_ATLAS', 			64, 		'DMS_KalinagoAlphaAtlas_64.dds',	1, 				1),
		('DMS_KALINAGO_ALPHA_ATLAS', 			48, 		'DMS_KalinagoAlphaAtlas_48.dds',	1, 				1),
		('DMS_KALINAGO_ALPHA_ATLAS', 			45, 		'DMS_KalinagoAlphaAtlas_45.dds',	1, 				1),
		('DMS_KALINAGO_ALPHA_ATLAS', 			32, 		'DMS_KalinagoAlphaAtlas_32.dds',	1, 				1),
		('DMS_KALINAGO_ALPHA_ATLAS', 			24, 		'DMS_KalinagoAlphaAtlas_24.dds',	1, 				1),
		('DMS_KALINAGO_ALPHA_ATLAS', 			16, 		'DMS_KalinagoAlphaAtlas_16.dds',	1, 				1),
		('DMS_BUYIES_FLAG_ART_ATLAS', 			32, 		'UnitFlag_Buyeis_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_DMS_KALINAGO_ICON',				0.541,	0.682,	0.047,	1),
		('COLOR_PLAYER_DMS_KALINAGO_BACKGROUND',		0.2,	0.404,	0.455,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_DMS_KALINAGO',		'COLOR_PLAYER_DMS_KALINAGO_ICON', 	'COLOR_PLAYER_DMS_KALINAGO_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_DMS_KAIROUANE_PEACE', 	'Kairouane_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_DMS_KAIROUANE_WAR', 		'Kairouane_War', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_DMS_KAIROUANE_PEACE',		'SND_LEADER_MUSIC_DMS_KAIROUANE_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_DMS_KAIROUANE_WAR', 		'SND_LEADER_MUSIC_DMS_KAIROUANE_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_DMS_BUYEIS',				'Unit', 	'sv_u_buyeis.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_DMS_BUYEIS'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GREAT_PROPHET');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	('ART_DEF_UNIT_DMS_BUYEIS'),			('ART_DEF_UNIT_MEMBER_DMS_BUYEIS'),			1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GREAT_PROPHET');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_BUYEIS'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_PROPHET');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_BUYEIS'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_PROPHET');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_BUYEIS'),		Scale,	ZOffset, Domain, 'chimu_general.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREAT_PROPHET');
--==========================================================================================================================	
--==========================================================================================================================	
