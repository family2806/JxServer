-- 帮会招募弟子活动
Include("\\script\\gb_taskfuncs.lua");
function TaskShedule()
	FESTIVAL_SHREWMOUSE = "收集帮会物品";
	TaskName("收集帮会物品");	

	-- 3个小时一次，单位分钟
	TaskInterval(15);
	-- 设置触发时间
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);--求出未来3倍数+ 1 的钟头
	
	TaskTime(nBeginTime, 0);
	OutputMsg(format("收集帮会物品活动开始从 %d:%d?", nBeginTime, 0));
	-- 执行无限次
	TaskCountLimit(0);
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 3);
end

function TaskContent()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	nResult = hourcheck(nHour, nMin);
	if (nResult == 0) then
		return
	end

	OutputMsg("收集帮会物品活动已开始报名.");
	GlobalExecute("dwf \\script\\missions\\tong\\collectgoods\\collg_gmscript.lua collg_opencellectgoods( 827 )");	--827为帮会收集物品活动准备场的mapid
end

function hourcheck(nHour, nMin)
	if (mod(nHour, 3) ~= 2) then
		return 0;
	end
	if (nMin > 55) then
		return 0;
	end;
	return 1;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
