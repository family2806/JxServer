--Created by fangjieying 2003-5-17
--�����������Ź����ǡ�
--ѧ��Ź����Ǽ���
--���ţ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(342)
	if(party ~= "tangmen") then							-- ��������
		Msg2Player("�����š����������Ź����ǡ��о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �����ŵ�δ��80��
		Msg2Player("�����š����������Ź����ǡ������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ����������Ź����ǡ�����͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(342,1)
		Msg2Player("ѧ���˼��ܡ��Ź����ǡ���")
		return 0
	end
end