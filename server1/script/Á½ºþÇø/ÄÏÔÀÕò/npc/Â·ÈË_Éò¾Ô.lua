-- ·��_��� ������ ��������(80����)��NPC�ű�
-- By Dan_Deng(2003-11-10)

Include("\\script\\tong\\tong_header.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

function main()
	UWorld97 = GetTask(97)
	str, result = GetTong()	
--	if (UWorld97 >= 10) then		-- �Ѿ����
--		Talk(1,"","��ԣ���һ��Ҫ�úöԴ������ÿ��Ҫ����ϴ�裬��������Ҫ���Ͼ���......")
	if (UWorld97 < 100) and (result == 1) and (GetTongFigure() == TONG_MASTER) then			-- �ǰ�����û�����ܹ��Ż�����
		SetTaskTemp(17,1000)
	else								-- ��ͨ����
		SetTaskTemp(17,1500)
--		Talk(1,"","��ԣ�ǧ�����У������ֲ����С�ͽ�����κΣ�")
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<#><npc>��������ܶ��ֻ꣬��һ�۾�֪���ò���!"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog:AddOptEntry("��ʱ�������?", horse_get);

	tbDailog:Show();
end

function horse_get()
	Talk(4,"sele_color","Ӣ��������. ","��̨, ��ʲôҪָ�̵�","��������ԩu, ������һƥ�������Է���ǧ��. ��λӢ�۷�ɲ���, һ���Ǹ��֡������ı�������ƥ��ѱ��. ","�������Կ���ı���,,, ")
end

function sele_color()
	Say("Ӣ�ۿ�! ",6,"�ⲻ������̤ѩ��!/buy_black","�ⲻ�ǳ��ñ�����! /buy_red","�ⲻ�Ǿ�Ӱ��! /buy_cyan","�ⲻ�ǵ�¬��! /buy_yellow","�ⲻ����ҹ��ʨ����! /buy_white","����ʲô��?��ѧʶ����/buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","һ��֮������ʦ���������������ôҲ��֪�������ʲô���治����˼�������㿴����!")
end

function the_buy(i)
	SetTaskTemp(49,i)
	x = GetTaskTemp(17)
	if (x == 1000) then
		Say("û��! ������Ӣ��. ���±�����������ƥ��, ������������1000 ��, ��Ӣ��Ҳ���ϲ������˿���ס���ĵĲ�������Ӣ��, ϣ��Ӣ�ۿ����ƴ�����",2,"��һ���úö���/buy_yes","һʱȥ������ô��Ǯ/buy_no")
	else
		Say("û��! ������Ӣ��. ���±�����������ƥ��, ������������1500 ��, ��Ӣ��Ҳ���ϲ������˿���ס���ĵĲ�������Ӣ��, ϣ��Ӣ�ۿ����ƴ���",2,"��һ���úö���/buy_yes","һʱȥ������ô��Ǯ/buy_no")
	end
end

function buy_yes()
	x = GetTaskTemp(17)
	if (GetCash() >= x * 10000) then
		i = GetTaskTemp(49)
		if (x == 1000) then			-- ���Żݼ���ģ�Ϊ������ֵ�����Ҽ�ס�����ʲô��ɫ��
			SetTask(97,100+i)
		end
		Pay(x * 10000)
		AddItem(0,10,5,i,0,0,0)
		Talk(1,"","��������! �ӽ�������͸�����λӢ���ˣ�һ��Ҫ������!")
	else
		Talk(1,"","������������������������������ЩǮ!")
	end
end

function buy_no()
	Talk(1,"","�ѵ�����ЩǮ��Ӣ��Ϊ����")
end
