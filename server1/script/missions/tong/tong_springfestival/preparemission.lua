Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = format("������ܹٸ�����˯������Ҫ�鷳��λ�����ʿȥ����%s����λ��ʿ���æ���Ե��ܻ�������μ� .",SF_ANIMALNAME);
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_SF_PHASE, 1);	--���Կ�ʼ������
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	StartMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME, SF_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME);
	festival_gameover(SF_MAPID[1], SF_PREPAREMISSIONID);
end;

function OnLeave()
end
