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
			print("ANNOUNCE: 武林大会会场"..CP_MAPTAB[i][3].."不在sever, ", mapid);
		else
			SubWorld = mapindex
			if(GetMissionV(MS_STATE) > 0) then
				return
			end
			OpenMission(MISSIONID)
			str = date("%m月%d日").."武林大会"..CP_MAPTAB[i][3].."门派预选已开始，请到位于临安的武林大会会场报名比赛.报名条件:等级大于90级，最少参加20次. 首次报名交90万两."
			WriteLog(date("%Y年%m月%d日%时%M分:").."武林大会"..CP_MAPTAB[i][3].."门派预选比赛及开始!")
			AddGlobalCountNews(str, 1)
			SetMissionV(MS_STATE, 1)
			SetMissionV(MS_ROUND, 1)
		end
	end
	SubWorld = orgworld
end