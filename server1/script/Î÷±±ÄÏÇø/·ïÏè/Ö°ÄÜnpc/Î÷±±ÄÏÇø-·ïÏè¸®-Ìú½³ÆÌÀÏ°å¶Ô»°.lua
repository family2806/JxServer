--�������� ���踮 �������ϰ�Ի�

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>�����������ɶ���������������㿴��û�¶���"
function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(19);  			--�������׿�
end;

