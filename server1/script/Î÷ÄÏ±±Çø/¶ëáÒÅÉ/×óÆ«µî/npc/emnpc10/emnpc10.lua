--description: �������մ�ܰ 
--author: yuanlan	
--date: 2003/3/5
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if ((UTask_em == 40*256) and (GetLevel() >= 40) and (GetFaction() == "emei")) then
			Talk(2, "L40_get","���ڶ�ʦ�����У��Һ���ʦ��ĸ�����ã�����Ҫ�������ˣ���������һ�������ʦ�㾫�����ɣ���һֱ��õ����м�Ʒ<color=Red>�����񳯷����<color>.","���Ĵ�Ѱ�ô�������֪<color=Red>���ɽ<color>����һλ���ӵ�<color=Red>����<color>����������ף��������˺ܾö�û���ҵ�������ʦ������վͿ쵽�ˣ���ô����?")
		elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 1)) then					--�õ����񳯷�����
			L40_prise()
		elseif (UTask_em >= 50*256) and (GetFaction() == "emei") then   							--�Ѿ����40��������δ��ʦ
			Talk(1,"","��ʦ��������׺��ļ��ˣ��ⶼ������æ��!")
		else
			Talk(1,"","������������������д��·���")
		end
	elseif (UTask_em >= 70*256) then										--�Ѿ���ʦ
		Talk(1,"","Сʦ�ã��Ժ����߽�������ʲô�Ѵ��������˻��������ǰ�!")
	else
		Talk(1,"","�uŷ�����������������������о䣬ͥԺ���������仰�����ֹ��������������!")
	end
end;

function L40_get()
	Say("��Ը�����ȥѰ����λ������?", 2, "Ը�� /L40_get_yes", "ûʱ�� /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","̫���ˣ���λ<color=Red>����<color>��������<color=Red>���ɽ�в�<color>��<color=Red>���ɶ�<color>��.")
	SetTask(1, 40*256+10)
	AddNote("��ƫ����մ�ܰ��ȥ�Ұ��񳯷�. ")
	Msg2Player("�������Ұ��񳯷�����")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","�����񳯷���ף�̫���ˣ���ʦ�����һ����ܿ��ĵģ�лл�㣬Сʦ��! ")
	DelItem(22)
	SetRank(17)
	SetTask(1, 50*256)
--	AddMagic(86)
	add_em(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ���Ϊ�������ӣ�ѧ����ˮ")
	AddNote("�ض�ü�����������񳯷���׸��մ�ܰ�����������Ϊ��������")
end;
