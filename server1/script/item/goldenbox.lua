-- ���������Ʒ��������һ����Ʒ��
-- By: Dan_Deng(2004-06-01)

function main(sel)
	p=random(0,99)
	if (p < 5) then
		p = random(238,240)
		AddEventItem(p)			-- ˮ��
		Msg2Player("��õ�һ��ˮ����")
	elseif (p < 10) then
		AddEventItem(353)			-- �ɺ�
		Msg2Player("��õ�һ���ɺ챦ʯ��")
	elseif (p < 20) then
		AddItem(6,1,15,1,0,0,0)		-- ����
		Msg2Player("��õ�һ�����磡")
	elseif(p < 40) then
		AddItem(6,1,18,1,0,0,0)		-- ������ӡ
		Msg2Player("��õ�һֻ������ӡ����")
	elseif (p < 65) then
		AddItem(6,1,19,1,0,0,0)		-- �����
		Msg2Player("��õ�һ�����꼪�����")
	else
		AddItem(6,0,20,1,0,0,0)		-- õ����
		Msg2Player("��õ�һ��õ�廨��")
	end
	return 0
end
