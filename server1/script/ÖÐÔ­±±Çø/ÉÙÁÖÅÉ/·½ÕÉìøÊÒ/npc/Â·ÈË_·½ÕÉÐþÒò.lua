-- Thi�u L�m·��NPC �������� 10������40������
-- by��Dan_Deng(2003-08-01)
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("T�m ta c� vi�c g�?", 2, "Mu�n th�nh gi�o ��i s�!/oldentence", "M�ng l� �n S�, t�i h� �� t�m �� �Th� �n S�� v� �Th� Cao ��./vt06_prizeenterr");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)

	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc> g�n ��y ta c� r�t nhi�u vi�c c�n gi�i quy�t, ng��i t�i ��y c� vi�c g�?"
	G_TASK:OnMessage("Thi�u L�m", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 0) then
		tbDailog:AddOptEntry("H�c k� n�ng 120", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu�n th�nh gi�o vi�c kh�c", oldentence)
	tbDailog:Show() 
end

function oldentence()

	local UTask_sl = GetTask(7)
	local nFactID = GetLastFactionNumber();
	
	if (UTask_sl == 70*256) and (GetFaction() == "shaolin") then			-- ��ʦ��������
		SetFaction("")
		Say("Ph�t hi�n l�i h� th�ng, �� k�p th�i ph�c h�i!",0)
		return
	elseif (UTask_sl == 70*256) and (GetTask(3) >= 5*256) and (GetTask(3) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(3,0)
		Say("Ph�t hi�n l�i h� th�ng, �� k�p th�i ph�c h�i!",0)
		return
	elseif (UTask_sl == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(7,70*256)
		Say("Ph�t hi�n l�i h� th�ng, �� k�p th�i ph�c h�i!",0)
		return
	elseif (GetTask(3) == 70*256) and (GetTask(7) == 70*256) then			-- ת���ɴ�������
		SetTask(3,75*256)
		Say("Ph�t hi�n l�i h� th�ng, �� k�p th�i ph�c h�i!",0)
		return
	elseif (UTask_sl == 80*256 and nFactID == 0 and GetCamp() == 1 and GetFaction() == "V�o ��u tr��ng") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("shaolin");
			Say("Ph�t hi�n l�i h� th�ng, �� k�p th�i ph�c h�i!",0)
			return
		end
	elseif (UTask_sl == 70*256 and nFactID == 0 and GetCamp() ~= 4 and GetFaction() == "V�o ��u tr��ng") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("Ph�t hi�n l�i h� th�ng, �� k�p th�i ph�c h�i!",0)
			return
		end
	end
	
	local tbDes = {"Ngh� thu�t Toushi/#daiyitoushi_main(0)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("������кܶ���Ҫ�����T�m ta c� vi�c g�?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_sl = GetTask(7)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),7) == 0) then				-- ��������������
		Talk(1,"","���������д˺�Ŵ��ԣ�����һ�����ӣ�ֻ�Ǳ����ڽ���������Ĳ��ܲ��ò������ڵ��ӵ�����������ðȻ���¡��鷳���ȥ�Ͷ�������˵���İﲻ��")
		Uworld40 = SetBit(GetTask(40),7,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 10*256+10) and (HaveItem(26) == 1) then
			L10_prise()
		elseif ((UTask_sl == 10*256) and (GetLevel() >= 10)) then		--10����������
			Say("�����ӷ����������ŵĵ��ӣ�����Ҫ���ܿ��ˡ���׼��������?",2,"����׼����!/L10_get_yes","��û��װ����!/L10_get_no")
		elseif (UTask_sl == 40*256+50) then		-- 40�����������
			SetTaskTemp(43,0)		-- ��ʱ����43,�����ش���ȷ�Ļ�
			Talk(1,"L40_sele3_1","��λʦ����Ҫ���Ӵ�5�仰�����ţ�˵���˵��������5�仰����:")
		elseif ((UTask_sl == 40*256) and (GetLevel() >= 40)) then		--40����������
			Say("����ʦ��������ɮ���书�Ѵﵽ����ɲ�ĵز������Ƕ��ϵ���Ϊ�˱ܿ����ɵ�һ���Ż�֮����һֱס�ں�ɽ��������չز�����������·��ң���ԭ�����᧿�Σ��Ϊʦ��������ɮ������¾��ƣ���Ը��ȥ�����Ƕ��ϳ�����?",2,"ͬ��/L40_get_yes","�����������ޣ����²���ʤ��/no")
		elseif (UTask_sl == 80*256) or (UTask_sl == 80) then						-- �ط�������ɳ��룬�Լ����ܵ�������ж�
			check_skill()
		else
			Talk(1,"","�ã��á����ͣ�����ᱣ�Ӯ�.")
		end
--	elseif (UTask_sl == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����ɣ������ӷ𣬼�����ţ��ͺú���ʰ�������вؾ����ڵ伮����Ҫ��ȥ����ս����ɱ�����޼ҳ��ˡ�")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_sl == 70*256) and ((GetTask(3) < 5*256) or (GetTask(3) == 75*256)) then		-- �ط�ʦ������
		Talk(1,"return_sele","ʦ�������ӿ��Խ�ؾ�����ľ�����?")
	elseif (GetCamp() == 4) and ((UTask_sl == 70*256+10) or (UTask_sl == 70*256+20)) then		-- �ط�ʦ��������
		Say("5 ����׼������û��?",2,"��׼������/return_complete","��û׼����/return_uncompleted")
--	elseif (GetTask(3) == 70*256+10) and (HaveMagic(21) >= 0) then		-- �������ط����ɣ��ջؽ�����
--		Say("�����ɣ�����������ս������������Ͷ��������ֽ���Դ��������ơ�",2,"Ϊ��ʦ�����գ����ջص�������/defection_yes","���ӿ���δ�ܣ���ʦ��ԭ��/no")
	else							-- ����Ի�
		Talk(1,"","��������ɮ����˵��������������������Ŀ������ı��˵����ʣ�����ɮ������Ϊ������.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(273) == -1) then
--		AddMagic(273)					-- ����ǧҶ��
--		Msg2Player("��ѧ���ˡ�����ǧҶ�֡�")
--		Say("�����ɣ�Ϊʦ��αչؿ�˼���գ��´���һ�С�����ǧҶ�֡������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("���ѳ�Ϊ���������ˣ��������ɽ����ȥ��!",2,"��л���ɶ�׼ /goff_yes","���Ӳ�������/no")
--	end
end
--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("��ӭ����������ɣ�������ɮ. ")
	SetRevPos(103,51)		  			--����������
	SetTask(7,10*256)					-- ����
	SetFaction("shaolin")       	--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	AddMagic(10)
	Msg2Player("ѧ����շ�ħ. ")
	AddNote("���������ɣ���Ϊ���ɮ��ѧ����շ�ħ. ")
	Msg2Faction("shaolin",GetName().." �������Ӽ��������ɣ�����������ǿ��!",GetName())
end

---------------------- �ط�������� --------------------------
function goff_yes()
	Talk(1,"","ȥ�ɣ��ǵ���ɽ��Ҫ���شȱ���.")
	SetTask(7,70*256)
	AddNote("�뿪�����£���ɽ�������߽���")
	Msg2Player("�뿪�����£���ɽ�������߽���")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("��ʦ��Ͳ������˵����ˣ������ǲ����ˣ����ǣ�����ο������������ǻ�����ط����ɵ���.",2,"���뷵��Thi�u L�m/return_yes","����Ҫ/no")
end;

function return_yes()
	Talk(1,"","����ò�ά�ޣ����ԣ��е��𻵣����������»�Ե50000�������ط�����.")
	SetTask(7,70*256+20)
	AddNote("��50000�������ط�����")
	Msg2Player("��50000�������ط�����")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ��50000��
		Talk(1,"","�ܺã�������Ա��µĹ��ף���Ϊ��������.")
		Pay(50000)
		SetTask(7,80*256)
		SetFaction("shaolin")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(72)
--		if (HaveMagic(273) == -1) then
--			AddMagic(273)
--			AddMagic(21)
		add_sl(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ�������ɾ�ѧ������Ҷ���׽. ")
--		end
		AddNote("�ѷ���������. ")
		Msg2Faction(GetName().." �ѷ��������ɣ�����Ϊ��������")
	else
		Talk(1,"","�����ӷ𣬺��񲻹�������.")
	end
end;

------------------------- ����������� --------------------------------
function L10_get_yes()
	Talk(1, "", "ֻҪ��˳����ľ�����õ�����������ͨ������")
	DelItem(26)
	SetTask(7,10*256+10)
	AddNote("����������ս����ľ�����õ�������. ")
	Msg2Player("����������ս����ľ�����õ�������. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","�ܺã�����Ϊ��Ժ��ɮ.")
	DelItem(26)
	SetTask(7,20*256)
	SetRank(2)
--	AddMagic(8)
--	AddMagic(4)
--	AddMagic(6)
	add_sl(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("�õ�����������ȥ�������ɣ���������ɿ��飬��Ϊ��Ժ��ɮ. ")
	Msg2Player("��ϲ����Ϊ��Ժ��ɮ��ѧ������ȭ�������ֹ��������ֵ���. ")
end;

function L40_get_yes()
	SetTask(7,40*256+10)
	AddNote("��������֮�ȥ������ɮ����. ")
	Msg2Player("��������֮�ȥ������ɮ����. ")
end;

function L40_sele3_1()
	Say("��һ����",5,"�������죬��α����/L40_sele3_2","�Ĵ��գ���������/L40_sele3_2","���ǹ۲죬��������/L40_sele3_2","�����޳�,����Σ��/L40_sele3_correct1","���Ƕ�Դ,��Ϊ��޴/L40_sele3_2")
end;

function L40_sele3_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_2()
end;

function L40_sele3_2()
	Say("�ڶ�����",5,"�����޳�,����Σ�� /L40_sele3_3","�Ĵ��գ��������� /L40_sele3_correct2","�������죬��α���� /L40_sele3_3","���ǹ۲죬�������� /L40_sele3_3","���Ƕ�Դ,��Ϊ��޴ /L40_sele3_3")
end;

function L40_sele3_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_3()
end;

function L40_sele3_3()
	Say("�������� ",5,"���Ƕ�Դ,��Ϊ��޴ /L40_sele3_4","���ǹ۲죬��������/L40_sele3_4","�Ĵ��գ���������/L40_sele3_4","�����޳�,����Σ�� /L40_sele3_4","�������죬��α����/L40_sele3_correct3")
end;

function L40_sele3_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_4()
end;

function L40_sele3_4()
	Say("���ľ���",5,"���ǹ۲죬��������/L40_sele3_5","���Ƕ�Դ,��Ϊ��޴ /L40_sele3_correct4","�����޳�,����Σ�� /L40_sele3_5","�������죬��α����/L40_sele3_5","�Ĵ��գ���������/L40_sele3_5")
end;

function L40_sele3_correct4()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_5()
end;

function L40_sele3_5()
	Say("������� ",5,"�Ĵ��գ���������/L40_sele3_result","�������죬��α����/L40_sele3_result","���ǹ۲죬��������/L40_sele3_correct5","���Ƕ�Դ,��Ϊ��޴ /L40_sele3_result","�������죬��α����/L40_sele3_result")
end;

function L40_sele3_correct5()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_result()
end;

function L40_sele3_result()
	if (GetTaskTemp(43) == 5) then		-- ���ȫ��
		Talk(1,"","�����������ɺܺã�Ϊʦ������Ϊ40������Ҫ����ʧ��")
		SetTask(7,50*256)
		SetRank(5)
--		AddMagic(20)
		add_sl(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		AddNote("�õ������ɮ��ָ�̣����������Ϊ�����޺�. ")
		Msg2Player("��ϲ����Ϊ���ִ����޺���ѧ��ʨ�Ӻ��书. ")
	else
		Talk(1,"","���������ô���£��ǲ����������?")
	end
	SetTaskTemp(43,0)			-- ������ͷű���
end;

function no()
end
