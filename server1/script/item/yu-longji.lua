-- Created by fangjieying 2003-5-17
-- ����������ì����
-- ѧ�Ἴ�� ������
-- ���̣�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(361)
	if(party ~= "tianren") then							-- ��������
		Msg2Player("�����š���������ì�����о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �����̵�δ��80��
		Msg2Player("�����š���������ì���������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ���������ì��������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(361,1)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˼��ܡ�����������")
		return 0
	end
end