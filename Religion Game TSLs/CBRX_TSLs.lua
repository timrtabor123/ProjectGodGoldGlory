local cbrxTSLs = {}	
cbrxTSLs["CIVILIZATION_THP_NAMIBIA"] = {X=26, Y=14}
cbrxTSLs["CIVILIZATION_DJ_ESWATINI"] = {X=32, Y=13}
cbrxTSLs["CIVILIZATION_PB_LIBERTATIA"] = {X=43, Y=18}
cbrxTSLs["CIVILIZATION_DMS_ERITREA"] = {X=36, Y=36} 			
cbrxTSLs["CIVILIZATION_JWW_ABEMAMA"] = {X=108, Y=36}
cbrxTSLs["CIVILIZATION_MOROCCO"] = {X=6, Y=50}
cbrxTSLs["CIVILIZATION_ANCIENT_LIBYA_MOD"] = {X=17, Y=45}
cbrxTSLs["CIVILIZATION_DMS_MC_KANEM_BORNU"] = {X=22, Y=38} 
cbrxTSLs["CIVILIZATION_UC_SONGHAI"] = {X=12, Y=41}
cbrxTSLs["CIVILIZATION_JFD_EGYPT_AKHENATEN"] = {X=31, Y=45}
cbrxTSLs["CIVILIZATION_EW_YUKAGHIR"] = {X=98, Y=84}
cbrxTSLs["CIVILIZATION_TCM_ASSYRIA"] = {X=42, Y=54}
cbrxTSLs["CIVILIZATION_SENSHI_NENETS"] = {X=46, Y=86}
cbrxTSLs["CIVILIZATION_LUNG_DAI_VIET"] = {X=78, Y=46}
cbrxTSLs["CIVILIZATION_ER_KAREN"] = {X=74, Y=42}
cbrxTSLs["CIVILIZATION_THP_PALA"] = {X=68, Y=48}
cbrxTSLs["CIVILIZATION_JWW_MALACCA"] = {X=77, Y=32}
cbrxTSLs["CIVILIZATION_PB_TAIPING"] = {X=86, Y=56}
cbrxTSLs["CIVILIZATION_CLWABANAKI"] = {X=162, Y=68}
cbrxTSLs["CIVILIZATION_PB_IGA"] = {X=94, Y=57}
cbrxTSLs["CIVILIZATION_RELIC_DENG_CHINA"] = {X=83, Y=65}
cbrxTSLs["CIVILIZATION_THP_NORTHYUAN"] = {X=73, Y=71}
cbrxTSLs["CIVILIZATION_THP_RASHTRAKUTA"] = {X=60, Y=41}
cbrxTSLs["CIVILIZATION_TCM_MASSAGETAE"] = {X=52, Y=65}
cbrxTSLs["CIVILIZATION_THP_KET"] = {X=66, Y=79}
cbrxTSLs["CIVILIZATION_THP_LUBA"] = {X=30, Y=24}
cbrxTSLs["CIVILIZATION_GT_SWEDEN_PALME"] = {X=26, Y=77}
cbrxTSLs["CIVILIZATION_DJ_ALBA"] = {X=9, Y=78}
cbrxTSLs["CIVILIZATION_JFD_ENGLAND_HENRY_VIII"] = {X=12, Y=70}
cbrxTSLs["CIVILIZATION_JFD_BYZANTIUM_JUSTINIAN"] = {X=31, Y=60}
cbrxTSLs["CIVILIZATION_LUNGNORWAY"] = {X=20, Y=85}
cbrxTSLs["CIVILIZATION_JFD_GERMANS"] = {X=22, Y=69}
cbrxTSLs["CIVILIZATION_JFD_ROME_JULIUS"] = {X=21, Y=58}
cbrxTSLs["CIVILIZATION_MC_GAUL"] = {X=14, Y=64}
cbrxTSLs["CIVILIZATION_RTRYPILLIA"] = {X=35, Y=67}
cbrxTSLs["CIVILIZATION_JFD_CASTILE"] = {X=8, Y=57}
cbrxTSLs["CIVILIZATION_DMS_KALINAGO"] = {X=161, Y=46}
cbrxTSLs["CIVILIZATION_HAIDA_MOD_LS"] = {X=126, Y=73}
cbrxTSLs["CIVILIZATION_VIVALA_DORSET"] = {X=150, Y=86}
cbrxTSLs["CIVILIZATION_JFD_DESERET"] = {X=137, Y=57}
cbrxTSLs["CIVILIZATION_MC_MAYA"] = {X=145, Y=47}
cbrxTSLs["CIVILIZATION_UAE"] = {X=48, Y=43}
cbrxTSLs["CIVILIZATION_JFD_INDO_GREEKS"] = {X=58, Y=53}
cbrxTSLs["CIVILIZATION_MC_CHINOOK"] = {X=129, Y=71}
cbrxTSLs["CIVILIZATION_MC_CALUSA"] = {X=151, Y=54}
cbrxTSLs["CIVILIZATION_JFD_LITHUANIA_GEDIMINAS"] = {X=31, Y=72}
cbrxTSLs["CIVILIZATION_THP_CHEYENNE"] = {X=138, Y=69}
cbrxTSLs["CIVILIZATION_PB_LANFANG"] = {X=81, Y=30} 			
cbrxTSLs["CIVILIZATION_RUSSIA"] = {X=38, Y=72}
cbrxTSLs["CIVILIZATION_THP_ANANGU"] = {X=93, Y=16}
cbrxTSLs["CIVILIZATION_SENSHI_WHITLAM"] = {X=102, Y=10}
cbrxTSLs["CIVILIZATION_CTCL_YUGRA"] = {X=55, Y=77}
cbrxTSLs["CIVILIZATION_MC_INCA"] = {X=153, Y=27}				
cbrxTSLs["CIVILIZATION_PB_PALMARES"] = {X=172, Y=30}
cbrxTSLs["CIVILIZATION_PG_RIODELAPLATA"] = {X=161, Y=16}
cbrxTSLs["CIVILIZATION_XINGU_MOD"] = {X=163, Y=31}
cbrxTSLs["CIVILIZATION_JFD_GREATER_ARMENIA"] = {X=41, Y=58}
cbrxTSLs["CIVILIZATION_BABYLON"] = {X=4, Y=0}
cbrxTSLs["CIVILIZATION_SENSHI_EVENKS"] = {X=79, Y=80}
cbrxTSLs["CIVILIZATION_TCM_ILKHANATE"] = {X=44, Y=56}
cbrxTSLs["CIVILIZATION_UC_KAWESKAR"] = {X=154, Y=4}
cbrxTSLs["CIVILIZATION_S_COMANCHE"] = {X=141, Y=60}


function setTSLs()
	for iPlayer = 0,62 do
		local pPlayer = Players[iPlayer]
		local sCivilizationType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
		if cbrxTSLs[sCivilizationType] then
			for v in pPlayer:Units() do 
				v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
			end
		end
	end

end

Events.SequenceGameInitComplete.Add(setTSLs)