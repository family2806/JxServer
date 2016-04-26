--长歌门禁地　祭坛任务
Include("\\script\\gb_taskfuncs.lua")
LG_PARTNER_JITAN_NAME = "祭坛"
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
	TaskName( "长歌门禁地　祭坛任务" );
	--启动后的正点开始
	local h, m = GetNextTime();
	TaskTime(h, m);
	TaskInterval( 60 );
	TaskCountLimit( 0 );
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 0)
	end
	-- 输出启动消息
	OutputMsg( "长歌门禁地　祭坛任务" );
end

function TaskContent()
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 1)
	end
	GlobalExecute("dw Msg2SubWorld ( [ [长歌门禁地，杀坛灵力已经复活，他正在叫他的同伙，带着你的同伙通过<color=yellow>长歌门禁地<color> 侵入探险禁地.]]) ")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
