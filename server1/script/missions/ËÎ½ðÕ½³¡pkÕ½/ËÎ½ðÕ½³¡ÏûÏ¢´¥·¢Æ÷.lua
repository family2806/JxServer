Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE,V + 1);

--报名阶段
if (timestate == 1) then 
	ReportMemberState(V);
elseif (timestate == 2) then 
	ReportBattle(V);

--如果已超过第一阶段，并且未有任何主将出现时
	if (V >= SHOWKINGTIME1 and GetMissionV(MS_FIRSTSHOW) == 0) then
		s_show = GetMissionV(MS_S_SHOWKING);
		j_show = GetMissionV(MS_J_SHOWKING);

--如果当前只有一方符合基本的主将出现要求则，让其主将出现
		if (s_show == 1 and j_show == 0) then 
			SetMissionV(MS_FIRSTSHOW, 1)
			ShowTheKing(1)
			SetMissionV(MS_S_SHOWKING,2)
			return
		end;

		if (s_show == 0 and j_show == 1) then 
			SetMissionV(MS_FIRSTSHOW, 2)
			ShowTheKing(2)
			SetMissionV(MS_J_SHOWKING,2)
			return
		end;

--如果两方都达到基本出现主将的要求，则根据双方的当前积分确定
		if (s_show == 1 and j_show == 1) then
			s_dpk  = GetMissionV(MS_S_DEATHCOUNT);--玩家PK死亡数量
			j_dpk  = GetMissionV(MS_J_DEATHCOUNT);
			s_dnpc = GetMissionV(MS_S_NPCDEATH);--NPC死亡数量
			j_dnpc = GetMissionV(MS_J_NPCDEATH);

			if (s_dpk * 1.5 + s_dnpc > j_dpk * 1.5 + j_dnpc) then
				SetMissionV(MS_FIRSTSHOW, 1)
				ShowTheKing(1)
				SetMissionV(MS_S_SHOWKING,2)
				return
			else
				SetMissionV(MS_FIRSTSHOW, 2)
				ShowTheKing(2)
				SetMissionV(MS_J_SHOWKING,2)
				return
			end
		end;
	end;

--如果已经到了第二阶段，即优势方主将可以出现了
	if (V >= SHOWKINGTIME2) then
		--如果当前无任何方主将出现，则直接返回
		local fstshow = GetMissionV(MS_FIRSTSHOW);
		if (fstshow <= 0) then
			return
		end

--记录优势方的代号 1song ,2jing
		nextgroup = 0;
		if (fstshow == 1) then	
			nextgroup = 2
		else
			nextgroup = 1
		end;

--如果该方出现主将的要求已经达到，则让主将出现
		local canshow = GetMissionV(MS_S_SHOWKING + nextgroup - 1);

		if (canshow == 1) then
			ShowTheKing(nextgroup);
			SetMissionV(MS_S_SHOWKING + nextgroup - 1, 2);
		end;
	end;
elseif (timestate == 3) then 
	Msg2MSAll("战役结束!");
	StopMissionTimer(1,1);
end;

end;

function ReportMemberState(V)
--在报名期间，系统定期通知玩家当前的报名情况

if (V == GO_TIME) then
	if (GetMSPlayerCount(1,1) <= 10 or GetMSPlayerCount(1,2) <= 10) then
		AddGlobalCountNews("宋金战场报名时间到，但目前双方人数不符合要求，本次战斗取消！");
		GiveBackBonus()
		CloseMission(1)
		return
	else
		AddGlobalCountNews("宋金战场报名时间到，宋金战斗已正式开始了!",3);
		logstr = "<#>宋金战场正式开始，双方参战人数为"..GetMSPlayerCount(1,1).."<#>:"..GetMSPlayerCount(1,2);
		WriteLog(logstr)
		Msg2MSAll(1, logstr)
		RunMission(1);
		return
	end
end;

if (mod(V, 18) == 0) then 
	RestTime = (GO_TIME - V) * 1800 / GO_TIME;
	RestMin, RestSec = GetMinAndSec(RestTime);
	local str1 = "<#>宋金大战正进入报名阶段，欲参战者请尽快在宋金战场两入口之一报名,报名剩余时间:"..RestMin.."<#>分。参战条件:等级不小于40级，报名费3000两。";
	AddGlobalCountNews(str1, 2);
end;

--str = "<#>报名阶段:宋、金双方当前总人数为:"..GetMSPlayerCount(1,1).."<#>:"..GetMSPlayerCount(1,2);
--Msg2MSAll(1, str);

end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知各方的阵亡情况
	s_death = GetMissionV(4) + GetMissionV(8);
	j_death = (GetMissionV(3) + GetMissionV(9));
	gametime = (floor(GetMSRestTime(1,5)/18));

	RestMin, RestSec = GetMinAndSec(gametime);

	s_dpk  = GetMissionV(MS_S_DEATHCOUNT);
	j_dpk  = GetMissionV(MS_J_DEATHCOUNT);
	s_dnpc = GetMissionV(MS_S_NPCDEATH);
	j_dnpc = GetMissionV(MS_J_NPCDEATH);

	s_result = floor(j_dpk * 1.5 + j_dnpc);
	j_result = floor(s_dpk * 1.5 + s_dnpc);
	
	str1 = "<#>战斗阶段:目前伤亡情况:宋军"..s_death.."人，积分"..s_result.."<#>;金兵"..j_death.."<#>人,积分"..j_result.."<#>。剩余时间:"..RestMin.."<#>分"..RestSec.."<#>秒";

	Msg2MSAll(1, str1);

--全球公告战况功能关闭 2004.11.5
--	if (mod(V, 24) == 0) then
--		str2 = "宋金战场正在进行激烈的战斗!目前宋金伤亡为"..s_death..":"..j_death;
--		AddGlobalCountNews(str2 , 1);
--	end;

end;
 