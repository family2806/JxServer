--Created by fangjieying 2003-5-17
--���ɵ����������Ӱ��
--ѧ�������Ӱ����
--���ţ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(339)
	if(party ~= "tangmen") then							-- ��������
		Msg2Player("�����š��ɵ����������Ӱ���о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �����ŵ�δ��80��
		Msg2Player("�����š��ɵ����������Ӱ�������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ��ɵ����������Ӱ������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(339,1)
		Msg2Player("ѧ���˼��ܡ������Ӱ����")
		return 0
	end
end