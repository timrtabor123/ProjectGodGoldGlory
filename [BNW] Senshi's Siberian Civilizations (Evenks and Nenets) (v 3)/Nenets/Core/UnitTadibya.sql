--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 												Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, WorkRate, CombatLimit, OneShotTourism, OneShotTourismPercentOthers, SpreadReligion, ReligionSpreads, ReligiousStrength, MoveRate, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_TADIBYA'),				Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, WorkRate, CombatLimit, OneShotTourism, OneShotTourismPercentOthers, 1, 3, 1000, MoveRate, ('TXT_KEY_UNIT_SENSHI_TADIBYA'),	('TXT_KEY_CIV5_UNIT_SENSHI_TADIBYA_TEXT'), 	('TXT_KEY_UNIT_SENSHI_TADIBYA_HELP'), 	('TXT_KEY_UNIT_SENSHI_TADIBYA_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_TADIBYA'),  0,					('SENSHI_TADIBYA_FLAG'),	2, 				('SENSHI_NENETS_ATLAS')
FROM Units WHERE (Type = 'UNIT_MUSICIAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_TADIBYA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_TADIBYA'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSICIAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_TADIBYA', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSICIAN');