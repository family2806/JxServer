--�������� ���踮 �ӻ����ϰ�Ի�
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
Say("�ӻ����ϰ壺Ҫ���ɶ��������Ļ�����ȫ�ˣ�Ҫɶ��ɶ�������ɡ�", 2, "����/yes", "������/no");
end;


function yes()
Sale(20); 		--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;

