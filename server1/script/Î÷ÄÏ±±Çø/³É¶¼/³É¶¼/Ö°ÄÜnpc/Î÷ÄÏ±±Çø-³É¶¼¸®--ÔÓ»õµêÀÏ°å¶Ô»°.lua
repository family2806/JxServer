--���ϱ��� �ɶ��� �ӻ����ϰ�Ի� 
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_em = GetTask(1);
	UTask_tm = GetTask(2);
	if (UTask_em == 30*256+50) then 		--���������ƴ�30������
Say("�ӻ����ϰ壺�����������Ǹ����ϱ��ӻ�������������������ʲô�õ��ŵģ�", 3, "�м�������?/chicken", "����/yes", "������/no")
	elseif ((UTask_em == 40*256+50) and (GetByte(GetTask(29),1) == 1)) then		--������40������
		Say("�������µ�������ֻҪ200������һ����!", 3, "������/hairpin", "����������/yes", "������/no")
	elseif (UTask_tm == 10*256+40) then		--�����ƺ�10������
		Say("��觽�ָ��Ư����500��һ�����������!", 3, "����觽�ָ. /ring", "����/yes", "������/no")
	else
		local Buttons = store_sel_extend();
		Say("�ӻ����ϰ壺�����������Ǹ����ϱ��ӻ�������������������ʲô�õ��ŵģ�", getn(Buttons), Buttons);
	end
end;

function chicken()
	if (GetCash() >= 50) then
		Pay(50)
		AddEventItem(119)
		Msg2Player("�򵽼��� . ")
		AddNote("�ڳɶ��ӻ����򵽼��� ")
	else
		Say("��Ǯ�������ɣ�������������Ҳ��.", 2, "����/yes", "������/no")		
	end
end;

function hairpin()
	if (GetCash() >= 200) then
		Pay(200)
		AddEventItem(63)
		Msg2Player("������")
--		SetTask(29, 4)
		AddNote("�ڳɶ��ӻ��������� ")
	else
		Say("��Ǯ�������ɣ�������������Ҳ��.", 2, "����/yes", "������/no")		
	end
end;


function ring()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(165)
		Msg2Player("����觽�ָ ")
		AddNote("�ڳɶ��ӻ�������觽�ָ")
	else
		Say("��Ǯ�������ɣ�������������Ҳ��.", 2, "����/yes", "������/no")		
	end
end;

function yes()
Sale(14);  		--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;
