Include("\\script\\missions\\championship\\tryout\\head.lua")
function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	StartMissionTimer(MISSIONID, 34, TRYOUT_TIMER_2);
	StartMissionTimer(MISSIONID, 33, TRYOUT_TIMER_1);
	
	SetMissionV(MS_STATE,1);--��������
	RunMission(MISSIONID)
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(MISSIONID, 33);
	StopMissionTimer(MISSIONID, 34);
	GameOver();
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	if(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		resultstr = "���ִ������Ԥѡ���Ѿ����������λ���ٰ������ִ���Ա(182, 203)������. �����е���ҿ��Ե����ִ���Ա��(182, 203)������."
	else
		resultstr = "��������ִ��Ԥѡ���ѽ�������λѡ������Լ��������."
	end
	AddGlobalNews(resultstr) 
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetCreateTeam(1);
	DisabledStall(0)	--�����̯
	SetTaskTemp(200, 0)
	SetDeathScript("");--���������ű�Ϊ��
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	ForbitTrade(0);
	RestoreOwnFeature();
end;