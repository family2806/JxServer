-- �����ɽ������ӽű����嶾
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "�嶾ɢ��"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 3 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuwudu","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","�嶾ɢ�ˣ�С���ˣ�������������������һ����")
	elseif (player_Faction == "emei") then				
		Talk(1,"","�嶾ɢ�ˣ�����ã��浹ù�������ޣ��󼪴����󼪴�����")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","�嶾ɢ�ˣ�����Ϊ���ǵķɵ���ʲô�˲���ģ����ǵ��Ѷ�֮��������������Ӱ���Σ�����ʤ����")
	elseif (player_Faction == "wudu") then
		Say("�嶾ɢ�ˣ���˵ɽ��������һ��������Ů���ǲ��Ǽ��Ż�ȥ���������ٺٺ٣�",4,"�������鷳����һ��/return_yes","��ͼ����/map_help","����˵��/skill_help","���ã�Ҳ������һʱ/no")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","�嶾ɢ�ˣ��ʹ���������ûʲô�ô��ģ��г�һ�մ���ƽ����ԭ���Ǿ͸�֪������ˡ�")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","�嶾ɢ�ˣ����ֵ���ͺ�ǣ�����Ϊ����װ��һ����ʵ�����Ǿͻ����㣬˭��֪������������Ļ��ϳ���ֻҪ������ץ�����ǰѱ��ˣ��ߺߺߣ�")
	elseif (player_Faction == "wudang") then
		Talk(1,"","�嶾ɢ�ˣ���ô���䵱�Ĵ���������ָ�����£���ο��²��������������ˣ�")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","�嶾ɢ�ˣ������Դ��������ɵ���Ͷ�����ӣ��������ǵ��۾�������������������ǲ������´�����������Ҫ����ˣ�")
	elseif (player_Faction == "tianren") then
		Talk(1,"","�嶾ɢ�ˣ������������ˣ������ϱ��л�����Ӧ���֮�ƣ��⻨����ɽ�������ֿɵã�����������")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","�嶾ɢ�ˣ����л��ӣ��������������˴�ү�ҵ��·���")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������!")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_wu = nt_getTask(10)
--		if (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_wu < 5*256) and (nt_getTask(2) == 70*256) then		-- ת������������
--			Say("�嶾ɢ�ˣ������Ű��������Ҷ�ҩ����֮�����ο��Ƴ������Ⱥ���������ѣ��������ᱻ��������ѵ���㲻������Ͷ�ҽ̣��������ƽ����ԭ֮ʱ���ɷ�һ������",2,"ɢ��֮�����������Ͷ�嶾��/defection_get","��������/no")
		if ((UTask_wu > 5*256) and (UTask_wu < 10*256)) then		-- ����������
			Talk(1,"","�嶾ɢ�ˣ�ֻҪͨ���˱��ɵ����ſ��飬��Ϳ��Թ��ٵس�Ϊ���ǵ�һԱ����������")
		elseif (UTask_wu >= 70*256) and (player_Faction ~= "wudu") then					--�Ѿ���ʦ
			Talk(1,"","�嶾ɢ�ˣ��þò����ˣ��������������ò����")
		else
			Talk(1,"enroll_select","�嶾ɢ�ˣ��嶾�̽�������������������֯���ܡ������������������̽̽�����ˣ��������ͳһ��ԭ����ͬ�����ˡ�����������")
		end
	end
end;

function defection_get()
	Talk(1,"","�嶾ɢ�ˣ�������������Ȼ��ʶʱ���ߣ���ֻҪȥ���Ƴ��϶�˵�������ţ�Ȼ�����򱾽̽��������ɾ��������Ϳɼ����嶾���ˡ�")
	nt_setTask(10,5*256+10)
	Msg2Player("��ҪתͶ�嶾�̣�ֻҪ���Ƴ�������ȥ���嶾���������ɾ��������ɡ�")
	AddNote("��ҪתͶ�嶾�̣�ֻҪ���Ƴ�������ȥ���嶾���������ɾ��������ɡ�")
end

function enroll_select()
	UTask_wu = nt_getTask(10)
	UTask_tm = nt_getTask(2)
	if ((UTask_tm > 5*256) and (UTask_tm < 10*256)) then		-- �ѽ���������������
		Talk(1,"","�嶾ɢ�ˣ��������ֲ�����������Ҳ��������������˷��˰����ˮ��")
	elseif (GetSeries() == 1) and (GetCamp() == 0) and (UTask_tm < 5*256) and (UTask_wu < 5*256) then		--ľϵ��δ�������嶾
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("�嶾ɢ�ˣ��������벻����뱾�̣�", 3, "�����嶾��/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","�嶾ɢ�ˣ������ڻ�һ�������û�У�óóȻ���������Ѷ�Ϊ���ǲ�������������ȥ����ʮ����˵�ɡ�")
		end
	end		-- ����ľϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(183,70)		  			--����������
--	nt_setTask(10,10*256)				-- ֱ������
	SetFaction("wudu")       			--��Ҽ��������
	SetCamp(2)
	SetCurCamp(2)
--	SetRank(49)
	nt_setTask(137,70)
	SetLastFactionNumber(3)
-- ֱ�Ӵ�������
	nt_setTask(10,80*256)
	SetRank(80)
	Msg2Player("��ӭ������嶾�̣�ֱ��ѧ�᱾�����м��ܡ�")
	add_wu(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ�����嶾�̣���Ϊ�嶾ͯ�ӣ�ѧ����ɰ�ƣ�Ѫ����ɱ.")
--	AddNote("�����嶾�̣���Ϊ�嶾ͯ��.")
	Msg2Faction("wudu",GetName().."���ռ����嶾�̣��ݼ���λ�ֳ���ϣ����λ���ָ��!",GetName())
	NewWorld(183, 1746, 2673)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(183, 1746, 2673)			--����Ҵ��͵��������
end;

function wu_check_yes()					-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","�嶾ɢ�ˣ�����������Բ�������ˮϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","�嶾ɢ�ˣ����Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(88) >= 0) then		-- ������40������,���𲻾�
		nt_setTask(1,50*256)
		Talk(1,"","�嶾ɢ�ˣ����Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(85) >= 0) then		-- ������30������,һҶ֪��
		nt_setTask(1,40*256)
		Talk(1,"","�嶾ɢ�ˣ����Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(82) >= 0) then		-- ������20������,����ͬ��
		nt_setTask(1,30*256)
		Talk(1,"","�嶾ɢ�ˣ����Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(77) >= 0) then		-- ������10������,��ü����
		nt_setTask(1,20*256)
		Talk(1,"","�嶾ɢ�ˣ����Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(1,10*256)
		Talk(1,"","�嶾ɢ�ˣ����Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end;

function em_check_no()
	Say("�嶾ɢ�ˣ���˵ɽ��������һ��������Ů���ǲ��Ǽ��Ż�ȥ���������ٺٺ٣�",2,"�������鷳����һ��/return_yes","���ã�Ҳ������һʱ/no")
end

function Uworld1000_jiaoyuwudu()
	nt_setTask(1000,260)
	Msg2Player("�嶾��������˵�������ɵ��ӣ������ֱ��ȥ������˵��.")
end

function no()
end;
