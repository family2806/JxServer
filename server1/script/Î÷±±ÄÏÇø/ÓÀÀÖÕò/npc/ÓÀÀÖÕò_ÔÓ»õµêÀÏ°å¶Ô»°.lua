--�������� ������ �ӻ����ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("�͹�Ҫ��ʲô?ʲô���У�",getn(buttons), buttons);
end;


function yes()
Sale(84);   			--�������׿�
end;


function no()
end;