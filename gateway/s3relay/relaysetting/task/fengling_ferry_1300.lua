function TaskShedule()
	--���÷�������
	TaskName("�����1300")
	TaskTime(13, 00);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(1440) --60����һ��
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg("=================�����==================");
end

function TaskContent()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end