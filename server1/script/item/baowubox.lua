-- ���������Ʒ��������һ����Ʒ��
-- By: Yuning_liu(2005-03-21)

function main(sel)
	p=random(0,99)
	if (p < 1) then
		p = random(238,240)
		AddEventItem(p)			-- ˮ��
		Msg2Player("��õ�һ��ˮ����")
	elseif (p < 2) then
		AddEventItem(353)			-- �ɺ�
		Msg2Player("��õ�һ���ɺ챦ʯ��")
	elseif (p < 33) then
		AddItem(6,1,15,1,0,0,0)		-- ����
		Msg2Player("��õ�һ�����磡")
	elseif (p < 66) then
		AddItem(6,1,18,1,0,0,0)		-- ������ӡ
		Msg2Player("��õ�һֻ������ӡ����")
	else
		AddItem(6,0,20,1,0,0,0)		-- õ����
		Msg2Player("��õ�һ��õ�廨��")
	end
	return 0
end
