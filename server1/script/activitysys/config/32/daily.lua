Include("\\script\\activitysys\\config\\32\\head.lua")
Include("\\script\\activitysys\\config\\32\\variables.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
Include("\\script\\activitysys\\config\\32\\gatherdailytask.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
Include("\\script\\lib\\log.lua")
--��������-��¼��������������ɴ���- Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")

function pActivity:IsOpen()
	return 1;
end

function pActivity:Init()
	%tbKillDailyTask:Init();
	%tbGatherDailyTask:Init();
	%tbTalkDailyTask:Init();
end

function pActivity:AcceptKillTask()
	%tbLog:PlayerActionLog("TinhNangKey","������������")
	%tbKillDailyTask:AcceptTask();
end

function pActivity:AcceptTalkTask()
	%tbLog:PlayerActionLog("TinhNangKey","������������")
	%tbTalkDailyTask:AcceptTask();
end

function pActivity:AcceptGatherTask()
	%tbLog:PlayerActionLog("TinhNangKey","������������")
	%tbGatherDailyTask:AcceptTask();
end

function pActivity:CompletKillTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbKillDailyTask:CompleteTask() == 1) then
		--��������-��¼��������������ɴ���- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "KillTask");
		--����ÿ��ɱ��������- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("���ÿ������(%s) �յ�%d ��%s", "ɱ������", 15000000, "����"));
		Talk(1,"",format("%s,�������λ��������������͸����С��Ʒ��������ܣ������ټ�Ŷ", GetSex() == 1 and "���" or "���"));
		
	end
end

function pActivity:CompletTalkTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbTalkDailyTask:CompleteTask() == 1) then
		--��������-��¼��������������ɴ���- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "TalkTask");
		--����ÿ�նԻ�������- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("���ÿ������(%s) ���%d��%s", "�Ի�����", 15000000, "����"));
		Talk(1,"",format("%s, �������λ��������������͸����С��Ʒ��������ܣ������ټ�Ŷ", GetSex() == 1 and "���" or "���"));
		
	end
end

function pActivity:CompletGatherTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbGatherDailyTask:CompleteTask() == 1) then
		--��������-��¼��������������ɴ���- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "GatherTask");
		--����ÿ���ռ�������- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 10000000}, format("���ÿ������(%s) ���%d��%s", "�ռ�����", 10000000, "����"));
		Talk(1,"",format("%s, �������λ��������������͸����С��Ʒ��������ܣ������ټ�Ŷ", GetSex() == 1 and "���" or "���"));
		
	end
end

function pActivity:TalkToNpc()
	%tbTalkDailyTask:TalkToNpc();
end