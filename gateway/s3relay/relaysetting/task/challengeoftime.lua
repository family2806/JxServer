-- 时间的挑战比赛定时器

INTERVAL_TIME = 60	-- 每小时触发
-- INTERVAL_TIME = 10	-- 每小时触发

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName("'挑战时间'比赛");	

	-- 60分钟一次
	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("'挑战时间'比赛根据在Server的时间  %d:%d...", h, m));
	-- 执行无限次
	TaskCountLimit(0);

	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()
	OutputMsg("'挑战时间'比赛正在报名");
	-- 触发GameServer上的脚本
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "'挑战时间'比赛报名时间已开始，队长快去摄试尘报名. 报名时间为10分钟."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
