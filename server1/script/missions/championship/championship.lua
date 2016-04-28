Include("\\script\\missions\\championship\\tryout\\head.lua")
function main()
	if ( not validateDate(CP_UPTO_TRYOUT,CP_END_TRYOUT) ) then
		return
	end
	orgworld = SubWorld
	for i = 1, getn(CP_MAPTAB) do
		mapid = CP_MAPTAB[i][1]
		mapindex = SubWorldID2Idx(mapid)
		if (mapindex < 0) then
			print("ANNOUNCE: Héi tr­êng §¹i héi vâ l©m"..CP_MAPTAB[i][3].."Kh«ng cã trªn sever, ", mapid);
		else
			SubWorld = mapindex
			if(GetMissionV(MS_STATE) > 0) then
				return
			end
			OpenMission(MISSIONID)
			str = date("%mth¸ng%dngµy").."Vâ l©m ®¹i héi"..CP_MAPTAB[i][3].."ÃÅÅÉÔ¤Ñ¡ÒÑ¿ªÊ¼£¬Çëµ½Î»ÓÚÁÙ°²µÄVâ l©m ®¹i héi»á³¡±¨Ãû±ÈÈü.±¨ÃûÌõ¼ş:µÈ¼¶´óÓÚ90¼¶£¬×îÉÙ²Î¼Ó20´Î. Ê×´Î±¨Ãû½»90ÍòÁ½."
			WriteLog(date("%YÄê%mth¸ng%dngµy%Ê±%M·Ö:").."Vâ l©m ®¹i héi"..CP_MAPTAB[i][3].."Thi ®Êu dù tuyÓn m«n ph¸i ®· b¾t ®Çu!")
			AddGlobalCountNews(str, 1)
			SetMissionV(MS_STATE, 1)
			SetMissionV(MS_ROUND, 1)
		end
	end
	SubWorld = orgworld
end