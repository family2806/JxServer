--ʯ���� ��ʦ ���������ͷ������Ṧ
-- By: Dan_Deng(2003-09-04)
-- Update: Dan_Deng(2003-11-04)��Ϊģ�巽ʽ��ȫ��ͳһ����һ������������ά������չ

Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\���ɽ�������\\�Ṧ_��ʦģ��.lua")

function main(sel)
	UTask_world22 = GetTask(22)		-- �ͷ�����
	if (UTask_world22 == 5) and (HaveItem(233) == 1) then			-- �ͷ��������
		Talk(4,"W22_prise","��Ҷ������������ң�����ôСҪ������ô���£��Ҳ��Ǻ�үү���ǵ���ʱ��3��.....Ȼ���.....����.....","��԰�!","лл���һ��кܶ໰����������?",".....����!")
	else
		learn()
	end
end;

function W22_prise()
	Talk(1,"","�� ....лл�㣬�����������������.")
	DelItem(233)
	SetTask(22,10)
	AddNote("��������ʦ��������� ")
	Msg2Player("��������ʦ��������� ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,7)
	i = random(0,8)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("���һ������")
	AddRepute(3)
	Msg2Player("�����������3��")
end;
