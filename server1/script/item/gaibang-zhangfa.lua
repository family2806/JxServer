--Created by fangjieying 2003-5-17
--��ؤ���Ʒ���
--ѧ��������켼��
--ؤ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(357)
	if(party ~= "gaibang") then							-- ����ؤ��
		Msg2Player("�����š�ؤ���Ʒ����о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- ��ؤ�ﵫδ��80��
		Msg2Player("�����š�ؤ���Ʒ��������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ�ؤ���Ʒ�������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(357,1)
		Msg2Player("ѧ���˼��ܡ��������족��")
		return 0
	end
end