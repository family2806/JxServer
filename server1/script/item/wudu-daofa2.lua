-- Created by fangjieying 2003-5-17
-- ���嶾�����������
-- ѧ�Ἴ������ն
-- �嶾��80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(355)
	if(party ~= "wudu") then							-- �����嶾
		Msg2Player("�����š��嶾������������о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- ���嶾��δ��80��
		Msg2Player("�����š��嶾����������������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ��嶾���������������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(355,1)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˼��ܡ�����ն����")
		return 0
	end
end