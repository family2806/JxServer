Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua")

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "官府开始让人去驱赶怪兽"..FE_ANIMALNAME..", 大家快到衙门差役那里报名参加.";
	AddGlobalNews(strGlbNews);
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	SetGlbValue(GLB_FE_PHASE, 1);	--可以开始报名了
	StartMissionTimer(FE_PREPAREMISSIONID, FE_PREPARETIME, FE_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(FE_PREPAREMISSIONID, FE_PREPARETIME);
	SetGlbValue(GLB_FE_PHASE, 2); --禁止再进来报名
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
	
	festival_gameover(FE_MAPID[1], FE_PREPAREMISSIONID);
end;

function OnLeave()
end
