--description: ���̷̽�����������ѩ��
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)
-- Update: xiaoyang(2004\4\12) ����90����������

Include("\\script\\global\\skills_table.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_tr = GetTask(4);
	Uworld127 = GetTask(127)
	if(GetSeries() == 3) and (GetFaction() == "tianren") then
		if(UTask_tr == 30*256) and (GetLevel() >= 30) then
			Say("�ٹ����վ�����ĸ��D�D���ʺ�������ˣ�������������һ���������¸�ĸ����Ϊ���񣬵��ǻ�ȱ���ֱ�ʯ <color=Red>��Ѫ�졢����������ĸ�̡�������color>. ����˵�� <color=Red>������<color> ������ֵ���ǵı�ʯ����Ը�����ȥ������?", 2, "Ϊ����Ч������֮��/L30_get_yes", "���»���һ����/L30_get_no")
		elseif(UTask_tr == 30*256+20) and (HaveItem(59) == 1) and (HaveItem(60) == 1) and (HaveItem(61) == 1) and (HaveItem(62) == 1) then
			L30_prise()
		elseif(UTask_tr > 30*256) and (UTask_tr < 40*256) then					--�Ѿ��ӵ�30��������δ���
			Talk(1,"","����Խ� <color=Red>������ color> ���� <color=Red>����<color>, �ǵ�4�ֱ�ʯ<color=Red>��Ѫ��<color>, <color=Red>������<color>, <color=Red>��ĸ��<color>, <color=Red>������ color>.")
		else					--�Ѿ����30��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","������Ҫ�Ұ����ո�������ԭ��������̲̽��ܵõ��Ҹ����İ������Ͳ�����ô��չ.")
		end
	elseif(Uworld127 == 10) and (HaveItem(374) == 1) then
		Talk(15,"Uworld127_killer","�����߹�������","������������Ϊʲô��?��������","���²������Լ�����������Ц.","���������Ǵ󵨣����ˣ�����ȥι��.","��˵������һֻ����ţ���֪����������?","��Ȼ���²���������ֻ��Ҫ���Ӧһ���������Ҿ�������ץ������!","����һ��ϲ�����ļһ�.","�������ۺ���ô������������ô����ƭ�߹���?","��Ҫʲô����?","���һ�����ʱ�򣬲���ɱ�����κ���","���Ǻ�Ц�����һ����㻹û��������ô��?","�ұ�֤һ���»���.","�ã�����һ�ԡ�һ���º���������㣬��ɱ������!","û����һ��.")
	elseif(Uworld127 == 10) then
		Talk(1,"","û�����ƣ���ҽ������������ǵ���ԭ���㲻�Ƕ��⣬���뿪�����һ�β�Ҫ����.")
	elseif(Uworld127 == 20) and (HaveItem(374) == 0) then
		Talk(1,"","��С�ӣ���������ߣ���Ȼ���������")
	elseif(Uworld127 == 30)and(HaveItem(369) == 1) then
		DelItem(369)
		Talk(6,"Uworld127_over","ѩ�¹�����������Ҫ�Ĵ��.","�ã��á����Ȼ����","���ǣ�����������Ҫȡ�ҵ�ͷ.","��Ҫ�����Ǽƽϣ��Ժ�������Ҿ�����.","��ԭ�£��������߽������ˣ������˭��",".....��������ǰ����˵��ֻ��һ����.")
	elseif(Uworld127 == 30) then
		Talk(1,"","����أ��õ�����ó���")
	elseif(Uworld127 == 255) then
		if(GetSex() == 0) then
			Talk(1,"","�ý�㣬�´�����ѩ����.")
		else
			Talk(1,"","�ø�磬�´�����ѩ����.")
		end
	elseif(UTask_tr >= 70) then							--�Ѿ���ʦ
		Talk(1,"","���������е�Ӣ�ۣ�ϣ���������ֵܣ����ǳ��ˣ��л����������Ƽ��㣬������Ҫ���ϳ��ʵ�����")
	else
		Talk(1,"","���̽̽����Ǵ���ʦ�������������������ԣ����Ҽ��뱾��������")
	end
end;

function L30_get_yes()
	Talk(1,"","��������̫���ˣ�������˵ȥ�����·��Σ�գ��ܶ���ȥ���鱦��ɥ���ˣ�����Ե��꾩ȥ�ҳ��򣬵��� <color=Red>������<color> ��Ϥ���������������������ȥ.")
	SetTask(4, 30*256+20)
	AddNote("�����̵̽������������������ѩ��(213, 201) , �� <color=red>��ʯ����<color>. �iȥ������4�ֱ�ʯ")
	Msg2Player("�����̵̽������������������ѩ��(213, 201) , �� <color=red>��ʯ����<color>. �iȥ������4�ֱ�ʯ")
end;

function L30_get_no()
	Talk(1,"","..........?")
end;

function L30_prise()
	Talk(1,"","���������������ֱ�ʯҲ���ҵ���ĸ��һ����ϲ���������!")
	SetRank(58)
	DelItem(59)
	DelItem(60)
	DelItem(61)
	DelItem(62)
	SetTask(4, 40*256)
--	AddMagic(141)
--	AddMagic(138)
--	AddMagic(140)
	add_tr(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("�����ֱ�ʯ�ø�������������ѩ�£���ɱ�ʯ����. ���⣺��ڤ��ʿ��ѧ���书���һ����죬��ɽ����ɺ��޼�. ")
	AddNote("�����̣̽������ֱ�ʯ�ø�������������ѩ�£���ɱ�ʯ����. ���⣺��ڤ��ʿ��")
end;

function Uworld127_killer()
	DelItem(374)
	SetTask(127,20)
	AddNote("�����񣺵�����ץ���")
	Msg2Player("�����񣺵�����ץ���")
end

function Uworld127_over()
	if (GetTask(4) >= 70*256) and (GetTask(4) ~= 75*256) then		-- �����̳�ʦ����
		Talk(2,"","�������齻���㣬����ܾ����Ҿ�ɱ���㣬����ʳ��.","��Ȼ��ˣ����²��ò�����.")
		if (HaveMagic(361) == -1) then		-- ����û�м��ܵĲŸ�����
      	AddMagic(361,1)
		end
		if (HaveMagic(362) == -1) then		-- ����û�м��ܵĲŸ�����
   	   AddMagic(362,1)
		end
		if (HaveMagic(391) == -1) then		-- ����û�м��ܵĲŸ�����
	      AddMagic(391)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("�Ѵ�������ѩ�£�ѧ�����������������ǣ�������ġ���ȥ���Ÿ�����ү. ")
		SetTask(127,110)
	else
		Talk(1,"","�ã��´μǵ�����ѩ��!")
		SetTask(127,100)
		Msg2Player("�Ѵ�������ѩ�£���ȥ���Ÿ�����ү")
	end
end
