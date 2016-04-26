Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then
	if (random(100) > 60) then
	return
	end;
	AddEventItem(195);
	Msg2Player("您获得了岳王剑!");
end;

--这句是给所有参加大战的玩家发的信息
str1 = "<#>宋金战役结果:金方将士"..GetName().."<#>杀掉了宋方大将，金方获得胜利!";

--下面这句是给获胜方发的信息，欢庆鼓舞的话语!
str = "<#>太好了！["..GetName().."<#>]杀死了宋将，我们金人赢了这场战斗!将士们欢呼呀！";

Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 2);
resultstr = WinBonus(2, 1);
str1 = str1..resultstr;
SetMissionV(2,1);
SetMissionV(MS_STATE,3);
AddGlobalCountNews(str1, 3);
CloseMission(1);
end;

