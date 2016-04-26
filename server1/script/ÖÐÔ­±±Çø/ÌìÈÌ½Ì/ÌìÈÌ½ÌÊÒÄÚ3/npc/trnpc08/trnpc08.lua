--description: ���̽��󻤷���ľ�
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)

-- ��������ϵͳ����޸Ĺ���Ķ�ľű�
-- Edited by peres
-- 2005/01/20

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\item\\skillbook.lua")

Include("\\script\\global\\skills_table.lua")

function main()

-- ������ϵͳ��а��������صĽű� --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==360) then
		task_level60_01();
		return
	end


-- ������ϵͳ��а��������صĽű� --

	UTask_tr = GetTask(4)
	Uworld123 = GetTask(123)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 50*256) and (GetLevel() >= 50) then
			Say("<color=Red>��̳̳��������<color>���α�ץȥ����Ѻ��<color=Red>�꾩<color>��һ��<color=Red>����<color>���棬����α��������б��ʳ�ʲô���ܣ����Ա��̴�ҵʮ�ֲ�������˲�������㶼Ҫ�ѷ�����ȳ�����", 2, "��������/yes", "���¿��ѵ��˴���/no")
		elseif (UTask_tr == 50*256+50) then 
			L50_prise()
		elseif (UTask_tr > 50*256) and (UTask_tr < 50*256+50) then					--�Ѿ��ӵ�50��������δ���
			Talk(1,"","<color=Red>�꾩����<color> ��Ѻ <color=Red>������<color> ��<color=Red>��������<color>, ��ȫ�����ؼ��ɾȳ������磬��ס������������������÷�����������������!")
		else							--�Ѿ����50��������δ��ʦ��ȱʡ�Ի���
			Skill150Dialog("�����ڽ��ھ����У�ʤ���ǲ�����")
		end
	elseif (Uworld123 == 60) and (HaveItem(377) == 1) then			-- �Ʋ�Ⱦ���޻�һ��������
		if (GetTask(2) >= 70*256) and (GetTask(2) ~= 75*256) then			-- ���ŵ��ӻ����ų�ʦ�Ĳ���ѧ������
			Talk(11,"Uworld123_step4a","����ô�ã������ؼ���Ȼ��������!","������Ȼ�ǲ��ѣ��ź���������û���뵽.","��ľ�������㿴�������������ؼ�����书��","�ؼ�д��̫�����ˣ���ʲô������?","���ǲ�����������ǰ�󿴺����飬��˲���.","��Ȼ��ˣ���ʲô����������.","............","...............?","............","...............?")
		else
			Talk(1,"Uworld123_step4b","����ô�ã������ؼ���Ȼ��������!")
		end
	elseif (UTask_tr >= 70*256) then							--�Ѿ���ʦ
		Skill150Dialog("�ɾʹ����ߣ��費��С�ڣ�������ʲô�¶�հǰ�˺�η��ηβ���Ǿ�ʲôҲ��������!")
	else
		Skill150Dialog("�书������а��ֻ��ǿ��������֮�£�����Ϊ֮������֮�ƣ�ǿ����֮.")
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
	G_TASK:OnMessage("����", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function yes()
	Talk(1,"","<color=Red>�꾩����<color> ��Ѻ <color=Red>������<color> ��<color=Red>��������<color>, ��ȫ�����ؼ��ɾȳ������磬��ס������������������÷�����������������!")
	SetTask(4, 50*256+20)
	Msg2Player("���󻤷���ľ��Ӿ������񣬵��꾩�����ȷ����� ")
	AddNote("���󻤷���ľ��Ӿ������񣬵��꾩�����ȷ�����")
end;

function no()
	Talk(1,"","����Ϊ��������ʹ�������С��Ҳ�����ˣ���η���?")
end;

function L50_prise()
	Talk(1,"","����Ȼ���µ��ӣ����ǿ��Ե������Σ����̺���Ҫ����һ�����ˣ��һ�ͽ���˵��������.")
	SetRank(60)
	SetTask(4, 60*256)
	SetTask(21,0)		--�����ͽ������������㣬���ڽ���ظ�����
--	AddMagic(143)
	add_tr(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("��ϲ�㱻���Ϊ���̻̽���ʹ.")
	AddNote("�����̼̽��󻤷���ľ�������ɾ���������Ϊ����ʹ")
end;

function Uworld123_step4a()
	DelItem(377)
	if (HaveMagic(339) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(339,1)
	end
	if (HaveMagic(302) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(302,1)
	end
	if (HaveMagic(342) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(342,1)
	end
	if (HaveMagic(351) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(351)
	end
	CheckIsCanGet150SkillTask()
	Msg2Player("��ѧ�������Ӱ�������滨���Ź�����!")
	Msg2Player("��ľ�������ȥ���Ʋ�Ⱦ����.")
	SetTask(123,75)
	Talk(2,"","�鷳�㴫������Ⱦ���ӣ�˵��ľ�������ʧ��. ","�ã�����ллǰ��ָ��. ")
end

function Uworld123_step4b()
	DelItem(377)
	SetTask(123,70)
	Talk(1,"","�ܺã��鷳�㴫������Ⱦ���ӣ�˵��ľ�������ʧ��. ")
	Msg2Player("��ľ�������ȥ���Ʋ�Ⱦ����.")
end
