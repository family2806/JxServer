-- 战役系统
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- 设置方案名称
	TaskName( "自动信息-通告" );
	-- 10分钟一次
	TaskInterval( 1 );
	-- 0时0分开始（不设TaskTme, 则是Relay启动时就开始）
--	TaskTime( 18, 32 );
	-- 设置触发次数，0表示无限次数
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "BATTLE 1 startup..." );
end

function TaskContent()
	Battle_StartNewRound( 1, 1 );	-- GM指令，启动新战局
end