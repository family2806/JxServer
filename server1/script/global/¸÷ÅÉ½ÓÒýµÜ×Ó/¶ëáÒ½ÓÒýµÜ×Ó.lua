-- ���ҽ������� ģ�� ���ҽ�����
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "���ҽ�����"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 4 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuemei","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "emei") then
		Say("���ҽ����᣺Сʦ�ã�����ɽ���棿���Ҫ�������ɽ��",4,"�ǵģ���Ҫ�鷳�����/return_yes", "��ͼ����/map_help","����˵��/skill_help","�����ˣ���лʦ��/no")
--		Say("���ҽ����᣺������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/em_check_yes","������/em_check_no")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","���ҽ����᣺����ƫ�����ϣ��뱾�ɴ�����������֪�к�ָ�̣�")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","���ҽ����᣺�����������ŵ����𣿱��������������ɣ��Ӳ����������֮�˽�����")
	elseif (player_Faction == "wudu") then
		Talk(1,"","���ҽ����᣺���ֵ�аħ��������˵ö���֮��")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","���ҽ����᣺��������������һλŮ�к��ܣ�ƶ��������Ľ����ϧһֱԵ�һ�档")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","���ҽ����᣺�����ӷ�ԭ���������ɵ�ʦ�֣���֪�����ʦ�����Ƿ񿵽���")
	elseif (player_Faction == "wudang") then
		Talk(1,"","���ҽ����᣺�䵱���壬�������£����ɵ�һ���˺ͱ������Ž��鲻ǳ���������ɿɳƵ�����ͬ����֦����")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","���ҽ����᣺���������������������֪�к�ָ�̣�")
	elseif (player_Faction == "tianren") then
		Talk(1,"","���ҽ����᣺���һֱ�����ϲ⣬������������Ҵ��ν�ɽͼı���죬�������������������Ĳ�������")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","���ҽ����᣺����˶��ƴ󣬺������죬���ɺ�Ը��ύ������Щ���ѣ�")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_em = nt_getTask(1)
		if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- ����������
			Talk(1,"","���ҽ����᣺���Ѿ��ڶ�üɽҶ����ʦ�㴦���˱��ɵ��������񣬵�����δ��ɣ��������ͨ��������Ŀ��飬Ȼ���ٴ������µõ��������⡣")
		elseif (UTask_em >= 70*256) and (player_Faction ~= "emei") then					--�Ѿ���ʦ
			Say("���ҽ����᣺ԭ����ʦ�㣬��֪�����ɺã�",3,"��ͼ����/map_help","����˵��/skill_help","�����ˣ���лʦ��/no")
		else
			Talk(1,"select","���ҽ����᣺����Ů�������������У��Ա���Ϊ��һ�����ɵ��Ӿ�ΪŮ�ӣ������书��ǿ�����Ҷ�Ŷ��գ������黭��������������˵���������˵����磬���Ǳ���ȴ�ܹ��������䵱������������������޲������ŵ������֡�")
		end
	end
end;

function select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- �ѽ��˴�����������
		Talk(1,"","���ҽ����᣺��λ����ԭ������������ţ��˸���־����Ҳ������ǿ�ˡ�")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_cy < 5*256) and (UTask_em < 5*256) then		--ˮϵ��δ����̶���
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("���ҽ����᣺�������Ƕ����ɣ���Ҷ��Ǻ���ã������మ�������Ա�������Ϊ�أ���ͬ�����ɷ�����", 3, "���������/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Say("���ҽ����᣺��ĸ�����δ��ã�����һ��ʱ�յ�ĥ������Ҫ��֮��������ȥҰ����һ��������<color=Red>ʮ��<color>�������Ұɡ�", 0)		
		end
	end		-- ����ˮϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(13,13)		  			--����������
--	nt_setTask(1, 10*256)				-- ֱ������
	SetFaction("emei")       			--��Ҽ��������
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(13)
	nt_setTask(137,61)
	SetLastFactionNumber(4)
-- ֱ�Ӵ�������
	nt_setTask(1,80*256)
	SetRank(74)
	Msg2Player("��ӭ���������ɣ�ֱ��ѧ�᱾�����м��ܡ�")
	add_em(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ������ü�ɣ���Ϊ��ü���ӣ�ѧ��һҶ֪�Ʈѩ����")
--	AddNote("�����ü�ɣ���Ϊ��ü����")
	Msg2Faction("emei",GetName().."�ӽ���������ü�ɣ��ݼ���λʦ�棬ϣ����λ����ָ��!",GetName())
	NewWorld(13, 1898, 4978)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(13, 1898, 4978)			--����Ҵ��͵��������
end;

function em_check_yes()
	if (GetSeries() ~= 2) then
		Talk(1,"","���ҽ����᣺����������Բ�������ˮϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","���ҽ����᣺���Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(88) >= 0) then		-- ������40������,���𲻾�
		nt_setTask(1,50*256)
		Talk(1,"","���ҽ����᣺���Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(85) >= 0) then		-- ������30������,һҶ֪��
		nt_setTask(1,40*256)
		Talk(1,"","���ҽ����᣺���Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(82) >= 0) then		-- ������20������,����ͬ��
		nt_setTask(1,30*256)
		Talk(1,"","���ҽ����᣺���Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(77) >= 0) then		-- ������10������,��ü����
		nt_setTask(1,20*256)
		Talk(1,"","���ҽ����᣺���Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(1,10*256)
		Talk(1,"","���ҽ����᣺���Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end;

function em_check_no()
	Say("���ҽ����᣺Сʦ�ã�����ɽ���棿���Ҫ�������ɽ��",2,"�ǵģ���Ҫ�鷳�����/return_yes","�����ˣ���лʦ��/return_no")
end

function Uworld1000_jiaoyuemei()
	nt_setTask(1000,260)
	Msg2Player("��ü�ɽ�������˵�������ɵ��ӣ������ֱ��ȥ������˵��.")
end

function no()
end;
