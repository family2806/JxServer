Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("大理-擂台赛开始");
	TaskSetMode(1);
	
	-- 2005年1月4号(星期二)第一次开始
	TaskSetStartDay(1, 4);

	-- 一周一个循环
	TaskInterval(7);
	
	-- 20点00分开赛
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 大理编号为3,必须跟citywar.ini中指定的一致
	if (cw_CanStart(3,3) == 1) then
		StartArena(3);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
