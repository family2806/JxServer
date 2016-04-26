Include("\\script\\missions\\autohang\\head.lua")

function InitMission()
	WriteLog(GetLoop()..date("%m%d-%H:%M")..": 开始挂机!")
	StartMissionTimer(AEXP_MISSIONID, AEXP_TIMERID, AEXP_UPDATETIME);
	
	-- 设置是否免费，以及经验倍数(>=1)
	SetAutoHangFreeFlag(AEXP_IsFreeTimeDoubleExp(), AEXP_FREEDATE_EXPFACTOR);
end;

function RunMission()
end;

function EndMission()
	WriteLog(GetLoop()..date("%m%d-%H:%M")..": 结束挂机!");
	StopMissionTimer(AEXP_MISSIONID, AEXP_TIMERID);
end;
