-- Created by fangjieying 2003-5-17
-- ������������������
-- ѧ�Ἴ��׷���
-- ������80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(322)	
	if(party ~= "tianwang") then							-- ��������
		Msg2Player("�����š������������������о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- ��������δ��80��
		Msg2Player("�����š����������������������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ���������������������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(322,1)										-- ѧ�Ἴ�� 
		Msg2Player("ѧ���˼��ܡ�����ն����")
		return 0
	end
end