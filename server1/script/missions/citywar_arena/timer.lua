Include("\\script\\missions\\citywar_arena\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V + 1);

	if (V == GO_TIME) then
		RunMission(MISSIONID)
		return
	end

	--报名阶段
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --开战了
		ReportBattle(V);
	elseif (timestate == 3) then  --战斗结束了
		Msg2MSAll(MISSIONID, "战斗结束");
		StopMissionTimer(MISSIONID, 16);
		StopMissionTimer(MISSIONID, 17);
	end;
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况
	if (V == GO_TIME) then
		Msg2MSAll(MSSIONID, "人数已够，比赛正式开始");
		msgstr = format("帮会 %s 和%s 已开始比赛: 现在双方人数是： %d - %d.", GetMissionS(1), GetMissionS(2), GetMSPlayerCount(MISSIONID, 1), GetMSPlayerCount(MISSIONID, 2));
		WriteLog(msgstr)
		RunMission(MISSIONID);
		return
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "进入赛场时间<#> 还有 "..RestMin.."<#> 分, 挑战队请立刻入场."
		str1 = "挑战城阵<#> 正在入场阶段，双方赶快入场。双方人数 "..GetMSPlayerCount(MISSIONID, 1).."<#>:"..GetMSPlayerCount(MISSIONID, 2).."<#>. 入场时间还有: "..RestMin.."<#> 分"..RestSec.."<#>秒";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知各方的阵亡情况
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>.比赛结束"..GetMissionS(2).."<#> 取得最终胜利!");
		WinBonus(2)
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>.比赛结束"..GetMissionS(1).."<#> 取得最终胜利!");
		WinBonus(1)
		CloseMission(MISSIONID);
		return
	end;

	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "比赛阶段<#>:现在双方人数：黄方"..GetMSPlayerCount(MISSIONID, 1).."<#>,紫方"..GetMSPlayerCount(MISSIONID, 2).."<#>. 剩余时间"..RestMin.."<#>分"..RestSec.."<#>秒 ";
	Msg2MSAll(MISSIONID, str1);
end;
