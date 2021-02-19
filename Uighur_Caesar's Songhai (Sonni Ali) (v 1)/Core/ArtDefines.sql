--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 											IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('UC_SONGHAI_ATLAS', 					256, 		'SonniAtlas256.dds',			2, 				2),
		('UC_SONGHAI_ATLAS', 					128, 		'SonniAtlas128.dds',			2, 				2),
		('UC_SONGHAI_ATLAS', 					80, 		'SonniAtlas80.dds',				2, 				2),
		('UC_SONGHAI_ATLAS', 					64, 		'SonniAtlas64.dds',				2, 				2),
		('UC_SONGHAI_ATLAS', 					45, 		'SonniAtlas45.dds',				2, 				2),
		('UC_SONGHAI_ATLAS', 					32, 		'SonniAtlas32.dds',				2, 				2),
		('UC_SONGHAI_ALPHA_ATLAS', 			128, 		'SonniAlpha128.dds',		1,				1),
		('UC_SONGHAI_ALPHA_ATLAS', 			80, 		'SonniAlpha80.dds',		1, 				1),
		('UC_SONGHAI_ALPHA_ATLAS', 			64, 		'SonniAlpha64.dds',		1, 				1),
		('UC_SONGHAI_ALPHA_ATLAS', 			48, 		'SonniAlpha48.dds',		1, 				1),
		('UC_SONGHAI_ALPHA_ATLAS', 			45, 		'SonniAlpha45.dds',		1, 				1),
		('UC_SONGHAI_ALPHA_ATLAS', 			32, 		'SonniAlpha32.dds',		1, 				1),
		('UC_SONGHAI_ALPHA_ATLAS', 			24, 		'SonniAlpha24.dds',		1, 				1),
		('UC_SONGHAI_ALPHA_ATLAS', 			16, 		'SonniAlpha16.dds',		1, 				1),
		('UC_HI_KOI_ATLAS', 				32, 		'unitflag_er_songhai_hi_koi.dds',		1, 				1);
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 							TileType,	Asset)
VALUES		('ART_DEF_UNIT_UC_HI_KOI', 			'Unit', 	'SV_er_songhai_hi_koi.dds');
------------------------------	
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_UC_HI_KOI'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GREAT_ADMIRAL');
------------------------------	
-- ArtDefine_UnitInfoMemberInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_UC_HI_KOI'),		('ART_DEF_UNIT_MEMBER_UC_HI_KOI'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GREAT_ADMIRAL');
------------------------------	
-- ArtDefine_UnitMemberCombats
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_UC_HI_KOI'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL');
------------------------------	
-- ArtDefine_UnitMemberCombatWeapons
------------------------------		
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_UC_HI_KOI'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL');
------------------------------	
-- ArtDefine_UnitMemberInfos
------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 									MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_UC_HI_KOI'),		Scale, ZOffset, Domain, ('er_songhai_hi_koi.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL');
------------------------------
-- ColorsSV_er_songhai_hi_koi.dds
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_UC_SONGHAI_ICON', 		0.89,	0.62,	0.212,	1),
		('COLOR_PLAYER_UC_SONGHAI_BACKGROUND',	0.38,	0.176,	0.0,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 											PrimaryColor, 									SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_UC_SONGHAI',			'COLOR_PLAYER_UC_SONGHAI_ICON', 	'COLOR_PLAYER_UC_SONGHAI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_UC_SONNI_ALI_PEACE', 	'Sonni_Peace',		'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_UC_SONNI_ALI_PEACE', 'SND_LEADER_MUSIC_UC_SONNI_ALI_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0);