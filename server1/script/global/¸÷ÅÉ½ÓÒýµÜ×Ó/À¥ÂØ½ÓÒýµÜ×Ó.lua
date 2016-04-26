-- �����ɽ������ӽű�������
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "���ػ���"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 9 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyukunlun","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","���ػ�����������С椣���Ȼ���������ຮ֮�����ܱ��⣬����")
	elseif (player_Faction == "emei") then				
		Talk(1,"","���ػ�����Ů��֮���͸��ڼ������ӣ������赶Ūǹ�ĳɺ���ͳ�������������°���")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","���ػ��������Ű�����΢ĩ֮�����������ǵ��������״�������ȣ�")
	elseif (player_Faction == "wudu") then
		Talk(1,"","���ػ�����߾��а�����Ҳ�ҳ�������������ү�Ҳ��������ܶ����ˣ�")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","���ػ�������������Ȼ�����Ǻ���𣬵���һŮ�����죬����һ������ݻ�ҵ�������ˡ�")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","���ػ�������˵������ѧ���ڣ���ϧȴ�ǲ���֮�������������ʦ�������л������似��")
	elseif (player_Faction == "wudang") then
		Talk(1,"","���ػ�������������ͬ�����ڣ��ֶ��ó�������ʲô���ǱȻ��Ȼ����Ÿ��ߵ�ǿ��������")
	elseif (player_Faction == "kunlun") then
		Say("��Ļ��������Ȼ�������ຮ֮�غö��˰ɣ�Ҫ��Ҫ��ȥ�ˣ�",4,"���ˣ���л���֡�/return_yes","��ͼ����/map_help","����˵��/skill_help","��ô����ĵط������Ż�ȥ���/no")
	elseif (player_Faction == "tianren") then
		Talk(1,"","���ػ���������������ұ����ݣ��������Ե�үһ����")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","���ػ�����һ��л��ӣ����������ٴ�Ҳֻ���ں�֮�ڣ��վ��ɲ���ʲô����")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ,������������! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_kl = nt_getTask(9)
--		if (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_kl < 5*256) and (nt_getTask(5) == 70*256) then		-- ת������������
--			Say("���ػ��������ŵ�һ�϶���ʲô�û�����һ���ϼһ�����Ż�˵�������껹����ӣ��������������ʲôǰ;���������������������ˣ������������ɷ���ǣ��ѵ��㲻��Ľ��",2,"��...���Կ���/defection_get","��ҥ�̰�����ҡײƭ֮ͽ�����ޣ�/no")
		if ((UTask_kl > 5*256) and (UTask_kl < 10*256)) then		-- ����������
			Talk(1,"","���ػ��������ɷǵ������룬���Ⱥúð����������������˵�ɡ�")
		elseif (UTask_kl >= 70*256) and (player_Faction ~= "kunlun") then					--�Ѿ���ʦ
			Say("���ػ�������˵����ɽ����Ƿ����Ⱑ����û���뵽����ʦ��ʦ�ð���",3,"��ͼ����/map_help","����˵��/skill_help","��ô����ĵط������Ż�ȥ���/no")
		else
			Talk(1,"enroll_select","���ػ�����������Զ�����򣬺����ļ���ԭ���ڼ����������ŵĲ���Ŭ���£����ɲ���׳�󣬽�����Ϊ������һ�����ɣ��۾���������ԭ�������ɷ�ͥ����")
		end
	end
end;

function defection_get()
	Talk(1,"","���ػ��������ǰ�������������Ŀ���Ͻ�ȥ���һ�϶�˵�㲻���ˣ���������������������Ϳ����ˡ�")
	nt_setTask(9,5*256+10)
	Msg2Player("��ҪתͶ�����ɣ�ֻҪ���䵱�ɵ�һ����������ȥ�������������������")
	AddNote("��ҪתͶ�����ɣ�ֻҪ���䵱�ɵ�һ����������ȥ�������������������")
end

function enroll_select()
	UTask_kl = nt_getTask(9)
	UTask_wd = nt_getTask(5)
	if ((UTask_wd > 5*256) and (UTask_wd < 10*256)) then		-- �ѽ����䵱��������
		Talk(1,"","���ػ�����ԭ���������䵱��Ҳ��Ҳ�գ���ԭ��ʿ����ϲ���������Ŵ��ɡ�")
	elseif (GetSeries() == 4) and (GetCamp() == 0) and (UTask_wd < 5*256) and (UTask_kl < 5*256) then		--ˮϵ��δ���䵱����
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("���ػ����������ó�������������䵱��������ʤ����ֹһ���Σ�Ҫ���뱾����", 3, "����������/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","���ػ��������ɲ�������֮�ˣ���ĸ�����δ��ã��ȵ���ʮ�������ɡ�")
		end
	end		-- ������ϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(131,57)		  				-- �ȴ��ṩ������
--	nt_setTask(9,10*256)						-- ֱ������
	SetFaction("kunlun")      			-- ��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(19)
	nt_setTask(137,69)
	SetLastFactionNumber(9)
-- ֱ�Ӵ�������
	nt_setTask(9,80*256)
	SetRank(75)
	Msg2Player("��ӭ������䵱�ɣ�ֱ��ѧ�᱾�����м��ܡ�")
	add_kl(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ���������ɣ���Ϊ�𳾵��ӣ�ѧ�����編���������")
--	AddNote("���������ɣ���Ϊ�𳾵���?.")
	Msg2Faction("kunlun",GetName().."�ӽ���ȥ���������ɣ��ݼ���λʦ�棬ϣ����λ����ָ��!",GetName())
	NewWorld(131, 1582, 3175)			-- �ȴ��ṩ����

end;

function return_yes()
	NewWorld(131, 1582, 3175)			--����Ҵ��͵��������
end;

function kl_check_yes()			-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","���ػ���������������Բ�������ˮϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","���ػ��������Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(88) >= 0) then		-- ������40������,���𲻾�
		nt_setTask(1,50*256)
		Talk(1,"","���ػ��������Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(85) >= 0) then		-- ������30������,һҶ֪��
		nt_setTask(1,40*256)
		Talk(1,"","���ػ��������Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(82) >= 0) then		-- ������20������,����ͬ��
		nt_setTask(1,30*256)
		Talk(1,"","���ػ��������Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(77) >= 0) then		-- ������10������,��ü����
		nt_setTask(1,20*256)
		Talk(1,"","���ػ��������Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(1,10*256)
		Talk(1,"","���ػ��������Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end;

function em_check_no()
	Say("���ػ���������Ļ��������Ȼ�������ຮ֮�غö��˰ɣ�Ҫ��Ҫ��ȥ�ˣ�",2,"���ˣ���л���֡�/return_yes","��ô����ĵط������Ż�ȥ���/no")
end

function Uworld1000_jiaoyukunlun()
	nt_setTask(1000,260)
	Msg2Player("�����ɽ�������˵����ȥ�ˣ������ֱ��ȥ������˵��")
end

function no()
end;
