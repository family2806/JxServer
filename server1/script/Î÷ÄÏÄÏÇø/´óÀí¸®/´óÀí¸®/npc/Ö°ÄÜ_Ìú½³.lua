-- ���� ְ�� ����
-- By: Dan_Deng(2003-09-16)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>�ҵ�������Ϊѧ���������������������ǹ��ʮ�˰�������У�������������?"

function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;

function yes()
	Sale(16);  				--��ʱ��Ϊ25
end;

