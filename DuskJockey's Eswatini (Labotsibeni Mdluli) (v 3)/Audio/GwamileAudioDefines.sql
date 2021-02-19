--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_DJ_GWAMILE_PEACE', 	'DJEswatiniPeace',	'DynamicResident'),
			('SND_LEADER_MUSIC_DJ_GWAMILE_WAR', 	'DJEswatiniWar', 	'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType,		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_DJ_GWAMILE_PEACE', 	'SND_LEADER_MUSIC_DJ_GWAMILE_PEACE',	'GAME_MUSIC', 	80, 		80, 		1, 		 0),
			('AS2D_LEADER_MUSIC_DJ_GWAMILE_WAR', 	'SND_LEADER_MUSIC_DJ_GWAMILE_WAR',		'GAME_MUSIC', 	70, 		70, 		1,		 0);