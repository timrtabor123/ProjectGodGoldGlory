--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 				Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_WHITLAM', 		'TXT_KEY_LEADER_SENSHI_WHITLAM', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_WHITLAM', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_WHITLAM', 	'Senshi_Whitlam_Scene.xml',					5, 						4, 						5, 							7, 			8, 				5, 				3, 						8, 				7, 			8, 			6, 				4, 			3, 			'SENSHI_WHITLAM_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_WHITLAM', 		'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_SENSHI_WHITLAM', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_SENSHI_WHITLAM', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_SENSHI_WHITLAM', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_SENSHI_WHITLAM', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_SENSHI_WHITLAM', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_WHITLAM', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_WHITLAM', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_SENSHI_WHITLAM', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_WHITLAM', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_SENSHI_WHITLAM', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_SENSHI_WHITLAM', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_WHITLAM', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_RECON', 					4),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_RANGED', 					6),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_MOBILE', 					4),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_NAVAL', 					6),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_NAVAL_RECON', 				6),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_NAVAL_GROWTH', 				8),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_AIR', 						8),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_GROWTH', 					9),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_GOLD', 						3),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_CULTURE', 					9),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_HAPPINESS', 				9),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_WONDER', 					5),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_RELIGION', 					2),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_WATER_CONNECTION', 			7),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_NUKE', 						4),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_AIRLIFT', 					6),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_SENSHI_WHITLAM', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_WHITLAM', 	'TRAIT_SENSHI_WHITLAM');
--==========================================================================================================================				
--==========================================================================================================================		