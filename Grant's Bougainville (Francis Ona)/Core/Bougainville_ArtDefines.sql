--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_GT_MEKEMAUI_DEFENCE_FORCE', 	'Unit', 	'sv_Mekemaui.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_GT_MEKEMAUI_DEFENCE_FORCE'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MARINE');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,										NumMembers)
SELECT	('ART_DEF_UNIT_GT_MEKEMAUI_DEFENCE_FORCE'),	('ART_DEF_UNIT_MEMBER_GT_MEKEMAUI_DEFENCE_FORCE'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MARINE');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_GT_MEKEMAUI_DEFENCE_FORCE'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_GT_MEKEMAUI_DEFENCE_FORCE'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale,  ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_GT_MEKEMAUI_DEFENCE_FORCE'),	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_MARINE');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_GT_FRANCIS_ONA_PEACE', 	'Bougainville_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_GT_FRANCIS_ONA_WAR', 		'Bougainville_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GT_FRANCIS_ONA_PEACE',	'SND_LEADER_MUSIC_GT_FRANCIS_ONA_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GT_FRANCIS_ONA_WAR', 	'SND_LEADER_MUSIC_GT_FRANCIS_ONA_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GT_BOUGAINVILLE_ICON',				0.471,	1,	0.855,	1),
		('COLOR_PLAYER_GT_BOUGAINVILLE_BACKGROUND',		0.161,	0.02,	0.02,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES	('PLAYERCOLOR_GT_BOUGAINVILLE',	'COLOR_PLAYER_GT_BOUGAINVILLE_ICON', 	'COLOR_PLAYER_GT_BOUGAINVILLE_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('GT_BOUGAINVILLE_ATLAS', 						256, 		'BougainvilleAtlas256.dds',				2, 				2),
		('GT_BOUGAINVILLE_ATLAS', 						128, 		'BougainvilleAtlas128.dds',				2, 				2),
		('GT_BOUGAINVILLE_ATLAS', 						80, 		'BougainvilleAtlas80.dds',				2, 				2),
		('GT_BOUGAINVILLE_ATLAS', 						64, 		'BougainvilleAtlas64.dds',				2, 				2),
		('GT_BOUGAINVILLE_ATLAS', 						45, 		'BougainvilleAtlas45.dds',				2, 				2),
		('GT_BOUGAINVILLE_ATLAS', 						32, 		'BougainvilleAtlas32.dds',				2, 				2),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					128, 		'BougainvilleAlpha128.dds',			1,				1),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					80, 		'BougainvilleAlpha80.dds',			1, 				1),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					64, 		'BougainvilleAlpha64.dds',			1, 				1),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					48, 		'BougainvilleAlpha48.dds',			1, 				1),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					45, 		'BougainvilleAlpha45.dds',			1, 				1),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					32, 		'BougainvilleAlpha32.dds',			1, 				1),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					24, 		'BougainvilleAlpha24.dds',			1, 				1),
		('GT_BOUGAINVILLE_ALPHA_ATLAS', 					16, 		'BougainvilleAlpha16.dds',			1, 				1),
		('GT_MEKEMAUI_DEFENCE_FORCE_FLAG_ATLAS', 				32, 		'Mekemaui_flag.dds',				1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	