-- ʯ���� ְ�� ����
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>C���ֵ�ǹ��������������ʯ������������õĵط�!"

function main(sel)
	tiejiang_village();
end;

function yes()
Sale(25);  				--��ʱ��Ϊ25
end;
