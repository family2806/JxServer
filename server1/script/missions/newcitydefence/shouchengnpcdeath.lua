----------------------------------------------------------------
--FileName:	npcdeath.lua
--Creater:	firefox
--Date:		2005-11-25
--Comment:	周末活动：卫国战争之烽火连城
--			功能：守城方士兵、将军死亡脚本
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")

function OnDeath(nNpcIndex)
	SetMissionV( MS_SHOUCHENGWEIBING, GetMissionV( MS_SHOUCHENGWEIBING ) - 1 )
	if (rank == 2) then
		SetMissionV( MS_SHOUCHENGJIANGJUN, GetMissionV( MS_SHOUCHENGJIANGJUN ) - 1)
		Msg2MSAll(MISSIONID, "守城战报:<color=pink>1 名我方守城将军死亡.")
	end
	if (GetMissionV( MS_SHOUCHENGJIANGJUN ) <= 0) then
		Msg2MSAll(MISSIONID, "守城战报:<color=pink>我方守城将军死亡.")
		CloseMission( MISSIONID )
	end
end