--Created by fangjieying 2003-5-17
--������ȭ������һ��
--ѧ���Ħ�ɽ�����
--���֣�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(318)
	if(party ~= "shaolin") then							-- ��������
		Msg2Player("�����š�����ȭ������һ���о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �����ֵ�δ��80��
		Msg2Player("�����š�����ȭ������һ�������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ�����ȭ������һ������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(318,1)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˼��ܡ���Ħ�ɽ�����")
		return 0
	end
end