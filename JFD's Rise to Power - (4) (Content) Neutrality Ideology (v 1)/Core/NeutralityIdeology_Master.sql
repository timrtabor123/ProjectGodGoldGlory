--=======================================================================================================================
-- CUSTOM MOD OPTIONS
--=======================================================================================================================
-- CustomModOptions
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_IDEOLOGIES', 1);
--==========================================================================================================================
--==========================================================================================================================