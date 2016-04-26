Include("\\script\\gb_taskfuncs.lua")
GN_EVENTNAME = "煌之章活动"
GN_HUANG_EVENTID = 1
GN_HUANG_SWITH = 2
GN_HUANG_DATE = 3
TB_HUANGZHIZHANG_EVENT = {
		"宋金战场",
		"信使任务 ",
		"挑战时间",
		"野叟任务",
		--"同伴剧情任务修炼篇、同伴修炼任务",
	}
	
TB_HUANGZHIZHANG_RATE = {
		50,
		0,
		25,
		25,
}

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 25;
end
function TaskShedule()
	--设置方案名称
	TaskName(GN_EVENTNAME)

	h, m = GetNextTime()
	TaskTime(h, m);
	--设置间隔时间，单位为分钟
	TaskInterval(30)
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
--每次重启清除活动内容
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		gb_SetTask(GN_EVENTNAME, GN_HUANG_DATE, 0)
	end
	gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
	OutputMsg("煌之章")
end

function TaskContent()
	local nDate = tonumber(date("%m%d"))
	local nHour = tonumber(date("%H%M"))
	--活动时间在21：00~23：00
	--00:00通知当晚活动内容
	
	local event_date = gb_GetTask(GN_EVENTNAME, GN_HUANG_DATE)
	--每天第一次活动时间内，随机选活动
	if (event_date == 0 or event_date ~= nDate) then
		local nrand = random(1, 100);
		local nsum = 0;
		local event_event = 1;
		for i = 1, getn(TB_HUANGZHIZHANG_RATE) do
			nsum = nsum + TB_HUANGZHIZHANG_RATE[i];
			if (nsum >= nrand) then
				event_event = i;
				break
			end;
		end;
		gb_SetTask(GN_EVENTNAME, GN_HUANG_EVENTID, event_event)
		gb_SetTask(GN_EVENTNAME, GN_HUANG_DATE, nDate)
		OutputMsg(date().."辉煌夜,辉煌夜活动为"..TB_HUANGZHIZHANG_EVENT[event_event])
		local szMsg = format("[辉煌夜活动]: 今晚，活动<color=yellow>%s<color> 双倍奖励为%s, 开始时间19h45, 各位大侠快去参加.",
						"煌之章",
						TB_HUANGZHIZHANG_EVENT[event_event]);
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		return
	end
	
	--非活动时间关闭开关
	if (nHour < 1945 or nHour >= 2145) then
		if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) ~= 0) then
			gb_SetTask(GN_EVENTNAME, GN_HUANG_EVENTID, 0)
			gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
			local szMsg = format("今晚, <color=yellow><color>双倍奖励活动已结束.", "煌之章");
			GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
			GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		end
		return
	end
	
	--在20：55时间开启活动开关
	if (nHour >= 1945 and nHour <= 2145 + 3) then
		local event_event = gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID)
		gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 1)
		OutputMsg(date().."开始辉煌夜活动")
		local szMsg = format("[辉煌夜活动]: 活动 <color=yellow>%s<color>已开始，活动内容为%s. 大家快去参加.",
							"煌之章",
							TB_HUANGZHIZHANG_EVENT[event_event])
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
--	GlobalExecute("dw AddLocalNews([[[辉煌之夜活动]：煌之章活动正在进行中，各位玩家可以在礼官处查询奖励双倍的活动内容，请各位尽情享受独孤盟主的馈赠。]])")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
