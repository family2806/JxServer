-- Created by fangjieying 2003-5-17
-- ����ꡤ���䡷
-- ѧ�Ἴ���������
-- ���̣�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(391)
	if(party ~= "tianren") then							-- ��������
		Msg2Player("�����š���ꡤ���䡷�о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �����̵�δ��80��
		Msg2Player("�����š���ꡤ���䡷�����˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ���ꡤ���䡷����͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(391,0)	
		Msg2Player("ѧ���˼��ܡ�������ġ���")
		return 0
	end
end