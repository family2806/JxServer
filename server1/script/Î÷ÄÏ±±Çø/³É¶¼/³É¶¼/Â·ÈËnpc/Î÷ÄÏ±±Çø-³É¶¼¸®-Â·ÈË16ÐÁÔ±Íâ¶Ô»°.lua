--���ϱ��� �ɶ��� ·��16��Ա��Ի� ������40������
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+50) then 		
		UTask_emsub03 = GetByte(GetTask(29),3)
		if (UTask_emsub03 == 0) then 
			Say("��Ա�⣺����ƽ����ϲ���ύ�������ͣ����������˸���ŽС����ϳ������������ޣ������������˵�����ǹ�����������������ʮ�ֲ��ޡ���֪Ů���ɷ�Ϊ���½�𼸸��ɻ�", 2, "����/L40_V3_Q1", "�һ��б����/no")
		elseif (UTask_emsub03 == 3) then 
			L40_V3_Q1()
		elseif (UTask_emsub03 == 5) then 
			L40_V3_Q2()
		elseif ((UTask_emsub03 == 10) and (HaveItem(168) == 0)) then
			AddEventItem(168)
			Talk(1,"","Ů�����ÿ���������Ҫ����ȥ��")
		else
			Talk(1,"","����Ů��������������ĳ������.")
		end
	else
		Talk(1,"","��Ա�⣺����ƽ����ϲ���ύ�������ͣ����������˸���ţ����������ϳ�����ʵ���������ˡ�")
	end
end;

function no()
	Talk(1,"","���Ҳ��鷳Ů����!")
end;

function L40_V3_Q1()
	Say("��Ա�⣺�ϳ������Ĺ��˰���", 4, "����/f1", "���/L40_V3_Q2", "�Թ�/f1", "κ��/f1")
end;

function f1()
	Talk(1,"","��Ա�⣺���񲻶԰ɣ����ϴ���ô˵�������˳�Ц��һ����")
	SetTask(29, SetByte(GetTask(29),3,3))
end;

function L40_V3_Q2()
	Say("��Ա�⣺Ŷ��ԭ����������˰���ս���Ĺ���������ϳ������������ƽԭ�����⣬��֪��֪������һ����˭ѽ��", 4, "������/f2", "������/f2", "�����/L40_V3_prise", "��ԭ��/f2")
end;

function f2()
	Talk(1,"","��Ա�⣺���񲻶԰ɣ�����ôû��˵���أ�")
	SetTask(29, SetByte(GetTask(29),3,5))
end;

function L40_V3_prise()
	Talk(4, "select", "���ˣ���ô��û�뵽�أ���˵��ǰ�ϳ�����3000ʳ�ͣ�����Ȼû�����������ǣ����Ǻ�ϲ���ύ��Ů�����������ѡ�Ů����Ҫ�Ұ�����?", "�������ұ�����ָ ", "��ç����˵������һ��������ָ���͸����!", "�a��лԱ��! ")
end;

function select()
	AddEventItem(168)
Msg2Player("�õ�������ָ��")
	SetTask(29, SetByte(GetTask(29),3,10))
	AddNote("�ڳɶ���Ա�⴦�ҵ���觽�ָ. ")
end;
