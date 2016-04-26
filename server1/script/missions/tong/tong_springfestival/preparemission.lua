Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = format("这个傀儡官府正在睡觉，需要麻烦各位帮会人士去驱赶%s，哪位人士想帮忙可以到总活动坊报名参加 .",SF_ANIMALNAME);
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_SF_PHASE, 1);	--可以开始报名了
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	StartMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME, SF_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME);
	festival_gameover(SF_MAPID[1], SF_PREPAREMISSIONID);
end;

function OnLeave()
end
