--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_AZATAVREAR',		'Unit', 	'sv_Azatavrear.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_AZATAVREAR',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_AZATAVREAR', 		'ART_DEF_UNIT_MEMBER_JFD_AZATAVREAR',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_AZATAVREAR',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_AZATAVREAR',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_AZATAVREAR',	Scale,	ZOffset, Domain, 'Azatavrear.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_TIGRANES_II_PEACE', 		'JFD_TigranesII_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_TIGRANES_II_WAR', 		'JFD_TigranesII_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_TIGRANES_II_PEACE',		'SND_LEADER_MUSIC_JFD_TIGRANES_II_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_TIGRANES_II_WAR', 		'SND_LEADER_MUSIC_JFD_TIGRANES_II_WAR', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_GREATER_ARMENIA_ICON', 		0.929,	0.768,	0.466,	1),
		('COLOR_PLAYER_JFD_GREATER_ARMENIA_BACKGROUND',	0.345,	0,		0.043,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 								 PrimaryColor, 							   SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_GREATER_ARMENIA',	 'COLOR_PLAYER_JFD_GREATER_ARMENIA_ICON',   'COLOR_PLAYER_JFD_GREATER_ARMENIA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_GREATER_ARMENIA_ACHIEVEMENT_ATLAS', 	256, 		'JFD_GreaterArmenia_AchievementAtlas_256.dds',	1, 				1),
		('JFD_GREATER_ARMENIA_ACHIEVEMENT_ATLAS', 	128, 		'JFD_GreaterArmenia_AchievementAtlas_128.dds',	1, 				1),
		('JFD_GREATER_ARMENIA_ACHIEVEMENT_ATLAS', 	80, 		'JFD_GreaterArmenia_AchievementAtlas_80.dds',	1, 				1),
		('JFD_GREATER_ARMENIA_ACHIEVEMENT_ATLAS', 	64, 		'JFD_GreaterArmenia_AchievementAtlas_64.dds',	1, 				1),
		('JFD_GREATER_ARMENIA_ACHIEVEMENT_ATLAS', 	45, 		'JFD_GreaterArmenia_AchievementAtlas_45.dds',	1, 				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		128, 		'JFD_GreaterArmenia_AlphaAtlas_128.dds',		1,				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		80, 		'JFD_GreaterArmenia_AlphaAtlas_80.dds',			1, 				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		64, 		'JFD_GreaterArmenia_AlphaAtlas_64.dds',			1, 				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		48, 		'JFD_GreaterArmenia_AlphaAtlas_48.dds',			1, 				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		45, 		'JFD_GreaterArmenia_AlphaAtlas_45.dds',			1, 				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		32, 		'JFD_GreaterArmenia_AlphaAtlas_32.dds',			1, 				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		24, 		'JFD_GreaterArmenia_AlphaAtlas_24.dds',			1, 				1),
		('JFD_GREATER_ARMENIA_ALPHA_ATLAS', 		16, 		'JFD_GreaterArmenia_AlphaAtlas_16.dds',			1, 				1),
		('JFD_GREATER_ARMENIA_ICON_ATLAS', 			256, 		'JFD_GreaterArmenia_IconAtlas_256.dds',			2, 				2),
		('JFD_GREATER_ARMENIA_ICON_ATLAS', 			128, 		'JFD_GreaterArmenia_IconAtlas_128.dds',			2, 				2),
		('JFD_GREATER_ARMENIA_ICON_ATLAS', 			80, 		'JFD_GreaterArmenia_IconAtlas_80.dds',			2, 				2),
		('JFD_GREATER_ARMENIA_ICON_ATLAS', 			64, 		'JFD_GreaterArmenia_IconAtlas_64.dds',			2, 				2),
		('JFD_GREATER_ARMENIA_ICON_ATLAS', 			45, 		'JFD_GreaterArmenia_IconAtlas_45.dds',			2, 				2),
		('JFD_GREATER_ARMENIA_ICON_ATLAS', 			32, 		'JFD_GreaterArmenia_IconAtlas_32.dds',			2, 				2),
		('JFD_GREATER_ARMENIA_PROMOTION_ATLAS',		256, 	    'Tomatekh_PromotionAtlas_256.dds',				2, 				1),
		('JFD_GREATER_ARMENIA_PROMOTION_ATLAS',		64, 	    'Tomatekh_PromotionAtlas_64.dds',				2, 				1),
		('JFD_GREATER_ARMENIA_PROMOTION_ATLAS',		45, 	    'Tomatekh_PromotionAtlas_45.dds',				2, 				1),
		('JFD_GREATER_ARMENIA_PROMOTION_ATLAS',		32, 	    'Tomatekh_PromotionAtlas_32.dds',				2, 				1),
		('JFD_GREATER_ARMENIA_UNIT_FLAG_ATLAS',		32, 		'JFD_GreaterArmenia_UnitFlagAtlas_32.dds',		1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
