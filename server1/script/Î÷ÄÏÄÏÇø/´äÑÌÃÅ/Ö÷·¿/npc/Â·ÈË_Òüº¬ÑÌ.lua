-- ������ ���������� 10������50�����񡢳�ʦ�����ط�ʦ������
-- by��Dan_Deng(2003-07-25)
-- Update: Dan_Deng(2003-09-24)��������ط����������ɾ�ѧ���
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\item\\skillbook.lua")

function main()
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 5) then
		Describe("������ʲô�� ", 2,
			"ѧ120������./lvl120skill_learn",
			"�����������/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_cy = GetTask(6)
	local nFactID = GetLastFactionNumber();

	if (UTask_cy == 70*256) and (GetFaction() == "cuiyan") then			-- ��ʦ��������
		SetFaction("")
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_cy == 70*256) and (GetTask(1) >= 5*256) and (GetTask(1) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(1,0)
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_cy == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(6,70*256)
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (GetTask(1) == 70*256) and (GetTask(6) == 70*256) then			-- ת���ɴ�������
		SetTask(1,75*256)
		Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
		return
	elseif (UTask_cy == 80*256 and nFactID == 5 and GetCamp() == 3 and GetFaction() == "���뽭�� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("cuiyan");
			Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
			return
		end
	elseif (UTask_cy == 70*256 and nFactID == 5 and GetCamp() ~= 4 and GetFaction() == "���뽭��") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("ϵͳ���ִ����Ѽ�ʱ�ָ�!",0)
			return
		end
	end

	local tbDes = {"����Ͷʦ/#daiyitoushi_main(5)", "�����������/common_talk"};
	
	Say("����Һ�æ����������ʲô��?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_cy = GetTask(6)
	local Uworld51 = GetTask(51)
	local Uworld126 = GetTask(126)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),6) == 0) then				-- ��������������
		Talk(1,"","���������������ô�Ҳ��ӡ����Ǳ��Ŷ���Ů��֮�������²��С���ر���������������һ��֧�ָ�λӢ�ۣ�ף��λ�쿪��ʤ!")
		Uworld40 = SetBit(GetTask(40),6,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 10) then			-- ϴ��ԩ�����������
		Talk(5,"Uworld51_20","��һ�����Ҵ����ţ��Ҹ��ײ���ΪʲôͻȻ�����������Ļ��£������е����ѣ������㲻�õ���.","һ�� ","Ŷ�i...��Ҫ���ˣ����鲻һ�������ģ�ֻҪ�������ģ���һ���ܹ��������ѣ��ߵ�һ��","��һ���ܰ��㣬��һ���������ش���.")
	elseif (Uworld51 == 100) then			-- ϴ��ԩ���������
		Talk(3,"Uworld51_prise"," ԭ����ˣ�����Ϊһ��������ô���࣬������ô�����㣬������!","����ʲô ","�������ʦ�����ҵģ���������Ѫ���������ӹ���!")
	elseif (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- ��������Լ����ɶԻ�
		if (UTask_cy == 10*256+10) and (HaveItem(0) == 1) then		-- 10���������
			Talk(2,"L10_prise","���ţ������Ѱ����һش�������! ","̫���ˣ����ҵ��˰�.")
		elseif (UTask_cy == 10*256) and (GetLevel() >= 10) then		--10����������
			Say("�������ۣ�����ȥ���ϱߵ�С����ɢ������������ϲ���Ĵ�����!",2,"�Ұ���ȥ��/L10_get_yes","��װû����/no")
		elseif (UTask_cy == 50*256+50) then		--���50������
			Talk(1,"L50_prise","���Ӱ�ʦ����������ʥ���һ�����ͩ���������ɴ�ʦ���Ҵ������㣬��лʦ��")
		elseif (UTask_cy == 50*256) and (GetLevel() >= 50) then			--50����������
			Say("��Բ�������ҵĺ��ѣ����ո�������˵С͵͵������ͩ�����������ֺ󣬾��ܽ��������С͵�����ո�ǿ��ɮ�������ܼ������ԣ�������������������ͬ��ȥ��ʥ�°�æ��?",2,"û���⣬��ȥ /L50_get_yes","�����书�����ã����²���ȥ/no")
		elseif (UTask_cy == 60*256+30) then							--��ʦ�������
			L60_prise()
		elseif (UTask_cy == 80*256) then						-- �ط�������ɳ���
			check_skill()
		elseif (UTask_cy >10*256) and (UTask_cy < 20*256) then		-- 10��������
			Talk(1,"","��û�ҵ���������?")
		elseif (UTask_cy > 50*256) and (UTask_cy < 60*256) then		-- 50��������
			Talk(1,"","ץ��С͵����?")
		elseif (UTask_cy >= 60*256) then		-- ���50�������ĳ���Ի�
			Talk(1,"","��ʥ�µ���������ĺܶԣ�����ǰ����Բ������������.")
		else		-- ����������״̬�³���Ի�
			Talk(1,"","����书�����ܿ죬����Ҳ��Ҫ��������Ҫ������������.")
		end
	elseif (Uworld126 == 20) then			-- 90����������
		Talk(5,"Uworld126_talk","������!","����ʲô��?","���µõ���˼�ɵİ������������˺ͺã�����۪����̫��ִ��."," Ŷ����ˮ̫��ִ����ʱ���ι����Ǹ��˲ţ������������⣬�ź����ǹ����ڼ������Ƕ�����ô�ܼ���������أ������ͺã������Ѱ�����Ȱ����۪���ϣ�����Ұ취�� .","ԭ����ˣ����»�Ŭ����.")
	elseif (Uworld126 == 80) and (GetFaction() ~= "cuiyan") then
		Talk(5,"Uworld126_finish"," ���������ɹ���! ","Ŷ��","����������?","���ǵģ����ǣ������Ѿ������ˣ�Ե��Ҳ����������ǲ�����ô��л��.","���������λ�����������Ѿ����Ҹ��ˣ�����л���أ�")
	elseif (Uworld126 > 20) and (Uworld126 < 70) then
		Talk(1,"","С�������ִ�����ܲ��˱��ŵ����飬��˵��û��ʲô���£����ԣ��鷳����.")
--	elseif (UTask_cy == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����̣����츳���ˣ����źܿ���ܳ�Ϊ���Ŷ����ˣ���������������ʱʧȥ�书������ȥ�뱾�Ÿ�λ������Ϥһ�£������������˶�������ֵ�����ɡ�")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_cy == 70*256) and ((GetTask(1) < 5*256) or (GetTask(1) == 75*256)) then		-- �ط�ʦ������
		Talk(2,"return_sele","���ԣ������ɱ�˲���ǿ���������ڽ����Ϻ�������","���ǣ��һ���������������ů�Ŀ�����ʦ�����ҿ��Է��ش�������?")
	elseif (GetCamp() == 4) and ((UTask_cy == 70*256+10) or (UTask_cy == 70*256+20)) then		-- �ط�ʦ��������
		Say("׼������������û��?",2,"׼������/return_complete","��û׼����/return_uncompleted")
--	elseif (GetTask(1) == 70*256+10) and (HaveMagic(111) >= 0) then		-- �������ط����ɣ��ջر̺�����
--		Say("�����̣��ع�һȥ�������������ִ��Ҫ������ţ�",2,"�쳾ʵ�޿ɾ���������������ȥ��/defection_yes","���ٿ��ǿ���/no")
	else
		Talk(1,"","������ź��������ˣ���Ȼ�Ǻ��£�ֻ��")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(114) == -1) then
--		AddMagic(114)					-- ����ѩ��
--		Msg2Player("��ѧ���ˡ�����ѩ�ġ�")
--		Say("�����̣�Ϊʦ��αչؿ�˼���գ��´���һ�С�����ѩ�ġ������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("���������������?",2,"�ǵģ������Ŷ�׼/goff_yes","�����Ҿ����Լ��Ĺ��򻹲���. /no")
--	end
end
--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("��ӭ���������ţ���Ϊ���")
	SetRevPos(154,61)		  				-- ������
	SetTask(6,10*256)						-- ����
	SetFaction("cuiyan")      			--��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	AddMagic(99)
	Msg2Player("ѧ���绨ѩ��")
	AddNote("��������ţ���Ϊ��澣�ѧ���绨ѩ��")
	Msg2Faction("cuiyan",GetName().." �Ӷ�ü����������ţ�������������ǿ��!",GetName())
end

-------------------------- �ط�������� ------------------------
function goff_yes()
	Talk(1,"","��Щ���飬ֻ���������������ף���ȥ������Ҳ��.")
	SetCamp(4)
	SetCurCamp(4)
	SetTask(6,70*256)
	SetFaction("")
	AddNote("�뿪�����ţ���һ�����߽���")
	Msg2Player("�뿪�����ţ���һ�����߽���")
end

function return_sele()
	Say("��Ȼ���ԣ���ֻ��Ҫ5�������ܷ�������.",2,"̫���� /return_yes","��ȥ��Ǯ��˵. /return_no")
end;

function return_yes()
	Talk(1,"","�ã�����ȥȡ������! ")
	SetTask(6,70*256+20)
	AddNote("��5�����������ž��ܷ�������. ")
	Msg2Player("��5�����������ž��ܷ�������. ")
end;

function return_no()
	Talk(1,"","5 ��������С�������������.")
end;

function return_complete()
	if (GetCash() >= 50000) then
		Talk(1,"","�ã��������ѹ��ˣ��ҷ���Ϊ���ɻ���ͬʱ�����㱾�ž�ѧ���̺�������ϣ�������Ŭ��.")
		Pay(50000)
		SetTask(6,80*256)
		SetFaction("cuiyan")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(67)
--		if (HaveMagic(114) == -1) then
--			AddMagic(108)
--			AddMagic(111)
--			AddMagic(114)
		add_cy(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("��ѧ�������ž�ѧ������ѩ�ģ���Ұ���ǣ��̺����� ")
--		end
		Msg2Player(GetName().."<#>���ش����ţ�����Ϊ����")
		AddNote("���ش������� ")
	else
		Talk(1,"","�������������񲻹�����鿴��.")
	end
end;

---------------------- �������� ---------------------------
function L10_get_yes()
	Talk(2,"","���ټ���������ģ��鷳����.","ʦ��̫������!")
	SetTask(6,10*256+10)
	AddNote("��10�����񣺵����ϱ�С�����ٴ�����")
	Msg2Player("��10�����񣺵����ϱ�С�����ٴ�����")
end;

function L10_prise()
	Talk(1,"","�����ˣ��������вš�������Ϊ10������.")
	DelItem(0)
	SetTask(6,20*256)
	SetRank(32)
--	AddMagic(95)
--	AddMagic(97)
	add_cy(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("������������ȥ�������̸�����������������񣬳�Ϊ��Ʒ��ʹ")
	Msg2Player("��ϲ�㱻��Ϊ��������Ʒ��ʹ��ѧ�����̵���������˫��. ")
end;

function L50_get_yes()
	Talk(1,"","����С��.")
	SetTask(6,50*256+10)
	AddNote("��50������Ϊ��ʥ�·�����Բ�����ͩ�����m ")
	Msg2Player("��50������Ϊ��ʥ�·�����Բ�����ͩ�����m ")
end;

function L50_prise()
	Talk(1,"","�ܺã����Ȼ����˫ȫ��Ϊ�������˲������飬�治���Ǳ��ŵ���! ")
	SetTask(6,60*256)
	SetRank(36)
--	AddMagic(109)
	add_cy(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㱻��Ϊ������ѧ��ѩӰ�书")
	AddNote("�o�����ͩ���������50�����񣬱���Ϊ����")
end;

function L60_prise()
	Msg2Player("�㽻�Ÿ������̣��������¶�˵������. ")
	Talk(2,"","�˴�����ҽ���˱��ŵ��£����˴󹦡���ϲ�㣬����Գ�ʦ�� ","�a��л����! ")
	SetTask(6,70*256)
	SetRank(35)
	SetFaction("") 		   					--�˳�����
	SetCamp(4)
	SetCurCamp(4)
	DelItem(235)
	AddNote("�㽻�Ÿ������̣��������¶�˵����������ɳ�ʦ���񣬱���Ϊ����")
	Msg2Player("��ϲ���Ϊ���ɣ����Գ�ʦ��")
end;

----------------------- �������� --------------------------
function Uworld51_20()
	SetTask(51,20)
	Msg2Player("�i������һ�����׷�����ʲô�£���ʲô�취��ȥ��? ")
end

function Uworld51_prise()
	SetTask(51,255)
	AddMagicPoint(1)
	Task86_2 = GetByte(GetTask(86),2) + 1
	if (Task86_2 > 255) then Task86_2 = 255 end
	Task86 = SetByte(GetTask(86),2,Task86_2)
	SetTask(86,Task86)			-- ��¼����ü��ܵ�����
	Msg2Player("��������Ϊ�뱨������ʦ���Ľ��͸��㡣��Ĺ�������1�� ")
	Msg2Player("���ϴ��ԩ������")
	AddNote("���ϴ��ԩ������")
end

function no()
end;

function Uworld126_talk()
	SetTask(126,30)
	Msg2Player("������Ҳû�и��õİ취���������ȥ��۪��ˮ")
	AddNote("������Ҳû�и��õİ취���������ȥ��۪��ˮ")
end

function Uworld126_finish()
	if (GetTask(6) >= 70*256) and (GetTask(6) ~= 75*256) then
		Talk(3,"","���߽����������ܶ�Σ�գ����ﺬ���б��������ſ��԰���. ","���ǲ�����˼","������Ů��������������Ű�!")
		if (HaveMagic(336) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(336,1)
		end
		if (HaveMagic(337) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(337,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("ѧ������书������Ӱ����������. ")
		SetTask(126,255)
	else
	   Talk(2,"","�������豨������������! ","��ʦ��������!")
	   SetTask(126,245)								--������������ñ���245
	end
	add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
	AddRepute(add_repute)
	Msg2Player("<#>ȥ��۪��ˮ�Ͷ�˼�ɵĶ�Թ���������. �����������"..add_repute.."<#>��.")
	AddNote("ȥ��۪��ˮ�Ͷ�˼�ɵĶ�Թ���������. ")
end
