--Created by fangjieying 2003-5-17
--��Ԧ������
--ѧ���ѩХ�缼��
--���أ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(372)
	if(party ~= "kunlun") then							-- ��������
		Msg2Player("�����š�Ԧ�������о��˰��죬���ʲôҲû���򵽡�")
		return 1
	elseif(GetLever < 80) then							-- �����ص�δ��80��
		Msg2Player("�����š�Ԧ�����������˰��죬����������٣�ûʲôЧ����")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���Ѿ��ѡ�Ԧ����������͸����������Ҳѧ�����κζ�����")
		return 1
	else
		AddMagic(372,1)
		Msg2Player("ѧ���˼��ܡ���ѩХ�硱��")
		return 0
	end
end