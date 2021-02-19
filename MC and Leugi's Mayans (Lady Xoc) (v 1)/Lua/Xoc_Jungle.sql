INSERT INTO Features
	(Type, 			 Description, Civilopedia, ArtDefineTag, Movement, SeeThrough, Defense, Growth, GrowthTerrainType, InfluenceCost, Rough, WorldSoundscapeAudioScript, EffectType, EffectProbability, EffectTypeTag, PortraitIndex, IconAtlas)
SELECT 'FEATURE_MC_MAYA_JUNGLE', Description, Civilopedia, ArtDefineTag, Movement, SeeThrough, Defense, Growth, GrowthTerrainType, InfluenceCost, Rough, WorldSoundscapeAudioScript, EffectType, EffectProbability, EffectTypeTag, PortraitIndex, IconAtlas
FROM Features WHERE Type = 'FEATURE_JUNGLE';

UPDATE Features
SET AddsFreshWater = 1
WHERE (Type = 'FEATURE_MC_MAYA_JUNGLE');

INSERT INTO Feature_YieldChanges
(FeatureType, YieldType, Yield)
SELECT 'FEATURE_MC_MAYA_JUNGLE', YieldType, Yield
FROM Feature_YieldChanges WHERE FeatureType = 'FEATURE_JUNGLE';

INSERT INTO Feature_TerrainBooleans
(FeatureType, TerrainType)
SELECT 'FEATURE_MC_MAYA_JUNGLE', TerrainType
FROM Feature_TerrainBooleans WHERE FeatureType = 'FEATURE_JUNGLE';