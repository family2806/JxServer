--帮会维护脚本
--by luobaohang 06/03/10
IncludeLib("TONG")
-- 帮会维护定时器
INTERVAL_TIME = 1440	-- 每24小时触发7次
function TaskShedule()
	TaskName("每日维修");
	-- 1440分钟一次
	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间(0点0分)
	TaskTime(0, 0);
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("启动帮会维修.......................")
	while (nTongID ~= 0)do
		OutputMsg("正在进行维修:  "..TONG_GetName(nTongID))
		TONG_ApplyMaintain(nTongID)
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
