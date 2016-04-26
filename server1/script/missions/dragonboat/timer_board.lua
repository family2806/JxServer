-- description	: 通告定时器，每分钟触发一次
-- author		: wangbin
-- datetime		: 2005-06-07

Include("\\script\\missions\\dragonboat\\include.lua")

function OnTimer()
	if (GetMSPlayerCount(MISSION_MATCH) ~= 0) then
		local time = GetMissionV(VARV_BOARD_TIMER) + INTERVAL_BOARD * 60;
		local batch = GetMissionV(VARV_NPC_BATCH);
		local count = GetMissionV(VARV_NPC_COUNT);
		SetMissionV(VARV_BOARD_TIMER, time);
		
		local msg = "<#> 已经进行比赛了!" .. floor(time / 60) 
			.. "分钟，现在是 "
			.. batch
			.. "怪物，还剩 "
			.. count
			.. "怪物.";
		Msg2MSAll(MISSION_MATCH, msg);
	end
end

