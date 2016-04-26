-- ���� ���� ����� �������񡢳�ʦ�����ط���������
-- by��Dan_Deng(2003-07-30)
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>������кܶ�����Ҫ����������ʲô��?"
	G_TASK:OnMessage("����", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 9) then
		tbDailog:AddOptEntry("ѩ120������.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("��ʲô����̵�", oldentence)
	tbDailog:Show() 
end

function oldentence()
	local UTask_kl = GetTask(9);
	local nFactID = GetLastFactionNumber();

	if (UTask_kl == 70*256) and (GetFaction() == "kunlun") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_kl == 70*256) and (GetTask(5) >= 5*256) and (GetTask(5) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(5,0)
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_kl == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(9,70*256)
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (GetTask(5) == 70*256) and (GetTask(9) == 70*256) then			-- ת���ɴ�������
		SetTask(5,75*256)
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_kl == 80*256 and nFactID == 9 and GetCamp() == 3 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("kunlun");
			Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
			return
		end
	elseif (UTask_kl == 70*256 and nFactID == 9 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
			return
		end
	end

	local tbDes = {"����Ͷʦ/#daiyitoushi_main(9)", "����̱������/common_talk"};
	
	Say("�������кܶ�����Ҫ�����������ʲô��?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_kl = GetTask(9);
	local Uworld31 = GetByte(GetTask(31),2)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),9) == 0) then				-- ��������������
		Talk(1,"","���Ǵ������ˣ����������岻�ݴǣ����Ƕ��½��������ŷ������ڽ��ˣ�ֻ�������Է���")
		Uworld40 = SetBit(GetTask(40),9,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 60*256+20) and (HaveItem(16) == 1)) then	-- ��ʦ�������
			Talk(2,"L60_prise","���ţ����Ӿ���ǧ����������ڻƺ�Դͷ�ҵ���ɫʯ!","ֻϣ����ɫʯ���Դ������ź鸣������������ô��޵�������Ҳ�о�����ο����������˳����ʦ��")
		elseif ((UTask_kl == 60*256) and (GetLevel() >=50)) then		-- ��ʦ����
			Say("��˵����Ů�����ɫʯ���죬����֮�󣬽����µ���ɫʯɢ�������˼䣬������һ�ž������˻ƺ�Դͷ����ɫʯ�����Ź������Ҹ���˭�õ�����ɫʯ��˭�Ϳ���������а���������Ϊ�����ҵ������ɫʯ����Ϳ���˳����ʦ�ˡ�",2,"����ȥ��/L60_get_yes","�Ǹ����¾���Ϲ��ģ�����. /L60_get_no")
		elseif (UTask_kl == 80*256) then						-- �ط�������ɳ���
			check_skill()
			Say("������տ�����Ҳ�������Ȥ��ɽ����һ����?",2,"����Ҳ���д���/goff_yes","����������һ��ʱ��. /no")
		else
			Talk(1,"","������һ��Ҳ����!")
		end
	elseif (Uworld31 == 20) then		--��������
		Talk(4,"enroll_prise","��˵�����Ů��ץ��һֻ��˿��?","�ǵ�!","����������ʲôҪ��?","���������������ѧ��")
--	elseif (UTask_kl == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","����ӣ��ã��ã���Ҳת�˹������䵱�������ӣ�")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_kl == 70*256) and ((GetTask(5) < 5*256) or (GetTask(5) == 75*256)) then		-- �ط�ʦ������
		Talk(1,"return_select","ʦ���������ڽ�����Ư��Ҳ��һ��ʱ���ˣ��о��Լ���ʶǳ���������õ��ӻ��������������书��?")
	elseif (GetCamp() == 4) and ((UTask_kl == 70*256+10) or (UTask_kl == 70*256+20)) then		-- �ط�ʦ��������
		Say("��ո�˵�����˵�����������ѧ��?",2,"׼������/return_complete","��û׼����/return_uncompleted")
	elseif (GetTask(5) == 70*256+10) and (HaveMagic(182) >= 0) then		-- �䵱�ط����ɣ��ջ���������
		Say("�䵱ȫ��һȺ̰��ƭ�˵��ˣ��׷��Ҿ��ľ����̵��㣬�㾹Ȼ���������������������!",2,"���������Ѿ�. /defection_yes","����֪����. /no")
	else
		Talk(1,"","���֡��䵱��ʲô����Ҫ�����ǲ��ڽ���")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(275) == -1) then
--		AddMagic(275)					-- ˪������
--		Msg2Player("��ѧ���ˡ�˪�����ء�")
--		Say("����ӣ�Ϊʦ��αչؿ�˼���գ��´���һ�С�˪�����ء������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("������տ�����Ҳ�������Ȥ��ɽ����һ����?",2,"����Ҳ���д���/goff_yes","����������һ��ʱ��. /no")
--	end
end
--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("��ӭ��������أ���Ϊ���ص���")
	SetRevPos(131,57)		  				-- ����������
	SetTask(9,10*256)						-- ����
	SetFaction("kunlun")      			-- ��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(19)
	AddMagic(169)
	Msg2Player("ѧ����編")
	AddNote("�������أ���Ϊ���ص��ӣ�ѧ����編")
	Msg2Faction("kunlun",GetName().." ���䵱�������ء������������ǿ!",GetName())
end

-------------------------- �ط�������� ---------------------
function goff_yes()
	Talk(1,"","���ˣ����߰ɣ������˿�����������н���!")
	SetTask(9,70*256)
	AddNote("�뿪���أ�����Ư������")
	Msg2Player("�뿪���أ�����Ư������")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_select()
	Say("�����������ɹ涨����Ҫ������ͨ��������ˣ��ҿ��԰�����취 ",2,"��50000������/return_yes","���ط�ʦ��/return_no")
end;

function return_yes()
	Talk(1,"","�ܺã���Ȼ�Ƕ��£����Ѿ����һЩ���˵����ˣ�ҲҪ�Ͽ�׼����!")
	SetTask(9,70*256+20)
	AddNote("ֻҪ��50000�������Ϳ����ط�ʦ��")
	Msg2Player("ֻҪ��50000�������Ϳ����ط�ʦ��")
end;

function return_no()
	Talk(1,"","Ҫ�������Ļ��Ҿͻؽ����ϼ���ѧһ��ʱ��. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","̫���ˡ���ȥͨ�����Ѿ��ط�ʦ����. ")
		Pay(50000)
		SetTask(9,80*256)
		SetFaction("kunlun")
--		if (HaveMagic(275) == -1) then
--			AddMagic(182)
--			AddMagic(275)
		add_kl(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("����ѧ�����ɾ�ѧ˪�����أ���������")
--		end
		SetCamp(3)
		SetCurCamp(3)
		SetRank(75)
		AddNote("�ص��������ɣ����¼������е����� ")
		Msg2Player(GetName().."<#>����Ϊ����������������ؼ�������. ")
	else
		Talk(2,"","ֻ������˵˵�����ò���ʲô������ж�����ô��?","������˼��������ȥ׬Ǯ!")
	end
end;

function return_uncompleted()
	Talk(1,"","�����������������ģ�������ô������ĳ�����!")
end;

----------------------- ����������� -------------------
function enroll_prise()
	Talk(1,"","��Ҫ���ŵĻ�ֻ����ôС�����ǲ����ģ����ǿ������������������׼�㵱����������! ")
	i = ReturnRepute(30,29,3)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld31 = SetByte(GetTask(31),2,127)
	SetTask(31,Uworld31)
	AddNote("<#>��ɽ�˿�����񣬳�Ϊ<color=Red>��������<color>. �����������"..i.."<#>��.")
	Msg2Player("��ɽ�˿�����񣬳�Ϊ��������")
end;

function L60_get_yes()
	SetTask(9,60*256+10)
	AddNote("���ܳ�ʦ���񣺵��ƺ�Դͷ����ɫʯ")
	Msg2Player("���ܳ�ʦ���񣺵��ƺ�Դͷ����ɫʯ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(1,"","��л����! ")
	DelItem(16)
	SetRank(65)
	SetTask(9, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("��ɳ�ʦ���񣬱���Ϊ�ɷ����")
	Msg2Player("��ϲ�㣡��ҵ��ʦ������Ϊ�ɷ����")
end;
