--�����Ž��ء���̳����
Include("\\script\\gb_taskfuncs.lua")
LG_PARTNER_JITAN_NAME = "��̳"
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
	TaskName( "�����Ž��ء���̳����" );
	--����������㿪ʼ
	local h, m = GetNextTime();
	TaskTime(h, m);
	TaskInterval( 60 );
	TaskCountLimit( 0 );
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 0)
	end
	-- ���������Ϣ
	OutputMsg( "�����Ž��ء���̳����" );
end

function TaskContent()
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 1)
	end
	GlobalExecute("dw Msg2SubWorld ( [ [�����Ž��أ�ɱ̳�����Ѿ���������ڽ�����ͬ��������ͬ��ͨ��<color=yellow>�����Ž���<color> ����̽�ս���.]]) ")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
