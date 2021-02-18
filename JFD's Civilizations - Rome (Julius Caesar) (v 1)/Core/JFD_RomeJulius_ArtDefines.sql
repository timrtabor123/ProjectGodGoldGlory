--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_PRAETORIAN', 	'Unit', 		'sv_Praetorian.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_PRAETORIAN', 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_PRAETORIAN', 		'ART_DEF_UNIT_MEMBER_JFD_PRAETORIAN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_PRAETORIAN',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_PRAETORIAN',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 						 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_PRAETORIAN',	Scale, ZOffset, Domain, 'Longswordsman_Rome.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 								LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_JULIUS_PEACE', 	'JFD_Julius_Peace',						'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_JULIUS_WAR', 	'JFD_Julius_War', 						'DynamicResident');			
--------------------------------------------------------------------------------------------------------------------------	
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_JULIUS_PEACE', 	'SND_LEADER_MUSIC_JFD_JULIUS_PEACE',	'GAME_MUSIC', 	50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_JULIUS_WAR', 	'SND_LEADER_MUSIC_JFD_JULIUS_WAR',		'GAME_MUSIC', 	50, 		50, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_ROME_JULIUS_ICON', 			0.698,	0.545,	0.219,	1),
		('COLOR_PLAYER_JFD_ROME_JULIUS_BACKGROUND', 	0.470,	0.050,	0.050,	1);
--------------------------------------------------------------------------------------------------------------------------	
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_ROME_JULIUS',	'COLOR_PLAYER_JFD_ROME_JULIUS_ICON', 	'COLOR_PLAYER_JFD_ROME_JULIUS_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_CHECKBOX',			'FontIcons_CheckBox_22');		
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
VALUES	('ICON_CHECKBOX',			'ICON_FONT_TEXTURE_CHECKBOX',			1),
		('ICON_UNCHECKBOX',			'ICON_FONT_TEXTURE_CHECKBOX',			2);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_ROME_JULIUS_ATLAS', 			256, 		'JFD_RomeJulius_IconAtlas_256.dds',		3, 				2),
		('JFD_ROME_JULIUS_ATLAS', 			128, 		'JFD_RomeJulius_IconAtlas_128.dds',		3, 				2),
		('JFD_ROME_JULIUS_ATLAS', 			80, 		'JFD_RomeJulius_IconAtlas_80.dds',		3, 				2),
		('JFD_ROME_JULIUS_ATLAS', 			64, 		'JFD_RomeJulius_IconAtlas_64.dds',		3, 				2),
		('JFD_ROME_JULIUS_ATLAS', 			45, 		'JFD_RomeJulius_IconAtlas_45.dds',		3, 				2),
		('JFD_ROME_JULIUS_ATLAS', 			32, 		'JFD_RomeJulius_IconAtlas_32.dds',		3, 				2),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	128, 		'JFD_RomeJulius_AlphaAtlas_128.dds',	1, 				1),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	80, 		'JFD_RomeJulius_AlphaAtlas_80.dds',		1, 				1),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	64, 		'JFD_RomeJulius_AlphaAtlas_64.dds',		1, 				1),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	48, 		'JFD_RomeJulius_AlphaAtlas_48.dds',		1, 				1),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	45, 		'JFD_RomeJulius_AlphaAtlas_45.dds',		1, 				1),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	32, 		'JFD_RomeJulius_AlphaAtlas_32.dds',		1, 				1),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	24, 		'JFD_RomeJulius_AlphaAtlas_24.dds',		1, 				1),
		('JFD_ROME_JULIUS_ALPHA_ATLAS', 	16, 		'JFD_RomeJulius_AlphaAtlas_16.dds',		1, 				1),
		('JFD_ROME_JULIUS_FLAG_ATLAS', 		32, 		'JFD_RomeJulius_UnitFlagAtlas_32.dds',	1, 				1),
		('JFD_ROME_JULIUS_PROMOTION_ATLAS',	256, 	    'Tomatekh_PromotionAtlas_256.dds',		2, 				1),
		('JFD_ROME_JULIUS_PROMOTION_ATLAS',	64, 	    'Tomatekh_PromotionAtlas_64.dds',		2, 				1),
		('JFD_ROME_JULIUS_PROMOTION_ATLAS',	45, 	    'Tomatekh_PromotionAtlas_45.dds',		2, 				1),
		('JFD_ROME_JULIUS_PROMOTION_ATLAS',	32, 	    'Tomatekh_PromotionAtlas_32.dds',		2, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
