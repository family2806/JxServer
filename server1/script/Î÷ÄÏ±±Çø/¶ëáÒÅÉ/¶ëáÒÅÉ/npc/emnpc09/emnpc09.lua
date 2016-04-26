--description: ���������ƴ� 
--author: yuanlan	
--date: 2003/3/5
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 30*256+50) then				-- 30��������
			if (HaveItem(120) == 1) then		-- �������
				L30_prise()
			else
				Talk(1,"","�鷳�㵽<color=Red>��ɽ����<color>���ҿ�. ������<color=Red>����<color>������ü������������������������İ�����ߵ�.")
			end
		elseif (UTask_em == 30*256) and (GetLevel() >= 30) then		-- 30����������
			Say("<color=Red>������<color=Red>���<color>�����ˣ����ܰ���������?", 2, "����Ѱ��/L30_get_yes", "ûʱ��/L30_get_no")
		elseif (UTask_em >= 40*256) then   							--�Ѿ����30��������δ��ʦ
			Skill150Dialog("Сʦ�ã�лл�����!")
		else
			Skill150Dialog("���ѽ��������ܵ�����ȥ�ˣ���������!")
		end
	elseif (UTask_em == 70*256) then								--�Ѿ���ʦ
		Skill150Dialog("Сʦ�ã���Ҫ��ɽ�����Һͻ�����������.")
	else
		Skill150Dialog("�ҵĻ���Ѿ�ͨ���ˣ��������ǲ���������.")
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
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get_yes()
	Talk(1,"","�鷳�㵽<color=Red>��ɽ����<color>���ҿ���<color=Red>���<color>���<color=Red>����<color>������ü������������������������İ�����ߵ�.")
	SetTask(1, 30*256+50)
	AddNote(" �ڶ����ɺ���(242, 305) �����ƴȣ���<color=red>�������<color>, ȥ��ɽ�һ��")
	Msg2Player("�����ƴȻ�����񣬵���ɽ�һ��")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","����������������С�������´οɲ�׼�����ˣ�лл������һػ��!")
	DelItem(120)
	SetRank(16)
	SetTask(1, 40*256)
--	AddMagic(385)
--	AddMagic(82)
--	AddMagic(89)
	add_em(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㱻��Ϊ��������")
	AddNote("�������ȥ�����ƴȣ���ɻ�����񣬱���Ϊ��������")
end;	
