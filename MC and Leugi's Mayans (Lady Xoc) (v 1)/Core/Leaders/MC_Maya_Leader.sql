--==========================================================================================================================	
-- Leaders
--==========================================================================================================================				
INSERT INTO Leaders
			(Type, 					Description, 						Civilopedia, 						CivilopediaTag,				 	ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_MC_LADY_XOC',	'TXT_KEY_LEADER_MC_LADY_XOC_DESC',	'TXT_KEY_LEADER_MC_LADY_XOC_PEDIA',	'TXT_KEY_LEADER_MC_LADY_XOC',	'MC_MAYA_Leaderscene.xml',	6,						7,						5,							5,			6,				5,				5,						6,				6,			6,			5,				7,			6,			'MC_MAYA_ATLAS',		1);

--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================				
INSERT INTO Diplomacy_Responses
			(LeaderType,				ResponseType,				Response)
VALUES		('LEADER_MC_LADY_XOC',		'RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_MC_LADY_XOC_FIRSTGREETING_%'),
			('LEADER_MC_LADY_XOC',		'RESPONSE_DEFEATED',		'TXT_KEY_LEADER_MC_LADY_XOC_DEFEATED_%');
			
--==========================================================================================================================	
-- Traits
--==========================================================================================================================				
INSERT INTO Traits
			(Type,						Description,						ShortDescription)
VALUES		('TRAIT_MC_SACRED_CENOTES',	'TXT_KEY_TRAIT_MC_SACRED_CENOTES',	'TXT_KEY_TRAIT_MC_SACRED_CENOTES_SHORT');

--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================				
INSERT INTO Leader_Traits
			(LeaderType,				TraitType)
VALUES		('LEADER_MC_LADY_XOC',		'TRAIT_MC_SACRED_CENOTES');

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================				
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_LADY_XOC', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_MC_LADY_XOC', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_MC_LADY_XOC', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_MC_LADY_XOC', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_MC_LADY_XOC', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_MC_LADY_XOC', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_MC_LADY_XOC', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_LADY_XOC', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_MC_LADY_XOC', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_MC_LADY_XOC', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_MC_LADY_XOC', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_MC_LADY_XOC', 	'MINOR_CIV_APPROACH_BULLY', 		4);

--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================	
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_MC_LADY_XOC', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_RECON', 					6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_RANGED', 					6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_MOBILE', 					3),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_NAVAL', 					4),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_AIR', 						6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_GROWTH', 					7),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_GOLD', 						5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_CULTURE', 					6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_WONDER', 					6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_RELIGION', 					6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_SPACESHIP', 				8),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_NUKE', 						6),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_USE_NUKE', 					5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_ARCHAEOLOGY', 				7),
			('LEADER_MC_LADY_XOC', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================