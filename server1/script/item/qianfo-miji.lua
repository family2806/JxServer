-- Created by fangjieying 2003-5-17
-- ��ǧ���ؼ���
-- ѧ�Ἴ��ǧ��ǧҶ
-- ���ң�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(380)
	if(party ~= "emei") then							-- ���Ƕ���
		Msg2Player("�����š����ҷ�����ؼ����о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �Ƕ��ҵ�δ��80��
		Msg2Player("�����š����ҷ�����ؼ��������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ����ҷ�����ؼ�������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(380,1)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˼��ܡ���˪��Ӱ����")
		return 0
	end
end