--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_WAR_MAHOUT',		'Unit', 	'sv_WarMahout.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_WAR_MAHOUT',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_INDIAN_WARELEPHANT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
VALUES	('ART_DEF_UNIT_JFD_WAR_MAHOUT', 	'ART_DEF_UNIT_MEMBER_JFD_WAR_MAHOUT',	2);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_WAR_MAHOUT',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_WAR_MAHOUT',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 			  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_WAR_MAHOUT',	Scale,	ZOffset, Domain, 'WarMahout.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT';	
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_MENANDER_PEACE',		'JFD_Menander_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_MENANDER_WAR', 		'JFD_Menander_War', 	'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_MENANDER_PEACE',	'SND_LEADER_MUSIC_JFD_MENANDER_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_MENANDER_WAR', 		'SND_LEADER_MUSIC_JFD_MENANDER_WAR', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_INDO_GREEKS_ICON', 		0.713,	0.329,	0.070,	1),
		('COLOR_PLAYER_JFD_INDO_GREEKS_BACKGROUND',	0.588,	0.745,	0.843,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 							 PrimaryColor, 						  SecondaryColor, 							 TextColor)
VALUES	('PLAYERCOLOR_JFD_INDO_GREEKS',	 'COLOR_PLAYER_JFD_INDO_GREEKS_ICON', 'COLOR_PLAYER_JFD_INDO_GREEKS_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_INDO_GREEKS_ALPHA_ATLAS', 		128, 		'JFD_IndoGreeks_AlphaAtlas_128.dds',		1,				1),
		('JFD_INDO_GREEKS_ALPHA_ATLAS', 		80, 		'JFD_IndoGreeks_AlphaAtlas_80.dds',			1, 				1),
		('JFD_INDO_GREEKS_ALPHA_ATLAS', 		64, 		'JFD_IndoGreeks_AlphaAtlas_64.dds',			1, 				1),
		('JFD_INDO_GREEKS_ALPHA_ATLAS', 		48, 		'JFD_IndoGreeks_AlphaAtlas_48.dds',			1, 				1),
		('JFD_INDO_GREEKS_ALPHA_ATLAS', 		45, 		'JFD_IndoGreeks_AlphaAtlas_45.dds',			1, 				1),
		('JFD_INDO_GREEKS_ALPHA_ATLAS', 		32, 		'JFD_IndoGreeks_AlphaAtlas_32.dds',			1, 				1),
		('JFD_INDO_GREEKS_ALPHA_ATLAS', 		24, 		'JFD_IndoGreeks_AlphaAtlas_24.dds',			1, 				1),
		('JFD_INDO_GREEKS_ALPHA_ATLAS', 		16, 		'JFD_IndoGreeks_AlphaAtlas_16.dds',			1, 				1),
		('JFD_INDO_GREEKS_ICON_ATLAS', 			256, 		'JFD_IndoGreeks_IconAtlas_256.dds',			2, 				2),
		('JFD_INDO_GREEKS_ICON_ATLAS', 			128, 		'JFD_IndoGreeks_IconAtlas_128.dds',			2, 				2),
		('JFD_INDO_GREEKS_ICON_ATLAS', 			80, 		'JFD_IndoGreeks_IconAtlas_80.dds',			2, 				2),
		('JFD_INDO_GREEKS_ICON_ATLAS', 			64, 		'JFD_IndoGreeks_IconAtlas_64.dds',			2, 				2),
		('JFD_INDO_GREEKS_ICON_ATLAS', 			45, 		'JFD_IndoGreeks_IconAtlas_45.dds',			2, 				2),
		('JFD_INDO_GREEKS_ICON_ATLAS', 			32, 		'JFD_IndoGreeks_IconAtlas_32.dds',			2, 				2),
		('JFD_INDO_GREEKS_PROMOTION_ATLAS',		256, 	    'Tomatekh_PromotionAtlas_256.dds',			2, 				1),
		('JFD_INDO_GREEKS_PROMOTION_ATLAS',		64, 	    'Tomatekh_PromotionAtlas_64.dds',			2, 				1),
		('JFD_INDO_GREEKS_PROMOTION_ATLAS',		45, 	    'Tomatekh_PromotionAtlas_45.dds',			2, 				1),
		('JFD_INDO_GREEKS_PROMOTION_ATLAS',		32, 	    'Tomatekh_PromotionAtlas_32.dds',			2, 				1),
		('JFD_INDO_GREEKS_UNIT_FLAG_ATLAS',		32, 		'JFD_IndoGreeks_UnitFlagAtlas_32.dds',		1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
