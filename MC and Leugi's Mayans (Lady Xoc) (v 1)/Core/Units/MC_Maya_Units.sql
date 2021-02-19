--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,						Class, Cost, Range, PrereqTech,	Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 								Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  MoveRate,	UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_MAYAN_HADZAB'),	Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_MAYAN_HADZAB'),	('TXT_KEY_UNIT_MC_MAYAN_HADZAB_PEDIA'), 	('TXT_KEY_UNIT_MC_MAYAN_HADZAB_HELP'), 	('TXT_KEY_UNIT_MC_MAYAN_HADZAB_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_MAYAN_HADZAB'), MoveRate,	0,					('MC_MAYAN_HADZAB_FLAG'),	2, 				('MC_MAYA_ATLAS')
FROM Units WHERE (Type = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 					UnitAIType)
SELECT		('UNIT_MC_MAYAN_HADZAB'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 					UnitClassType)
SELECT		('UNIT_MC_MAYAN_HADZAB'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,					FlavorType, Flavor)
SELECT		('UNIT_MC_MAYAN_HADZAB'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_MC_MAYAN_HADZAB',	'PROMOTION_WOODSMAN');

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 										SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_MAYAN_HADZAB'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');
--==========================================================================================================================
--==========================================================================================================================
