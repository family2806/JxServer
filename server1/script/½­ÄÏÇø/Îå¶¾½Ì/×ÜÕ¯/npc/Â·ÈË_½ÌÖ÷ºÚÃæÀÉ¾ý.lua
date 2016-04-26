-- �嶾 ·��NPC ���������ɾ� ��ʦ�����ط���������
-- by��Dan_Deng(2003-08-05)
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"�����յ���/#tbMasterGift:getGift('wudu')",
				"���������������/oldMain"
			}
		Say("���갲������", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if allbrother_0801_CheckIsDialog(4) == 1 then
		allbrother_0801_FindNpcTaskDialog(4)
		return 0;
	end
	if (vt06_isactive() ~= 0) then
		Say("������ʲô��", 2, "����̴�ʦ/oldentence", "�ض�ʦ�������ҹ���ʦ���͸߶ȿ�/vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 3) then
		Describe("������ʲô��", 2,
			"ѧ120������./lvl120skill_learn",
			"����̱������/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wu = GetTask(10)
	local nFactID = GetLastFactionNumber();

	if (UTask_wu == 70*256) and (GetFaction() == "wudu") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_wu == 70*256) and (GetTask(2) >= 5*256) and (GetTask(2) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(2,0)
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_wu == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(10,70*256)
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (GetTask(2) == 70*256) and (GetTask(10) == 70*256) then			-- ת���ɴ�������
		SetTask(2,75*256)
		Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
		return
	elseif (UTask_wu == 80*256 and nFactID == 3 and GetCamp() == 2 and GetFaction() == "����̱����") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudu");
			Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
			return
		end
	elseif (UTask_wu == 70*256 and nFactID == 3 and GetCamp() ~= 4 and GetFaction() == "����̱����") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ����©�����Ѽ�ʱ�޸�!",0)
			return
		end
	end
	
	local tbDes = {"����Ͷʦ/#daiyitoushi_main(3)", "�����������/common_talk"};
	
	
	Say("�������ֺܶ�����Ҫ�����������ʲô����", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wu = GetTask(10)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),10) == 0) then				-- ��������������
		Talk(1,"","���½������ο������Բ��飿���̺ͽ��ԭ���������ˡ���Щ�Ƶ���������ʲô����")
		Uworld40 = SetBit(GetTask(40),10,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 60*256+20) and (HaveItem(222) == 1) then		-- ���������
			Talk(2,"L60_prise","�����Ѷ������ɵı����կ��������","��!̫����!�ǳ��ã���Ȼû�й����ҵļ���. ���ǲ����嶾����'������,���������˳����ʦ��! ֮�����������˲�Ҫ���Ǳ���")
		elseif (UTask_wu == 60*256) and (GetLevel() >= 50) then		--��ʦ����
			Say("���̺��㵴��ԭ�������졣10��ǰ���̺��㵴�ɽ�����һ�ζ�ս�����̱����㣬���̵����֮���ٶ��鱻�㵴�ɶ�ȥ���������㵴ɽ����Ƕ�������һֻ���ҹ����ڻ���ʵ���Ǳ��̵���ܴ��衣��������ʦ�Ļ�����ȥ�ѱٶ�����Ҷ������������̸��",2,"���½��߾�ȫ��������֮��/L60_get_yes","�����������ޣ����²�������������! /no")
		elseif (UTask_wu == 80*256) then						-- �ط�������ɳ���
			Say("�����ʦ�ǰɣ�ʱ���ˣ�Ҳ��ʱ������ԭ��ʿ�������ŵ��ӵ�������",2,"�ǣ���л����/goff_yes","����������һ����,����Ҫ���������ˣ�/no")
		else
			Talk(1,"","��Ҫ��ؤ���Գ������ֵ�һ���ʵ���ֲ��ǣ��ߣ������ǵ�һ����Ҳ���ӹ��ҵĶ�ҩ��")
		end
--	elseif (UTask_wu == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����ɾ����������������Һúøɣ��ٻ������ٲ�����ģ�")
--	elseif (GetSeries() == 1) and (GetTask(2) == 5*256+10) and (HaveMagic(76) >= 0) then		-- ��ʦ�����ţ�����嶾���ջ�ȫ������
--		Say("�����ɾ����������ţ��ѵ������书������ǿ���㾹Ȼ��Ͷ�����ţ�",2,"����ֻ����͵ѧ���ž�����Ϊ���̹��/defection_yes","�Բ��𣬵���֪����/no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wu == 70*256) and ((GetTask(2) < 5*256) or (GetTask(2) == 75*256)) then		-- �ط�ʦ������
		Say("�����ط�ʦ��?����˵��Ҳ��˵СҲС��ֻҪ���ܹ����������Щ���ɾͿ��Ծ���. ",2,"������չ�/return_yes","�����������һ��/no")
	elseif (GetCamp() == 4) and ((UTask_wu == 70*256+10) or (UTask_wu == 70*256+20)) then			-- �ط������С�����Ϊ70*256+20��������70*256+10��ֵ
		Say("��˵����Щ���Ѿ�׼��������",2,"׼������/return_complete","���ٸ�����һ��ʱ�� /return_uncompleted")
	else							-- ����Ի�
		Talk(1,"","�����ɵ����໥�����¶��Ǳ����ڹ档˭�Ƚ�ǿ�ͻ�������")
	end
end;

---------------------- ���ܵ������ ------------------------
--function check_skill()
--	x = 0
--	skillID = 61					-- �嶾����
--	i = HaveMagic(skillID)
--	if (i >= 0) then
--		x = x + 1
--		DelMagic(skillID)
--		AddMagicPoint(i)
--	end
--	if (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
--		Say("�����ɾ���Ϊʦ��αչؿ�˼���գ���������������һ�����٣����ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
--		return
--	end
--end

--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("��ӭ������嶾��,���ѳ�Ϊ�嶾��ͯ��")
	SetRevPos(183,70)		  			--����������
	SetTask(10,10*256)				-- ����
	SetFaction("wudu")       	--��Ҽ�������
	SetCamp(2)
	SetCurCamp(2)
	SetRank(49)
	AddMagic(63)
	Msg2Player("ѧ����ɰ��")
	AddNote("�����嶾�̳�Ϊ�嶾ͯ��ѧ�ᶾɳ��")
	Msg2Faction("wudu",GetName().."�뿪���ż����嶾�̡�������������ǿ!",GetName())
end

--------------------- �ط�������� ----------------------
function goff_yes()
	Talk(1,"","����! ��ʦ֮���������в�Ҫ��������������������")
	SetTask(10,70*256)
	AddNote("�뿪�嶾�̣��������ν���")
	Msg2Player("���뿪�嶾�̣��������ν���")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_yes()
	Talk(3,"","��������5000�������������Ц��","�ã�����ô�г�����Ҳ�Ͳ��ƴ���","��׼����ȥ׼��")
	SetTask(10,70*256+20)
	AddNote("�Ͻ�50000�������Ϳ��Է����嶾��")
	Msg2Player("�Ͻ�50000�������Ϳ��Է����嶾��")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","ι! ���������Ǳ��̵���! �ҽ����������ڤ����")
		Pay(50000)
		SetTask(10,80*256)
		SetRank(80)
--		if (HaveMagic(75) == -1) then
--			AddMagic(71)
--			AddMagic(74)
--			AddMagic(75)
		add_wu(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ�����ɾ�ѧ���嶾�澭���书���ɷ�������ڤ�� ")
--		end
		SetFaction("wudu")
		SetCamp(2)
		SetCurCamp(2)
		AddNote("�ص��嶾�̣���������")
		Msg2Player(GetName().."�������嶾��,����Ϊ��ڤ����. ")
	else
		Talk(2,"","���ʦ��, ��������ʲô��û��׼��","������˼!�Ҽ��һ��.")
	end
end;

function return_uncompleted()
	Talk(1,"","���!")
end;

---------------------- ����������� ---------------------
function L60_get_yes()
	SetTask(10,60*256+10)
	AddNote("����ԭ���㵴����ȥ������֮���ܶ���")
	Msg2Player("����ԭ���㵴����ȥ������֮���ܶ���")
end;

function L60_prise()
	Talk(1,"","���¿̹����ģ���������")
	SetTask(10,70*256)
	DelItem(222)
	SetRank(70)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("���㵴�����ж����ܶ��飬�ͻ����嶾�̡���ɳ�ʦ���񡣱���Ϊ��ڤ��ʹ��˳����ʦ")
	Msg2Player("��ϲ��!�ѳɹ���ʦ������Ϊ��ڤ��ʹ")
end;

function no()
end;
