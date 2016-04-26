CP_MAPTAB = {
				{396, 397, "����"},
				{398, 399, "����"},
				{400, 401, "����"},
			 	{402, 403, "�嶾"},
			 	{404, 405, "��ü"},
			 	{406, 407, "����"},
			 	{408, 409, "ؤ��"},
			 	{410, 411, "����"},
			 	{412, 413, "�䵱"},
			 	{414, 415, "����"}
			 }
MISSIONID = 18;
MS_STATE = 1; --�����м�¼����״̬�ı���ID
MS_ROUND = 4	--��¼�������µ��ִ�
CP_UPTO_TRYOUT = 5051620
CP_END_TRYOUT = 5052224
CP_BEGIN_HOUR = 20
CP_END_HOUR = 24



function CP_CheckOpenTime()
	if (tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT and tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		if(tonumber(date("%H")) >= CP_BEGIN_HOUR and tonumber(date("%H")) < CP_END_HOUR) then
			orgworld = SubWorld
			for i = 1, getn(CP_MAPTAB) do
				mapid = CP_MAPTAB[i][1]
				mapindex = SubWorldID2Idx(mapid)
				if (mapindex < 0) then
					print("ANNOUNCE: ���ִ��᳡"..CP_MAPTAB[i][3].."����sever, ", mapid);
				else
					SubWorld = mapindex
					if(GetMissionV(MS_STATE) == 0) then
						OpenMission(MISSIONID)
						str = date("%m��g%d��").."���ִ��"..CP_MAPTAB[i][3].."����Ԥѡ������ʼ��, �뵽λ���ٰ������ִ��᳡��������. �i��������: 90������, ���ٲμ�20��. �״α���Ҫ��10����."
						WriteLog(date("%Y��%m��g%d��%ʱ%M��:").."���ִ��"..CP_MAPTAB[i][3].."����Ԥѡ�����Ѿ���ʼ!")
						AddGlobalCountNews(str, 1)
						SetMissionV(MS_STATE, 1)
						SetMissionV(MS_ROUND, 1)						
					end
				end
			end
			SubWorld = orgworld
		end
	end
end