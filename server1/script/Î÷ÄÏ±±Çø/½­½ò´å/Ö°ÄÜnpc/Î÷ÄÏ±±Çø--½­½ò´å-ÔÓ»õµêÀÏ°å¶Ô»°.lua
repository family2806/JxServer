--���ϱ��� ����� �ӻ����ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("�ӻ����ϰ壺С��Ļ���ȫ���أ��������ʲô���ȿ�����",getn(buttons), buttons);
end;


function yes()
Sale(23);   			--�������׿�
end;


function no()
end;






