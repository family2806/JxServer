Include("\\script\\missions\\autohang\\head.lua")

function InitMission()
	WriteLog(GetLoop()..date("%m%d-%H:%M")..": ��ʼ�һ�!")
	StartMissionTimer(AEXP_MISSIONID, AEXP_TIMERID, AEXP_UPDATETIME);
	
	-- �����Ƿ���ѣ��Լ����鱶��(>=1)
	SetAutoHangFreeFlag(AEXP_IsFreeTimeDoubleExp(), AEXP_FREEDATE_EXPFACTOR);
end;

function RunMission()
end;

function EndMission()
	WriteLog(GetLoop()..date("%m%d-%H:%M")..": �����һ�!");
	StopMissionTimer(AEXP_MISSIONID, AEXP_TIMERID);
end;
