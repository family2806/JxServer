--close_citydefence_1700.lua
--�ر�����ս��

function TaskShedule()
	TaskName("�����������");	

	-- һ��һ�Σ���λ����
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(17, 0);
	OutputMsg(format("'��������' �Ѿ�����%d:%d...", 17, 0));
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
