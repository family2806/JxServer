--��ԭ���� ���ݸ� �ӻ����ϰ�Ի�
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("�ӻ����ϰ����������ˮ·ͨ�飬���ϱ����Ｏɢ֮�أ��������������Ʒ�������ϱ�֮��ȫ��Ӧ�о��У�Ҫ���ʲô��", getn(Buttons), Buttons);

end;


function yes()
Sale(5);  			--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;





