--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--��������������滨��
--ѧ�ᱩ���滨����
--���ţ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(302)
	if(party ~= "tangmen") then							-- ��������
		Msg2Player("�����š�������������滨���о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLevel() < 80) then							-- �����ŵ�δ��80��
		Msg2Player("�����š�������������滨�������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ�������������滨������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(302,1)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˼��ܡ������滨����")
		return 0
	end
end