-- �׵۵ı��ر�����ʱ��
--ÿ������2�㵽����12�����㴥��

--by С�˶��
--2007.10.22
INTERVAL_TIME = 60	-- ÿСʱ����
Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\leaguematch\\head.lua")

function GetNextTime()	--ÿ������1��55������23��55 ��������
	-- �ı��׵����ܲμӵı���ʱ��-Modifiled by AnhHH - 20110802
    local hour = tonumber(date("%H"));
    if (hour == 24) then
    	hour = 13;
    elseif(hour <= 14) then
    	hour = 14
    else
    	hour = hour + 1;
    end
    return hour, 25;
end

function TaskShedule()
	TaskName("YANDIBAOZANG");	
	
	-- 60����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("[YANDIBAOZANG] Task Start At %d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);
	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	local TB_YDBZ_DATE_START =	--��������(ʱ)
	{
		14,16,18,20,22,
	}
	
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_YDBZ_DATE_START do
		-- �ı��׵����ܲμӵı���ʱ�� -Modifiled by AnhHH - 20110802
		if (nhour == ndate_hour) then
			
--			if gb_GetModule("YANDIBAOZANG") == 1 and gb_GetModule("YANDIBAOZANG_TALK") == 1 then
				OutputMsg("[YANDIBAOZANG]"..tonumber(date("%H"))..":55 StartSignUp...");
				-- ����GameServer�ϵĽű�
				--GlobalExecute("dw LoadScript([[\\settings\\trigger_challengeoftime.lua]])");
				GlobalExecute("dwf \\script\\missions\\yandibaozang\\yandibaozang_trigger.lua YDBZ_OnTrigger()");
				szMsg = "�׵۱��ش��ػ�ѿ�ʼ�����ˣ���ҿ�ȥ�꾩��ƼƼ���ﴦ�Ǽǣ�����ʱ��Ϊ�����."
				GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
--			end
			break;
		end
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end