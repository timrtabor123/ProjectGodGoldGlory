INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_ILKHANID_ILDUCHI', 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_ILKHANID_ILDUCHI', 'ART_DEF_UNIT_MEMBER_ILKHANID_ILDUCHI', 5);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_ILKHANID_ILDUCHI', 0.119999997317791, 'Knight_Turkey.fxsxml', 'ARMOR', 'ARMOR');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions, RushAttackFormation)
  VALUES ('ART_DEF_UNIT_MEMBER_ILKHANID_ILDUCHI', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 2, 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_ILKHANID_ILDUCHI', 0, 0, 'METAL', 'SWORD');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_ILKHANID_ILDUCHI', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_ILKHANID_ILDUCHI', 'Unit', 'SV_ILKHANID_ILDUCHI.dds');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 							 IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_ILKHANATE_ATLAS', 				 256, 		'tcmIconIlkhanate256.dds',			2,				2),
			('TCM_ILKHANATE_ATLAS', 				 128, 		'tcmIconIlkhanate128.dds',			2, 				2),
			('TCM_ILKHANATE_ATLAS', 				 80, 		'tcmIconIlkhanate80.dds',			2, 				2),
			('TCM_ILKHANATE_ATLAS', 				 64, 		'tcmIconIlkhanate64.dds',			2, 				2),
			('TCM_ILKHANATE_ATLAS', 				 45, 		'tcmIconIlkhanate45.dds',			2, 				2),
			('TCM_ILKHANATE_ATLAS', 				 32, 		'tcmIconIlkhanate32.dds',			2, 				2),
			('TCM_ILKHANATE_ALPHA_ATLAS',			 128, 		'tcmAlphaIlkhanate128.dds',			1,				1),
			('TCM_ILKHANATE_ALPHA_ATLAS',			 80, 		'tcmAlphaIlkhanate80.dds',			1, 				1),
			('TCM_ILKHANATE_ALPHA_ATLAS',			 64, 		'tcmAlphaIlkhanate64.dds',			1, 				1),
			('TCM_ILKHANATE_ALPHA_ATLAS',			 48, 		'tcmAlphaIlkhanate48.dds',			1, 				1),
			('TCM_ILKHANATE_ALPHA_ATLAS',			 32, 		'tcmAlphaIlkhanate32.dds',			1, 				1),
			('TCM_ILKHANATE_ALPHA_ATLAS',			 24, 		'tcmAlphaIlkhanate24.dds',			1, 				1),
			('TCM_ILKHANATE_ALPHA_ATLAS',		 	 16, 		'tcmAlphaIlkhanate16.dds',			1, 				1),
			('TCM_UNIT_FLAG_ILDUCHI_ATLAS',			 32,		'tcmIlduchiIcon32.dds',				1, 				1);
--==========================================================================================================================
--==========================================================================================================================
