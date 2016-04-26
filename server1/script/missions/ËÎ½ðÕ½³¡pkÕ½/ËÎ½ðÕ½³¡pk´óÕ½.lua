Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function InitMission()
    --Msg2Player("战事紧急，大战一触即发.");
    StartMissionTimer(1,4,TIMER_1);
    SetMissionV(1,1);--允许报名了
    SetMissionV(MS_KEY, random(100000))
    RevivalAllNpc();
HideNpc("南宋将军",1000000);
HideNpc("金国大将",1000000);

    RestMin, RestSec = GetMinAndSec(1800);
local str1 = "<#>宋金大战正进入报名阶段，欲参战者请尽快在宋金战场两入口之一报名,报名剩余时间:"..RestMin.."<#>分"..RestSec.."<#>秒".."<#>。参战条件:等级不小于40级，报名费3000两。";
    AddGlobalCountNews(str1, 1);
end;

function RunMission()
    SetMissionV(1,2);
    SetMissionV(MS_J_NPCDEATH, 0);
    SetMissionV(MS_S_NPCDEATH, 0);
    SetMissionV(MS_S_SHOWKING, 0);
    SetMissionV(MS_J_SHOWKING, 0);
    RevivalAllNpc();
HideNpc("南宋将军",1000000);
HideNpc("金国大将",1000000);
HideNpc("宋军军医",1000000);
HideNpc("金国军医",1000000);
    idx = 0;
    
    for i = 1 , 500 do
    	idx, pidx = GetNextPlayer(1,idx, 0);
    	
    	if (idx == 0) then
    		break
    	end;
    	
    	if (pidx > 0) then
    		PlayerIndex = pidx;
    		SetFightState(1);
    	end;

    	--此时为GM发布命令，正式打响战斗
PutMessage("敌军已经开始行动，将士们赶赴前线,奋勇杀敌呀!");
    end;
    
    StartMissionTimer(1,5, TIMER_2);
end;

function EndMission()

    for i = 1, 20 do 
    SetMissionV(i , 0);
    end;

    StopMissionTimer(1,4);
    StopMissionTimer(1,5);
    GameOver();
end;

function OnLeave(RoleIndex)
    PlayerIndex = RoleIndex;
str2 = GetName().."退出了战场";
    -- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
    SetPKFlag(0)
    ForbidChangePK(0);
    Msg2MSAll(1, str2);
end;
