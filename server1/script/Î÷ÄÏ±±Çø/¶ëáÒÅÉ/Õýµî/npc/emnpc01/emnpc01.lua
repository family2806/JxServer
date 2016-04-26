--description: ����������ʦ̫��������������50�����񡢳�ʦ�����ط���������
--author: yuanlan	
--date: 2003/3/6
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--update: Dan_Deng(2003-07-24), �ӡ��ط����ɡ�����
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
-- Update��Dan_Deng(2003-10-27)Ϊ�ط�ʦ���������ȡ�������ܣ��Լ��������ɶ�Ӧ
-- update: xiaoyang(2004\4\19) ����90������

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>����Һ�æ����������ʲô��?"
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 4) then
		tbDailog:AddOptEntry("ѧϰ120����.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("�����������", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
	local UTask_em = GetTask(1)
	local nFactID = GetLastFactionNumber();

	if (UTask_em == 70*256) and (GetFaction() == "emei") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_em == 70*256) and (GetTask(6) >= 5*256) and (GetTask(6) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(6,0)
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_em == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(1,70*256)
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_em == 80*256 and nFactID == 4 and GetCamp() == 1 and GetFaction() == "���뽭�� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("emei");
			Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
			return
		end
	elseif (UTask_em == 70*256 and nFactID == 4 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
			return
		end
	end

	local tbDes = {"����Ͷʦ/#daiyitoushi_main(4)", "�����������/common_talk"};
	
	Say("����Һ�æ����������ʲô��?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_em = GetTask(1)
	local Uworld125 = GetTask(125)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),1) == 0) then				-- ��������������
		Talk(1,"","��������Ů��֮�������ǹ�������ƥ�����𡣴𸴶�����������ü������ķԸ�!")
		Uworld40 = SetBit(GetTask(40),1,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 80*256) then						-- �ط�������ɳ���
			check_skill()
		elseif ((UTask_em == 60*256+50) and (HaveItem(24) == 1)) then		--�õ�����ָ������ʦ�������
			DelItem(24)
			Talk(1,"L60_prise","������ܹ��ɹ�Ϊ���ɶ������֮�������Ͳ�С��������ǻۺ��������Ѿ�����˳����ʦ�ˣ��պ����߽�������ؽ����԰����м��м�!")
		elseif (UTask_em == 60*256) and (GetLevel() >= 50) then		--��ʦ��������
			DelItem(24)
			Say("��������<color=Red>����ָ��<color>�����Ǳ�����ʦ������������֮���������ڼ�ʮ��ǰ�����ɳ���һ����ͽ<color=Red>���<color>������Ϊʦ��ʦ�㣬��Ϊ��Ϊʦ�������Ų��������Ե�����<color=Red>����ָ��<color>����Ը��ﱾ�ɶ��<color=Red>����ָ��<color>��?" , 2, "Ը�� /L60_get_yes", "���ѵ��˴���/L60_get_no")
		elseif (UTask_em == 50*256+80) then													--50���������
			L50_prise()
		elseif ((UTask_em == 50*256+50) or (UTask_em == 50*256+60)) and (HaveItem(23) == 0) then
			AddEventItem(23)
			Talk(1,"","����书����Խ��Խ�ߣ����Ǳ��ɵ�֧�����ӽ��������²������⣬�����վ�Ҫ�������!")
		elseif (UTask_em == 50*256) and (GetLevel() >= 50) then		--50����������
			DelItem(23)
			Say("Ϊʦ��<color=Red>�ɶ�������<color>��ס��<color=Red>�Ⱥ���ʦ<color>�Ƿ���֪���������´�������쾵۴�ҵ��䣬����������ʮ���ꡣΪ����ף�����´��µĴ�����ӣ�Ϊʦ׼���͸�������һ����������<color=Red>�����������վ���<color>��Ϊ������Ը�����ȥ����ݺ�����?", 2, "Ը�� /L50_get_yes", "���ѵ��˴���/L50_get_no")
		elseif (UTask_em > 50*256) and (UTask_em < 60*256) then								--�Ѿ��ӵ�50��������δ��ɵ���ͨ�Ի�
			Talk(1,"","��վ�������?")
		elseif (UTask_em > 60*256) and (UTask_em < 70*256) then				-- ��ʦ�����е���ͨ�Ի�
			Talk(1,"","<color=Red>����ָ��<color>��������֮������������. ��˵���<color=Red>���<color>��<color=Red>����Դͷ<color>����������Ҫһ��С��!")
		else
			Talk(1,"","�ҷ�ȱ����������ţ�������Ź档�������ѧ�գ���Ҫ������Ϊʦ������!")
		end
--	elseif (UTask_em == 5*256+70) and (HaveItem(17) == 1) and (GetSeries() == 2) and (GetCamp() == 0) then		--�õ��������⣬�����������
--		enroll_prise()
	elseif (Uworld125 == 20) and (HaveItem(388) == 1)then
		Talk(7,"Uworld125_lose","ʦ̫������","����...?","���½ӵ������������񣬴����������������ü.","̫���ˣ����뼸�����ʦ������ֻص���ü�����ѣ���л��!","���ÿ���!","���Ƕ�ü���ŵ��������ȥ�ɶ�����������ȡ���͡��Ժ������ü������������������������������.","�a ��лʦ̫!.")
   elseif (Uworld125 == 30) and (HaveItem(389) == 0)then
   	Talk(1,"","���ģ���ü��Ӧ�����������������!")
   	AddEventItem(389)
		Msg2Player("�õ���ü���")
   elseif (Uworld125 == 40) then
		Talk(5,"Uworld125_finish","ʦ̫��ô������ʲô����?","�ҵĺܶ������Ϊ��ϰ�������龭�����ң���������.","��ô�ˣ������ܡ���û�ж����ؼ�.","�i�����֪�������鷢��������ؼ���ʱ��ֻ����Ե�˲�������","ԭ�����")
--	elseif (GetTask(6) == 5*256+10) then		-- ת����������
--		Say("����ʦ̫�������Ź���Ȼ����תͶ���ɣ��������Դ��߱����κ����ա�����Ĵ���ҪͶ������ţ�",2,"���������Ѿ�/defection_yes","�����һ��ǲ���Ͷ��/defection_no")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_em == 70*256) and (GetTask(6) < 5*256) then		-- �ط�ʦ������
		Talk(5,"return_sele","ʦ�� ","������ɽ���氡","�ǵģ��������뵽������ɽ����Щ����. ","�ţ���Ҳ�ǣ�ת�ۼ������ɽ��. ","�����ն��������ϡ���������������ɽ. ")
	elseif (GetCamp() == 4) and ((UTask_em == 70*256+10) or (UTask_em == 70*256+20)) then		-- �ط�ʦ��������
		Say("׼����5��������?",2,"׼������/return_complete","��û׼����/return_uncompleted")
	elseif (Uworld125 > 20) and (Uworld125 < 40)then
   	Talk(1,"","��ü�͸��»���Ե�֣��Ժ�ϣ���ܼ�����æ.")
	elseif (UTask_em < 10*256) and (GetSeries() == 2) then 								--��δ����
		Talk(1,"","�Ҷ���һ�ɣ��������գ����а��꣬�����ڶ࣬�����Ե�������Ƿ������ǽ���ϵ�ɽ����������Ե��.")
	elseif (UTask_em == 70*256) then								--��ʦ���ӣ������ط����ɵļ��ݣ�
		Talk(1,"","���ѳ�ʦ���ӽ��������߽�����ؽ����԰�!")
	else														-- �Ƕ����ɶԻ�
		Talk(1,"","�Ҷ�ü��Ȼ��Ů��֮������Ҳ���������������.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(92) == -1) then
--		AddMagic(92)					--���Ĵ���
--		Msg2Player("��ѧ���ˡ����Ĵ��ӡ�")
--		Say("����ʦ̫��Ϊʦ��αչؿ�˼���գ��´���һ�С����Ĵ��ӡ������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	elseif  (HaveMagic(252) == -1) then
--		AddMagic(252)					--���ޱ�
--		Msg2Player("��ѧ���ˡ����ޱߡ�")
--		Say("����ʦ̫��Ϊʦ��αչؿ�˼���գ��´���һ�С����ޱߡ������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("������ɽ����?",2,"�ǵģ���ʦ������/goff_yes","���ǣ��Ҹо����򻹲�����. /no")
--	end
end

----------------- �ط�ʦ����� ------------------
function goff_yes()				-- �ط�������ɳ��루����
	Talk(1,"","�ܺã���һ����һ��.")
	SetTask(1,70*256)
	AddNote("�뿪��ü�����߽���")
	Msg2Player("�뿪��ü�����߽���")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=80; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ʈѩ����
	i=101;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=77; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ҽ���
	i=79; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����Ʒ�
	i=81; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ҷ
	i=82; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ͬ��
	i=83; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����
	i=84; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����Ʈ��
	i=85; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- һҶ֪��
	i=86; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ˮ
	i=87; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ľ�
	i=88; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���𲻾�
	i=89; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ε�
	i=91; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �������
	i=93; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �Ⱥ��ն�
	i=252;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ޱ�
	i=92; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ĵ���
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(6,5*256+20)
	SetTask(1,75*256)				-- Ϊԭ�����������
	SetRank(74)
	if (GetRepute() < 200) then
		Msg2Player("����������ɵ���Ϊ���ң���������"..GetRepute().."��!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("����������ɵ���Ϊ���ң���������200 ��! ")
		AddRepute(-200)
	end
	AddNote("����ʦ̫�ѷ��书���õ�ʥŮ�𶦳ƺţ����������ѽ��������ü������Լ��������. ")
	Msg2Player("����ʦ̫�ѷ��书���õ�ʥŮ�𶦳ƺţ����������ѽ��������ü������Լ��������. ")
	Talk(1,"KickOutSelf","���ϣ��ҽ�����书������ϵ���������������!")
end

function defection_no()
	AddNote("��������������. ")
	Msg2Player("��������������. ")
	SetTask(6,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_sele()
	Say("���г��⣬�Ҳ��ܾܾ�",2,"�a ��лʦ�� /return_yes","���ˣ�����Ҫ/return_no")
end;

function return_yes()				-- �ط��ļ��
	Talk(3,"","�a��лʦ��������Ư������Ҳ���һ������������ʦ����Ҫ��?"," �벻����������ģ��Ǿ;�50000����ά��һ�¶�üɽ·��","�ǣ�����ȥ׼�� ")
	SetTask(1,70*256+20)
	AddNote("��500�����������üɽɽ·�����ܷ��ض�ü. ")
	Msg2Player("��500�����������üɽɽ·�����ܷ��ض�ü. ")
end;

function return_no()
	Talk(2,"","������·�أ���Ҫ�Լ���������лʦ������","û��ϵ��������������ü��ʱΪ���")
end;

function return_complete()			-- �ط��ɹ�
	if (GetCash() >= 50000) then
		Talk(1,"","�ã�����5�������㱻��Ϊ��ʥŮ��ϣ����Ŭ���������ɷ�����.")
		Pay(50000)
		SetTask(1,80*256)
		SetFaction("emei")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(64)
--		if (HaveMagic(252) == -1) then
--			AddMagic(88)
--			AddMagic(91)
--			AddMagic(282)
--			AddMagic(252)
		add_em(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ�����ɾ�ѧ�����ޱߣ����𲻾��书���������. ")
--		end
		AddNote("�ѷ��ض�ü��")
		Msg2Player(GetName().."����Ϊ��ʥŮ�����ض�ü��. ")
	else
		Talk(2,"","������û�д��ܶ�Ǯ","�Բ�����ȥ��Ǯ. ")
	end
end;

--------------- �������� ----------------------
function enroll_prise()		-- �����������
	Talk(1,"","�ҷ�ȱ�����Ȼ��һ�����ϣ�ƶ�������Ϊͽ��ϣ�������ѧ�գ������Ź棬��Ҫ������Ϊʦ������.")
	DelItem(17)
	SetFaction("emei")    			
	SetCamp(1)
	SetCurCamp(1)
	SetRank(13)
	AddMagic(80)
	AddMagic(101)
	SetRevPos(13, 13)
	SetTask(1, 10*256)
	AddNote("���������������ʦ̫�������������. �����ü�ɣ���Ϊ�����ᣬѧ��Ʈѩ���ƣ������� ")
	Msg2Player("���������������ʦ̫�������������. ")
	Msg2Player("��ӭ��������ɣ���Ϊ������")
	Msg2Player("ѧ��Ʈѩ�����书 '. ")
	Msg2Player("ѧ�������ɾ�ѧ������' ")
end;

--------------------- 50������ -----------------------
function L50_get_yes()
	Talk(1,"","<color=Red>�Ⱥ���ʦ<color>�չض��꣬Ѱ��������ͣ��������ȥ������ʦ��<color=Red>���Ʒ�ʦ<color>. ")
	AddEventItem(23)
	Msg2Player("�����񣬴����������վ�ȥ�ɶ�������. ")
	Msg2Player("��ý��������վ�. ")
	SetTask(1, 50*256+50)
	AddNote("�����������ʦ̫��������ȥ�����£������������վ�. ")
end;

function L50_get_no()
	Talk(1,"","��ȥ������!")
end;

function L50_prise()
	Talk(1,"","����������úܺã������ʴ�ӱ��ֻҪ����Ŭ��������һ����ѧ������")
	AddNote("��ȥ����������ʦ̫���������������������Ϊɢ����Ů��ѧ�����Ĵ���. ")
	SetRank(18)
	SetTask(1, 60*256)
--	AddMagic(92)
	add_em(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ����Ϊɢ����Ů��ѧ�����Ĵ���. ")
	AddNote("������ɣ�����Ϊɢ����Ů")
end;

----------------------- ��ʦ���� ------------------------
function L60_get_yes()
	Talk(1,"","��˵���<color=Red>���<color>��<color=Red>����Դͷ<color>����������Ҫһ��С��! ")
	SetTask(1, 60*256+50)
	AddNote("�����������ʦ̫���ӳ�ʦ���񣬶��������������ָ��. ")
	Msg2Player("�ӳ�ʦ���񣬶��������������ָ��. ")
end;

function L60_get_no()
	Talk(1,"","����ֻ�ܰ�������ν�����!")
end;

function L60_prise()
	Talk(1, "","��ϲ��ɹ���ʦ������ΪʥŮ���պ�����������߽����������ѡ������������ɼ���ѧ�գ�Ҳ���Խ�����ᣬ������һ�����е�Ů��Ҳ�����硣������������ߵغ�ϣ����һչ��ͼ!")
	Msg2Player("��ϲ��ѧ�ɣ��㱻��Ϊ��üʥŮ����������120��! ")
--	AddGlobalCountNews("����"..GetName().."�ճɳ�ʦ�����ͬ��ʦ����ɽ��������", 1)
	Msg2SubWorld("��ü����"..GetName().."�ճɳ�ʦ�����ͬ��ʦ����ɽ��������")
	AddRepute(120)
	SetRank(74)
	SetTask(1, 70*256)
	SetFaction("") 		   					--����˳�������
	SetCamp(4)
	SetCurCamp(4)
	AddNote("�ص����������ָ��������ʦ̫����ɳ�ʦ������ΪʥŮ")
end;

function no()
end;

-------------------- �������� ---------------------
function Uworld125_lose()
	DelItem(388)
	AddEventItem(389)
	SetTask(125,30)
	Msg2Player("�����������飬�õ���ü���. ")
	AddNote("�õ�������سɶ����������콱. ")
end

function Uworld125_finish()
	if (GetTask(1) >= 70*256) and (GetTask(1) ~= 75*256) then
		Talk(4,"","������ü�������Ե���Ѿ������ʹ������ĲŶ�!","����?","�ǵģ�Ҳ��ֻ�����������������ؼ���ƶ�Ὣ���������е���ʽ��ϣ����ɹ�����Ҫ�����ҵ�һ������!","����һ�������������������պ���ʲô�Ը�������һ�����!")
		if (HaveMagic(328) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(328,1)
		end
		if (HaveMagic(380) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(380,1)
		end
		if (HaveMagic(332) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(332)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("��ѧ��������ѩ����·��Ӱ���ն�����")
		SetTask(125,255)  --ѧ�ü��ܵ����ñ���255
	else
		Talk(1,"","�Ȿ����û������������ֻ�ܷ��ھ�¥�Ⱥ��ˡ�����ô���࣬���С�����͸��㡣","�ǵ��ӾͲ�������!")
	   SetTask(125,245)  --������������ñ���245
	end
	add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
	AddRepute(add_repute)
	Msg2Player("��ü����˳�����أ��������. ��������"..add_repute.."��.")
	AddNote("��ü����˳�����أ��������. ")
end
