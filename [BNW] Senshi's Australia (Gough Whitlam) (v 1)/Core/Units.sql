--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 									Class, Cost, Range, AirInterceptRange, PrereqTech, RangedCombat, Moves, MoveRate, Immobile, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Special, Domain, Pillage, CombatLimit, RangedCombatLimit, IgnoreBuildingDefense, Mechanized, AirUnitCap, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_GAF_NOMAD'),		Class, Cost, Range, AirInterceptRange, PrereqTech, RangedCombat-7, Moves, MoveRate, Immobile, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Special,	Domain, Pillage, CombatLimit, RangedCombatLimit, IgnoreBuildingDefense, Mechanized, AirUnitCap, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_GAF_NOMAD'),	('TXT_KEY_CIV5_UNIT_SENSHI_GAF_NOMAD_TEXT'), 	('TXT_KEY_UNIT_SENSHI_GAF_NOMAD_HELP'), 	('TXT_KEY_UNIT_SENSHI_GAF_NOMAD_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_GAF_NOMAD'),  0,					('SENSHI_GAF_NOMAD_FLAG'),	2, 				('SENSHI_WHITLAM_ATLAS')
FROM Units WHERE (Type = 'UNIT_FIGHTER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_GAF_NOMAD'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_GAF_NOMAD'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_GAF_NOMAD'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_SENSHI_GAF_NOMAD'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 				ResourceType)
SELECT		('UNIT_SENSHI_GAF_NOMAD'),		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		('UNIT_SENSHI_GAF_NOMAD'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_SENSHI_GAF_NOMAD',	'PROMOTION_MEDIC'),
			('UNIT_SENSHI_GAF_NOMAD',	'PROMOTION_MEDIC_II');
--==========================================================================================================================
--==========================================================================================================================
