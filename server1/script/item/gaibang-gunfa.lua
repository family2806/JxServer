--Created by fangjieying 2003-5-17
--��ؤ�������
--ѧ�������޹�����
--ؤ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(359)
	if(party ~= "gaibang") then							-- ����ؤ��
		Msg2Player("�����š�ؤ��������о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- ��ؤ�ﵫδ��80��
		Msg2Player("�����š�ؤ������������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ�ؤ�����������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(359,1)
		Msg2Player("ѧ���˼��ܡ������޹�����")
		return 0
	end
end