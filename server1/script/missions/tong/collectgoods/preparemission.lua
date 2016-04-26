Include([[\script\missions\tong\collectgoods\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "武林盟主正召集各人士去找西夏商人的货物袋回来，大家可以到活动坊总管处报名参加."
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_COLLG_PHASE, 1);	--可以开始报名了
	gb_SetTask(COLLG_NAME, 1, 1);
	StartMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME, COLLG_RUNINTERVER);
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME);
	SetGlbValue(GLB_COLLG_PHASE, 2); --禁止再进来报名
	gb_SetTask(COLLG_NAME, 1, 2);
	collg_gameover(COLLG_MAPID[1], COLLG_PREPAREMISSIONID);
end;

function OnLeave()
end
