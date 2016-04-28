Include("\\script\\missions\\citywar_city\\head.lua");
function OnDeath(DoorIndex)
	WriteLog(GetLoop()..": CÊng nµo Æ„ bﬁ ch’t rÂi! "..DoorIndex);
	DoorI = DoorIndex
	for i = 1, g_nDoorCount do 
		D = GetMissionV(MS_DOORBEGIN + i - 1)
		if (D - DoorI == 0) then
			SetMissionV(MS_DOORBEGIN + i - 1, 0)
			AddGlobalNews("Theo tin tı chi’n tr≠Íng Æ≠a v“, mÈt cÊng thµnh cÒa phe thÒ Æ∑ bﬁ t n c´ng, t◊nh th’ r t nguy c p ");
			ClearObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
			
			--…æµÙ∂‘”¶µƒπ•≥«≥µ
			DelGcc = GetMissionV(MS_GCCBEGIN + i - 1) 
			if (DelGcc > 0) then 
				WriteLog(GetLoop()..": CÊng nµo Æ„ bﬁ ch’t rÂi! ");
				DelNpcSafe(DelGcc)
				SetMissionV(MS_GCCBEGIN + i - 1, 0);
			end;
			
			return 
		end
	end;
end;