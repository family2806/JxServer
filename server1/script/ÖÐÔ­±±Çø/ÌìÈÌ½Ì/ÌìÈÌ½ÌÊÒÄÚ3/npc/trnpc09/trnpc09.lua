--description: ���̽̽������պ��ҡ����̳̽�ʦ�����ط���������
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
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
				"�ʹ���/#tbMasterGift:getGift('tianren')",
				"�����������/oldMain"
			}
		Say("���갲������", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("������ʲô��?", 2, "����̴�ʦ/oldentence", "��ף��ʦ�ڣ��������ҹ���ʦ���͸��ֿ� /vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 7) then
		Describe("������ʲô�£� ", 2,
			"ѧ120����./lvl120skill_learn",
			"�����������/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_tr = GetTask(4);
	local nFactID = GetLastFactionNumber();

	if (UTask_tr == 70*256) and (GetFaction() == "tianren") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_tr == 70*256) and (GetTask(8) >= 5*256) and (GetTask(8) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(8,0)
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_tr == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(4,70*256)
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_tr == 80*256 and nFactID == 7 and GetCamp() == 2 and GetFaction() == "���뽭�� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianren");
			Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
			return
		end
	elseif (UTask_tr == 70*256 and nFactID == 7 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
			return
		end
	end

	local tbDes = {"����Ͷʦ/#daiyitoushi_main(7)", "�����������/common_talk"};
	
	Say("����Һ�æ����������ʲô�£�", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tr = GetTask(4);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),4) == 0) then				-- ��������������
		Talk(1,"","���½�ʧȥ���ǰ������̱��Ǵ����̣����½����������ϸ����¡��ã���Ͷ��½�˵������ֻ��һȺ�ں�֮�ڣ������𷴿����ȿ��Ǻ�����˵��������!")
		Uworld40 = SetBit(GetTask(40),4,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 60*256) and (GetLevel() >= 50) then		-- ��ʦ��������
			Say("����ʥ������һ������н�����̡��������̾��ĵ�<color=Red>��Ƥ��<color>�������Ƥ�鱻���ν���������˺����<color=Red>ʥ��<color>���˵���Ǵ���ʥ���߶���ȥ�޻ء�����Ϊ���̵Ļ��̷������е�������ʥ��ȡ����Ƥ����", 2, "���������Դ� /L60_get_yes", "���¿��ѵ��˴���/L60_get_no")
		elseif (UTask_tr == 60*256+20) and (HaveItem(127) == 1 and HaveItem(128) == 1 and HaveItem(129) == 1 and HaveItem(130) == 1 and HaveItem(131) == 1) then 
			DelItem(127)
			DelItem(128)
			DelItem(129)
			DelItem(130)
			DelItem(131)
			SetTask(28,0)		-- ���ӱ�����λ��ʥ�����ټ���ʹ��
			SetTask(4,60*256+50)		-- ������ѶϽ����������պ��Ҳ��ܽ�ʥ�����򻯳�����
			AddNote("�ҵ�5�ѶϽ��󣬻����̣̽���ʥ��. ")
			Msg2Player("���Ѿ��ܽ���ʥ��")
			Talk(1,"","�ܺã���������Խ�ʥ������Ƥ�����.")
		elseif (UTask_tr == 60*256+70) and (HaveItem(132) == 1) then		-- ��ʦ�������
			Talk(2, "L60_prise", "���Ȼ���Ǳ��̵�ʥ�飡�ã��ã��Ϸ򲻻ῴ���ˣ�����Ŀǰ���书�͵�ʶ������ʱ�գ��ػ���һ�����춯�صĴ���Ϊ��ϣ�����ʦ�Ժ󣬲����Ϊ�Ϸ�ĵ��ˣ���������!", "��ϲ���ճɳ�ʦ�����ѱ���Ϊ���̵̽������������ӽ��Ժ�����������߽�������ϣ�����ܴ�չȭ�ţ�һչ��ͼ!")
		elseif (UTask_tr == 80*256) then						-- �ط�������ɳ���
			check_skill()
		elseif (UTask_tr > 60*256) and (UTask_tr < 60*256+50) then					--�Ѿ��ӵ���ʦ������δ�õ���ѶϽ�
			Talk(1,"","�ڽ���<color=Red>ʥ��<color>ȡ��<color=Red>��Ƥ��<color>֮ǰ����������ҵ�������<color=Red>�꾩<color>�����<color=Red>��ѶϽ�<color> .")
		elseif (UTask_tr >= 60*256+50) and (UTask_tr <= 60*256+70) then					--�Ѿ��ӵ���ʦ������δ�õ���Ƥ��
			Talk(1,"","<color=Red>��Ƥ��<color>���ں����<color=Red>ʥ��<color>��.")
		else
			Talk(1,"","�Թ�������λ��Ȩ���߶�Ϊ�������ɣ�����ʥ����Ȼ���Ϸ�����мӣ����ǲ¼�֮�Ŀ��´�δ��ʧ����������������߹����ɵ�������һ��СС�������أ������գ��գ��գ��Ϸ�ֻ��������������ģ��ܲ����������Եķ̰�ڮ��!")
		end
--	elseif (GetTask(8) == 5*256+10) then		-- ת���ɵ�ؤ��
--		Say("���պ��ң�ؤ���뱾���Ĳ��������㾹�뱳�����̸�Ͷؤ�С���ҷ�����Ĺ���",2,"�Բ��𣬵������Ѿ�/defection_yes","�һ��ǲ�ȥ��/defection_no")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tr == 70*256) and (GetTask(8) < 5*256) then		-- �ط�ʦ������
		Talk(1,"return_sele","��������ʦ����˿��Է������ɼ���������?")
	elseif (GetCamp() == 4) and ((UTask_tr == 70*256+10) or (UTask_tr == 70*256+20)) then		-- �ط�ʦ��������
		Say("׼��������������?",2,"׼������/return_complete","��δ׼����/return_uncompleted")
	elseif (UTask_tr >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","�����Ǻ�����η��������Ŀǰ���书�͵�ʶ������ʱ�գ��ػ���һ�����춯�صĴ���Ϊ��ϣ���պ����Ҳ����Ϊ����!")
	else
		Talk(1,"","ֻҪ������ſ�����뱾�̣����̶�ʮ�ֻ�ӭ.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(150) == -1) then
--		AddMagic(142)
--		AddMagic(148)
--		AddMagic(150)
--		AddNote("��ѧ�������ɾ�ѧ��ħ���塢�书͵�컻�ա�ħ����ɱ��")
--		Msg2Player("��ѧ�������ɾ�ѧ��ħ���塢�书͵�컻�ա�ħ����ɱ��")
--		Say("���պ��ң�Ϊʦ��αչؿ�˼���գ��Ľ��˱����书�����ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("����ȥ�ϳ���̽��Ϣ��?",2,"��������Ҳ�����뽭��һ��. /goff_yes","���¸о���ϰ����/no")
--	end
end

----------------------- �ط�������� --------------------
function goff_yes()
	Talk(1,"","�ܺã����ܲ�Ҫ�����ϳ����ջ�. ")
	SetTask(4,70*256)
	AddNote("�뿪���̣̽��������߽���")
	Msg2Player("���뿪���̣̽��������߽���")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=135; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������Ѫ
	i=131; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���̵���
	i=132; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ì��
	i=134; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���̴���
	i=136; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����ٻ�
	i=137; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��Ӱ�ɺ�
	i=138; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ɽ�
	i=139; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ˮ����
	i=140; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ɺ��޼�
	i=141; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ˮ����
	i=142; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ͵�컻��
	i=143; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ħ���
	i=145; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ָ����
	i=146; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=147; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ڤ����
	i=148; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ɱ��ȭ
	i=149; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ʴ��Ѫ��
	i=150; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ħ����
	i=254; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ζ���
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(8,5*256+20)
	SetTask(4,75*256)				-- Ϊԭ�����������
	SetRank(71)
	if (GetRepute() < 200) then
		Msg2Player("��Ϊ��Ϊ�����ɲ��ң���������"..GetRepute().."��!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("��Ϊ��Ϊ�����ɲ��ң���������200��! ")
		AddRepute(-200)
	end
	AddNote("�������̵̽ļ��ܺͳƺź���������Լ���ؤ����. ")
	Msg2Player("�������̵̽ļ��ܺͳƺź���������Լ���ؤ����. ")
	Talk(1,"KickOutSelf","��Ȼ��ˣ���ϳ��书��������ô������. ")
end

function defection_no()
	AddNote("���������ؤ��. ")
	Msg2Player("���������ؤ��. ")
	SetTask(8,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_sele()
	Say("��˵�뷵�ر���?",2,"����!/return_yes","��. /return_no")
end;

function return_yes()
	Talk(2,"","�뵽���̼��ķ�չ���̣����̹涨���ر�����Ҫ��5���� ","�ã������Ѵ���5����.")
	SetTask(4,70*256+20)
	AddNote("���������������̽�. ")
	Msg2Player("���������������̽�. ")
end;

function return_no()
	Talk(1,"","�Ժ󷵻������񱾽̣����ڻ���δ�������. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","�ܺã����ѳ�Ϊ���̼������ӣ��һ��򱾽�ʥ�̳�������㣬��Ҫ����ʧ��.")
		Pay(50000)
		SetFaction("tianren")	
		SetCamp(2)
		SetCurCamp(2)
		SetRank(81)
		SetTask(4, 80*256)
--		if (HaveMagic(150) == -1) then
--			AddMagic(142)
--			AddMagic(148)
--			AddMagic(150)
		add_tr(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("����ѧ�����ɾ�ѧ����ħ���壬���컻�գ�ħ����ɱ. ")
--		end
		AddNote("�������̽�")
		Msg2Player(GetName().."�������̣̽�����Ϊʥ�̳���. ")
	else
		Talk(2,"","��ô�ˣ���ֻ����ô������?","�Բ������Ҽ��һ��.")
	end
end;

function return_uncompleted()
	Talk(1,"","���!")
end;

----------------------- ��ʦ���� ------------------------
function L60_get_yes()
	Talk(1,"","�Ϸ��Ȼû�п����ۣ��㵹����Щ��ʶ�������ڽ���ʥ��֮ǰ����������ҵ�������<color=Red>�꾩<color>���<color=Red>��ѶϽ�<color> .")
	SetTask(4, 60*256+20)
	AddNote("�����պ��ң��ӳ�ʦ��������Ҫȥ�꾩����ѶϽ�. ")
	Msg2Player("�����պ��ң��ӳ�ʦ��������Ҫȥ�꾩����ѶϽ�. ")
end;

function L60_get_no()
	Talk(1,""," �ѵ��㲻ע��������?")
end;

function L60_prise()
	DelItem(132)
--	AddGlobalCountNews(GetName().."�ճɳ�ʦ������λ�������½�����", 1)
	Msg2SubWorld("���̽���ͽ"..GetName().."��ʦ�ɹ�������λ���ѷ����Ϸ�. ")
	SetRank(71)
	SetTask(28,0)		-- ���ӱ�����λ
	SetTask(4, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("�������̣̽�����Ƥ������պ��ң���ɳ�ʦ������Ϊ�������� ")
	Msg2Player("��ϲ���ճɳ�ʦ�����ѱ���Ϊ���̵̽�������������������120��! ")
	AddRepute(120)
end;

function no()
end
