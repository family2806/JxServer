-- ������������ ģ�� ��������
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
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 1 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianwang","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "emei") then				
		Talk(1,"","�������죺�ְ����������������������ɣ��Թ�����������ʦ̫һֱ����ʮ�־�Ľ�ġ�")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","�������죺Ů���鷳��Ư����Ů�������鷳�����书��Ư��Ů�˸����鷳�е��鷳�����ɵ����ۿɲ������ǣ�")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","�������죺ѧ��֮��Ӧ�ù������䣬����������Щʹ�������¶�ҩ�ļ����ù���о���")
	elseif (player_Faction == "wudu") then				
		Talk(1,"","�������죺������Ȼ�������κ��������ɣ�����Ҳ��м����Щʹ���¶�֮ͽΪ�飡")
	elseif (player_Faction == "shaolin") then				
		Talk(1,"","�������죺���ֹ�����Ȼ�ų��������ڣ�������ȴ����ô���������кú������������ѧʲô�˴�ܣ�ʵ����Υ����֮����")
	elseif (player_Faction == "wudang") then				
		Talk(1,"","�������죺��˵���ɵĵ�һ�����书��ɲ⣬��֪ʲôʱ���л��������")
	elseif (player_Faction == "kunlun") then				
		Talk(1,"","�������죺���ɽ�������չ���٣����Ҳ�����˵�������ֻ�Ǳ����ԭ���ֶ������ˣ�")
	elseif (player_Faction == "tianren") then				
		Talk(1,"","�������죺���ǿɲ��ͽ��˴�ʲô������")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","�������죺����뱾��ų����������л�������Ҫ�ú��׽��׽���")
	elseif (player_Faction == "tianwang") then
		Say("�������죺�ֵܣ�Ҫ��Ҫ������ص���",4,"�ã���л�ֵ�/return_yes", "��ͼ����/map_help","����˵��/skill_help","�����ˣ���л/no")
--		Say("�������죺������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/tw_check_yes","������/tw_check_no")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������!")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_tw = nt_getTask(3)
--		if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- ����������
--			Talk(1,"","�������죺���Ѿ�������������촦���˱�����������񣬵�����δ��ɣ�����Ҫȥ�����ؾƹ������ơ���������")
		if (UTask_tw >= 70*256) then					--�������ʦ
			Say("�������죺���Ѿ�������������촦���˱�����������񣬵�����δ��ɣ�����Ҫȥ�����ؾƹ������ơ���������",3,"��ͼ����/map_help","����˵��/skill_help","֪����/no")
		elseif (UTask_tw == 5*256+80) and (GetByte(nt_getTask(38),1) == 127) then		-- ����������ɣ�������BUG���˵��޲�
			Talk(1,"","�������죺���ֵܣ������ּ����ˣ������ɺã��л����۸����ٺ�һ����")
			if (HaveMagic(29) >= 0) then		-- ѧ����ն�����ģ����ŵ��ӣ�������Ϊ�ѳ�ʦ
				nt_setTask(3,70*256)
			else										-- ��������㣬������ǰ�ѵ����ֵġ�
				nt_setTask(3,0)
			end
		else
			Talk(3, "select", "�������죺������������ڽ����Ϻպ������������Ǹ�Ů�ӣ��������ո�ǿ����ʶ���ˣ�������ü��������ֵ��Ƕ�������", "������ڱ鲼�������˶��ƴ��������˸�С�����ǣ�", "����ȿ������Ҳ����͢���ֵ��Ƕ���ƶ����ճ�����������Ҳֻ��Ϊ��������·���ĸ��ʵ�����ɽ�������ǿ�ûʲô��ϵ��")
		end
	end
end;

function select()
	UTask_tw = nt_getTask(3)
	UTask_sl = nt_getTask(7)			-- ��ʱ�������ط��������ط�������
	if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- �ѽ���������������
		Talk(1,"","�������죺�ֵ�ԭ�������������ɣ��պ�Ҳ��ӭ�����������͡�")
	elseif (GetCamp() == 0) and (GetSeries() == 0) and (UTask_sl < 5*256) and (UTask_tw < 5*256) then		--��ϵ��δ����������
		if (GetLevel() >= 10) then					--�ȼ��ﵽʮ��
			Say("�������죺����뱾����Ǿ���һ���ֵ���������и�ͬ������ͬ����������ҵش��һ����", 3, "����������/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","�������죺ѧ��֮�ˣ�˭û����Ѫ�����������¿�ɲ��У��ȳ���ú���һ������ø�������<color=Red>ʮ��<color>�������ҡ�")
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(59,21)	  				--����������
--	nt_setTask(3, 10*256)
	SetFaction("tianwang")       			--��Ҽ���������
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(43)
	nt_setTask(137,63)
	SetLastFactionNumber(1)
-- ֱ�Ӵ�������
	nt_setTask(3,80*256)
	SetRank(79)
	Msg2Player("��ӭ����������ֱ��ѧ�᱾�����м��ܡ�")
	add_tw(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ���������������������!")
--	Msg2Player("ѧ������ն���ط�����")
--	AddNote("�����������Ϊ�������.")
	Msg2Faction("tianwang",GetName().." �ӽ��������������ݼ���λ��ϣ����λ���ָ��!",GetName())
	NewWorld(59,1552,3188)			--����Ҵ��͵��������
end;

function return_yes()
	NewWorld(59, 1425, 3472)			--����Ҵ��͵��������
end;

function tw_check_yes()
	if (GetSeries() ~= 0) then
		Talk(1,"","�������죺����������Բ������ǽ�ϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(41) >= 0) then		-- ������50������,Ѫս�˷�
		nt_setTask(3,60*256)
		Talk(1,"","�������죺���Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(37) >= 0) then		-- ������40������,�÷�ն
		nt_setTask(3,50*256)
		Talk(1,"","�������죺���Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(36) >= 0) then		-- ������30������,����ս��
		nt_setTask(3,40*256)
		Talk(1,"","�������죺���Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(33) >= 0) then		-- ������20������,���ľ�
		nt_setTask(3,30*256)
		Talk(1,"","�������죺���Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(23) >= 0) then		-- ������10������,����ǹ��
		nt_setTask(3,20*256)
		Talk(1,"","�������죺���Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(3,10*256)
		Talk(1,"","�������죺���Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end

function tw_check_no()
	Say("�������죺�ֵܣ�Ҫ��Ҫ������ص���",2,"�ã���л�ֵ�/return_yes","�����ˣ���л/return_no")
end


function Uworld1000_jiaoyutianwang()
	nt_setTask(1000,260)
	Msg2Player("�������������˵�������ɵ��ӣ������ֱ��ȥ������˵��.")
end


function no()
end;


