-- Created by fangjieying 2003-5-17
-- ��������������һ��
-- ѧ�Ἴ������ն
-- ������80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(325)
	if(party ~= "tianwang") then							-- ��������
		Msg2Player("�����š�������������һ���о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- ��������δ��80��
		Msg2Player("�����š�������������һ�������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ�������������һ������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(325,1)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˼��ܡ�׷�������")
		return 0
	end
end