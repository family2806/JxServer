-- ؤ�� ���������ҡ�10������50�������ط�ʦ������
-- by��Dan_Deng(2003-07-28)
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("������ʲô��?", 2, "����̴�ʦ/oldentence", "��ʦ�ڣ��������ҹ���ʦ������ͽ��/vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>������кܶ���Ҫ�������������ʲô��?"
	G_TASK:OnMessage("ؤ��", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 6) then
		tbDailog:AddOptEntry("ѧ��120����.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("�����������", oldentence)
	tbDailog:Show() 
end
	

function oldentence()
--	check_skill()
	local UTask_gb = GetTask(8)
	local nFactID = GetLastFactionNumber();

	if (UTask_gb == 70*256) and (GetFaction() == "gaibang") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_gb == 70*256) and (GetTask(4) >= 5*256) and (GetTask(4) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(4,0)
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_gb == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(8,70*256)
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (GetTask(4) == 70*256) and (GetTask(8) == 70*256) then			-- ת���ɴ�������
		SetTask(4,75*256)
		Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_gb == 80*256 and nFactID == 6 and GetCamp() == 1 and GetFaction() == "���뽭�� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("gaibang");
			Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
			return
		end
	elseif (UTask_gb == 70*256 and nFactID == 6 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ���������Ѽ�ʱ�ָ�!",0)
			return
		end
	end

	local tbDes = {"����Ͷʦ/#daiyitoushi_main(6)", "�����������/common_talk"};
	
	Say("������кܶ���Ҫ�������������ʲô��?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_gb = GetTask(8)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),8) == 0) then				-- ��������������
		Talk(1,"","ؤ��ͽ���������죬��������������²��ܲ��ӡ������ȥת�棺ؤ�����½������.")
		Uworld40 = SetBit(GetTask(40),8,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 50*256+60) then		-- 50���������
			Talk(1,"L50_prise","������������������Ѿ�������ԭ����ͼ���������Ŵ��ˣ�������ʻ���.")
		elseif ((UTask_gb == 50*256+10) or (UTask_gb == 50*256+20)) and (HaveItem(199) == 0) then		--�����У����߶���
			Talk(2,"","����ô�������ң���˵�˶��ٱ��ˣ�Ҫ��С���úõ�ͼ����ô��Ū���ˣ�!","���ﻹ��һ�������Ҫ����С�ģ���Ҫ����ʲô��!")
			AddEventItem(199)
		elseif ((UTask_gb == 50*256) and (GetLevel() >= 50)) then		--50����������
			Say("�����������һ��������ԭ�ĵ�ͼ����Ҫ������ٰ�����͢����ͬ��ȥ��?",2,"ͬ�� /L50_get_yes","���ӻ��ܲ�����ܵ��δ���!/no")
		elseif (UTask_gb == 10*256+40) and (HaveItem(76) == 1) and (HaveItem(77) == 1) and (HaveItem(78) == 1) and (HaveItem(79) == 1) and (HaveItem(80) == 1) then
			L10_prise()
		elseif (UTask_gb == 10*256) and (GetLevel() >= 10) then		--10����������
			Talk(3,"L10_get","�˻������ϣ���Ҫԩԩ�౨��������ʳ�����Ӿͺ���!","�������ǲ����������?","��������Խ����Խ�ѣ�����˭��˭���ң�������!")
		elseif (UTask_gb == 80*256) then						-- �ط�������ɳ���
			Say("�ҽл���־���ķ����㲻Ҫ������������!",2,"�ǣ�������ʻ㽭������!/goff_yes","���Ӿ����Լ����ղ�������ܳ�ʦ/no")
		elseif (UTask_gb > 10*256) and (UTask_gb < 20*256) then		--10���������ʱ����ͨ�Ի�
			Talk(1,"","��ô�ƻ�û��������㣬���!")
		else
			Talk(1,"","ʥ�˶ෳ�գ�ֻ���Ҳſ���.")
		end
--	elseif (UTask_gb == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����ң��ܺã�����Ͷ�����Ǵ��Ǵ��¡�������ǰ����ȥ֤����ĳ൨���İɣ�")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_gb == 70*256) and ((GetTask(4) < 5*256) or (GetTask(4) == 75*256)) then		-- �ط�ʦ������
		Talk(3,"return_sele","����Ľл��ӷϻ����","��Ȼ�����˷�����Ҫ�е�ʲô��������Ȼ��!","�����������Ƿ��ԣ���Ҫ���ǳ�ȥ!")
	elseif (GetCamp() == 4) and ((UTask_gb == 70*256+10) or (UTask_gb == 70*256+20)) then		-- �ط�ʦ��������
		Say("5 ����׼��������?",2,"��׼������/return_complete","��δ׼����/return_uncompleted")
--	elseif (GetTask(4) == 70*256+10) and (HaveMagic(128) >= 0) then		-- �����ط����ɣ��ջؿ����л�
--		Say("�����ң����������Ĳ��������㾹�뱳������Ͷ�������",2,"���������Ѿ�/defection_yes","�Բ�������֪����/no")
	else
		Talk(1,"","ʥ�˶ෳ�գ�ֻ���Ҳſ���.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()		-- Ŀǰû����ұ䶯�޸�����û��60������
	x = 0
	skillID = 121					-- 
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
		Say("Ϊʦ��Ҫ�չ�ڤ�룬����ѱ������վ�ѧ�����㣬ѧ��Ҫ��Ϣһ�£���ֹ���˾���.",1,"��лʦ�� /KickOutSelf")
	else
		return
	end
end

--------------------- ת������� ------------------------
function defection_complete()
	SetRevPos(115,53)		  			--�ȴ��ṩ������
	SetTask(8, 10*256)				-- ֱ������
	SetFaction("gaibang")       			--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
	SetRank(37)
	AddMagic(117)
	Msg2Player("��ӭ�����ؤ���Ϊ�޴�����!")
	Msg2Player("ѧ���������֣������в�")
	AddNote("����ؤ���Ϊ�޴����ӣ�ѧ���������أ������в�")
	Msg2Faction("gaibang",GetName().."�����̽��˼���ؤ�ؤ�����ǿ��",GetName())
end

--------------- �ط�ʦ����� ------------------------
function goff_yes()
	Talk(1,"","�ã���ס��������ƽ֮�£���Ҫ����������!")
	SetTask(8,70*256)
	AddNote("�뿪ؤ��������߽���")
	Msg2Player("���뿪ؤ����߽��� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("�������췵�ر���ɣ���ҿ���һ��Է���ÿ����������ʲô.",2,"�a��ζ����/return_yes","����!/return_no")
end;

function return_yes()
	Talk(2,"","ֽ�ڱ���֧������ã�����������ת����Ҫ�ط�������Ҫ����50000��.","�ã�����׼��Ǯȥ��.")
	SetTask(8,70*256+20)
	AddNote("��50000�����ط�ؤ��.")
	Msg2Player("��50000�����ط�ؤ��.")
end;

function return_no()
	Talk(1,"","ʦ�����Ҹо���������Ҫ��ҵ�����ܿ�����ʩ����ڡ����ԣ��Ҳ��������.")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","������û�뵽��׼������˵��Ǯ�����ܺá�����Ϊ�����������ط����ͬʱ�����ξŴ���ְ��.")
		Pay(50000)
		SetTask(8,80*256)
		SetFaction("gaibang")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(78)
--		if (HaveMagic(130) == -1) then
--			AddMagic(360)
--			AddMagic(130)
		add_gb(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ����ѧ������裬��ң��")
--		end
		AddNote("������ؤ��")
		Msg2Player(GetName().."�ط�ؤ�����Ϊ�Ŵ���")
	else
		Talk(2,"","��Ҫ��Ϊ�����ˣ������ҿ��ú���������ﲻ��5����","�Բ������������ˣ����Ҽ��һ��.")
	end
end;

function return_uncompleted()
	Talk(1,"","5��������С��������������û��!")
end;

---------------- ����������� -----------------------
function L10_get()
	Say("�i����10������ȥ��5�־ƣ���Ȫ�ƣ����괺���ٻ��ã���¶��˫������.",2,"ȥ���/L10_get_yes","��װ������/no")
end;

function L10_get_yes()
	SetTask(8,10*256+10)
	AddNote("����10������ȥ��5�־ƣ���Ȫ�ƣ����괺���ٻ��ã���¶��˫��������ȥ������ ")
	Msg2Player("����10������ȥ��5�־ƣ���Ȫ�ƣ����괺���ٻ��ã���¶��˫��������ȥ������")
end;

function L10_prise()
	Talk(2,"","�������ҵľ��������!","�ܺã��ֵ�һ���")
	DelItem(76)
	DelItem(77)
	DelItem(78)
	DelItem(79)
	DelItem(80)
	SetTask(8,20*256)
	SetRank(38)
--	AddMagic(116)
--	AddMagic(115)
	add_gb(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("��5�־ƣ����10�����񣬱��ִ�����")
	Msg2Player("��ϲ������Ϊִ������ӡ�ѧ��ؤ���Ʒ���ؤ�����.")
end;

function L50_get_yes()
	Talk(1,"","�����ԭ��ͼ��ϵ�ش�С�Ĳ�Ҫ�������֮��!")
	SetTask(8,50*256+10)
	AddEventItem(199)
	AddNote("����50����������ԭ��ͼ����͢.")
	Msg2Player("����50����������ԭ��ͼ����͢.")
end;

function L50_prise()
	Talk(1,"","�����������ĺܺã�ϣ�������ܰ�������!")
	SetTask(8,60*256)
	SetRank(42)
--	AddMagic(128)
--	AddMagic(125)
	add_gb(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ������Ϊ����ͷ��ѧ�������лڣ�����񹷹���.")
	AddNote("�ɹ�����ԭ��ͼ���ſ������50�����񡣳�Ϊ����ͷ.")
end;

function no()
end;
