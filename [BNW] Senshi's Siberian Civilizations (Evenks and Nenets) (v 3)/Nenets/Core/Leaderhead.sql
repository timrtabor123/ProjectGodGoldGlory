--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_VAVLYO', 		'TXT_KEY_LEADER_SENSHI_VAVLYO', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_VAVLYO', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_VAVLYO', 	'Vavlyo_Scene.xml',				6, 						4, 						4, 							8, 			4, 				9, 				8, 						4, 				8, 			5, 			2, 				3, 			6, 			'SENSHI_NENETS_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_VAVLYO', 		'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_SENSHI_VAVLYO', 		'MAJOR_CIV_APPROACH_HOSTILE', 		9),
			('LEADER_SENSHI_VAVLYO', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
			('LEADER_SENSHI_VAVLYO', 		'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_SENSHI_VAVLYO', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_SENSHI_VAVLYO', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_SENSHI_VAVLYO', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_VAVLYO', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_SENSHI_VAVLYO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_SENSHI_VAVLYO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_SENSHI_VAVLYO', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_SENSHI_VAVLYO', 	'MINOR_CIV_APPROACH_BULLY', 		6);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_VAVLYO', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_RECON', 					5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_RANGED', 					6),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_MOBILE', 					8),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_NAVAL', 					3),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_AIR', 						4),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_GROWTH', 					7),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_GOLD', 						4),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_CULTURE', 					6),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_WONDER', 					5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_RELIGION', 					8),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_NUKE', 						8),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_USE_NUKE', 					6),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_SENSHI_VAVLYO', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_VAVLYO', 	'TRAIT_SENSHI_SAMBADABTS');
--==========================================================================================================================				
--==========================================================================================================================		