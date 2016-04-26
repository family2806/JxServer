-- �����ɽ������ӽű���ؤ��
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "ؤ����������"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 6 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyugaibang","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","ؤ���������ӣ����Ŵ������¹�����������������λ�����������ͽл��Ӽ�����Ǯ��")
	elseif (player_Faction == "emei") then				
		Talk(1,"","ؤ���������ӣ��л��ӶԶ����书���������Ѿã����յü��������᳦������������Ȼ�����鴫��")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","ؤ���������ӣ����Ű�����Ȼ����ɫ�䣬���վ���С�ɹ�����ʵ���ŵ������������������¹���Ҳδ��ѷ�����ˡ�")
	elseif (player_Faction == "wudu") then
		Talk(1,"","ؤ���������ӣ��Թ���а���������ƶ�֮��Ҳ���ſ�")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","ؤ���������ӣ���������ϳ����������۸����Ҳ�úú��׽��׽���������")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","ؤ���������ӣ�����Ϊ�л�����֮Դ�������ڽ���׾���Ȼ�����������л�����ʵ����ý���")
	elseif (player_Faction == "wudang") then
		Talk(1,"","ؤ���������ӣ��䵱�����������£������ұ���ģ������л������һ�������λ�������")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","ؤ���������ӣ�ԭ�����½�ܥ��������ɸ�ͽ���ѹ�����������ˡ�")
	elseif (player_Faction == "tianren") then
		Talk(1,"","ؤ���������ӣ����Ǹ�Ϊ��������ؤ�����̼�Ϊ���У�����Ҳ���ض��ԣ�����ɳ���ټ��ɡ�")
	elseif (player_Faction == "gaibang") then				-- ����
		Say("ؤ���������ӣ���ʲôҪ��ת������ģ�����Ҫ��������ܶ棿",4,"�鷳���һ�ȥ/return_yes","��ͼ����/map_help","����˵��/skill_help","��������ʺ򣬵���һ�а���/no")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������!")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_gb = nt_getTask(8)
--		if (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_gb < 5*256) and (nt_getTask(4) == 70*256) then		-- ת������������
--			Say("ؤ���������ӣ���Ϊ���ζ�Ů��ȴ��������Ϊ����Ч��������Ҳ���ߣ�����������Ͷ����ʵ���ж���֤����ȭȭ�����ģ�",2,"�ǣ�����һ������ؤ��Ϊ���γ���/defection_get","û��Ȥ/defection_no")
		if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- ����������
			Talk(1,"","ؤ���������ӣ������ڽ��е����������������ݳǣ��ϵ�̫���˿ɲ�̫�á�")
		elseif (UTask_gb >= 70*256) and (player_Faction ~= "gaibang") then					--�Ѿ���ʦ
			Say("���������ӣ���ò�������һ����������ģ���֪�����ɺã�",3,"��ͼ����/map_help","����˵��/skill_help","��������ʺ򣬵���һ�а���/no")
		else
			Talk(1,"enroll_select","ؤ���������ӣ����������µ�һ��ĳƺţ����ｭ�������겻˥�������Ի��������˲ı�����")
		end
	end
end;

function defection_get()
	Talk(1,"","ؤ���������ӣ���Ȼ���лڸ�֮�⣬��ôֻҪ���������պ���������̣�Ȼ�����������Ǻ����Ұ����������ɡ�")
	nt_setTask(8,5*256+10)
	Msg2Player("��ҪתͶؤ�ֻҪ�����̽̽���������̣���ȥ��ؤ������Ұ�������������ɡ�")
	AddNote("��ҪתͶؤ�ֻҪ�����̽̽���������̣���ȥ��ؤ������Ұ�������������ɡ�")
end

function defection_no()
	Talk(1,"","��ң����������ܿܣ�������ô��Դ�֮�֣��ο������ĵĺ���֮�������������³ˡ�ؤ�ﾡ���������˲ģ�������ȥҲ�ա�")
end

function enroll_select()
	UTask_gb = nt_getTask(8)
	UTask_tr = nt_getTask(4)
	if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- �ѽ���������������
		Talk(1,"","ؤ���������ӣ����������������У���Ȼ���������̣�����Ҳûʲô��˵���ˡ�")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_tr < 5*256) and (UTask_gb < 5*256) then		--��ϵ��δ������ؤ��
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("ؤ���������ӣ���û����Ȥ����ؤ�����з�һ��ԣ��о�һ��ȣ�", 3, "����ؤ��/go", "��������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","ؤ���������ӣ���ĸ�����δ��ã������������к�������������ȥ�Ѹ������һ�㣬����ʮ���������Ұɡ�")
		end
	end		-- ���ǻ�ϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(115,53)		  			--�ȴ��ṩ������
--	nt_setTask(8, 10*256)				-- ֱ������
	SetFaction("gaibang")       			--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
--	SetRank(37)
	nt_setTask(137,68)
	SetLastFactionNumber(6)
-- ֱ�Ӵ�������
	nt_setTask(8,80*256)
	SetRank(78)
	Msg2Player("��ӭ�����ؤ�ֱ��ѧ�᱾�����м��ܡ�")
	add_gb(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
--	Msg2Player("��ӭ����ؤ���Ϊ�޴����ӣ�ѧ�����ż���")
--	AddNote("����ؤ���Ϊ�޴�����.")
	Msg2Faction("gaibang",GetName().."�������ؤ��ݼ���λʦ�棬ϣ����λ����ָ��!",GetName())
	NewWorld(115, 1501, 3672)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(115, 1501, 3672)			--����Ҵ��͵��������
end;

function gb_check_yes()			-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","ؤ���������ӣ�����������Բ�������ˮϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","ؤ���������ӣ����Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(88) >= 0) then		-- ������40������,���𲻾�
		nt_setTask(1,50*256)
		Talk(1,"","ؤ���������ӣ����Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(85) >= 0) then		-- ������30������,һҶ֪��
		nt_setTask(1,40*256)
		Talk(1,"","ؤ���������ӣ����Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(82) >= 0) then		-- ������20������,����ͬ��
		nt_setTask(1,30*256)
		Talk(1,"","ؤ���������ӣ����Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(77) >= 0) then		-- ������10������,��ü����
		nt_setTask(1,20*256)
		Talk(1,"","ؤ���������ӣ����Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(1,10*256)
		Talk(1,"","ؤ���������ӣ����Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end;

function gb_check_no()
	Say("ؤ���������ӣ���ʲôҪ��ת������ģ�����Ҫ��������ܶ棿",2,"�鷳���һ�ȥ/return_yes","��������ʺ򣬵���һ�а���/no")
end

function Uworld1000_jiaoyugaibang()
	nt_setTask(1000,260)
	Msg2Player("������ؤ����ӣ�����ȥ�ˣ������ֱ��ȥ������˵��.")
end

function no()
end;
