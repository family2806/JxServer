--幸运之星Relay端触发脚本

function GameSvrConnected(dwGameSvrIP)
rolename = GetStringFromSDB("LuckyStar", 0, 0);
if (rolename ~= "") then
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end;
	str = format("游戏服务器：连接%d Relay,之前幸运星为%s", dwGameSvrIP, rolename)
	OutputMsg(str);
end;

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	TaskName("幸运星")
	TaskTime(12, 0)
	TaskInterval(360)
	TaskCountLimit(0)
end

function TaskContent()
	accname, rolename = RandomSelAOnlinePlayer()
	date = GetCurrentTime()
	success = SaveStringToSDBOw("LuckyStarLog", date, 0, rolename)
	success = SaveStringToSDBOw("LuckyStar", 0, 0, rolename)
	str = format("新出现的幸运星为%s",rolename)
	OutputMsg(str);
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end

