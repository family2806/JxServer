--����֮��Relay�˴����ű�

function GameSvrConnected(dwGameSvrIP)
rolename = GetStringFromSDB("LuckyStar", 0, 0);
if (rolename ~= "") then
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end;
	str = format("��Ϸ������������%d Relay,֮ǰ������Ϊ%s", dwGameSvrIP, rolename)
	OutputMsg(str);
end;

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	TaskName("������")
	TaskTime(12, 0)
	TaskInterval(360)
	TaskCountLimit(0)
end

function TaskContent()
	accname, rolename = RandomSelAOnlinePlayer()
	date = GetCurrentTime()
	success = SaveStringToSDBOw("LuckyStarLog", date, 0, rolename)
	success = SaveStringToSDBOw("LuckyStar", 0, 0, rolename)
	str = format("�³��ֵ�������Ϊ%s",rolename)
	OutputMsg(str);
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end

