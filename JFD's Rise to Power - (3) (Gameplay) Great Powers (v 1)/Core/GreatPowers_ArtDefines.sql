--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 							Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_JFD_DEVELOPING_POWER', 	0.807,	0.654,	0.313,	1),
		('COLOR_JFD_GREAT_POWER', 		0.572,	0.270,	0.627,	1),
		('COLOR_JFD_HYPER_POWER', 		0.247,	0.215,	0.749,	1),
		('COLOR_JFD_MIDDLE_POWER', 		0.062,	0.745,	0.749,	1),
		('COLOR_JFD_SMALL_POWER', 		0.439,	0.592,	0.149,	1),
		('COLOR_JFD_STAGNANT_POWER', 	0.870,	0.827,	0.741,	1),
		('COLOR_JFD_SUPER_POWER', 		0.815,	0.109,	0.109,	1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_DEVELOPING_POWER',	'FontIcons_JFD_DevelopingPower_22'),
		('ICON_FONT_TEXTURE_JFD_GREAT_POWER',		'FontIcons_JFD_GreatPower_22'),
		('ICON_FONT_TEXTURE_JFD_HYPER_POWER',		'FontIcons_JFD_HyperPower_22'),
		('ICON_FONT_TEXTURE_JFD_MIDDLE_POWER',		'FontIcons_JFD_MiddlePower_22'),
		('ICON_FONT_TEXTURE_JFD_SMALL_POWER',		'FontIcons_JFD_SmallPower_22'),
		('ICON_FONT_TEXTURE_JFD_STAGNANT_POWER',	'FontIcons_JFD_StagnantPower_22'),
		('ICON_FONT_TEXTURE_JFD_SUPER_POWER',		'FontIcons_JFD_SuperPower_22');	
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 						IconFontTexture,							IconMapping)
VALUES	('ICON_JFD_DEVELOPING_POWER',	'ICON_FONT_TEXTURE_JFD_DEVELOPING_POWER',	1),
		('ICON_JFD_GREAT_POWER',		'ICON_FONT_TEXTURE_JFD_GREAT_POWER',		1),
		('ICON_JFD_HYPER_POWER',		'ICON_FONT_TEXTURE_JFD_HYPER_POWER',		1),
		('ICON_JFD_MIDDLE_POWER',		'ICON_FONT_TEXTURE_JFD_MIDDLE_POWER',		1),
		('ICON_JFD_SMALL_POWER',		'ICON_FONT_TEXTURE_JFD_SMALL_POWER',		1),
		('ICON_JFD_STAGNANT_POWER',		'ICON_FONT_TEXTURE_JFD_STAGNANT_POWER',		1),
		('ICON_JFD_SUPER_POWER',		'ICON_FONT_TEXTURE_JFD_SUPER_POWER',		1);
--==========================================================================================================================
--==========================================================================================================================