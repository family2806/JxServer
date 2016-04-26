-- �䵱�������� ģ�� �䵱����
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "�䵱����"

function default_talk()
	check_WDtask()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 8 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuwudang","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "emei") then
		Talk(1,"","�䵱���ˣ�����Ů����С�����������ˡ���ʦ����ʦ̫����ɺã�")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","�䵱���ˣ������ŵĹ���С���Ǻ�����ģ���֪�����к�ָ�̣�")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","�䵱���ˣ�����������Ȼ�Ը�ƫ�������²�ѭ��������Ϊ�˹�ֱ̹������Ҳ��ʧΪһ������ӡ�")
	elseif (player_Faction == "wudu") then
		Talk(1,"","�䵱���ˣ�ʹ���¶��ı����ٸ߳���Ҳ�վ���ĩ��֮�ƣ��ǲ��˴���֮�á�")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","�䵱���ˣ������˵��������ֵ��Ǹ������Ǻú�������һ������Ȼ�Ƕ������صĺ��ж���")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","�䵱���ˣ�ԭ���������ɵ�Сʦ������֪�к�ָ�̣�")
	elseif (player_Faction == "wudang") then
		Say("���ˣ���ʮ�ֹ���ʦ���������˼ҽ�������ɺã�",4,"��Ҫ�ͷ�ʦ�����һ�ɽ/return_yes","��ͼ����/map_help","����˵��/skill_help","ʦ��һ�ж���/no")
--		Say("�䵱���ˣ�������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/wd_check_yes","������/wd_check_no")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","�䵱���ˣ�ԭ���������ɵ����ѣ���֪Զ���������к�ָ�̣�")
	elseif (player_Faction == "tianren") then
		Talk(1,"","�䵱���ˣ���Ȼ�Ǹ�Ϊ���������ǽ���²�Һ�ɽ�����Ұ��գ���Ϊ�������񣬱�������һ�����������ף�")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","�䵱���ˣ����ĺΰ��������������������֮���������ʲô�£�����һ���ᶦ��������")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T? ����ѧ��Ұ��ȭ!������������!")
	else
		UTask_wd = nt_getTask(5)
		if ((UTask_wd > 5*256) and (UTask_wd < 10*256)) then		-- ����������
			Talk(1,"","�䵱���ˣ����Ѿ����䵱ɽС��ͯ��紦���˱��ɵ��������񣬵�����δ��ɣ�����ҪΪ���һص����ھ����ľͰ��")
		elseif (UTask_wd >= 70) and (player_Faction ~= "wudang") then					--�Ѿ���ʦ
			Say("�䵱���ˣ���Ȼ���ѳ�ʦ��ɽ���������ǳ��������㣬����һ��ɺã�",3,"��ͼ����/map_help","����˵��/skill_help","ʦ��һ�ж���/no")
		else
			Talk(3, "select", "�䵱���ˣ�������ѧ���������֣��ϳ��䵱���������˵���ɣ�", "�䵱���ˣ������书�����Ծ��ƶ�������˸գ��Զ�ʤ�����������졢�����������������������ˡ������񵭣�����Ϊʤ��Ϊ��������ʤ���Σ�������ѧ��ߵľ��硣", "�䵱���ˣ������书�С��岻������������ʴࡢ���ա��ö�����ơ���¶�ߣ�������")
		end
	end
end;

function select()
	UTask_wd = nt_getTask(5)
	UTask_kl = nt_getTask(9)
	if ((UTask_kl > 5*256) and (UTask_kl < 10*256)) then		-- �ѽ���������������
		Talk(1,"","�䵱���ˣ�Ŷ��ԭ������ȥ����ѧ����������")
	elseif (GetSeries() == 4) and (GetCamp() == 0) and (UTask_kl < 5*256) and (UTask_wd < 5*256) then		--��ϵ��δ�������䵱
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("�䵱���ˣ������뱾����Ҫ�������ԣ�ר�����У��պ���кܶ��������㣬�������ƼӶԴ���", 3, "�����䵱��/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Say("�䵱���ˣ�ѧ��֮���������򲻴����뽭���������Ⱥú����������ɣ�����<color=Red>ʮ��<color>�Ժ���������", 0)
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(81,40)	 					--����������
--	nt_setTask(5, 10*256)
	SetFaction("wudang")      				--��Ҽ����䵱
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(7)
	nt_setTask(137,65)
	SetLastFactionNumber(8)
-- ֱ�Ӵ�������
	nt_setTask(5,80*256)
	SetRank(73)
	Msg2Player("��ӭ������䵱�ɣ�ֱ��ѧ�᱾�����м��ܡ�")
	add_wd(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ�����䵱�ɣ����һ����ͯ��ʼ��ѧ���׺������书!")
--	AddNote("�����䵱�ɣ���Ϊ��ͯ!")
	Msg2Faction("wudang",GetName().."���ռ����䵱�ɣ��Ȱݼ���λ�ֳ�!",GetName())
	NewWorld(81, 1574, 3224)				--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(81, 1574, 3224)			--����Ҵ��͵��������
end;

function wd_check_yes()
	if (GetSeries() ~= 4) then
		Talk(1,"","�䵱���ˣ�����������Բ���������ϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(164) >= 0) then		-- ������50������,��������
		nt_setTask(5,60*256)
		Talk(1,"","�䵱���ˣ����Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(161) >= 0) then		-- ������40������,�����ķ�
		nt_setTask(5,50*256)
		Talk(1,"","�䵱���ˣ����Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(158) >= 0) then		-- ������30������,���ɾ���
		nt_setTask(5,40*256)
		Talk(1,"","�䵱���ˣ����Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(156) >= 0) then		-- ������20������,�����ķ�
		nt_setTask(5,30*256)
		Talk(1,"","�䵱���ˣ����Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(151) >= 0) then		-- ������10������,�䵱����
		nt_setTask(5,20*256)
		Talk(1,"","�䵱���ˣ����Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(5,10*256)
		Talk(1,"","�䵱���ˣ����Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end

function wd_check_no()
	Say("�䵱���ˣ���ʮ�ֹ���ʦ���������˼ҽ�������ɺã�",2,"��Ҫ�ͷ�ʦ�����һ�ɽ/return_yes","ʦ��һ�ж���/return_no")
end

function check_WDtask()
	if (nt_getTask(5) == 30*256+50) then		-- �����������
		if (GetFaction() == "wudang") then		-- δ��ʦ������������
			nt_setTask(5,10*256)
			Say("�䵱���ˣ������������д��󣬷ǳ���ǸҪ�������´�10������ʼ����һ������",1,"��л��/no")
		elseif (HaveMagic(164) >= 0) then			-- �ѳ�ʦ(ѧ���ˡ��������������Ҳ���������)����Ϊ������ʦ
			nt_setTask(5,70*256)
			Say("�䵱���ˣ������������д������Ѿ���������Ϊ�ѳ�ʦ״̬��",1,"��л��/no")
		else										-- ������Ϊδ���䵱��
			nt_setTask(5,0)
			Say("�䵱���ˣ������������д������Ѿ���������Ϊ��δ����״̬��",1,"��л��/no")
		end
	end
end

function Uworld1000_jiaoyuwudang()
	nt_setTask(1000,260)
	Msg2Player("�䵱�ɽ�������˵�������ɵ��ӣ������ֱ��ȥ������˵��.")
end



function no()
end;
