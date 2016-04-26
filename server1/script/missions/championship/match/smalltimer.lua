Include("\\script\\missions\\championship\\match\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV(MS_TIME_1) + 1
	SetMissionV(MS_TIME_1, timer_1)
	if (timer_1 == UP_A_TIME) then
		Msg2MSAll(MISSIONID, "<color=yellow>门派预选赛准备时间结束。比赛正式开始.");
print("match start!!!!**************************************************************start")
		SetMissionV(MS_STATE, 2);
		RunMission(MISSIONID)
	elseif ((timer_1 > UP_A_TIME) and (mod(timer_1, 2) == 0)) then
		gametime = (floor(GetMSRestTime(MISSIONID, 36) / 18));
		RestMin = floor(gametime / 60);
		RestSec = mod(gametime,60);
		if (RestMin == 0) then
			Msg2MSAll(MISSIONID, "<#> 战斗阶段：武林新秀联赛时间还有"..RestSec.."<#> 秒.");
		elseif (RestSec == 0) then
			Msg2MSAll(MISSIONID, "<#> 战斗阶段：武林新秀联赛时间还有"..RestMin.."<#> 分.");
		end;
	end
end
