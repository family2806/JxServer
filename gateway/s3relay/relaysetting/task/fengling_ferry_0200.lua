function TaskShedule()
	--设置方案名称
	TaskName("风陵渡0200")
	TaskTime(2, 0);
	
	--设置间隔时间，单位为分钟
	TaskInterval(1440) --60分钟一次
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("=================风陵渡==================");
end

function TaskContent()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end