--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_GRAND_CARRACK',	'Unit', 	'sv_SeaDog.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GRAND_CARRACK', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_PORTUGUESE_CARRACK'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_GRAND_CARRACK', 	'ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_PORTUGUESE_CARRACK';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK',	0.17,  ZOffset, Domain, 'u_british_carrack.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_ENGLAND_HENRY_VIII_PEACE', 	'JFD_EnglandHenryVIII_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_ENGLAND_HENRY_VIII_WAR', 	'JFD_EnglandHenryVIII_War', 	'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_ENGLAND_HENRY_VIII_PEACE',	'SND_LEADER_MUSIC_JFD_ENGLAND_HENRY_VIII_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_ENGLAND_HENRY_VIII_WAR', 	'SND_LEADER_MUSIC_JFD_ENGLAND_HENRY_VIII_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_JFD_ENGLAND_HENRY_VIII_ICON', 		0.854,	0.870,	0.588,	1),
		('COLOR_PLAYER_JFD_ENGLAND_HENRY_VIII_BACKGROUND', 	0.274,	0.462,	0.137,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_ENGLAND_HENRY_VIII',	'COLOR_PLAYER_JFD_ENGLAND_HENRY_VIII_ICON',	'COLOR_PLAYER_JFD_ENGLAND_HENRY_VIII_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		128, 		'JFD_EnglandHenryVIII_AlphaAtlas_128.dds',		1,				1),
		('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		80, 		'JFD_EnglandHenryVIII_AlphaAtlas_80.dds',		1, 				1),
		('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		64, 		'JFD_EnglandHenryVIII_AlphaAtlas_64.dds',		1, 				1),
		('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		48, 		'JFD_EnglandHenryVIII_AlphaAtlas_48.dds',		1, 				1),
		('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		45, 		'JFD_EnglandHenryVIII_AlphaAtlas_45.dds',		1, 				1),
		('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		32, 		'JFD_EnglandHenryVIII_AlphaAtlas_32.dds',		1, 				1),
		('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		24, 		'JFD_EnglandHenryVIII_AlphaAtlas_24.dds',		1, 				1),
		('JFD_ENGLAND_HENRY_VIII_ALPHA_ATLAS',		16, 		'JFD_EnglandHenryVIII_AlphaAtlas_16.dds',		1, 				1),
		('JFD_ENGLAND_HENRY_VIII_ICON_ATLAS', 		256, 		'JFD_EnglandHenryVIII_IconAtlas_256.dds',		2, 				2),
		('JFD_ENGLAND_HENRY_VIII_ICON_ATLAS', 		128, 		'JFD_EnglandHenryVIII_IconAtlas_128.dds',		2, 				2),
		('JFD_ENGLAND_HENRY_VIII_ICON_ATLAS', 		80, 		'JFD_EnglandHenryVIII_IconAtlas_80.dds',		2, 				2),
		('JFD_ENGLAND_HENRY_VIII_ICON_ATLAS', 		64, 		'JFD_EnglandHenryVIII_IconAtlas_64.dds',		2, 				2),
		('JFD_ENGLAND_HENRY_VIII_ICON_ATLAS', 		45, 		'JFD_EnglandHenryVIII_IconAtlas_45.dds',		2, 				2),
		('JFD_ENGLAND_HENRY_VIII_ICON_ATLAS', 		32, 		'JFD_EnglandHenryVIII_IconAtlas_32.dds',		2, 				2),
		('JFD_ENGLAND_HENRY_VIII_UNIT_FLAG_ATLAS', 	32, 		'JFD_EnglandHenryVIII_UnitFlagAtlas_32.dds',	1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
