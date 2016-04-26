--帮会维护脚本
--by luobaohang 06/03/10
IncludeLib("TONG")
-- 帮会维护定时器
INTERVAL_TIME = 999999
function TaskShedule()
	TaskName("旧帮会已启动");
	-- 设置触发时间(即时执行)
	-- 执行1次
	TaskCountLimit(1);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("旧帮会已启动.......................")
	while (nTongID ~= 0)do
		if (TONG_GetDay(nTongID) <= 0)then
			OutputMsg("正在运行旧帮会"..TONG_GetName(nTongID))
			TONG_ApplyInit(nTongID)
		end	
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
