--description: ���������� 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--update: Dan_Deng(2003-07-24), �ӡ��ط����ɡ�����
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1);
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 20*256) and (GetLevel() >= 20) then		--�ӵ�20������
			Say("���<color=Red>��ɽɽ��<color>����<color=Red>�ͻ�<color>��û���˺��˲�����ɽ����İ��գ�������Ϊ�����ӵܣ������ۿ��ͻ����˶���֮�����أ���Ը��ȥ�շ���Щ����", 2, "Ը��/L20_get_yes", "��������/L20_get_no")
		elseif (UTask_em == 20*256+80) then										--20�����������
			L20_prise()
		elseif (UTask_em == 20*256+50) then
			Talk(1,"","��������������ֻҪ�շ���<color=Red>����<color>��������ͻ���Ȼ����Ϊ���������������ӣ�������շ���<color=Red>����<color>�����Ż���������")
		elseif (UTask_em >= 30*256) then   							--�Ѿ����20��������δ��ʦ
			Skill150Dialog("���ܹ����뻢Ѩ���շ��ͻ����治��Ϊ�Ҷ��ҵ���!")
		else
			Skill150Dialog("��ѧ�����ͬ����Ҫ��͸������֮�£�ֻҪ���ģ����������ɾ�.")
		end
	elseif (UTask_em >= 70*256) then										--�Ѿ���ʦ
		Skill150Dialog("����Ļ۸�����������һ���ɾͣ���ʱ�ɱ�����������Щʦ�㰡!")
	else
		Skill150Dialog("��ѧ�����ͬ����Ҫ��͸������֮�£�ֻҪ���ģ����������ɾ�.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("��ü", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L20_get_yes()
	Talk(1,"","��������������ֻҪ�շ���<color=Red>����<color>��������ͻ���Ȼ����Ϊ���������������ӣ�������շ���<color=Red>����<color>�����Ż���������")
	SetTask(1, 20*256+50)
	AddNote("�ڽ����ü��������(240, 308) , �յ� <color=red>��������<color>, ȥ�ͻ����ո���")
	Msg2Player("�ڽ����ü�������磬�յ�ȥ�ͻ����ո��� ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","���ܹ����뻢Ѩ���շ��ͻ����治��Ϊ�Ҷ��ҵ���!")
	SetRank(15)
	SetTask(1, 30*256)
--	AddMagic(93)
	add_em(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ���Ϊ������")
	AddNote("���ض����ɵĽ����ã��������磬������񣬱���Ϊ������. ")
end;
