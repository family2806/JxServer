--ʯ���� ·�� ���� �������񣺰���Ľ�ָ
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world24 = GetTask(24)
	if (UTask_world24 == 0) and (GetLevel() >= 5) then		-- ��������
		Say("�ҵĽ�ָ�Ҳ�����һ������è������. ",2,"������. /W24_get_yes","��װû����/W24_get_no")
	elseif (UTask_world24 == 5) and (HaveItem(234) == 1) then		-- �������
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
		if (GetSex() == 0) then
			W24_rank = "<#> ������������Ҳû�ã���ȥ����л��"
			AddItem(0, 4, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("��û�������̹�ʯ. ")
		else
			W24_rank = "<#> ����������Ȼ�ܺÿ������ǣ���һ������������͵ģ��������ø���."
			AddItem(0, 4, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("�õ�һ��ͭ����. ")
		end
		Talk(1,"","<#> ��ѽ���ⲻ���ҵĽ�ָ�����Ǹ�л������ҵ�!"..W24_rank)
		SetTask(24,10)
		DelItem(234)
		AddRepute(7)
		AddNote("����ָ������������� ")
		Msg2Player("����ָ�������������")
		Msg2Player("�����������7��. ")
	else				-- ������Ի�
		Talk(1,"","�Ҵ��Ů�������������ɣ��������ݷ���ֽ������ϲ�����������ָ�����ĺܾ���.")
	end
end;

function W24_get_yes()
	SetTask(24,5)
	Talk(1,"","���õ��ģ��Ұ���ȥ��!")
	AddNote("�����񣺰ﰢ���Ҷ�ʧ�Ľ�ָ. ")
	Msg2Player("�����񣺰ﰢ���Ҷ�ʧ�Ľ�ָ. ")
end

function W24_get_no()
end
