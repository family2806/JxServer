--close_citydefence_1700.lua
--关闭卫国战争

function TaskShedule()
	TaskName("卫国烽火连城");	

	-- 一天一次，单位分钟
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(17, 0);
	OutputMsg(format("'卫国连城' 已经结束%d:%d...", 17, 0));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	OutputMsg("卫国连城已结束");
	GlobalExecute("dw CityDefence_CloseMain()");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
