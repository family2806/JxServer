-- description	: 关闭比赛定时器
-- author		: wangbin
-- datetime		: 2005-07-13

Include("\\script\\missions\\challengeoftime\\include.lua")

function timeout()
	Msg2MSAll(MISSION_MATCH, "<#> 做任务时间已结束，你的队伍挑战失败");
end

function OnTimer()
	timeout();
	-- 关闭自己
	close_close_timer();
	-- 结束比赛
	close_match();
	-- 关闭公告定时器
	close_board_timer();
end
