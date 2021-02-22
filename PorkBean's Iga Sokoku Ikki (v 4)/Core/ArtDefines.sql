-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
		  (Type,                                            Red,     Green,    Blue,     Alpha)
VALUES	  ('COLOR_PLAYER_PB_IGA_ICON',			 0.6666666666666666,   0.7137254901960784,    0.9490196078431372, 1),
		  ('COLOR_PLAYER_PB_IGA_BACKGROUND',       0.011764705882352941,   0.03137254901960784,    0.25098039215686274,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_PB_IGA',        'COLOR_PLAYER_PB_IGA_ICON',     'COLOR_PLAYER_PB_IGA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');


-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,						IconSize,	Filename,					IconsPerRow,	IconsPerColumn)
VALUES
('PB_IGA_ALPHA_ATLAS',		128,		'Iga_Alpha_128.dds',		1,				1),
('PB_IGA_ALPHA_ATLAS',		80,			'Iga_Alpha_80.dds',			1,				1),
('PB_IGA_ALPHA_ATLAS',		64,			'Iga_Alpha_64.dds',			1,				1),
('PB_IGA_ALPHA_ATLAS',		48,			'Iga_Alpha_48.dds',			1,				1),
('PB_IGA_ALPHA_ATLAS',		32,			'Iga_Alpha_32.dds',			1,				1),
('PB_IGA_ALPHA_ATLAS',		24,			'Iga_Alpha_24.dds',			1,				1),
('PB_IGA_ALPHA_ATLAS',		16,			'Iga_Alpha_16.dds',			1,				1),

('PB_IGA_ICON_ATLAS', 		256, 		'Iga_Atlas_256.dds',		2, 				2),
('PB_IGA_ICON_ATLAS', 		128, 		'Iga_Atlas_128.dds',		2, 				2),
('PB_IGA_ICON_ATLAS', 		80, 		'Iga_Atlas_80.dds',			2, 				2),
('PB_IGA_ICON_ATLAS', 		64, 		'Iga_Atlas_64.dds',			2, 				2),
('PB_IGA_ICON_ATLAS', 		45, 		'Iga_Atlas_45.dds',			2, 				2),
('PB_IGA_ICON_ATLAS', 		32, 		'Iga_Atlas_32.dds',			2, 				2),
    
('PB_IGA_NINJA_FLAG',		32,			'flag_ninja.dds',			1,				1),
('ACTION_PB_KAKUREZATO',	64,			'Kakurezato_Flag64.dds',	1,				1),
('ACTION_PB_KAKUREZATO',	45,			'Kakurezato_Flag45.dds',	1,				1);

--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID,										Filename,			LoadType)
VALUES	('SND_LEADER_MUSIC_PB_MOMOCHI_TAMBA_PEACE',		'MomochiPeace',		'DynamicResident'),
		('SND_LEADER_MUSIC_PB_MOMOCHI_TAMBA_WAR',		'MomochiWar',		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_PB_MOMOCHI_TAMBA_PEACE', 		'SND_LEADER_MUSIC_PB_MOMOCHI_TAMBA_PEACE', 	'GAME_MUSIC', 	-1.0,		80, 		80, 		1, 		 0),
		('AS2D_LEADER_MUSIC_PB_MOMOCHI_TAMBA_WAR', 		'SND_LEADER_MUSIC_PB_MOMOCHI_TAMBA_WAR', 		'GAME_MUSIC', 	-1.0,		80, 		80, 		1,		 0),
		('AS2D_AMBIENCE_LEADER_PB_MOMOCHI_TAMBA_AMBIENCE', 		'SND_AMBIENCE_FOREST_BED', 				'GAME_SFX', 	-1.0,		60, 		60, 		0,		 1);

--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,			TileType,		Asset)
VALUES	('ART_DEF_UNIT_PB_NINJA',	'Unit', 		'ninja_sv.dds');

------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_PB_NINJA'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_CROSSBOWMAN');

------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_PB_NINJA'), ('ART_DEF_UNIT_MEMBER_PB_NINJA'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CROSSBOWMAN');

------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_PB_NINJA'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN');

------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_PB_NINJA'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN');

------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_PB_NINJA'), Scale, ZOffset, Domain, ('Ninja_Japan.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN');

--==========================================================================================================================
-- Update Iga Art
--==========================================================================================================================
UPDATE Civilizations SET ArtStyleSuffix = "_IGA_SAMURAI" WHERE Type = 'CIVILIZATION_PB_IGA';
INSERT OR REPLACE INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	REPLACE("Type", '_ASIA', '_IGA_SAMURAI'), "DamageStates", "Formation"
	FROM "ArtDefine_UnitInfos" WHERE Type LIKE '%_ASIA';
INSERT OR REPLACE INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	SELECT	REPLACE("UnitInfoType", '_ASIA', '_IGA_SAMURAI'), "UnitMemberInfoType", "NumMembers"
	FROM "ArtDefine_UnitInfoMemberInfos" WHERE UnitInfoType LIKE '%_ASIA';

---------------
-- Longswordsman
---------------
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_LONGSWORDSMAN';

INSERT OR REPLACE INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	("ART_DEF_UNIT_LONGSWORDSMAN_IGA_SAMURAI"), "DamageStates", "Samurai"
	FROM "ArtDefine_UnitInfos" WHERE (Type = "ART_DEF_UNIT_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	SELECT	("ART_DEF_UNIT_LONGSWORDSMAN_IGA_SAMURAI"), ("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_IGA_SAMURAI"), 12
	FROM "ArtDefine_UnitInfoMemberInfos" WHERE (UnitInfoType = "ART_DEF_UNIT_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberCombats" ('UnitMemberType', 'EnableActions', 'DisableActions', 'MoveRadius', 'ShortMoveRadius', 'ChargeRadius', 'AttackRadius', 'RangedAttackRadius', 'MoveRate', 'ShortMoveRate', 'TurnRateMin', 'TurnRateMax', 'TurnFacingRateMin', 'TurnFacingRateMax', 'RollRateMin', 'RollRateMax', 'PitchRateMin', 'PitchRateMax', 'LOSRadiusScale', 'TargetRadius', 'TargetHeight', 'HasShortRangedAttack', 'HasLongRangedAttack', 'HasLeftRightAttack', 'HasStationaryMelee', 'HasStationaryRangedAttack', 'HasRefaceAfterCombat', 'ReformBeforeCombat', 'HasIndependentWeaponFacing', 'HasOpponentTracking', 'HasCollisionAttack', 'AttackAltitude', 'AltitudeDecelerationDistance', 'OnlyTurnInMovementActions', 'RushAttackFormation')
	SELECT	("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_IGA_SAMURAI"), "EnableActions", "DisableActions", "MoveRadius", "ShortMoveRadius", "ChargeRadius", "AttackRadius", "RangedAttackRadius", 
			"MoveRate", "ShortMoveRate", "TurnRateMin", "TurnRateMax", "TurnFacingRateMin", "TurnFacingRateMax", "RollRateMin", "RollRateMax", "PitchRateMin", "PitchRateMax", "LOSRadiusScale", "TargetRadius", "TargetHeight", "HasShortRangedAttack", "HasLongRangedAttack", "HasLeftRightAttack", "HasStationaryMelee", "HasStationaryRangedAttack", "HasRefaceAfterCombat", "ReformBeforeCombat", "HasIndependentWeaponFacing", "HasOpponentTracking", "HasCollisionAttack", "AttackAltitude", "AltitudeDecelerationDistance", "OnlyTurnInMovementActions", "RushAttackFormation"
	FROM "ArtDefine_UnitMemberCombats" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberCombatWeapons" ('UnitMemberType', 'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
	SELECT ("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_IGA_SAMURAI"), "Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberCombatWeapons" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberInfos" ("Type", "Scale", "ZOffset", "Domain", "Model", "MaterialTypeTag", "MaterialTypeSoundOverrideTag")
	SELECT	("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_IGA_SAMURAI"), 0.140000000596046, "ZOffset", "Domain", 
			("Art/Samurai/u_iga_samurai.fxsxml"), "MaterialTypeTag", "MaterialTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberInfos" WHERE (Type = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");

--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_PB_KAKUREZATO', 'Improvement', 'PB_KAKUREZATO';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.8, 'ART_DEF_IMPROVEMENT_PB_KAKUREZATO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Kakurezato_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.8, 'ART_DEF_IMPROVEMENT_PB_KAKUREZATO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Kakurezato_01.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.8, 'ART_DEF_IMPROVEMENT_PB_KAKUREZATO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Kakurezato_pl.fxsxml', 1;

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_PB_KAKUREZATO', 'Improvement', 'SV_Kakurezato.dds';

--==========================================================================================================================
-- MUSIC
--==========================================================================================================================
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 							LoadType)
VALUES	('SND_BIRTH_PB_NINJA',				'NinjaBirth',					'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID,					SoundID,				SoundType, 		TaperSoundtrackVolume,	DontTriggerDuplicates,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_BIRTH_PB_NINJA',		'SND_BIRTH_PB_NINJA',	'GAME_SFX', 	-1.0,					1,						100, 		100, 		0, 		 0);