Include("\\script\\missions\\citywar_city\\head.lua");
function OnDeath(DoorIndex)
	WriteLog(GetLoop()..":城门被破，丢弃攻城车"..DoorIndex);
	DoorI = DoorIndex
	for i = 1, g_nDoorCount do 
		D = GetMissionV(MS_DOORBEGIN + i - 1)
		if (D - DoorI == 0) then
			SetMissionV(MS_DOORBEGIN + i - 1, 0)
			AddGlobalNews("从战场传来的消息，守城方的一道城门被攻了，形势十分危急");
			ClearObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
			
			--删掉对应的攻城车
			DelGcc = GetMissionV(MS_GCCBEGIN + i - 1) 
			if (DelGcc > 0) then 
				WriteLog(GetLoop()..":城门被破，丢弃攻城车");
				DelNpcSafe(DelGcc)
				SetMissionV(MS_GCCBEGIN + i - 1, 0);
			end;
			
			return 
		end
	end;
end;