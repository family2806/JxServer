--description: ���ϱ��� �ɶ��� ������10������������
--author: yuanlan	
--date: 2003/5/24

function main()
	SetPropState()
	AddEventItem(118)
	Msg2Player("��һ��������. ")
	if (GetTask(1) > 10*256) and (GetTask(1) < 20*256) then
		AddNote("�ڳɶ����ߵ��������ҵ�һ��������. ")
	end
end;
