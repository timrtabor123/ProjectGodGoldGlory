--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Calusa_Decisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 										Description) 
VALUES		('POLICY_DECISIONS_CALUSACANAL',	 	    'TXT_KEY_DECISIONS_CALUSACANAL'),
			('POLICY_DECISIONS_CALUSASALVAGE',	 		'TXT_KEY_DECISIONS_CALUSASALVAGE');
--==========================================================================================================================
-- Policy_FreePromotions
--==========================================================================================================================
INSERT INTO Policy_FreePromotions 
			(PolicyType, 							PromotionType) 
VALUES 		('POLICY_DECISIONS_CALUSACANAL', 		'PROMOTION_DECISIONS_CALUSACANAL'),
	 		('POLICY_DECISIONS_CALUSASALVAGE', 		'PROMOTION_DECISIONS_CALUSASALVAGE');
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 								BuildingClass, 					Description,										Help,											GreatWorkCount,	Cost,	FaithCost,	PrereqTech, 	NeverCapture)
VALUES		('BUILDING_DECISIONS_CALUSACANAL', 	'BUILDINGCLASS_MC_CALUSA',		'TXT_KEY_DECISIONS_CALUSACANAL',					'TXT_KEY_BUILDING_DECISIONS_CALUSACANAL_HELP',	-1, 			-1,   		-1,		null,			1);
--==========================================================================================================================	
-- Building_FeatureYieldChanges
--==========================================================================================================================	
INSERT INTO Building_FeatureYieldChanges
			(BuildingType, 							FeatureType,		YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_CALUSACANAL',		'FEATURE_MARSH',	'YIELD_PRODUCTION',		1);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
			(Type, 											Description, 												Help, 												CannotBeChosen, 		Sound, 				PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_DECISIONS_CALUSASALVAGE', 			'TXT_KEY_PROMOTION_DECISIONS_CALUSASALVAGE_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_CALUSASALVAGE_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_CALUSASALVAGE_DESC'),
			('PROMOTION_DECISIONS_CALUSACANAL', 			'TXT_KEY_PROMOTION_DECISIONS_CALUSACANAL_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_CALUSACANAL_HELP',		1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_CALUSACANAL_DESC');
--==========================================================================================================================
-- UnitPromotions_Features
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions_Features		
			(PromotionType, 						FeatureType, 		DoubleMove, Attack, Defense)
VALUES		('PROMOTION_DECISIONS_CALUSACANAL', 	'FEATURE_MARSH', 	1, 			0, 		0),
			('PROMOTION_DECISIONS_CALUSASALVAGE', 	'FEATURE_MARSH', 	0, 			33, 	33);
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 							UnitCombatType)
VALUES		('PROMOTION_DECISIONS_CALUSACANAL', 		'UNITCOMBAT_RECON'),
			('PROMOTION_DECISIONS_CALUSACANAL', 		'UNITCOMBAT_ARCHER'),
			('PROMOTION_DECISIONS_CALUSACANAL', 		'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DECISIONS_CALUSACANAL', 		'UNITCOMBAT_MELEE'),
			('PROMOTION_DECISIONS_CALUSACANAL', 		'UNITCOMBAT_SIEGE'),
			('PROMOTION_DECISIONS_CALUSACANAL', 		'UNITCOMBAT_GUN'),
			('PROMOTION_DECISIONS_CALUSACANAL', 		'UNITCOMBAT_ARMOR');

INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 							UnitCombatType)
VALUES		('PROMOTION_DECISIONS_CALUSASALVAGE', 		'UNITCOMBAT_RECON'),
			('PROMOTION_DECISIONS_CALUSASALVAGE', 		'UNITCOMBAT_ARCHER'),
			('PROMOTION_DECISIONS_CALUSASALVAGE', 		'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DECISIONS_CALUSASALVAGE', 		'UNITCOMBAT_MELEE'),
			('PROMOTION_DECISIONS_CALUSASALVAGE', 		'UNITCOMBAT_SIEGE'),
			('PROMOTION_DECISIONS_CALUSASALVAGE', 		'UNITCOMBAT_GUN'),
			('PROMOTION_DECISIONS_CALUSASALVAGE', 		'UNITCOMBAT_ARMOR');
--==========================================================================================================================
-- UnitPromotions_CivilianUnitType
--==========================================================================================================================
INSERT INTO UnitPromotions_CivilianUnitType 	
			(UnitType, 		PromotionType)
SELECT		 Type, 		('PROMOTION_DECISIONS_CALUSACANAL')
FROM Units WHERE (CombatLimit < 1);
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_DECISIONS_CALUSACANAL',
		'Initiate Canal Construction'
	),
	(
		'TXT_KEY_DECISIONS_CALUSACANAL_DESC',
		'Roads do not work as well as they might elsewhere due to our marsh covered lands; they are dangerous and horrible for the transportation of goods. Yet, these same lands would be perfect for canals, which, with our canoes would be a much more efficient mode of transport. Let us authorise their construction.[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be Calusa
		[NEWLINE][ICON_BULLET]Must have researched Masonry
		[NEWLINE][ICON_BULLET]Must have researched The Wheel
		[NEWLINE][ICON_BULLET]Must have a City located on Marsh
		[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]1 [ICON_MAGISTRATES] Magistrates
		[NEWLINE][ICON_BULLET]{1_Num} [ICON_GOLD] Gold
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] from Marsh
		[NEWLINE][ICON_BULLET]Double movement rate through Marshes
		[NEWLINE][ICON_BULLET]Workers may create Marshes by building roads on Open Terrain.'
	),
	(
		'TXT_KEY_DECISIONS_CALUSACANAL_ENACTED_DESC',
		'Roads do not work as well as they might elsewhere due to our marsh covered lands; they are dangerous and horrible for the transportation of goods. Yet, these same lands would be perfect for canals, which, with our canoes would be a much more efficient mode of transport. Let us authorise their construction.[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] from Marsh
		[NEWLINE][ICON_BULLET]Double movement rate through Marshes
		[NEWLINE][ICON_BULLET]Workers may create Marshes by building roads on Open Terrain.'
	),
	(
		'TXT_KEY_PROMOTION_DECISIONS_CALUSACANAL_DESC',
		'Canal Network'
	),
	(
		'TXT_KEY_PROMOTION_DECISIONS_CALUSACANAL_HELP',
		'Double movement rate through Marsh'
	),
	(
		'TXT_KEY_BUILDING_DECISIONS_CALUSACANAL_HELP',
		'+1 [ICON_PRODUCTION] from Marsh'
	),
	(
		'TXT_KEY_DECISIONS_CALUSASALVAGE',
		'Begin Salvage Operations'
	),
	(
		'TXT_KEY_DECISIONS_CALUSASALVAGE_DESC',
		'The seas are full of hidden treasures. Cargo from ships all nations have been lost to the treacherous oceans. Let us sieze these riches for our own; using this opportunity to accustom our men to working in the seas and marshes.[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be Calusa
		[NEWLINE][ICON_BULLET]Player must have a Coastal City
		[NEWLINE][ICON_BULLET]Must have researched Astronomy
		[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]{1_Num} [ICON_CULTURE] Culture
		[NEWLINE][ICON_BULLET]1 [ICON_MAGISTRATES] Magistrates
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Gain [ICON_GOLD] Gold whenever a Naval Unit is killed in combat in your territory
		[NEWLINE][ICON_BULLET]+33% [ICON_STRENGTH] Combat Strength when fighting in Marshes'
	),
	(
		'TXT_KEY_DECISIONS_CALUSASALVAGE_ENACTED_DESC',
		
		'The seas are full of hidden treasures. Cargo from ships all nations have been lost to the treacherous oceans. Let us sieze these riches for our own; using this opportunity to accustom our men to working in the seas and marshes.[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Gain [ICON_GOLD] Gold whenever a Naval Unit is killed in combat in your territory
		[NEWLINE][ICON_BULLET]+33% [ICON_STRENGTH] Combat Strength when fighting in Marshes'
	),
	(
		'TXT_KEY_PROMOTION_DECISIONS_CALUSASALVAGE_DESC',
		'Salvage Worker'
	),
	(
		'TXT_KEY_PROMOTION_DECISIONS_CALUSASALVAGE_HELP',
		'+33% [ICON_STRENGTH] Combat Strength when fighting in Marshes'
	),
	(
		'TXT_KEY_DECISIONS_CALUSASALVAGE_NOTIFICATION',
		'You have gained {1_Num} [ICON_GOLD] Gold from salvaging shipwrecks.'
	);
--==========================================================================================================================
--==========================================================================================================================