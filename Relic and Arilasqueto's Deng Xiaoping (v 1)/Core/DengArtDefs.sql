
--==========================================================================================================================
-- COLORS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 				Green, 					Blue, 				Alpha)
VALUES	('COLOR_PLAYER_RELIC_DENG_CHINA_ICON', 		round(219.0/255, 3),round(164.0/255, 3),	round(76.0/255, 3), 1),
		('COLOR_PLAYER_RELIC_DENG_CHINA_BACKGROUND',round(122.0/255, 3),round(55.0/255, 3),		round(41.0/255, 3), 1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_RELIC_DENG_CHINA','COLOR_PLAYER_RELIC_DENG_CHINA_ICON',   'COLOR_PLAYER_RELIC_DENG_CHINA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');	
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_RELIC_DENG_PEACE', 		'Relic_Deng_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_RELIC_DENG_WAR', 		'Relic_Deng_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_RELIC_DENG_AMBIENCE', 	'SND_AMBIENCE_COAST_BED', 					'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_RELIC_DENG_PEACE',		'SND_LEADER_MUSIC_RELIC_DENG_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_RELIC_DENG_WAR', 		'SND_LEADER_MUSIC_RELIC_DENG_WAR', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_RELIC_T59',	TileType, 	'SV_T59.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_RELIC_T59',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_RELIC_T59', 	'ART_DEF_UNIT_MEMBER_RELIC_T59',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_RELIC_T59',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_RELIC_T59',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_RELIC_T59',	Scale,	ZOffset, Domain, 'T55China.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_TANK';
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('RELIC_DENG_CHINA_ALPHA_ATLAS', 		128, 		'DengAlpha128.dds',		1,				1),
		('RELIC_DENG_CHINA_ALPHA_ATLAS', 		64, 		'DengAlpha64.dds',		1, 				1),
		('RELIC_DENG_CHINA_ALPHA_ATLAS', 		48, 		'DengAlpha48.dds',		1, 				1),
		('RELIC_DENG_CHINA_ALPHA_ATLAS', 		32, 		'DengAlpha32.dds',		1, 				1),
		('RELIC_DENG_CHINA_ALPHA_ATLAS', 		24, 		'DengAlpha24.dds',		1, 				1),
		('RELIC_DENG_CHINA_ICON_ATLAS', 		256, 		'DengAtlas256.dds',		2, 				2),
		('RELIC_DENG_CHINA_ICON_ATLAS', 		128, 		'DengAtlas128.dds',		2, 				2),
		('RELIC_DENG_CHINA_ICON_ATLAS', 		80, 		'DengAtlas80.dds',		2, 				2),
		('RELIC_DENG_CHINA_ICON_ATLAS', 		64, 		'DengAtlas64.dds',		2, 				2),
		('RELIC_DENG_CHINA_ICON_ATLAS', 		45, 		'DengAtlas45.dds',		2, 				2),
		('RELIC_DENG_CHINA_ICON_ATLAS', 		32, 		'DengAtlas32.dds',		2, 				2),
		('RELIC_DENG_CHINA_UNIT_FLAG_ATLAS',	32, 		'Tiananmen32.dds',		1, 				1);