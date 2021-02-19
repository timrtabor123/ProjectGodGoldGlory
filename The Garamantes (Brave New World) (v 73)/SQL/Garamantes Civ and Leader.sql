---------------------------
--Civilizations
---------------------------

INSERT INTO Civilizations 
		(Type,													         Description,							      ShortDescription,									     Adjective,								     CivilopediaTag,					      DefaultPlayerColor,						   ArtDefineTag,						ArtStyleType,			PortraitIndex,					    IconAtlas,					    AlphaIconAtlas,					        MapImage,			ArtStyleSuffix,			ArtStylePrefix,										   DawnOfManQuote,				           DawnOfManImage,			                           DawnOfManAudio,			SoundtrackTag)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',		    'TXT_KEY_ANCIENT_LIBYA_MOD_DESC',			'TXT_KEY_ANCIENT_LIBYA_MOD_SHORT_DESC',			 'TXT_KEY_ANCIENT_LIBYA_MOD_ADJECTIVE',			 'TXT_KEY_CIVLOPEDIA_ANCIENT_LIBYA_MOD',			 'PLAYERCOLOR_ANCIENT_LIBYA_MOD',		   'ART_DEF_CIVILIZATION_EGYPT',			  'ARTSTYLE_MIDDLE_EAST',                       0,			'ANCIENT_LIBYA_ATLAS',		   'ANCIENT_LIBYA_ALPHA_ATLAS',			'AncientLibyaModMap.dds',			       '_AFRI',			     'AFRICAN',			   'TXT_KEY_CIV5_DAWN_ANCIENT_LIBYA_MOD_TEXT',			 'ALT_AncientLibyaModDOM.dds',                'AS2D_DOM_SPEECH_ANCIENT_LIBYA_MOD',                'Egypt');

INSERT INTO Civilization_Leaders 
		(CivilizationType,											                   LeaderheadType)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',				                   'LEADER_ANCIENT_LIBYA_MOD');

INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType,											               BuildingClassType)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',				                      'BUILDINGCLASS_PALACE');

INSERT INTO Civilization_FreeTechs 
		(CivilizationType,											                        TechType)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',				                          'TECH_AGRICULTURE');

INSERT INTO Civilization_FreeUnits 
		(CivilizationType,							  UnitClassType,			Count,						     UnitAIType)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',	    'UNITCLASS_SETTLER',				1,						'UNITAI_SETTLE');

INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType,											            UnitClassType,						                            UnitType)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',				                    'UNITCLASS_SCOUT',							         'UNIT_LIBYAN_NOMAD_MOD');

INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType,											         RegionType)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',				                'REGION_DESERT');

INSERT INTO Civilization_Religions 
		(CivilizationType,											       ReligionType)
VALUES	('CIVILIZATION_ANCIENT_LIBYA_MOD',				               'RELIGION_ISLAM');

INSERT INTO Colors 
		(Type,												   Red,		  Green,		Blue,			Alpha)
VALUES	('COLOR_PLAYER_ANCIENT_LIBYA_MOD_ICON',				 0.701,       0.909,       1.000,               1),
		('COLOR_PLAYER_ANCIENT_LIBYA_MOD_BACKGROUND',	     0.917,       0.509,       0.164,               1);

INSERT INTO PlayerColors 
		(Type,							                                     PrimaryColor,			                                 SecondaryColor,						                TextColor)
VALUES	('PLAYERCOLOR_ANCIENT_LIBYA_MOD',			'COLOR_PLAYER_ANCIENT_LIBYA_MOD_ICON',				'COLOR_PLAYER_ANCIENT_LIBYA_MOD_BACKGROUND',						'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Civilization_CityNames 
			(CivilizationType, 				                                                          CityName)
VALUES		('CIVILIZATION_ANCIENT_LIBYA_MOD', 					  'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_GARAMA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				   'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_ZINCHECRA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				      'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_DEDRIS'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			         'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_THELGAE'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				    'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_POLIGNAC'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 		     'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_AGHRAM_NADHARIF'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			           'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_FEWET'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				    'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_ABALESSA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			       'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_EL_HATTIA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				       'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_ALELE'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				     'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_CILLIBA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				      'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_TAWTEK'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				  'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_EL_CHARAIG'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				     'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_CYDAMUS'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				        'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_GYRI'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				    'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_TABUDIUM'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				 'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_NIGLIGEMELA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				     'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_BUBEIUM'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				      'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_THUBEN'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				    'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_NITIBRUM'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				        'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_BOIN'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				        'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_PEGE'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				      'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_BULUBA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 		              'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_ZIGAMA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				       'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_RAPSA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 		            'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_EL_ABIAD'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				       'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_ALASI'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				       'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_BALLA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				        'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_EDRI'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				        'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_GHAT'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				       'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_DIDER'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				       'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_SEBHA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			    'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_BIR_GHELANIA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				    'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_AGISYMBA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				     'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_TASSILI'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			         'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_ES_SOUQ'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 				      'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_GHERIA'),
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			         'TXT_KEY_CITY_NAME_ANCIENT_LIBYA_MOD_BU_NJEM');

INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				                                           SpyName)
VALUES		('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_0'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_1'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_2'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_3'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_4'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_5'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_6'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_7'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_8'),	
			('CIVILIZATION_ANCIENT_LIBYA_MOD', 			'TXT_KEY_SPY_NAME_ANCIENT_LIBYA_MOD_9');

---------------------------
--Traits
---------------------------

INSERT INTO Traits 
		(Type,											                                           Description,						                                    ShortDescription)
VALUES	('TRAIT_FOGGARAS_ANCIENT_LIBYA_MOD',				        'TXT_KEY_TRAIT_FOGGARAS_ANCIENT_LIBYA_MOD',							'TXT_KEY_TRAIT_FOGGARAS_ANCIENT_LIBYA_MOD_SHORT');

---------------------------
--Leaders
---------------------------

INSERT INTO Leaders 
		(Type,														          Description,									       Civilopedia,						              CivilopediaTag,									    ArtDefineTag,		VictoryCompetitiveness,		WonderCompetitiveness,		MinorCivCompetitiveness,	 Boldness,		DiploBalance,		WarmongerHate,		DenounceWillingness,		DoFWillingness,			Loyalty,		Neediness,		Forgiveness,	Chattiness,		Meanness,	PortraitIndex,	                    IconAtlas)
VALUES	('LEADER_ANCIENT_LIBYA_MOD',			          'TXT_KEY_LEADER_JALLA_MOD_DESC',				      'TXT_KEY_LEADER_JALLA_MOD_PEDIA',					      'TXT_KEY_LEADER_JALLA_MOD',				'Ancient_Libya_Leader_Scene_Mod.xml',						     6,							3,							  3,            6,                 4,                   5,                        5,                     5,               5,                5,                5,             5,            4,               1,			'ANCIENT_LIBYA_ATLAS');

INSERT INTO Leader_Traits 
		(LeaderType,											                            TraitType)
VALUES	('LEADER_ANCIENT_LIBYA_MOD',				               'TRAIT_FOGGARAS_ANCIENT_LIBYA_MOD');

INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 									MajorCivApproachType, 				 Bias)
VALUES		('LEADER_ANCIENT_LIBYA_MOD', 			    'MAJOR_CIV_APPROACH_WAR', 					5),
			('LEADER_ANCIENT_LIBYA_MOD', 		    'MAJOR_CIV_APPROACH_HOSTILE', 					5),
			('LEADER_ANCIENT_LIBYA_MOD', 	      'MAJOR_CIV_APPROACH_DECEPTIVE', 					6),
			('LEADER_ANCIENT_LIBYA_MOD', 		    'MAJOR_CIV_APPROACH_GUARDED', 					6),
			('LEADER_ANCIENT_LIBYA_MOD', 		     'MAJOR_CIV_APPROACH_AFRAID', 					3),
			('LEADER_ANCIENT_LIBYA_MOD', 	       'MAJOR_CIV_APPROACH_FRIENDLY', 					5),
			('LEADER_ANCIENT_LIBYA_MOD', 		    'MAJOR_CIV_APPROACH_NEUTRAL', 					5);

INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 									MinorCivApproachType, 				 Bias)
VALUES		('LEADER_ANCIENT_LIBYA_MOD', 		     'MINOR_CIV_APPROACH_IGNORE', 					6),
			('LEADER_ANCIENT_LIBYA_MOD', 	       'MINOR_CIV_APPROACH_FRIENDLY', 					6),
			('LEADER_ANCIENT_LIBYA_MOD', 	     'MINOR_CIV_APPROACH_PROTECTIVE', 					4),
			('LEADER_ANCIENT_LIBYA_MOD', 	       'MINOR_CIV_APPROACH_CONQUEST', 					3),
			('LEADER_ANCIENT_LIBYA_MOD', 	         'MINOR_CIV_APPROACH_BULLY', 					5);

INSERT INTO Leader_Flavors 
			(LeaderType, 										    FlavorType, 					   Flavor)
VALUES		('LEADER_ANCIENT_LIBYA_MOD', 					  'FLAVOR_OFFENSE', 							5),
			('LEADER_ANCIENT_LIBYA_MOD', 					  'FLAVOR_DEFENSE', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 				 'FLAVOR_CITY_DEFENSE', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 			'FLAVOR_MILITARY_TRAINING', 							4),
			('LEADER_ANCIENT_LIBYA_MOD', 						'FLAVOR_RECON', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 					   'FLAVOR_RANGED', 							8),
			('LEADER_ANCIENT_LIBYA_MOD', 					   'FLAVOR_MOBILE', 							8),
			('LEADER_ANCIENT_LIBYA_MOD', 						'FLAVOR_NAVAL', 							3),
			('LEADER_ANCIENT_LIBYA_MOD', 			      'FLAVOR_NAVAL_RECON', 							3),
			('LEADER_ANCIENT_LIBYA_MOD', 			     'FLAVOR_NAVAL_GROWTH', 							3),
			('LEADER_ANCIENT_LIBYA_MOD', 	   'FLAVOR_NAVAL_TILE_IMPROVEMENT', 							4),
			('LEADER_ANCIENT_LIBYA_MOD', 						  'FLAVOR_AIR', 							6),
			('LEADER_ANCIENT_LIBYA_MOD', 				    'FLAVOR_EXPANSION', 							6),
			('LEADER_ANCIENT_LIBYA_MOD', 					   'FLAVOR_GROWTH', 						    8),
			('LEADER_ANCIENT_LIBYA_MOD', 			 'FLAVOR_TILE_IMPROVEMENT', 							8),
			('LEADER_ANCIENT_LIBYA_MOD', 			   'FLAVOR_INFRASTRUCTURE', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 				   'FLAVOR_PRODUCTION', 							5),
			('LEADER_ANCIENT_LIBYA_MOD', 						 'FLAVOR_GOLD', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 					  'FLAVOR_SCIENCE', 							5),
			('LEADER_ANCIENT_LIBYA_MOD', 					  'FLAVOR_CULTURE', 							6),
			('LEADER_ANCIENT_LIBYA_MOD', 					'FLAVOR_HAPPINESS', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 				 'FLAVOR_GREAT_PEOPLE', 							4),
			('LEADER_ANCIENT_LIBYA_MOD', 					   'FLAVOR_WONDER', 							4),
			('LEADER_ANCIENT_LIBYA_MOD', 					 'FLAVOR_RELIGION', 							6),
			('LEADER_ANCIENT_LIBYA_MOD', 					'FLAVOR_DIPLOMACY', 							6),
			('LEADER_ANCIENT_LIBYA_MOD', 					'FLAVOR_SPACESHIP', 							5),
			('LEADER_ANCIENT_LIBYA_MOD', 			 'FLAVOR_WATER_CONNECTION', 							4),
			('LEADER_ANCIENT_LIBYA_MOD', 						 'FLAVOR_NUKE', 							4),
			('LEADER_ANCIENT_LIBYA_MOD', 					 'FLAVOR_USE_NUKE', 							5),
			('LEADER_ANCIENT_LIBYA_MOD', 					'FLAVOR_ESPIONAGE', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 				      'FLAVOR_ANTIAIR', 							6),
			('LEADER_ANCIENT_LIBYA_MOD', 				  'FLAVOR_AIR_CARRIER', 							3),
			('LEADER_ANCIENT_LIBYA_MOD', 		          'FLAVOR_ARCHAEOLOGY', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 		   'FLAVOR_I_LAND_TRADE_ROUTE', 							8),
			('LEADER_ANCIENT_LIBYA_MOD', 		    'FLAVOR_I_SEA_TRADE_ROUTE', 							4),
			('LEADER_ANCIENT_LIBYA_MOD', 		       'FLAVOR_I_TRADE_ORIGIN', 							7),
			('LEADER_ANCIENT_LIBYA_MOD', 		  'FLAVOR_I_TRADE_DESTINATION', 							8),
			('LEADER_ANCIENT_LIBYA_MOD', 					  'FLAVOR_AIRLIFT', 							6);

---------------------------
--Diplomacy
---------------------------

INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_ANCIENT_LIBYA_MOD',			'RESPONSE_FIRST_GREETING',			'TXT_KEY_LEADER_ANCIENT_LIBYA_MOD_FIRST_GREETING_%',				'1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_ANCIENT_LIBYA_MOD',			'RESPONSE_DEFEATED',				'TXT_KEY_LEADER_ANCIENT_LIBYA_MOD_DEFEATED_%',						'1');