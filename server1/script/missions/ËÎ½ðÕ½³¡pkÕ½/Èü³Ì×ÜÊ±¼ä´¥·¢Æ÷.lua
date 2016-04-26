Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");
function OnTimer()

State = GetMissionV(1) ;
if (State == 0) then
return
end;

--在规定时间内，两大军队未有一方杀死敌主将，则比赛结束
--比如 某某大将:将士们!据通讯兵通报，敌军找来了后方增援部队，我们错过了..机会。现在退兵...等等..
Msg2MSAll(1, "天色已晚，暂且鸣金收兵！留待明日再战，不杀敌将誓不还！");
SetMissionV(MS_STATE,3);
CloseMission(1);
end;