--description: �������޹� ������������ʦ�����ط���������
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
-- Update��Dan_Deng(2003-10-27)Ϊ�ط�ʦ���������ȡ�������ܣ��Լ��������ɶ�Ӧ

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	if (vt06_isactive() ~= 0) then
		Say("������ʲô��?", 2, "����̴�ʦ��/oldentence", "��ʦ�������Ѿ��ҹ���ʦ���͸߶�����/vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>�������кܶ�����Ҫ�����������ʲô��?"
	G_TASK:OnMessage("����", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 1) then
		tbDailog:AddOptEntry("ѧϰ120������.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("����̱����", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end

	UTask_tw = GetTask(3);
	local nFactID = GetLastFactionNumber();

	if (UTask_tw == 70*256) and (GetFaction() == "tianwang") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ����©���Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_tw == 70*256) and (GetTask(7) >= 5*256) and (GetTask(7) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(7,0)
		Say("ϵͳ����©���Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_tw == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(3,70*256)
		Say("ϵͳ����©���Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_tw == 80*256 and nFactID == 1 and GetCamp() == 3 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianwang");
			Say("ϵͳ����©���Ѽ�ʱ�޸�!",0)
			return
		end
	elseif (UTask_tw == 70*256 and nFactID == 1 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ����©���Ѽ�ʱ�޸�!",0)
			return
		end
	end
	local tbDes = {"����Ͷʦ/#daiyitoushi_main(1)", "����̱������/common_talk"};
	
	Say("�������кܶ�����Ҫ�������������ʲô��?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- ��������������
		Talk(1,"","�γ���͢�޴���������Ҳ������졣����������Ҹ��׼�����Ρ������治�ţ�ҲҪʵ�������־!")
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--�õ���������
			Talk(3, "L60_prise", "���²���ʹ�����Ѿ������������顷ȡ�أ��������Ŀ! ", "̫���ˣ��õ��������鲻�����Ա�ȫ���ﻹ��ֹ��һ�����ֺƽ٣������ĺܺã���������������ɴ���������?", "��ϲ��ɹ���ʦ���㱻��Ϊ����Ԫ˧���ӽ�������������ɴ��������ˣ�ϣ������Է�����������չǰ;!")
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", "�뵱�꣬�����ڶ�ͥ��������Ͽ����Σ����ֽ�����ε�Ӣ�ۣ�������ʺ�����в��ƾ��ҵ���ʥ����Ϊ���䣬�����쵼���塣�����չѸ�ͣ�����͢�ֻţ����ر�ǰ���������ǳ�Ѫս�У��ҵ����ұ���ͽ��������ս�����������ݵ���������", "�º��ҽ������¹ڡ��彣��һ������һ������ <color=Red>���ݵ�<color>. �Ǳ�������Ϊ<color=Red>'��������<color>, ���治���������ҵ���ǰ�о�������ĵ�����Ҫ�����һ���ϸ��¼�˶�ͥ�������ľ���Ҫ�غ�ˮ·Ҫ������˶��ڱ����������һ��ʮ����Ҫ������. ", "���������֪��˭��©����Ϣ���Ȿ�鱻�����̽�����������˴���ɱ��ǰ�����ݵ�����ȥ�����Ȿ��. ")
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- �ط�������ɳ���
			Say("��ô�������߽���һ��?",2,"�ǵģ��������׼. /goff_yes","�������Լ����Ĺ��򻹲���. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--�Ѿ��ӵ���ʦ������δ���
			Talk(1,"","<color=Red>'��������<color>������һ��<color=Red>������<color>, �������<color=Red>���ݵ�����<color>, ֮ǰҪ�ҵ�<color=Red>�򿪱����Կ��<color>.")
		else
			Talk(1,"","������������Ʒ�������ԭ���֣���������ֵܲ�ͬ�ģ���ô�ܶԿ��о���")
		end
--	elseif (GetTask(7) == 5*256+10) then		-- ת����������
--		Say("�������Ѱ���Ҫ��ȥ����ȫ���书�������Ҫ��������Ͷ�������ɣ�",2,"���������Ѿ�/defection_yes","�����һ��ǲ���Ͷ������/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- �ط�ʦ������
		Talk(1,"return_select","�ܺã����߽����ǵ�Ҫ�����������")
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say("��׼����5��������?",2,"׼������/return_complete","��û׼����/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--�Ѿ���ʦ
		Talk(1,"","�뿪����֮��ÿ�����Ծ���������һ��!")
	else
		Talk(1,"","�����ﲻ���ν��κ�һ��Ҳ��վ�ȣ�������չ���٣�������Ϊ�����ֵ��Ž�һ��")
	end
end

---------------------- ���ܵ������ ------------------------
function check_skill()
	x = 0
	skillID = 38					-- �̹ž�ʽ
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
		Say("Ϊʦ�˴αչ�˼�����գ�����������ʽ�����ڴ����㡣ѧ��֮��ǵ�Ҫ����һ��ʱ��������˽���.",1,"��лʦ��/KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- �ط����� ----------------------
function goff_yes()
	Talk(1,"","̫����! ���߽���Ҫ�ǵð���������˰�")
	SetTask(3,70*256)
	AddNote("�뿪������������߽���")
	Msg2Player("�����뿪������������߽���")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- ˢ������
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ն����
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ǹ��
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ط�����
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ƾ�
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ն
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ľ�
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ն
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ս��
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �÷�ն
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �̹ž�ʽ����ȡ�����ܣ�
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ϻ���
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ѫս�˷�
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- Ϊԭ�����������
	SetRank(79)						-- ͷ�ν�Ϊ���Ԫ˧
	if (GetRepute() < 200) then
		Msg2Player("��Ϊ��Ϊ�����ɲ��ң������������"..GetRepute().."��!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("��Ϊ��Ϊ�����ɲ��ң������������200��! ")
		AddRepute(-200)
	end
	AddNote("������������������书�������㾪��Ԫ˧��ְλ��ͬʱ�������������뿪�������������Լ���������. ")
	Msg2Player("������������������书�������㾪��Ԫ˧��ְλ��ͬʱ�������������뿪�������������Լ���������. ")
	Talk(1,"KickOutSelf","���ź�����Ҫ�ջؽ�����书��ȡ����ľ���Ԫ˧֮��")
end

function defection_no()
	SetTask(7,1*256)				-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
	AddNote("�������������. ")
	Msg2Player("�������������. ")
end

function return_select()
	Say("�ԣ�һ���˵��������ޣ�Ҫ�Ž�ÿһ���˲ſ��Գ��¡����ﻹ�����ɾ����������֡���ֻ�����ҳϵĵ��ӡ���Σ���Ҫ�ر�����?",2,"�õģ������������/return_yes","������ֻ�����˵˵. /return_no")
end;

function return_yes()
	Talk(2,"","̫���ˣ������Ҿ������ξ���ս�����Ѳ��㣬�㽻5�����Ϳ��Իر�����ѧ������","�õģ�����׼��һ��. ")
	SetTask(3,70*256+20)
	AddNote("�ó�5��������֧��������Ϳ��Ի�������. ")
	Msg2Player("�ó�5��������֧��������Ϳ��Ի�������. ")
end;

function return_no()
	Talk(1,"","��ֻ��·��������ͬ�Ŷ���!")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ��50000��
		Talk(1,"","�ܺã���ӭ�����������ҷ���Ϊ����Ԫ˧. ")
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
--		if (HaveMagic(36) == -1) then
--			AddMagic(32)
--			AddMagic(41)
--			AddMagic(324)
--			AddMagic(36)
		add_tw(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ�������＼�ܣ�����ս�⣬�书����ն��Ѫս�˷���������. ")
--		end
		AddNote("�ص�������. ")
		Msg2Faction(GetName().."�ص����������Ϊ����Ԫ˧")
	else
		Talk(2,"","�������񻹲���","������˼���Ҽ��һ��.")
	end
end;

---------------------- ��ʦ���� ----------------------
function L60_get()
	Say("<color=Red>'��������<color> ���Բ����䵽��������. �����̵� <color=Red>���ݵ�<color>, �õ�<color=Red>'��������<color> ���������õ���?", 2, "���¶������ľ���/L60_get_yes", "���¿��²��ܽ����������/no")
end;

function L60_get_yes()
	Talk(1,"","<color=Red>'��������<color>����һ��<color=Red>����<color>, �������<color=Red>���ݵ�����<color>, ֮ǰҪ�ҵ�<color=Red>���������Կ��<color>. ��Ͽ�����ȥ<color=Red>���ݵ�<color>. ��סҪǧ��С��!")
	SetTask(3, 60*256+20)
	AddNote("���������޹�(223, 196)������, ��������ȥ���ݵ��û���������")
	Msg2Player("���������޹�(223, 196)������, ��������ȥ���ݵ��û���������")
end;

function L60_prise()
DelItem(96)
Msg2Player("��ϲ���ʦ�ɹ����㱻��Ϊ���Ԫ˧����������120��")
--AddGlobalCountNews(GetName().."�ճɳ�ʦ�����ͬ��ʦ�ܿ�ʼ����������", 1)
Msg2SubWorld("����"..GetName().."�ճɳ�ʦ�����ͬ���ֵܼ�����������")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--����˳�������
SetCurCamp(4)
AddNote("�����������޹������������齻��������������ɳ�ʦ�������ξ���Ԫ˧.. ")
end;

function no()
end
