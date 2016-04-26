-- �����ɽ������ӽű���������
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "���̻�ʹ"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 5 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyucuiyan","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "cuiyan") then		-- ����
		Say("���̻�ʹ��������͵͵��������ˣ�",4,"�ţ��鷳������һ�ȥ/return_yes","��ͼ����/map_help","����˵��/skill_help","���װ��û�����Ҿ�������/no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","���̻�ʹ���绨���Ů�ӣ�ƫҪ���������ƹŷ����ϲ�����Ǿ�����һ�㡣")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","���̻�ʹ���������������ڼ��������ٷֱ˴ˣ�ʵ�����ϲ�¡�")
	elseif (player_Faction == "wudu") then
		Talk(1,"","���̻�ʹ����������͵͵�¶����˵������ģ�������Ǹ���Ҳ���˵�㰡��")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","���̻�ʹ�����ǰ�������и��ҼҺν�㣬�ߣ��������˹�Ȼûһ���ö�����")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","���̻�ʹ�����ǲ��뵱�ź�����ͺ¿���������������û�����Ҵ�ڨ��ʲô��")
	elseif (player_Faction == "wudang") then
		Talk(1,"","���̻�ʹ�������������Ծӣ�ȴ��֪��˼����������Ƥ��һ��ճ��������ʦ�������������壿")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","���̻�ʹ������������Ѹ��ܥ���ͷǿ����ԭ������ͬ���������浶��ǹ�����಩���������ܿɹ�СŮ����̾����ѽ��")
	elseif (player_Faction == "tianren") then
		Talk(1,"","���̻�ʹ��˭���ʵ��ǲ����ҵ��£������ǲ�ɱ�޹�ݱ�����鱾��������Ʋ�˳�ۣ�")
	elseif (player_Faction == "gaibang") then
		Talk(2,"","���̻�ʹ����������Ҫ��������","���̻�ʹ�������������飡������")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_cy = nt_getTask(6)
--		if (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_cy < 5*256) and (nt_getTask(1) == 70*256) then		-- ת������������
--			Say("���̻�ʹ���绨���Ů�ӣ�ƫҪ���������ƹŷ𣬺α��ء��������Ǵ������£����컶��Ц��ǲ�����������Ӧ��ӵ�е�����ѽ��",2,"�е�����ô�����Ͷ���̸���ô���أ�/defection_get","��ƹŷ�����Ը����㲻�ض���/no")
		if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- ����������
			Talk(1,"","���̻�ʹ�����Ѿ���ʦ����������������񣬵�����δ��ɣ���ͨ��������Ŀ���֮�����ͬ�Ž����ˡ�")
		elseif (UTask_cy >= 70*256) and (player_Faction ~= "cuiyan") then					--�Ѿ���ʦ
			Say("���̻�ʹ�����ΪʲôҪ��ʦ�����������Цĵ�������Ǹ���ң������",3,"��ͼ����/map_help","����˵��/skill_help","���װ��û�����Ҿ�������/no")
		else
			Talk(1,"enroll_select","���̻�ʹ�����Ǵ�������ȻȫΪŮ�ӣ��������书�ԡ��ᡢ�졢�桢�����������������������ģ�������Ҳ���˸�С�����ǡ�")
		end
	end
end;

function defection_get()
	Talk(1,"","���̻�ʹ���ܼ򵥣���ֻҪȥ���������ʦ̫����ת������������Ȼ�����������������������Ϳ����ˡ����ģ�����ʦ̫ͨ�����������Ϊ��ġ�")
	nt_setTask(6,5*256+10)
	Msg2Player("��ҪתͶ�����ţ�ֻҪ���������ʦ̫����Ȼ��ȥ����������������������ɡ�")
	AddNote("��ҪתͶ�����ţ�ֻҪ���������ʦ̫����Ȼ��ȥ����������������������ɡ�")
end

function enroll_select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- �ѽ��˴�����������
		Talk(1,"","���̻�ʹ����һλ�ý���Ҫȥ����ľ����ƣ����ǿ�ϧ��̾��")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_em < 5*256) and (UTask_cy < 5*256) then		--ˮϵ��δ����Ҵ���
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("���̻�ʹ�������벻��������Ǵ����ţ�", 3, "���������/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","���̻�ʹ�����ȰѸ�����һ�򣬵���<color=Red>ʮ��<color>����һ�����ý��ðɡ�")
		end
	end		-- ����ˮϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(154,61)		  				-- ������
--	nt_setTask(6,10*256)						-- ֱ������
	SetFaction("cuiyan")      			--��Ҽ��������
	SetCamp(3)
	SetCurCamp(3)
--	SetRank(31)
	nt_setTask(137,66)
	SetLastFactionNumber(5)
-- ֱ�Ӵ�������
	nt_setTask(6,80*256)
	SetRank(77)
	Msg2Player("��ӭ���������ţ�ֱ��ѧ�᱾�����м��ܡ�")
	add_cy(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ������������ɱ�ɻ��ӣ�ѧ���绨ѩ�£�������")
--	AddNote("����������ɣ���Ϊ����")
	Msg2Faction("cuiyan",GetName().."�ӽ������������ɣ��ݼ���λʦ�棬ϣ����λ����ָ��!",GetName())
	NewWorld(154, 403, 1361)			-- ����������

end;

function return_yes()
	NewWorld(154, 403, 1361)			-- ����������
end;

function cy_check_yes()					-- �ɶ��Ҹ�����������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","���̻�ʹ������������Բ�������ˮϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","���̻�ʹ�����Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(88) >= 0) then		-- ������40������,���𲻾�
		nt_setTask(1,50*256)
		Talk(1,"","���̻�ʹ�����Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(85) >= 0) then		-- ������30������,һҶ֪��
		nt_setTask(1,40*256)
		Talk(1,"","���̻�ʹ�����Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(82) >= 0) then		-- ������20������,����ͬ��
		nt_setTask(1,30*256)
		Talk(1,"","���̻�ʹ�����Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(77) >= 0) then		-- ������10������,��ü����
		nt_setTask(1,20*256)
		Talk(1,"","���̻�ʹ�����Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(1,10*256)
		Talk(1,"","���̻�ʹ�����Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end;

function cy_check_no()
	Say("���̻�ʹ��������͵͵��������ˣ�",2,"�ţ��鷳������һ�ȥ/return_yes","���װ��û�����Ҿ�������/no")
end

function Uworld1000_jiaoyucuiyan()
	nt_setTask(1000,260)
	Msg2Player("�����Ž�������˵�����ֱ��ȥ������˵��.")
end

function no()
end;
