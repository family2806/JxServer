-- �����ɽ������ӽű�������
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "�����޺�"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 0 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyushaolin","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","�����޺��������������䣬����ѧ֮�������辶��������似Ҳ��Сɮ���������ˡ�")
	elseif (player_Faction == "emei") then				
		Talk(1,"","�����޺�����������ʦ̫��ѧ������ո�����Сɮ�����Ѿ��ˡ�")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","�����޺��������������Ż�����Ϊ�������������ϵĹ������ó����뻯�����ɴ�ʦ����ʱҲ������ý���")
	elseif (player_Faction == "wudu") then
		Talk(1,"","�����޺������ɹ������������������Υ��ͣ�ƶɮ����Ȱ���Ƕ����ϰ���������ǴȰ���ͣ������������ǡ�")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","�����޺�����ﴦ�����������ԣ����Ž�����ڵ���ǲ���Ը������λ���С�ġ�")
	elseif (player_Faction == "shaolin") then
		Say("�����޺���ʦ�ܣ�ʦ����ǲ����ɽ���£�",4,"�ǣ���ʦ�����һ�ɽ/return_yes","��ͼ����/map_help","����˵��/skill_help","�ǵģ�������ʦ���ʰ�/no")
	elseif (player_Faction == "wudang") then
		Talk(1,"","�����޺�����ת����ɵ�һ�������ϣ����ɷ������£���λ��������������ɸ�λ�پۣ�������ѧ���С�")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","�����޺���������ѧ������ɣ���â̫�����м��ޡ����߽���������Ǵ�ɰ��������ӷ�")
	elseif (player_Faction == "tianren") then
		Talk(1,"","�����޺���������ܽ���ӻ������������н������򣬲����ǳ�Ϊ������̾Ϳ������ɵ��ˡ�")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","�����޺�������ںΰ����������������ϣ���Ϊ��ԭ�����п���������мᣬ�����ұ���ģ��")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_sl = nt_getTask(7)
--		if (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_sl < 5*256) and (nt_getTask(3) == 70*256) then		-- ת������������
--			Say("�����޺��������书�����֣������书�������ڣ�������ǧ���ӽ�����Ϊ����",2,"�����Ͷ����ѧ��/defection_get","û��Ȥ/defection_no")
		if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- ����������
			Talk(1,"","�����޺���ʦ������������������ǿ�����������־������ֻҪ��֮��ɾͿ��Խ��뱾���ˡ�")
		elseif (UTask_sl >= 70*256) and (player_Faction ~= "shaolin") then					--�Ѿ���ʦ
			Say("�����޺���ԭ���ǳ�ʦʦ�֣���֪�����ɺã�",3,"��ͼ����/map_help","����˵��/skill_help","�ǵģ�������ʦ���ʰ�/no")
		else
			Talk(1,"enroll_select","�����޺�����������������Ϊ���ֵ�һ���ɣ��ų���ԭ���ֵ�̩ɽ������������ɮ��ϰ��ԴԶ�������ԡ�������ʮ���������������¡�")
		end
	end
end;

function defection_get()
	Talk(1,"","�����޺��������ӷ���ֻҪȥ������������������������������������������Ϳɼ�������ˡ�")
	nt_setTask(7,5*256+10)
	Msg2Player("��ҪתͶ�����ɣ�ֻҪ�������������������ȥ���������������������ɡ�")
	AddNote("��ҪתͶ�����ɣ�ֻҪ�������������������ȥ���������������������ɡ�")
end

function defection_no()
	Talk(1,"","��ң������书�Գ�һ��Ҳδ�ر��������֡��һ�����Ը�����������")
end

function enroll_select()
	UTask_sl = nt_getTask(7)
	UTask_tw = nt_getTask(3)
	if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- �ѽ�����������
		Talk(1,"","�����޺�����������������ֲ����������ڽ�����Σ��֮����������ѡ��Ҳδ�����á�")
	elseif (GetSeries() == 0) and (GetCamp() == 0) and (UTask_tw < 5*256) and (UTask_sl < 5*256) then		--��ϵ��δ����������
		if ((GetLevel() >= 10) and (HaveMagic(29) == -1)) then						--�ȼ��ﵽʮ��������ûѧ����ն��������
			Say("�����޺�������Ϊ��ԭ������������֮�ף����Ƿ�Ҳ����뱾�£�", 3, "����������/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","�����޺�����ĸ�����δ��ã����˹����������ɾ�ѧ����������ȥ��û���������ʮ��������Сɮ��")
		end
	end		-- ���ǽ�ϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(103,51)		  			--����������
--	nt_setTask(7,10*256)				-- ֱ������
	SetFaction("shaolin")       			--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(1)
	nt_setTask(137,67)
	SetLastFactionNumber(0)
-- ֱ�Ӵ�������
	nt_setTask(7,80*256)
	SetRank(72)
	Msg2Player("��ӭ����������ɣ�ֱ��ѧ�᱾�����м��ܡ�")
	add_sl(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ����������ɣ���Ϊɨ��ɮ��ѧ�������书����շ�ħ")
--	AddNote("���������ɣ���Ϊɨ��ɮ.")
	Msg2Faction("shaolin",GetName().."�ӽ���ȥ�������֣��ݼ���λʦ�棬ϣ����λ����ָ��!",GetName())
	NewWorld(103, 1845, 2983)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(103, 1845, 2983)			--����Ҵ��͵��������
end;

function sl_check_yes()			-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","�����޺�������������Բ�������ˮϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","�����޺������Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(88) >= 0) then		-- ������40������,���𲻾�
		nt_setTask(1,50*256)
		Talk(1,"","�����޺������Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(85) >= 0) then		-- ������30������,һҶ֪��
		nt_setTask(1,40*256)
		Talk(1,"","�����޺������Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(82) >= 0) then		-- ������20������,����ͬ��
		nt_setTask(1,30*256)
		Talk(1,"","�����޺������Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(77) >= 0) then		-- ������10������,��ü����
		nt_setTask(1,20*256)
		Talk(1,"","�����޺������Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(1,10*256)
		Talk(1,"","�����޺������Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end;

function em_check_no()
	Say("�����޺���ʦ�ܣ�ʦ����ǲ����ɽ���£�",2,"�ǣ���ʦ�����һ�ɽ/return_yes","�ǵģ�������ʦ���ʰ�/no")
end

function Uworld1000_jiaoyushaolin()
	nt_setTask(1000,260)
	Msg2Player("�����ɽ�������˵�������ɵ��ӣ������ֱ��ȥ������˵��.")
end

function no()
end;
