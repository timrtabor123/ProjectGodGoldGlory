--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================	
-- USER SETTINGS
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,									Value)
VALUES	('JFD_CIVILIZATIONS_ROME_DISABLE',		0), -- Disables Augustus's Rome.
		('JFD_CIVILIZATIONS_ROME_UA_CHANGE',	1), -- Changes to Augustus's UA.
		('JFD_UNITS_BALLISTA_CHANGE',			1), -- Changes to the Ballista.
		('JFD_UNITS_LEGION_CHANGE',				1); -- Changes to the Legion.
--==========================================================================================================================	
--==========================================================================================================================	