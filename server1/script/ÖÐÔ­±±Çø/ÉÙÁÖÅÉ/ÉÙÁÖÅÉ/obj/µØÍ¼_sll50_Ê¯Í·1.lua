-- ��ͼ��Ʒ �����º����� ʯͷ1 ����50������
-- by��Dan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+30) and (HaveItem(28) == 0) then		--����50��������
		i = GetTaskTemp(47)
		if (i == 2) then
			Talk(1,"","ʯͷ������Ų����������������б���")
			AddEventItem(28)
			AddNote("�õ��׽. ")
			Msg2Player("�õ��׽. ")
			SetTaskTemp(47,0)			--��λ��ʱ��������һ������...
		elseif (i == 1) then
			Talk(1,"","��������ʯͷ��, �����е�ת��")
			SetTaskTemp(47,2)
		else
			Talk(1,"","��������ʯͷ��, ���ǣ�����Ȼ���� ")
			SetTaskTemp(47,1)
		end
	else
		Talk(1,"","��������ʯͷ��, ���ǣ�����Ȼ����")
	end
end;
