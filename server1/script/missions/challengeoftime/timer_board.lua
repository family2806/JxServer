-- description	: 通告定时器，每分钟触发一次
-- author		: wangbin
-- datetime		: 2005-06-07

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnTimer()
	if (GetMSPlayerCount(MISSION_MATCH) ~= 0) then
		local time = GetMissionV(VARV_BOARD_TIMER) + INTERVAL_BOARD * 60;
		local batch = GetMissionV(VARV_NPC_BATCH);
		local count = GetMissionV(VARV_NPC_COUNT);
		SetMissionV(VARV_BOARD_TIMER, time);
		
		local msg = "<#> '挑战时间'任务过去了" .. floor(time / 60) 
			.. "分钟, 现在是"
			.. batch
			.. "关, 还有"
			.. count
			.. "小怪.";
		Msg2MSAll(MISSION_MATCH, msg);
	end
end

