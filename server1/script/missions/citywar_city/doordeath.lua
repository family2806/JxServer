Include("\\script\\missions\\citywar_city\\head.lua");
function OnDeath(DoorIndex)
	WriteLog(GetLoop()..":���ű��ƣ��������ǳ�"..DoorIndex);
	DoorI = DoorIndex
	for i = 1, g_nDoorCount do 
		D = GetMissionV(MS_DOORBEGIN + i - 1)
		if (D - DoorI == 0) then
			SetMissionV(MS_DOORBEGIN + i - 1, 0)
			AddGlobalNews("��ս����������Ϣ���سǷ���һ�����ű����ˣ�����ʮ��Σ��");
			ClearObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
			
			--ɾ����Ӧ�Ĺ��ǳ�
			DelGcc = GetMissionV(MS_GCCBEGIN + i - 1) 
			if (DelGcc > 0) then 
				WriteLog(GetLoop()..":���ű��ƣ��������ǳ�");
				DelNpcSafe(DelGcc)
				SetMissionV(MS_GCCBEGIN + i - 1, 0);
			end;
			
			return 
		end
	end;
end;