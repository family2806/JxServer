IncludeLib("SETTING"); --����SETTING�ű�ָ���

function main()
	p = random(0,99)
	if (p < 50) then
		AddItem(0,2,28,2,0,0,0)		-- �����
		Msg2Player("��ϲ��õ��½���������װ֮����ף�ף�����쿪��!")
		return 0
	else
		AddItem(0,2,28,5,0,0,0)		-- ����ȹ
		Msg2Player("��ϲ��õ��½���������װ֮����ȹ��ף�����쿪��!")
		return 0
	end
	
end