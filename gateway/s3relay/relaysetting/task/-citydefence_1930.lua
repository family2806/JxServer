--citydefence.lua
-- ����ս��֮�������

function TaskShedule()
	TaskName("�����������");	

	-- һ��һ�Σ���λ����
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(19, 30);
	OutputMsg(format("' �������� ' �Ѿ���ʼ %d:%d...", 19, 30));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local weekdate = CloudOpen_Defence()
	if (weekdate == nil) then
		OutputMsg("it is not saturday or sunday,so citydefence will not open")
		return
	end
	if (weekdate == 6) then
		OutputMsg("'��������' ���ѿ�ʼ����.");
		GlobalExecute("dw CityDefence_OpenMain(2)");
	else
		OutputMsg("'��������'  �η��ѿ�ʼ����.");
		GlobalExecute("dw CityDefence_OpenMain(1)");
	end
end

function CloudOpen_Defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= 6 and weekdate ~= 0) then
		return nil
	end
	return weekdate
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
