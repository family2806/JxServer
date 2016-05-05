-- description	: 闯关活动触发器，由Relay每小时触发
-- author		: wangbin
-- datetime		: 2005-07-14

Include("\\settings\\trigger_include.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")

function OnTrigger()
	-- DEBUG
	print("trigger_challengeoftime start...");
	-- TODO: 修改任务参数
	-- 重启missions
	close_missions(map_map, MISSION_MATCH, VARV_STATE);
	start_missions(map_map, MISSION_MATCH);
end

OnTrigger();