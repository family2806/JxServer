-- Created by fangjieying 2003-5-17
-- ��̫�����ס������
-- ѧ�Ἴ�� �˽���һ
-- �䵱��80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(368)
	if(party ~= "wudang") then							-- �����䵱
		Msg2Player("���о�̫������-��2�����ˣ���Ȼû������ʲô")
		return 1
	elseif(GetLever < 80) then							-- ���䵱��δ��80��
		Msg2Player("���о�̫������-��2�����ˣ��������. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("���о�̫������-��2�����ˣ�������Ȼû��ѧ��ʲô")
		return 1
	else
		AddMagic(368,1)										-- ѧ�Ἴ��
		Msg2Player("ѧ���˽���һ����. ")
		return 0
	end
end