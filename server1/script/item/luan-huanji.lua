--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--�����������һ�����
--ѧ���һ�������
--���ţ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(351)
	if(party ~= "tangmen") then							-- ��������
		Msg2Player("�����š����������һ������о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �����ŵ�δ��80��
		Msg2Player("�����š����������һ����������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ����������һ���������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(351,0)
		Msg2Player("ѧ���˼��ܡ��һ�������")
		return 0
	end
end