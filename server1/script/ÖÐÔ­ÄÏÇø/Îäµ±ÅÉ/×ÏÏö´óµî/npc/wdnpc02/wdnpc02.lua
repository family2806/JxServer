--description: �䵱�ɵ�һ���ˡ��䵱10������40�����񡢳�ʦ�����ط���������
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
-- �޸�Dan_Deng�Ĵ���QBJ
-- Update��Dan_Deng(2003-10-27)Ϊ�ط�ʦ���������ȡ�������ܣ��Լ��������ɶ�Ӧ

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"�ʹ��ڱ� /#tbMasterGift:getGift('wudang')",
				"�����������/oldMain"
			}
		Say("���갲������", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("������ʲô�� ", 2, "����̴�ʦ /oldentence", "ף�ض�ʦ�ڣ��������ҹ���ʦ���͸�ͽ��/vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 8) then
		Describe("������ʲô�� ", 2,
			"ѧ120����./lvl120skill_learn",
			"�����������/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wd = GetTask(5)
	local nFactID = GetLastFactionNumber();

	if (UTask_wd == 70*256) and (GetFaction() == "wudang") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_wd == 70*256) and (GetTask(9) >= 5*256) and (GetTask(9) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(9,0)
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_wd == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(5,70*256)
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_wd == 80*256 and nFactID == 8 and GetCamp() == 1 and GetFaction() == "���뽭�� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudang");
			Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
			return
		end
	elseif (UTask_wd == 70*256 and nFactID == 8 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
			return
		end
	end

	local tbDes = {"����Ͷʦ/#daiyitoushi_main(8)", "�����������/common_talk"};
	
	Say("������кܶ���Ҫ�������������ʲô�� ", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wd = GetTask(5)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),5) == 0) then				-- ��������������
		Talk(1,"","�������������´�����������룬�䵱�ɲ��ܲ����������������������䵱����������İ���")
		Uworld40 = SetBit(GetTask(40),5,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 60*256+20) and (HaveItem(69) == 1 and HaveItem(70) == 1 and HaveItem(71) == 1) then
			Talk(2, "L60_prise", "����������֮�ǣ��������ˡ�����ʱ�Ʒ��ң�ս������������Ȩ������Ϳ̿������԰�����ȥ��������ѧ�����츣����", "��ϲ���ճɳ�ʦ�����ѱ���Ϊ�䵱�ɵ��������̣��ӽ��Ժ�����������߽������������ѡ����������ɼ���ѧ�գ�Ҳ����ȥ���������չ�Լ��Ľ����������ֻ�����һ�����н���Ҳ������������������ߺ�����ϣ�����ܴ�չȭ�ţ�һչ��ͼ")
		elseif (UTask_wd == 60*256) and (GetLevel() >= 50) then					--��ʦ����
			Say("�ں�ɽ<color=Red>̫����<color>����<color=Red>��������<color>��ÿ�����䶼��һ�������ӡ�ţ����������ɷ�������ע�������񣬾Ϳ��Դ򿪱��䣬��������б��ɵ�<color=Red>��������<color>���ܹ�ȡ�ñ����߷��ܳ�ʦ!", 2, "��������/L60_get_yes", "�ݲ���ʦ/L60_get_no")
		elseif ((UTask_wd == 40*256+60) or (UTask_wd == 40*256+80)) and (HaveItem(164) == 1) then		--40���������
			Talk(3, "L40_prise", " ʦ�������Ӵ���ʦ��ȥ��һ�˷�ţɽ�����Ž���������������Ļ���!", "ԭ����ˡ�����������㲻Ҫ������̸�𣬼�ס����?", " ��������")
--		Ϊ��ʱ������򲹶�������ֵΪ35��δѧ�䵱����(151)�ģ�Ҳ���Խ�10��������ȡ����
--		elseif ((UTask_wd == 10*256) or (((UTask_wd == 35) or (UTask_wd >= 20*256)) and (HaveMagic(151) == -1))) and (GetLevel() >= 10) and (GetFaction() == "wudang") then
		elseif (UTask_wd == 10*256) and (GetLevel() >= 10) then
			Talk(1,"","�����䵱���ӣ���Ӧ���<color=Red>�����¾���<color>������ȥ�ú����һ��<color=Red>Ҷ����<color>ʦ�壬�����ˡ����¾���֮��������Ϊʦ")
			SetTask(5, 10*256+20)
			AddNote("�����������һ���ˣ��ӵ��¾�������Ҷ����ѧ���¾�. ")
			Msg2Player("�����������һ���ˣ��ӵ��¾�������Ҷ����ѧ���¾�. ")
		elseif (UTask_wd == 10*256+50) then					--10������
			Talk(1,"L10_Q1","��������ΪʦҪ�����㣬�������")
		elseif (UTask_wd == 10*256+60)  then
			L10_Q2()
		elseif (UTask_wd == 10*256+70)  then
			L10_Q3()
		elseif (UTask_wd == 80*256) then						-- �ط�������ɳ��루�¼Ӽ��ܣ�
			check_skill()
		elseif (UTask_wd == 10*256+20) then
			Talk(1,"","�����䵱���ӣ���Ӧ���<color=Red>�����¾���<color>������ȥ�ú����һ��<color=Red>Ҷ����<color>ʦ�壬�����ˡ����¾���֮��������Ϊʦ")
		elseif (UTask_wd > 60*256) and (UTask_wd < 70*256) then					--��δ��ɳ�ʦ����
			Talk(1,"","�����򿪺�ɽ<color=Red>̫����<color>�ϵ�<color=Red>��������<color>���õ������<color=Red>��������<color>������˳����ʦ!")
		elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--�Ѿ����40��������δ�ӵ���ʦ����
			Talk(1,"","����������㲻Ҫ������̸�𣬼�ס����?")
		else					--�Ѿ����10��������δ���40������ȱʡ�Ի���
			Talk(1,"","�����ܹ���Ϊ�ֵ����ѣ�����Ե��")
		end
--	elseif (GetTask(9) == 5*256+10) then		-- ת���ɵ�����
--		Say("��һ���ˣ��������ŷ粻��������Ϊ�����ǣ�ת���ɵĻ��ұ����ջ������б������ա������ִ��Ҫ�����أ�",2,"���������Ѿ�/defection_yes","���һ��ǲ�ȥ��/defection_no")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wd == 70*256) and (GetTask(9) < 5*256) then		-- �ط�ʦ������
		Talk(2,"return_select","��ɽ��Щ���ӣ���о���ô��?","Ư���������գ���֪���Լ����书���ǲ")
	elseif (GetCamp() == 4) and ((UTask_wd == 70*256+10) or (UTask_wd == 70*256+20)) then		-- �ط�ʦ��������
		Say("׼��������������?",2,"׼������/return_complete","��û׼����/return_uncompleted")
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","�����ѳ�ʦ��Ϊʦ���м��仰����������ϰ��֮�ˣ������Ȼ��Ҫ����¸���������������²����ߣ��ղ��ܴﵽ��ѧ�澳���������Ϊ֮!")
	else
		Talk(1,"","��ѧ�е�����������������������ɣ�����������;����������ԯ����")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(267) == -1) then
--		AddMagic(267)					-- ��������
--		Msg2Player("��ѧ���ˡ��������¡�")
--		Say("��һ���ˣ�Ϊʦ��αչؿ�˼���գ��´���һ�С��������¡������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("��������Ѿ������ܴ󣬿�����ɽ������!",2,"�ǣ��������ȥ/goff_yes","������ϰ�������� /no")
--	end
end

-------------------------- �ط�������� ---------------------
function goff_yes()
	Talk(1,"","�ã���ס������ּ���������£�����ƶ����")
	SetTask(5,70*256)
	AddNote("�뿪�䵱�ɣ����߽���")
	Msg2Player("�뿪�䵱�ɣ����߽���")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=153; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ŭ��ָ
	i=151; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �䵱����
	i=152; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �䵱ȭ��
	i=155; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �׺�����
	i=156; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����ķ�
	i=157; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=158; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ɾ���
	i=159; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=160; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=161; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����ķ�
	i=162; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��һ����
	i=164; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=165; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����޽�
	i=166; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ̫����
	i=267; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(9,5*256+20)
	SetTask(5,75*256)				-- Ϊԭ�����������
	SetRank(63)
	if (GetRepute() < 200) then
		Msg2Player("������Ϊ�����ɲ��ң������������"..GetRepute().."��!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("������Ϊ�����ɲ��ң������������200��! ")
		AddRepute(-200)
	end
	AddNote("�ջ��䵱�书��������������ְλ������Լ���������. ")
	Msg2Player("�ջ��䵱�书��������������ְλ������Լ���������. ")
	Talk(1,"KickOutSelf","��Ȼ��ˣ��Ҿ͵��ջ���ѧ���书!")
end

function defection_no()
	AddNote("��������������ɵ��뷨. ")
	Msg2Player("��������������ɵ��뷨. ")
	SetTask(9,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_select()
	Say("�кܶ����о��ͷ��ﱾ���书����ô����������Ȥ����һ���о���ѧ��߾�����?",2,"����ϣ������һ���о���ѧ /return_yes","����Ҫ/return_no")
end;

function return_yes()
	Talk(1,"","�䵱ɽ�кܶ��ο����ιۣ�ɽ·Ҳ����𻵺ܶ࣬Ϊ�˿����㣬����Ծ�5����ά��ɽ·�� ")
	SetTask(5,70*256+20)
	AddNote("��5�������Է����䵱��. ")
	Msg2Player("��5�������Է����䵱��. ")
end;

function return_no()
	Talk(1,"","��л���ŵĺ��⣬���ǣ�����ħ��ʢ�У�����Ϳ̿��������ô�������Թ�?")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","�ܺã��ҽ���ͨ��˵�㷵��������!")
		Pay(50000)
		SetTask(5, 80*256)
		SetFaction("wudang")
--		if (HaveMagic(166) == -1) then
--			AddMagic(165)
--			AddMagic(267)
--			AddMagic(166)
		add_wd(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ�����ɾ�ѧ��̫���񹦣������޽�����������. ")
--		end
		SetCamp(1)
		SetCurCamp(1)
		SetRank(73)
		AddNote("�ѷ����䵱�� ")
		Msg2Player(GetName().."����Ϊ�䵱��������������������䵱������. ")
	else
		Talk(2,"","�����Ǻܹ�!","�Բ����Ҽ��һ��!")
	end
end;

function return_uncompleted()
	Talk(1,"","����!")
end;

------------------- 10������ --------------------
function L10_Q1()
	Say("���¾�����1�µĿ�ƪ��һ�仰��ʲô?", 3, "����һ��һ����������������������/no", "�˷��أ��ط��죬�취����������Ȼ/no", "���ɵ����ǳ��������������ǳ���/L10_Q2")
end;

function L10_Q2()
	SetTask(5,10*256+60)
	Say("��һ�����⣺���������Ρ��ġ�������ָ��ʲô?", 3, "һ�ֶ���/no", "������״/L10_Q3", "̫����/no")
end;

function L10_Q3()
	SetTask(5,10*256+70)
	Say("���һ�����⣺��֪�����ǣ���֪�������ĺ���һ����ʲô?", 3, "��ֱ������������׾/no", "ʤ������������ʤ��ǿ//L10_prise", "���⣬��֮���У����⣬��֮����/no")
end;

function no()
	Talk(1,"","������û���¿๦���������ˡ����¾����Ժ�������!")
end;

function L10_prise()
	Talk(1,"","�������ȷ����һ�����򣬺ܺ�!")
	SetRank(8)
	SetTask(5, 20*256)
--	AddMagic(152)
--	AddMagic(151)
	add_wd(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("���������ش���ȷ3�����⣬��ɵ��¾����񣬳�Ϊ��ɢ����. ")
	Msg2Player("��ϲ���Ϊ��ɢ���ˣ�ѧ���䵱ȭ�����䵱����. ")
end

----------------------- 40������ -----------------------
function L40_prise()
	DelItem(164)
	SetRank(11)
	SetTask(5, 50*256)
--	AddMagic(160)
	add_wd(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ���Ϊ��ص��ˣ�ѧ���䵱�ɾ�ѧ������. ")
	AddNote("��������������Ÿ���һ���ˣ�������񣬳�Ϊ��ص���. ")
end;

------------------------- ��ʦ���� -------------------------
function L60_get_yes()
Say("�����򿪺�ɽ<color=Red>̫����<color>�ϵ�<color=Red>��������<color>���õ������<color=Red>��������<color>������˳����ʦ!", 0);
SetTask(5, 60*256+20)	
AddNote("������������һ���ˣ��ӳ�ʦ����ȥ��ɽ̫�������������������������. ")
Msg2Player("������������һ���ˣ��ӳ�ʦ����ȥ��ɽ̫�������������������������. ")
end;

function L60_get_no()
	Talk(1,"","Ҳ�ã��Ǿ����䵱ɽ����Щ���Ӱ�!")
end;

function L60_prise()
	DelItem(69)
	DelItem(70)
	DelItem(71)
--	AddGlobalCountNews(GetName().."�ճɳ�ʦ������λʦ��ʦ�ó�ɽ����������", 1)
	Msg2SubWorld("�䵱�ɵ���"..GetName().."��ʦ�ɹ������ʦ��ʦ�ó�ɽ��������! ")
	SetRank(63)
	SetTask(5, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("���������������澭�������ŵ�һ���ˣ���ɳ�ʦ����˳����ʦ ")
	Msg2Player("��ϲ���ʦ������Ϊ�������̣������������120��! ")
	AddRepute(120)
end;

function no()
end
