-- 战役系统
-- Fanghao_Wu 2004-12-6
Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

function TaskShedule()
	-- 设置方案名称
	TaskName( "宋金战役总指挥" );
	TaskSetMode(1);

	--每周的（星期一)开始新的一轮
	TaskSetStartDay(1, 3);

	-- 一周一个循环
	TaskInterval(7);
	TaskTime(2, 0);
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("****************Create XIANGYANG New Battle********")
	battle_StartNewIssue(1, 1 );	
	battle_StartNewIssue(1, 2 );	
	battle_StartNewIssue(1, 3 );	
	OutputMsg("***************************************************")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
