-- ʱ�����ս������ʱ��

INTERVAL_TIME = 60	-- ÿСʱ����
-- INTERVAL_TIME = 10	-- ÿСʱ����

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
	TaskName("'��սʱ��'����");	

	-- 60����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("'��սʱ��'����������Server��ʱ��  %d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	OutputMsg("'��սʱ��'�������ڱ���");
	-- ����GameServer�ϵĽű�
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "'��սʱ��'��������ʱ���ѿ�ʼ���ӳ���ȥ���Գ�����. ����ʱ��Ϊ10����."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
