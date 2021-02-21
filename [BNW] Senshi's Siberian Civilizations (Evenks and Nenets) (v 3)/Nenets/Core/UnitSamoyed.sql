--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 												Class, Cost, WorkRate, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_SAMOYED'),		Class, Cost, 100, Range, ('TECH_ANIMAL_HUSBANDRY'), 9, RangedCombat, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_SAMOYED'),	('TXT_KEY_CIV5_UNIT_SENSHI_SAMOYED_TEXT'), 	('TXT_KEY_UNIT_SENSHI_SAMOYED_HELP'), 	('TXT_KEY_UNIT_SENSHI_SAMOYED_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_SAMOYED'),  0,					('SENSHI_SAMOYED_FLAG'),	3, 				('SENSHI_NENETS_ATLAS')
FROM Units WHERE (Type = 'UNIT_HORSEMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_SAMOYED'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_HORSEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_SAMOYED'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_HORSEMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_SAMOYED'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_HORSEMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_SAMOYED', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_HORSEMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_SAMOYED',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_HORSEMAN');
--==========================================================================================================================
--==========================================================================================================================
INSERT INTO Builds
        (Type,                    Description,    Help, Recommendation, HotKey, HotKeyPriority,    OrderPriority, ImprovementType, EntityEvent,    IconIndex, IconAtlas, ShowInPedia,     ShowInTechTree, Time,     Kill)
SELECT    'BUILD_SENSHI_CAMP',    Description,    Help, Recommendation, HotKey, 1,                 OrderPriority, ImprovementType,    EntityEvent,    IconIndex, IconAtlas, 0,            0,                null,    1
FROM Builds WHERE Type = 'BUILD_CAMP';

INSERT INTO Builds
        (Type,                    Description,    Help, Recommendation, HotKey, HotKeyPriority,    OrderPriority, ImprovementType, EntityEvent,    IconIndex, IconAtlas, ShowInPedia,     ShowInTechTree, Time,     Kill)
SELECT    'BUILD_SENSHI_POST',    Description,    Help, Recommendation, HotKey, 1,                 OrderPriority, ImprovementType,    EntityEvent,    IconIndex, IconAtlas, 0,            0,                null,    1
FROM Builds WHERE Type = 'BUILD_TRADING_POST';