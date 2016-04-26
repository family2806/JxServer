

function TaskShedule()
	--设置方案名称
	TaskName("闯关活动每日排行榜")
	
	TaskTime(0, 0);
	
	--设置间隔时间，单位为分钟
	TaskInterval(1440) --30分钟一次
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("=================闯关活动每日排行榜==================");
end

function TaskContent()
	name , value = Ladder_GetLadderInfo(10235, 1);
	value = value * (-1);
	if (name ~= "") then
		local szTime	= format("%s 分钟 %s 秒", floor(value/60), floor(mod(value, 60)));
		local szMsg 	= format("恭喜<%s> 已完成<时间挑战> 以最短时间 <%s>", name, szTime);
		GlobalExecute(format("dw AddGlobalNews([[%s]], 10)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
	Ladder_ClearLadder(10235);
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


