--��ԭ���� �꾩�� ��������1�Ի�

--function main(sel)
--Say("�����������κ���ֻҪ˵���Դ����������Դǣ�������ץ������", 0);
--end;

--ͨ��ϵͳר�������ű�(BlackBay.2003.12.30)

FESTIVAL06_NPCNAME = "<color=yellow>��������:<color>";
Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	--�������ָ����ϵͳѯ�ʵ�ǰPlayer��ͨ�����״̬��Ϣ
	--��ѯ�Ľ�������Ժ�ϵͳ�ص�������ָ���ĺ�����
	Say("�κ���ֻҪ˵���Դ����������Դǣ�������ץ����! ", 0);
	--AskRelayForKillerStatus("KillerCallBack")
end;

--������������ǲ�ѯ����Ļص�����������������˳������ı�
function KillerCallBack(RewardMoney, RewardTaskID, CancelMoney, CancelTaskID, OwnCount, MyTaskCount)
	if (RewardMoney > 0) then
		--�����������֪ͨϵͳ����Ѿ���ȡ���ͽ�ע���һ������0��ʾ���ͽ𣬵ڶ���������ʾΪ�ĸ��������ͽ�
		GetTaskMoney(0, RewardTaskID)
		Earn(RewardMoney)
	elseif (CancelMoney > 0) then
		--�����������֪ͨϵͳ����Ѿ���ȡ���˻صı�Ľ�ע���һ������1��ʾ���˽𣬵ڶ���������ʾΪ�ĸ��������˽�
		GetTaskMoney(1, CancelTaskID)
		Earn(CancelMoney)
	elseif (OwnCount + MyTaskCount > 0) then
		Say("�����ǵ����ô����ú����ŵ������㵣��������?", 4, "����׷������ /CreateTask", "��׷������ /QueryTask", "���Լ�������/ModifyTask", "����ʲô/DoNothing")
	else
		Say("�����ǵ����ô����ú����ŵ������㵣��������?", 3, "����׷������/CreateTask", "��׷������/QueryTask", "����ʲô /DoNothing")
	end
end;

function CreateTask()
	--�����������֪ͨ�ͻ��˴򿪴�������Ľ���
	OpenCreateTask()
end;

function QueryTask()
	--���������������������ȡ�������͸���ҿͻ���
	OpenAllTask()
end;

function ModifyTask()
	--�������������������ȡ�������Լ��Ѵ����������͸���ҿͻ���
	OpenOwnTask()
end;

function DoNothing()
	Say("�κ���ֻҪ˵���Դ����������Դǣ�������ץ����! ", 0)
end;