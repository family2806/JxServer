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
			print("ANNOUNCE: H�i tr��ng ��i h�i v� l�m"..CP_MAPTAB[i][3].."Kh�ng c� tr�n sever, ", mapid);
		else
			SubWorld = mapindex
			if(GetMissionV(MS_STATE) > 0) then
				return
			end
			OpenMission(MISSIONID)
			str = date("%mth�ng%dng�y").."V� l�m ��i h�i"..CP_MAPTAB[i][3].."����Ԥѡ�ѿ�ʼ���뵽λ���ٰ���V� l�m ��i h�i�᳡��������.��������:�ȼ�����90�������ٲμ�20��. �״α�����90����."
			WriteLog(date("%Y��%mth�ng%dng�y%ʱ%M��:").."V� l�m ��i h�i"..CP_MAPTAB[i][3].."Thi ��u d� tuy�n m�n ph�i �� b�t ��u!")
			AddGlobalCountNews(str, 1)
			SetMissionV(MS_STATE, 1)
			SetMissionV(MS_ROUND, 1)
		end
	end
	SubWorld = orgworld
end