Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua")

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "又有一批新人来找失落的礼物。"
	AddGlobalNews(strGlbNews);
	gb_SetTask("圣诞活动", 1, 1);
	SetGlbValue(GLB_CH_PHASE, 1);	--可以开始报名了
	StartMissionTimer(CH_PREPAREMISSIONID, CH_PREPARETIME, CH_RUNINTERVER); --
end;

function RunMission()
	SetGlbValue(GLB_CH_PHASE, 2); --禁止再进来报名
end;

function EndMission()
	StopMissionTimer(CH_PREPAREMISSIONID, CH_PREPARETIME);
	SetGlbValue(GLB_CH_PHASE, 3); --禁止再进来报名
	gb_SetTask("圣诞活动", 1, 2);
end;

function OnLeave()
end
