IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local szTongName, nTongID = GetTongName();
	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 60) then
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			SetNpcParam(nNpcIdx, 4, 1)
			DelNpc(nNpcIdx);
			if (nTongID ~= 0 and TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) >= 120) then
				AddEventItem(1121);
				Msg2Player("得到1个密件");
				AddItem(6,1,1257,1,1,1);
				AddItem(6,1,1257,1,1,1);
				Msg2Player("得到2块荣誉令牌");
				Msg2SubWorld("<color=white>"..szTongName.."<color> 帮会 - "..GetName().."得到密件.");
			else
				Talk(1, "", "没看见!! (密件古怪的突然着火，眨眼间只剩灰烬.)");
				Msg2Player("班会积累的烽火英雄令不够120个, 无法接受密件.");
				Msg2SubWorld("<color=white>"..GetName().."<color>帮会未达到参加密件活动的条件，密件被销毁.");
			end;
		else	--时间没到60秒钟;
			Msg2Player("你选了这个密件, "..(60 - (nTime - GetTask(GREADSEED_TIME_TASKID))) .." 一会就可以拿到!")
		end;
	else
		Msg2Player("你选了这个密件！60秒后可以拿到.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;