-- Created by fangjieying 2003-5-17
-- ���ն��ؼ���
-- ѧ�Ἴ���ն�����
-- ���ң�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(332)	
	if(party ~= "emei") then							-- ���Ƕ���
		Msg2Player("�����š��ն��ؼ����о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �Ƕ��ҵ�δ��80��
		Msg2Player("�����š��ն��ؼ��������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ��ն��ؼ�������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(332)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˼��ܡ��ն���������")
		return 0
	end
end