--close_citydefence_1700.lua
--�ر�����ս��

function TaskShedule()
	TaskName("�����������");	

	-- һ��һ�Σ���λ����
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(15, 30);
	OutputMsg(format("'��������' �Ѿ�����%d:%d...", 15, 30));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	OutputMsg("���������ѽ���");
	GlobalExecute("dw CityDefence_CloseMain()");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
