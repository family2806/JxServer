Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\singlefight\\dt_head.lua")

function OnTimer()
	dtworld = GetMissionV(MS_DTWORLDINDEX)
	orgworld = GetMissionv(MS_ORGWORLDINDEX)

	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end;
	
	local str = "<#>单挑时间结束，金方"..GetMissionS(1).."<#> 与 宋方"..GetMissionS(2).."<#>打成平手！"
	
	Msg2MSAll(MISSIONID, str);
	SubWorld = orgworld
	Msg2MSAll(GetMissionV(MS_ORGMISSION),str)--通知宋金战的所有人
	SubWorld = dtworld
	CloseMission(MISSIONID);
end;
  