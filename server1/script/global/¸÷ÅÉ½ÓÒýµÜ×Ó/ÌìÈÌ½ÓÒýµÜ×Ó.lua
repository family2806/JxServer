-- ���̽������� ģ�� ������ʿ
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "������ʿ"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 7 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianren","�����Ǳ��ŵ��ӣ�����Ҫȥ������ֱ�Ӻ���������˵.")
	elseif (player_Faction == "emei") then
		Talk(1,"","������ʿ������������ܼ��뱾�̣����������Щ���ɰ�����ˣ������Ҫ�����ˣ�")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","������ʿ�������˵�Ϲ�Ů��������ģ��������һ������Ȼ�����Ǳ�����Ů�ӽ��ۡ�����һ�����εε����˶����ֺα��赶Ū���أ�")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","������ʿ�����̽���һֱϣ�������ܹ�����������ߣ��ٻ����󡢸߹ٺ�»�����ò�������")
	elseif (player_Faction == "wudu") then
		Talk(1,"","������ʿ���������̺̽��嶾��һ��һ�ϣ��ѳɺ�Χ֮�ƣ���ԭ��������������֮�")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","������ʿ���κ���Ҳ�赲���˱���������ԭ�ĺ�ͼΰҵ��")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","������ʿ�����������ɵĸ��ֶ��ѽ����Ͼ���������к���û��ʲô�˲ţ�����Ҳ��ʢ��֮�¡���ʵ�Ѹ�ѽ������������")
	elseif (player_Faction == "wudang") then
		Talk(1,"","������ʿ�������˵�䵱���ڹ���������һ�����л���һ��Ҫ�����̣�")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","������ʿ�����������ɳư�����һֱ������¹��ԭ��Ұ�ģ�����һ�գ����̻�����������ԭһ��ʤ���ģ�")
	elseif (player_Faction == "tianren") then
		Say("������ʿ�����ж���",4,"�ж�����ɣ����һ���̳/return_yes","��ͼ����/map_help","����˵��/skill_help","û��/no")
--		Say("������ʿ��������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/tr_check_yes","������/tr_check_no")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","������ʿ��������л�������������ϸ��")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","����ѧ��Ұ��ȭ!������������!")
	else
		UTask_tr = nt_getTask(4)
		if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- ����������
			Talk(1,"","������ʿ�����Ѿ�����̳���˱��̵��������񣬵�����δ��ɣ�������ϻ�ɽΪ���̶����������")
		elseif (UTask_tr >= 70*256) and (player_Faction ~= "tianren") then					--�Ѿ���ʦ
			Say("������ʿ����˵���ʦ�Ժ󣬾�Ȼ����˵����ã�����ʿ�����գ�����Ŀ�࿴����",3,"��ͼ����/map_help","����˵��/skill_help","û��/no")
		else
			Talk(1,"select","������ʿ�������ŷ�����Ĺ��������̣��������ǹ�ʦ���պ��ң�������������ı���ˣ��������ʵ۶���Ҳ�������֡����̸�����������ļ�˴������������ĸ��֣���ν�����Ի���")
		end
	end
end;

function select()
	UTask_tr = nt_getTask(4)
	UTask_gb = nt_getTask(8)
	if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- �ѽ���ؤ����������
		Talk(1,"","������ʿ���ϳ���ӹ��������Щ���������ȴ����Ϊ�����϶��������ο��ء�")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_gb < 5*256) and (UTask_tr < 5*256) then		--��ϵ��δ��ؤ������
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("������ʿ��������뱾����", 3, "�������̽�/yes", "������/no","�˽�������վ���/Uworld1000_knowmagic")
		else
			Talk(1,"","������ʿ�����̵��Ӷ��Ǿ�Ӣ֮������������û�о���ĥ�µ����֣���������ȥҰ��������<color=Red>ʮ��<color>�Ժ��������ҡ�")
		end
	end
end;

function yes()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	Talk(1,"","������ʿ���ȼ��뱾�̣���Ҫ��ӽ���������̹̽�ɭ�ϣ���ʤ��̭�Ǳ��̵ķ���������Լ���ʵ����֤����ļ�ֵ�ɣ�")
	SetRevPos(49,28)	 						--����������
--	nt_setTask(4, 10*256)
	SetFaction("tianren")      					--��Ҽ������̽�
	SetCamp(2)
	SetCurCamp(2)
--	SetRank(55)							--���óƺ�
	nt_setTask(137,64)
	SetLastFactionNumber(7)
--	Msg2Player("�������̣̽���Ϊ��һ��ɱ�֡�")
--	AddNote("�������̣̽���Ϊɱ�֣�ѧ���书������Ѫ��")
	Msg2Faction("tianren",GetName().."�Խ�����������̣̽��ݼ���λʦ��ʦ�㣡",GetName())
-- ֱ�Ӵ�������
	nt_setTask(4,80*256)
	SetRank(81)
	Msg2Player("��ӭ��������̣̽�ֱ��ѧ�᱾�����м��ܡ�")
	add_tr(90)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	NewWorld(49, 1644, 3215)					--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(49, 1644, 3215)			--����Ҵ��͵��������
end;

function tr_check_yes()
	if (GetSeries() ~= 3) then
		Talk(1,"","������ʿ������������Բ������ǻ�ϵ����ô��쵽�������ģ���ȥ��һ����Ϸ����Ա�ɡ�")
	elseif (HaveMagic(148) >= 0) then		-- ������50������,��ɱ��ȭ
		nt_setTask(4,60*256)
		Talk(1,"","������ʿ�����Ѿ����������״̬����������ˡ������ڿ���ȥ�ӳ�ʦ����")
	elseif (HaveMagic(146) >= 0) then		-- ������40������,������
		nt_setTask(4,50*256)
		Talk(1,"","������ʿ�����Ѿ����������״̬����������ˡ����Ѿ������40������")
	elseif (HaveMagic(141) >= 0) then		-- ������30������,�һ�����
		nt_setTask(4,40*256)
		Talk(1,"","������ʿ�����Ѿ����������״̬����������ˡ����Ѿ������30������")
	elseif (HaveMagic(138) >= 0) then		-- ������20������,��ɽ�
		nt_setTask(4,30*256)
		Talk(1,"","������ʿ�����Ѿ����������״̬����������ˡ����Ѿ������20������")
	elseif (HaveMagic(131) >= 0) then		-- ������10������,����ì��
		nt_setTask(4,20*256)
		Talk(1,"","������ʿ�����Ѿ����������״̬����������ˡ����Ѿ������10������")
	else
		nt_setTask(4,10*256)
		Talk(1,"","������ʿ�����Ѿ����������״̬����������ˡ������ڿ���ȥ��10������")
	end
end

function tr_check_no()
	Say("������ʿ�����ж���",2,"�ж�����ɣ����һ���̳/return_yes","û��/return_no")
end

function Uworld1000_jiaoyutianren()
	nt_setTask(1000,260)
	Msg2Player("�����ɽ�������˵�������ɵ��ӣ������ֱ��ȥ������˵��.")
end

function no()
end;
