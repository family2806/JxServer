Include([[\script\missions\tong\tong_disciple\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "各帮会举行各位人士去招募弟子，作为后备力量活动坊总管正等着大家的帮助."
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_DIS_PHASE, 1);	--可以开始报名了
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 1);
	StartMissionTimer(DIS_PREPAREMISSIONID, DIS_PREPARETIME, DIS_RUNINTERVER); --
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(DIS_PREPAREMISSIONID, DIS_PREPARETIME);
	gameover(DIS_MAPID[1], DIS_PREPAREMISSIONID);
end;

function OnLeave()
end
