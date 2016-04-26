--花灯活动
--每晚19：00~21：00 每15分钟 在华山，青城山，点苍山，武夷山
--四个地点分别 产生300个花灯
LANTERN_DATE_START	= 20080611
LANTERN_DATE_END	= 20080713
LANTERN_TIME_START 	= 1900
LANTERN_TIME_END	= 2100

function TaskShedule()
	-- 设置方案名称
	TaskName("花灯活动");
	TaskTime(19, 00);
	TaskInterval(15);
	TaskCountLimit(0);
	OutputMsg("启动花灯活动"..date("%H%M"));
end

function TaskContent()
	local nTime	= tonumber(date("%H%M"));
	local nDate	= tonumber(date("%Y%m%d"));
	
	if (nDate >= LANTERN_DATE_START and nDate <= LANTERN_DATE_END and nTime >= LANTERN_TIME_START and nTime <= LANTERN_TIME_END) then
		if (nTime == LANTERN_TIME_END) then
			GlobalExecute("dw del_all_lantern()");
			return 0;
		end
		GlobalExecute("dw Msg2SubWorld([[你快去青城山，武夷山，点苍山，华山，只需要解答对3个谜语就获得丰厚的礼品!]])");
		GlobalExecute("dw create_lanterns()");
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end