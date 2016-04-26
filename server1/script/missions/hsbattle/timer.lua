Include("\\script\\missions\\hsbattle\\hshead.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);

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
		StopMissionTimer(MISSIONID, 14);
		StopMissionTimer(MISSIONID, 15);
	end;
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况
	if (V == GO_TIME) then
		Msg2MSAll(MSSIONID, "进入人数已够，比赛正式开始");
		RunMission(MISSIONID);
		return
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "进入赛场时间 <#> 还有"..RestMin.."<#> 分钟，挑战队请立即进入赛场."
		str1 = "挑战赛<#> 正处于进入赛场状态，双方会计进入赛场。双方人数"..GetMSPlayerCount(MISSIONID, 1).."<#>:"..GetMSPlayerCount(MISSIONID, 2).."<#>. 进入斗场时间还剩: "..RestMin.."<#> 分钟"..RestSec.."<#> gi﹜ ";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知各方的阵亡情况
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. 比赛结束,"..GetMissionS(2).."<#> 获得最终胜利!");
		WinBonus(2)
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. 比赛结束,"..GetMissionS(1).."<#> 获得最终胜利!");
		WinBonus(1)
		CloseMission(MISSIONID);
		return
	end;
		
	s_value = GetMissionV(MS_TONG1VALUE);
	j_value = GetMissionV(MS_TONG2VALUE);
	
	gametime = (floor(GetMSRestTime(MISSIONID,15)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> 战斗阶段：目前积分为：金方:"..s_value.."<#>, 紫方"..j_value.."<#>. 还剩时间"..RestMin.."<#> 分钟"..RestSec.."<#> 秒";
	Msg2MSAll(MISSIONID, str1);
end;
