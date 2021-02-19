--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_TOP_GOVERNMENT',	'FontIcons_JFD_TopGovernment_22'),
		('ICON_FONT_TEXTURE_JFD_TOP_ECONOMY',		'FontIcons_JFD_TopEconomy_22'),
		('ICON_FONT_TEXTURE_JFD_TOP_EDUCATION',		'FontIcons_JFD_TopEducation_22'),
		('ICON_FONT_TEXTURE_JFD_TOP_INDUSTRY',		'FontIcons_JFD_TopIndustry_22'),
		('ICON_FONT_TEXTURE_JFD_TOP_MILITARY',		'FontIcons_JFD_TopMilitary_22'),
		('ICON_FONT_TEXTURE_JFD_TOP_RELIGION',		'FontIcons_JFD_TopReligion_22'),
		('ICON_FONT_TEXTURE_JFD_TOP_SOCIETY',		'FontIcons_JFD_TopSociety_22'),
		('ICON_FONT_TEXTURE_JFD_TOP_WELFARE',		'FontIcons_JFD_TopWelfare_22');	
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
VALUES	('ICON_TOP_GOVERNMENT',		'ICON_FONT_TEXTURE_JFD_TOP_GOVERNMENT',	1),
		('ICON_TOP_ECONOMY',		'ICON_FONT_TEXTURE_JFD_TOP_ECONOMY',	1),
		('ICON_TOP_EDUCATION',		'ICON_FONT_TEXTURE_JFD_TOP_EDUCATION',	1),
		('ICON_TOP_INDUSTRY',		'ICON_FONT_TEXTURE_JFD_TOP_INDUSTRY',	1),
		('ICON_TOP_MILITARY',		'ICON_FONT_TEXTURE_JFD_TOP_MILITARY',	1),
		('ICON_TOP_RELIGION',		'ICON_FONT_TEXTURE_JFD_TOP_RELIGION',	1),
		('ICON_TOP_SOCIETY',		'ICON_FONT_TEXTURE_JFD_TOP_SOCIETY',	1),
		('ICON_TOP_WELFARE',		'ICON_FONT_TEXTURE_JFD_TOP_WELFARE',	1);
--==========================================================================================================================
--==========================================================================================================================
