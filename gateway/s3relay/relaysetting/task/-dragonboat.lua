-- ���۱�����ʱ��

INTERVAL_TIME = 60	-- ÿСʱ����

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
	TaskName("������");	

	-- 60����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("�����۶�ʱ�ӱ�������%d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	OutputMsg("��ʼ�����۱���...");
	-- ����GameServer�ϵĽű�
	GlobalExecute("dw LoadScript([[\\settings\\trigger.lua]])");
end
