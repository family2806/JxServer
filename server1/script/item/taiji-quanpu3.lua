-- Created by fangjieying 2003-5-17
-- ��̫��ȭ�ס�������
-- ѧ�Ἴ�� ����޼�
-- �䵱��80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(365)
	if(party ~= "wudang") then							-- �����䵱
		Msg2Player("�����š�̫��ȭ�ס��������о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- ���䵱��δ��80��
		Msg2Player("�����š�̫��ȭ�ס������������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ�̫��ȭ�ס�����������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(365,1)	
		Msg2Player("ѧ���˼��ܡ�����޼�����")
		return 0
	end
end