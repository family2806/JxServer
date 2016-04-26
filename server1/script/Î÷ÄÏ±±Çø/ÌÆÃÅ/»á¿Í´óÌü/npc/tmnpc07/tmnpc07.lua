--description: �����Ƴ� 20�����񡢳�ʦ���� 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-13)
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
				"���ʹ��ڱ�/#tbMasterGift:getGift('tangmen')",
				"�����������/oldMain"
			}
		Say("���갲������", getn(tbSay), tbSay)
		return
	end
	oldMain()
end

function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("������ʲô��?", 2, "����̴�ʦ/oldentence", "��ף��ʦ�ڣ��������ҹ���ʦ���͸�ͽ��/vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 2) then
		Describe("������ʲô��?", 2,
			"ѧ120����./lvl120skill_learn",
			"�����������/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end
	local UTask_tm = GetTask(2);
	local nFactID = GetLastFactionNumber();
	
	if (UTask_tm == 70*256) and (GetFaction() == "tangmen") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_tm == 70*256) and (GetTask(10) >= 5*256) and (GetTask(10) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(10,0)
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_tm == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(2,70*256)
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_tm == 80*256 and nFactID == 2 and GetCamp() == 3 and GetFaction() == "���뽭�� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tangmen");
			Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
			return
		end
	elseif (UTask_tm == 70*256 and nFactID == 2 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
			return
		end
	end

	local tbDes = {"����Ͷʦ/#daiyitoushi_main(2)", "�����������/common_talk"};
	
	Say("����Һ�æ������ʲô��?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tm = GetTask(2);
	local Uworld51 = GetTask(51)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),2) == 0) then				-- ��������������
		if (GetSex() == 0) then
			Talk(1,"","������ʦ��ѵ���Ӳ��ܸ�Ԥ������£�. �Ƴ𲻸�Υ�����鷳����ת���ҶԶ���������Ǹ��")
		else
			Talk(1,"","������ʦ��ѵ���Ӳ��ܸ�Ԥ������£�. �Ƴ𲻸�Υ�����鷳����ת���ҶԶ���������Ǹ��")
		end
		Uworld40 = SetBit(GetTask(40),2,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 30) then				-- ϴ��ԩ�����������
		Talk(4,"Uworld51_40","���ţ�������˵����һ�������гɼ����������������.","�����Ƽҵ��£������޹�!","���ţ�һ������������������?.!","�ߣ��Ϳ�! ")
	elseif (Uworld51 == 80) and (HaveItem(377) == 1) then				-- ϴ��ԩ�������Ѿ��������
		Talk(8,"Uworld51_90","���ţ����ָ�ɮ�����ѵ�����������̶̽�ñ������ź󣬰��������ָ�ɮ����������ɲ�Ⱦ����й©��ȥ!","ʲô����ô������?","��Ⱦ����һ���ǳ��ӣ��½����������������֮λ�����ԣ��������ͽ����ʹ�׹�����ϵ��͵������̽�!","���̵̽õ����������2������ȥ��ɱ���ָ�ɮ���˴Σ�������׼����ɱؤ����֡�����ȥ��ر������ţ������Ų�Ҫ����.","��Ⱦ���������������Ӱ� ","����Ϣŭ����Ⱦ����ֻ��һʱ��Ϳ������������������һ��!","���治���ļһ�������⣬����̳�����֮λ.","�鷳�����Ұ�οһ����ԭ���Ҵ������!")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 20*256+60) and (UTask_tm <= 20*256+70) and (HaveItem(41) == 1)) then		-- 20���������
			Talk(5, "L20_prise", "���������õ���Ȧ����ô��������?", "����ʦ�ý��ҽ������ŵģ����Ѿ�ԭ��������!", "�����������ԭ�����ˣ������Ը��ؼ��ˣ�����˵��������?", "������Ǵ�ʦ�ְ��ŵģ����Ӳ�û����ʲô", "������ô˵�����Ϊʦ�⿪���Ⱳ�������Ľᣬ���Ͳ�С��Ϊʦ�����������.")
		elseif (UTask_tm == 60*256+60) and (HaveItem(49) == 1) then		-- ��ʦ�������
			Talk(3, "L60_prise", "���ţ�������˿����֮�ҵ�������ƽ�����������Ǵ�˵�е����Ǿ�������?", "���������Ǿ��������������ƣ����ļ�ֵ�������������ȡ�ᡣ�������Ǯ�ͱ��ض�ѡ������˵����������ջ��ʱ�����ܱ��ֶԱ��ŵ��ҳϣ��ܺã��ܺã����Ѿ�ͨ�����飬����˳����ʦ��", "��ϲ���ճɳ�ʦ�����ѱ���Ϊ���ŵ�ǧ���������ӽ��Ժ�����������߽������������ѡ����������ɼ���ѧ�գ�Ҳ����ȥ���������չ�Լ��Ľ����������ֻ�����һ�����п�Ҳ������������������ߺ�����ϣ�����ܴ�չȭ�ţ�һչ��ͼ")
		elseif (UTask_tm == 60*256+70) then				--��ʦ����
			Talk(3, "L60_fail", "��Ҫ�����Ǿ�������?", "............", "����˾���������Ʊ����ջ�����ô���������ʦ�أ�˵������һ�����Ϊ�˸�������棬�����ѱ���!")
		elseif (UTask_tm == 60*256+80) then
			if (GetCash() >= 20000) then
				Talk(1,"","������Ļڹ����Ҿ��ٸ���һ�λ��ᣬ������ٴ�һ����˿����ȡ�����Ǿ�����.")
				Pay(20000)
				SetTask(2, 60*256+20)
				AddNote("��20000���������ſ�ˡ������˿��ȡ�����Ǿ�����. ")
				Msg2Player("��20000���������ſ�ˡ������˿��ȡ�����Ǿ�����. ")
			else
				Talk(1,"","�ں�Ҳ���棬����Ǯ����˵!")
			end
		elseif (UTask_tm == 60*256+90) then
			if (GetCash() >= 40000) then
				Talk(1,"","�ߣ����ٸ���һ�λ��ᣬ��ȥһ����˿����ȡ�����Ǿ�����..")
				Pay(40000)
				SetTask(2, 60*256+20)
				AddNote("��40000���������ſ�ˡ������˿��ȡ�����Ǿ�����. ")
				Msg2Player("��40000���������ſ�ˡ������˿��ȡ�����Ǿ�����. ")
			else
				Talk(1,"","�츶40000��������˿��ȡ�����Ǿ�����.. ")
			end
		elseif ((UTask_tm == 60*256) and (GetLevel() >= 50) and (GetFaction() == "tangmen")) then				--��ʦ��������
			Say("���ڱ���ѧ�ն�ʱ��ΪʦҪ��һ���㣬�����������һ��<color=Red>��˿��<color>��������ܹ���<color=Red>��˿��<color>��ȡ��һ��<color=Red>���Ǿ�����<color>���Ϳ���˳����ʦ��", 2, "���ܿ���/L60_get_yes", "�ݲ����� /no")
		elseif (UTask_tm == 80*256) then						-- �ط�������ɳ���
			Say("�������֮���ˣ�",2,"�ǵģ������Ÿ��������߽���/goff_yes","����������������ҪŬ������. /no")
		elseif (UTask_tm > 20*256) and (UTask_tm < 20*256+60) then					--�Ѿ��ӵ�20��������δ���
			Talk(1,"","��֪�����ù��ÿɺã�����ֱ�����죬����Ȼ����ԭ����������!")
		elseif (UTask_tm >= 30*256) and (UTask_tm <= 60*256) then					--�Ѿ����20��������δ�ӵ���ʦ����
			Talk(1,""," ���Ϊʦ�⿪���Ⱳ�������ĽᣬΪʦ����������� !")
		elseif (UTask_tm > 60*256) and (UTask_tm < 70*256) then					--�Ѿ��ӵ���ʦ������δ���
			Talk(1,"","ֻҪ���ܹ���<color=Red>��˿��<color>��ȡ��һ��<color=Red>���Ǿ�����<color>������ͨ����ʦ������ ")
		else					--�Ѿ����ţ���δ��20������ȱʡ�Ի���
			Talk(1,"","���ż��մӲ��⴫���������µ������˸�й©�������ذ��Ź洦�ã���������!")
		end
--	elseif (GetTask(10) == 5*256+10) then		-- ת���ɵ��嶾��
--		Say("�Ƴ���Ͷ���嶾����֪���Ų��������Ͷ�������������з�ȥ���ž��ա��㲻�����¿���һ����",2,"���������Ѿ�/defection_yes","�һ��ǲ�ȥ�嶾����/defection_no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tm == 70*256) and (GetTask(10) < 5*256) then		-- �ط�ʦ������
		Say("�˴λ��������뷵��������?",2,"����!/return_yes","��. /return_no")
	elseif (GetCamp() == 4) and ((UTask_tm == 70*256+10) or (UTask_tm == 70*256+20)) then		-- �ط�ʦ��������
		Say("׼����5������?",2,"��׼������/return_complete","δ׼����/return_uncompleted")
	elseif (Uworld51 >= 90) then			-- �Ѿ���ɡ�ϴ��ԩ��������
		Talk(1,"","�����Ĳ�Ⱦ�и�����!")
	elseif (UTask_tm == 70*256) and (GetFaction() ~= "tangmen") then							--�Ѿ���ʦ
		Talk(1,"","���ʦ��Ҫ����Ϊ֮����������С���˱��ŵĹ���!")
	else
		Talk(1,"","���˶��������ſ�����̶��Ѩ�������Ƴ𿴳�ϲŭ�޳���ħͷ���ߣ�?")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
	x = 0
	skillID = 51					-- ��ľ��
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (GetFaction() == "tangmen") and (GetTask(2) == 80*256) and (HaveMagic(253) == -1) then		-- �ط�ʦ�������¼���
		AddMagic(253)
		Msg2Player("��ѧ���޶�ʴ��. ")
		Say("���ѱչ��������գ������һ���޶�ʴ�ǣ������Ҵ����㡣��ѧ�����Ҫע����Ϣ�������˼�����!",1,"�a��лʦ��/KickOutSelf")
		return 0
	elseif (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
		Say("���ѱչ��������գ������һ���޶�ʴ�ǣ������Ҵ����㡣��ѧ�����Ҫע����Ϣ�������˼�����!",1,"�a��лʦ��/KickOutSelf")
		return 0
	else
		return 1
	end
end

------------------------ �ط�������� -------------------------
function goff_yes()
	Talk(1,"","�ã�ȥ�ɣ�Ҫ�ǵò�����а�̽ύ")
	SetTask(2,70*256)
	AddNote("�뿪���ţ����߽���")
	Msg2Player("�뿪���ţ����߽���")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=45; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=43; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ű���
	i=44; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ŵ���
	i=47; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����
	i=48; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����
	i=50; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ׷�ļ�
	i=51; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ľ������ȡ����
	i=54; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���컨��
	i=55; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �㶾��
	i=57; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ǻ���
	i=58; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���޵���
	i=249;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- С��ɵ�
	i=253;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ԧ��ʴ��
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(10,5*256+20)
	SetTask(2,75*256)				-- Ϊԭ�����������
	SetRank(66)
	if (GetRepute() < 200) then
		Msg2Player("�����뱾�ɲ��У������������"..GetRepute().."��!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("�����뱾�ɲ��У������������200��! ")
		AddRepute(-200)
	end
	AddNote("�Ƴ��ջ���������书����������Լ����嶾����. ")
	Msg2Player("�Ƴ��ջ���������书����������Լ����嶾����. ")
	Talk(1,"KickOutSelf","Ϊ�˷�ֹ���ž�ѧ��¶�����Ѿ��ļ����嶾���Ҿ�Ҫ�ջ����ž�ѧi!")
end

function defection_no()
	AddNote("��ȡ�������嶾�̵��뷨")
	Msg2Player("��ȡ�������嶾�̵��뷨")
	SetTask(10,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_yes()
	Talk(3,"","�ԣ������ڽ�����û��ʲô�����������λʦ��ָ��!","�����Ź棬��Ҫ���������ط�����!","�ǣ��õ���׼��һ��!")
	SetTask(2,70*256+20)
	AddNote("�����������������Է�������")
	Msg2Player("�����������������Է�������")
end;

function return_no()
	Talk(2,"","�����Ʈ������һ��ʱ��.","��Ȼ��ˣ���Ҫ����!")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","�ܺã�������ݳ��ţ�����ô�ܾܾ�!")
		Pay(50000)
		SetTask(2,80*256)
		SetRank(76)
--		if (HaveMagic(48) == -1) then
--			AddMagic(249)
--			AddMagic(58)
--			AddMagic(341)
--			AddMagic(48)
		add_tm(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ�����ɾ�ѧ�����ۣ�С��ɵ������޵�����ɢ����")
--		end
		SetFaction("tangmen")
		SetCamp(3)
		SetCurCamp(3)
		AddNote("�ѷ�������")
		Msg2Player(GetName().."�������ţ���Ϊ»����. ")
	else
		Talk(2,"","������û��׼����!","�Բ����Ҽ��һ��.")
	end
end;

function return_uncompleted()
	Talk(1,"","û������׼����!")
end;

----------------------- 20������ -----------------------
function L20_prise()
	DelItem(41)
	SetRank(27)	
	SetTask(2, 30*256)
--	AddMagic(303)
	add_tm(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ���Ϊ���Ż�����ѧ�����̹�")
	AddNote("������Ȧ���Ƴ����ţ��������������Ϊ����")
end;

----------------------- ��ʦ���� --------------------------
function L60_get_yes()
	SetTask(2, 60*256+20)
	AddNote("�ڴ���( 508, 322) , ���Ƴ𣬽� <color=red>��ʦ����<color>, ����˿��ȡ�����Ǿ�����")
	Msg2Player("�ڴ������Ƴ𣬽ӳ�ʦ���񣬵���˿��ȡ�����Ǿ�����")
end;

function L60_prise()
	DelItem(49)
	Msg2Player("��ϲ��ѧ�ɣ����Գ�ʦ�ˡ��㱻��Ϊ������������������120��")
--	AddGlobalCountNews(GetName().."�ճɳ�ʦ������λͬ�����߽�����", 1)
	Msg2SubWorld("����"..GetName().."ѧ�ɳ�ʦ���Ǳ�ͬ�����ã����߽���")
	AddRepute(120)
	SetRank(66)
	SetTask(2, 70*256)
	SetFaction("")				    			--����˳�����
	SetCamp(4)
	SetCurCamp(4)
	AddNote("�������ţ������Ǿ��������Ƴ����ţ���ɳ�ʦ������Ϊ�������� ")
end;

function L60_fail()
	Say("���������ˣ������ô��?", 2, "Ǯ�����˻�����/L60_faila", "�����ſ�ˡ/L60_failb")
end;

function L60_faila()
	SetTask(2,60*256+90)
	Talk(1,"","������4������Ȼ��ȥ��˿��ȡ�����Ǿ�����!")
end;

function L60_failb()
	SetTask(2,60*256+80)
	Talk(1,"","������ŸĹ����Ҿ͸���һ�����ᣬ������2������Ȼ��ȥ��˿��ȡ�����Ǿ�����.")
end;

----------------------- �������� --------------------------
function Uworld51_40()
	SetTask(51,40)
	Msg2Player("����û�а취Ȱ�Ƴ��ˣ������ȥ����һ����ʦ���ƺڽ������")
end

function Uworld51_90()
	DelItem(377)
	SetTask(51,90)
	Msg2Player("�������ף��Ƴ����֪���������һ��. ��ȥ������һ������")
	AddNote("�������ף��Ƴ����֪���������һ��. ")
end

function no()
end
