Include("\\script\\missions\\citywar_city\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);
	if (timestate == 2) then --开战了
		ReportBattle(V);
	end;
end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知石碑的情况
	gametime = (floor(GetMSRestTime(MISSIONID,13) / 18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str = format("现在 %s 现在处于激烈争夺的阶段! 时间还剩 %d分 %d 秒; 现在 %d 龙柱已经恢复属性", GetGameCity(), RestMin, RestSec, MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "防守方"	;
		else 	
			str = str .. "进攻方";
		end;
	end;

	--2004.11.5关闭向全球发送广播的功能
	--if (mod(V, 18) == 0) then 
	--	AddGlobalNews(str)
	--else
		Msg2MSAll(MISSIONID, str)
	--end;
end;
 