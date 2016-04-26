Include("\\script\\missions\\challenge\\challengehead.lua");

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
		Msg2MSAll(MISSIONID, "战役结束");
		StopMissionTimer(MISSIONID, 10);
		StopMissionTimer(MISSIONID, 11);
	end;
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况
	if (V == GO_TIME) then
		if (GetMSPlayerCount(MISSIONID,1) == 0 or GetMSPlayerCount(MISSIONID , 2) == 0) then
			Msg2MSAll(MISSIONID, "报名已结束，但是双方人数都还不符合要求，取消比赛");
			CloseMission(MISSIONID)
			return
		else
			Msg2MSAll(MSSIONID, "报名已结束，比赛正式开始");
			RunMission(MISSIONID);
			return
		end
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "<#> 挑战正在报名阶段，挑战方请赶快入场"..RestMin.."<#> 分 ";
		str1 = "<#>挑战正在报名阶段，各挑战队请尽快入场！双方人数是:"..GetMSPlayerCount(MISSIONID, 1)..","..GetMSPlayerCount(MISSIONID, 2).."<#>.报名时间还有:"..RestMin.."<#> 分"..RestSec.."<#> 秒";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知各方的阵亡情况
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "战斗结束，紫方取得了最终胜利");
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "战斗结束，黄方取得了最终胜利");
		CloseMission(MISSIONID);
		return
	end;
		
	s_death = GetMissionV(MS_S_DEATHCOUNT);
	j_death = GetMissionV(MS_J_DEATHCOUNT);
	gametime = (floor(GetMSRestTime(MISSIONID,11)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> 战斗阶段. 伤亡情况是: 黄方:"..s_death.."<#> 人, 紫方:"..j_death.."<#> 人. 时间还剩"..RestMin.."<#> 分 "..RestSec.."<#> 秒 ";
	Msg2MSAll(MISSIONID, str1);
end;
 