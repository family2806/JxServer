--description: �����Ʋ�Ⱦ 30������ 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-13)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>�������Ǽ��뱾���������ڵģ����˲��ý���!"
	G_TASK:OnMessage("����", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("��������������", main2)
	tbDailog:Show() 
end

function main2()
	UTask_tm = GetTask(2)
	Uworld123 = GetTask(123)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then		-- ������������
		if (UTask_tm == 30*256) and (GetLevel() >= 30) then		--30����������
			Talk(3, "L30_get", "<color=Red>������<color>��<color=Red>����<color>ʦ�������������ǰ��һ�������������˰�������Ķ�����С����ҪЮ��������������<color=Red> �������ס� <color>��", "����ʦ�岻��Υ���Ź棬����ڶ����ǻ��˾�������С�����ֱۣ�ʦ��ֻ����ôһ�����ӣ��ε�����֮�²����ѽ����ˡ������ס�������û�뵽������ȴ��С����ʬ�ף�ʦ����ʹ����������һ��Ҫ���г�С�", "������������ʦ��й©���������ţ���������Ź洦���������������������뿪���Ű벽���˳�˺޿��½������������ˣ�!")
		elseif (UTask_tm == 30*256+50) then
			Talk(2, "", "���Ѿ��ҵ��˰������ʦ����ӵķ�ͽ�������<color=Red>�������ס�<color>.", " ̫���ˣ�<color=Red>����<color>ʦ��һ����е���ο�ģ����ȥ��<color=Red>�������ס�<color>��������������<color=Red>������<color>��.")
			Msg2Player("�ؼ��������Ʋ�Ⱦ��֪������ʦ�����ڻ�����")
			SetTask(2,30*256+60)
		elseif (UTask_tm == 30*256+60) then
			Talk(1, "", "ʦ��һ����е���ο�ģ����ȥ<color=Red>������<color>�������������Ϣ!")
		elseif (UTask_tm > 30*256) and (UTask_tm < 40*256) then					--�Ѿ��ӵ�30��������δ���
			Talk(1,""," ���Ѱ���̽������ǻ��˺��񾭳���û��<color=Red>���ɽ���߰��ƶ�<color>һ��.")
		elseif (UTask_tm >= 40*256) then					--�Ѿ����30�����񣬱��ŵ���
			Skill150Dialog("���ܰ�����ʦ��ϴ��ԩ����������Ҫ�����Ŀ�࿴��!")
		else		
			Skill150Dialog("��������Ǳ��Űݼ��������ڵĵط���Ѱ���˵Ȳ�������!")
		end
	elseif (Uworld123 == 10) then											-- ����90����������
		Say("���԰��Ҵ�һ������?",2,"����!/Uworld123_get","���ǲ�����˼�����Ÿոս��ҹ�ȥ������. /L30_get_no")
	elseif (Uworld123 == 20) and (HaveItem(379) == 0) then		-- �Ʋ�Ⱦ���񣬵��߶���
		Talk(1,"","������.., �Ż�δ�þ�����!")
		AddEventItem(379)
		Msg2Player("���Ʋ�Ⱦ����")
	elseif (Uworld123 == 30) and (HaveItem(380) == 1) then		-- �Ʋ�Ⱦ���񣬿���
		Talk(3,"Uworld123_step2","����������Ȼ��ƣ�����һ����������֮��!","����˭����ô���ǰ���?","�����������ܣ������Ҳ�����ˣ�����!")
	elseif (Uworld123 == 40) then											-- û���꣬������
		Talk(1,"Uworld123_step2","���ܣ�����!")
	elseif (Uworld123 == 50) then
		if (GetSex() == 0) then
			sexstr = "���� "
		else
			sexstr = "Ů��"
		end
		Talk(8,"Uworld123_step3","���Ӻ������ǣ���Ȼ�Һ͹��Ӳ��ף����ǣ�Ҳ���ỵ�˹��ӵ��� ","�㣬��. ","������Ϊ�Ƽұ����������䲻�ţ����ǣ����﹫�ӣ��ѵ�ȥ��������","��������Ӣ����˵���������մ���? ","����"..GetName().."��","ԭ����� "..GetName()..sexstr.."���Ŵ�����û�뵽������������. ","�������֧���ң���֪�ܷ񽫴��������ľ�𣿴��������˵��������Ҫ�������ش󣬲��ܿ�������. ","С��һ׮�������Ҿ�����. ")
	elseif (Uworld123 == 60) and (HaveItem(377) == 0) then		-- ���Ŷ���
		if (GetSex() == 0) then
			Talk(1,"","�������Ǵ�������!")
		else
			Talk(1,"","�������Ǵ�������!")
		end
		AddEventItem(377)
		Msg2Player("�õ���������")
	elseif (Uworld123 == 70) or (Uworld123 == 75) then			-- �������
		Talk(1,"Uworld123_prise","���������ҵ���ĺ���Ϣ�����Ǹ�л��!")
	elseif (Uworld123 >= 10) and (Uworld123 < 80) then		-- �Ʋ�Ⱦ���������
		Talk(1,"","��˵�ģ���Ͻ�ȥ������Ҫ�˷�ʱ��!")
	elseif (GetTask(51) >= 90) then		-- һ����ϴ��ԩ��������֮�󣬶Ի��ı�
		Talk(1,"","Ϊʲô���õ��谮������ȴ���ܣ����ǲ���!")
	elseif (Uworld123 >= 80) then									-- �Ʋ�Ⱦ�����Ѿ����
		Talk(1,"","��ζ�����㣬�ҳ�Ϊ���ź�һ�������������!")
	elseif (UTask_tm >= 70*256) then							--�Ѿ���ʦ
		Skill150Dialog("�����ȥ�����ǣ����ײ�ͬ��?")
	else
		Skill150Dialog("��������Ǳ��Űݼ��������ڵĵط���Ѱ���˵Ȳ�������!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("����", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get()
--	DelItem(42)							--��ֹ�ؽ��������Ҽ����������
	Say(" ����ʦ������˵����������˭��ֻҪ�ܰ�����ɱ��֮�𣬶��<color=Red>�������ס�<color>�������㾡���б��������!", 2, "Ѱ�Ұ�� /L30_get_yes", "��������!/L30_get_no")
end;

function L30_get_yes()
	Talk(1,""," ���Ѱ���̽������ǻ��˺��񾭳���û��<color=Red>���ɽ���߰��ƶ�<color>һ��.")
	SetTask(2, 30*256+20)
	AddNote("���Ʋ�Ⱦ��( 514, 318) , ��<color=Red>����������<color>, ������ʦ���ػ�����")
	Msg2Player("�ӻ��������񣬰�����ʦ���ػ�����")
end;

function Uworld123_get()
	Talk(1,"","�ã������Ҵ�����ŵ��꾩���׹��ӣ���ȥ���!")
	SetTask(123,20)
	Msg2Player("���������Ʋ�Ⱦ���Ÿ��׹���")
	AddEventItem(379)
	Msg2Player("�յ��Ʋ�Ⱦ����")
end

function Uworld123_step2()
	DelItem(380)
	SetTask(123,40)
	SetFightState(1)
	NewWorld(229,1616,3195)
end

function Uworld123_step3()
	AddEventItem(377)
	SetTask(123,60)
	Msg2Player("�õ���������. ")
end

function Uworld123_prise()
	AddRepute(10)
	Earn(20000)
	if (GetTask(123) == 70) then			-- ���Ǳ���
		SetTask(123,245)
	else
		SetTask(123,255)
	end
	Msg2Player("������ɣ�����2��������������10��. ")
	AddNote("������ɣ�����2��������������10��. ")
end

function L30_get_no()
end;
