--description: ��ԭ���� �꾩�� ����1�Ի� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>����������ǰ���������̵�����ɺ���ˣ�������ʿ���Ͷ�����������Ʊ��У�����񡭡���˵Ҳ�գ�Ҫ��Ҫ����������ı��У�"

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),1)
		if (UTask_trsub60 == 0) then
			tiejiang_city("<dec><npc>�ҽ�����ʮ�ˣ���û��Ȣ��ϱ��������Ϊʲôû����ϲ�����أ�������˵����ʵ��ͦϲ���Ƕ����ŹѸ���������һֱ����������ף�������������.", "������������������!/L60_sub_yes")
		elseif (UTask_trsub60 == 1) then
			if (HaveItem(63) == 1) then
				tiejiang_city("<dec><npc>̫�鷳���ˣ����������͸�������?")
			else
				AddEventItem(63)
				Talk(1,"","�㻹û���������ߣ������������?")
			end
		elseif (UTask_trsub60 == 2) and (HaveItem(64) == 1) then
			Talk(2, "", "��ʵ�ŹѸ�����Ҳ�кøУ����������͸��������!", "̫лл���ˣ����û���㣬���ǲ�֪Ҫ�ȶ�ò������׶Է������⡣����һ�ѶϽ�����Ȼ��ֵʲôǮ����ȴ�����Ǽ��洫�ģ����͸�����Ϊл��.")
			DelItem(64)
			AddEventItem(127)
			SetTask(28, SetByte(GetTask(28),1,10))
			AddNote("�����Ҹ����������õ��Ͻ�������'.")
			Msg2Player("�õ��Ͻ�������'.")
		else
			if (HaveItem(127) == 1) then
				tiejiang_city("<dec><npc>�a��л�����Һ��ŹѸ�����Ե��Ҫ��Ҫ����������ı��� ")
			else
				AddEventItem(127)
				Talk(1,"","������ʩ������ر������ǣ�����Ҵ�æ�ˣ���ѽ����������Ҫ����.")
			end
		end
	elseif (UTask_tr > 60*256+20) then
		tiejiang_city("<dec><npc>�a��л�����Һ��ŹѸ�����Ե��Ҫ��Ҫ����������ı��� ")
	else
		tiejiang_city()
	end
end;

function L60_sub_yes()
	Talk(1,"","��̫�鷳���ˣ���������������ִ��Ƶģ�������͸�������������ܣ��ͱ�����������Ҳ����.")
	AddEventItem(63)
	SetTask(28, SetByte(GetTask(28),1,1))
	AddNote("���������Ի����������������ŹѸ� ")
	Msg2Player("���һ������.")
end;

function yes()
Sale(7);  			--�������׿�
end;

