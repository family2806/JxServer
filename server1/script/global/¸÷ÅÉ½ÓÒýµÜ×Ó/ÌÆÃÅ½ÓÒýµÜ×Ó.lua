-- ���Ž������� ģ�� ��������
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "��������"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 2 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutangmen","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "tangmen") then
		Say("������������������������ʲô�Ը���",4,"�����������һ�ȥ/return_yes","��ͼ����/map_help","����˵��/skill_help","û�У��ҳ�������������/no")
--		Say("����������������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/tm_check_yes","������/tm_check_no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","�������������ɶԱ���һֱ����΢�ʣ�����������Ȼͬ����أ�ȴ����û�н�����")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","��������������������Ȼ���г��棬����Ҳ�����۸�����Ů�ӡ�")
	elseif (player_Faction == "wudu") then
		Talk(1,"","���������������嶾�̵����𣿱�������������������֪�кι�ɣ���Ȼ��˵���ʹ���¹Ƶ��ֶ�����һ�������Ǳ���ȴ���£����������ʲô��ͼ�������ڱ��ŵİ�������Ҳ�ֲ��˺�ȥ��")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","�������������Զ�ڶ�ͥ���뱾�ź���û��ʲô����ɣ�")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","�������������ŴӲ�����Щ��ν���������ɽ�����")
	elseif (player_Faction == "wudang") then
		Talk(1,"","�������������ŴӲ�����Щ��ν���������ɽ�����")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","�����������к�ָ�̣�")
	elseif (player_Faction == "tianren") then
		Talk(1,"","�������������ҼȲ������ѣ�Ҳ���ǵ��ˣ�������ʲô������")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","�����������벻��һȺ�л���Ҳ�ܴ���һ����أ����Ż��Ǻ�����ġ�")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������!")
	else
		UTask_tm = nt_getTask(2)
		if ((UTask_tm > 5*256) and (UTask_tm < 10*256)) then		-- ����������
			Talk(1,"","�������������Ѿ��������ؽ��˱��ŵ��������񣬵�����δ��ɣ�������õ��ࡢ�ϡ����������ȣ�Ȼ�󽻸����ڵ�ͬ�š�")
		elseif (UTask_tm >= 70) and (GetFaction() ~= "tangmen") then					--�Ѿ���ʦ
			Say("���������þò�������ʦ�Ժ��к���������˵��������",3,"��ͼ����/map_help","����˵��/skill_help","û�У��ҳ�������������/no")
		else
			Talk(2, "select", "���������������۾ᴨ��ƾ�谵���ͻ����������֣�����������������֮�á���������̸���Ŷ�ɫ�䣬�ɼ����ŵ�������", "ʲô����������������壬ȫ���ǹ�ƨ������ֻ�����Լ���������ƣ��Ȳ�Ը����Щ��ν���������ɽύ��Ҳ��м��аħ���Ϊ�顣����뱾�ſɲ���һ�����׵��£����Ĳ����������ǿɲ�Ҫ��")
		end
	end
end;

function select()
	UTask_tm = nt_getTask(2)
	UTask_wu = nt_getTask(10)
	if ((UTask_wu > 5*256) and (UTask_wu < 10*256)) then		-- �ѽ����嶾��������
		Talk(1,"","������������òŻ���ȴ�����嶾�̣���ʵ��ϧ��̾��")
	elseif (GetSeries() == 1) and (GetCamp() == 0) and (UTask_wu < 5*256) and (UTask_tm < 5*256) then		--ľϵ��δ���嶾����
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("�������������Ű������������������Ի�������Ҳ�����о����㲻������Щ����һ�������𣿵���Ҫ��ס��ǧ�򲻿�й©�����ؼ���", 3, "��������/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","������������Ļ�����ô����˱���Ҳ����������Ϊ����ȥ�Լ�ĥ��ĥ��������<color=Red>ʮ��<color>�Ժ��������Ұɣ�")
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(25,15)	 				--����������
--	nt_setTask(2, 10*256)
	SetFaction("tangmen")      				--��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(25)
	nt_setTask(137,62)
	SetLastFactionNumber(2)
-- ֱ�Ӵ�������
	nt_setTask(2,80*256)
	SetRank(76)
	Msg2Player("��ӭ��������ţ�ֱ��ѧ�᱾�����м��ܡ�")
	add_tm(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ�������ţ���Ϊ���ۣ�ѧ����������")
--	AddNote("�������ţ���Ϊ����.")
	Msg2Faction("tangmen",GetName().."�ӽ�����������ţ��ݼ���λʦ�棬ϣ����λ����ָ��!",GetName())
	NewWorld(25, 3982, 5235)				--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(25, 3982, 5235)			--����Ҵ��͵��������
end;

function tm_check_yes()
	if (GetSeries() ~= 1) then
		Talk(1,"","��������������������Բ�������ľϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(58) >= 0) then		-- ������50������,���޵���
		nt_setTask(2,60*256)
		Talk(1,"","�������������Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(54) >= 0) then		-- ������40������,���컨��
		nt_setTask(2,50*256)
		Talk(1,"","�������������Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(50) >= 0) then		-- ������30������,׷�ļ�
		nt_setTask(2,40*256)
		Talk(1,"","�������������Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(47) >= 0) then		-- ������20������,�����
		nt_setTask(2,30*256)
		Talk(1,"","�������������Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(43) >= 0) then		-- ������10������,���Ű���
		nt_setTask(2,20*256)
		Talk(1,"","�������������Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(2,10*256)
		Talk(1,"","�������������Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end;

function tm_check_no()
	Say("������������������������ʲô�Ը���",2,"�����������һ�ȥ/return_yes","û�У��ҳ�������������/return_no")
end

function Uworld1000_jiaoyutangmen()
	nt_setTask(1000,260)
	Msg2Player("�����ɽ�������˵�������ɵ��ӣ������ֱ��ȥ������˵��.")
end

function no()
end;
