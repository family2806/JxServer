--description: ��ԭ���� ������ �����Ի� �䵱�ɳ�ʦ����
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>������ר��Ϊפ�����������æ�úܣ�����Ҫ��ô���������Լ��������"

function main(sel)
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "����ս�½������ٱ���е���㣬����Կ���������һ��������?", "������˵����������ҹ���������ǣ����������࣬������Ŀ�ʯ������!<color=Red>������������ͳ�ͭ��<color>�������ˣ�����Ե�<color=Red>���ϱ�<color>��������?")
			SetTask(17, SetByte(GetTask(17),2,5))
			AddNote("����(193,201)˵����Ҫ���������Ҫ3�ֿ�ʯ��������������ͳ�ͭ�󣬿����������������Ϸ����ҵ�.")
		elseif (UTask_wd60sub == 5) then 
			if ( HaveItem(138) == 1 and HaveItem(118) == 1 and HaveItem(121) == 1) then
				Talk(2, "", "���ҵ���ʯ�ˣ�ϣ�������������õı�����������ʿ����", "���־����ɽ��һ���ܸ�������!")
				DelItem(138)
				DelItem(118)
				DelItem(121)
				SetTask(17, SetByte(GetTask(17),2,8))
				AddNote("�ҵ�3�ֿ�ʯ�������������Խ��������������.")
				Msg2Player("�ҵ�3�ֿ�ʯ�������������Խ��������������.")
			else
				tiejiang_city("û�п�ʯ����û���������������ȥ<color=Red>�����ϱ�<color> ��һЩ <color=Red> ������������ͳ�ͭ��<color>?")
			end
		else
			tiejiang_city()
		end		
	else
		tiejiang_city()
	end
end;

function yes()
	Sale(10);  			--�������׿�
end;

