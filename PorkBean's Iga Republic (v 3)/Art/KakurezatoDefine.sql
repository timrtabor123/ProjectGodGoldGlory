
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_KAKUREZATO', 'Improvement', 'KAKUREZATO';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.8, 'ART_DEF_IMPROVEMENT_KAKUREZATO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Kakurezato_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.8, 'ART_DEF_IMPROVEMENT_KAKUREZATO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Kakurezato_01.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.8, 'ART_DEF_IMPROVEMENT_KAKUREZATO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Kakurezato_pl.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_KAKUREZATO', 'Improvement', 'SV_Kakurezato.dds';