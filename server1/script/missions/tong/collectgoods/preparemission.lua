Include([[\script\missions\tong\collectgoods\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "�����������ټ�����ʿȥ���������˵Ļ������������ҿ��Ե�����ܹܴ������μ�."
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_COLLG_PHASE, 1);	--���Կ�ʼ������
	gb_SetTask(COLLG_NAME, 1, 1);
	StartMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME, COLLG_RUNINTERVER);
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME);
	SetGlbValue(GLB_COLLG_PHASE, 2); --��ֹ�ٽ�������
	gb_SetTask(COLLG_NAME, 1, 2);
	collg_gameover(COLLG_MAPID[1], COLLG_PREPAREMISSIONID);
end;

function OnLeave()
end
