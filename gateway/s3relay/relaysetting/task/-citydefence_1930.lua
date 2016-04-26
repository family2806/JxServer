--citydefence.lua
-- 卫国战争之烽火连城

function TaskShedule()
	TaskName("卫国烽火连城");	

	-- 一天一次，单位分钟
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(19, 30);
	OutputMsg(format("' 卫国连城 ' 已经开始 %d:%d...", 19, 30));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local weekdate = CloudOpen_Defence()
	if (weekdate == nil) then
		OutputMsg("it is not saturday or sunday,so citydefence will not open")
		return
	end
	if (weekdate == 6) then
		OutputMsg("'卫国连城' 金方已开始报名.");
		GlobalExecute("dw CityDefence_OpenMain(2)");
	else
		OutputMsg("'卫国连城'  宋方已开始报名.");
		GlobalExecute("dw CityDefence_OpenMain(1)");
	end
end

function CloudOpen_Defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= 6 and weekdate ~= 0) then
		return nil
	end
	return weekdate
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
