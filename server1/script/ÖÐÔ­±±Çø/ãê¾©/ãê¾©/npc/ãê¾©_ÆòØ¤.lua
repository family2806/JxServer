-- ѧ���ٸ���ƶ�����ܵ���ؤ
-- By: Dan_Deng(2003-08-22)
-- ��Ǯ����һ��100���ڶ���200��������400...�������ƣ�����8��(12800)֮��ûѧ���ľ�ûʲô�����ˣ�ֻ��Թ̫���ࡣ

function main(sel)
	UTask_world16 = GetTask(16)
	if (UTask_world16 == 255) then			-- ���������
		Talk(1,"","��������!")
	else
		i = (2 ^ UTask_world16) * 100
		Say("ף�㽡�������������������ؤ��! ",2,"����"..i.."����./W53_pay","�ó������ļһһ������/W53_no")
	end
end;

function W53_pay()
	UTask_world16 = GetTask(16)
	i = (2 ^ UTask_world16) * 100
	if (GetCash() >= i) then
		Pay(i)
		if (random(0,99) < 20) then			-- 20%����ѧ�����ٸ���ƶ������
			Talk(3,"W53_prise","�a��л��ĺ��ģ���ѧһЩ�������Ϸ��? ","�������Ϸ? ","�Ե�. ")
		else
			SetTask(16,UTask_world16 + 1)
		end
	else
		Talk(1,"","������û����Ǯ ")
	end
end;

function W53_no()
	Talk(1,"","��û�����⣬�������ᱣ��.")
end;

function W53_prise()
	AddNote("ʩ����ؤ��ѧ�����ܽٸ���ƶ' ")
	Msg2Player("ʩ����ؤ��ѧ�����ܽٸ���ƶ' ")
	if (HaveMagic(400) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(400,1)
	end
	SetTask(16,255)
end;
