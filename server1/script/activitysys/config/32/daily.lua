Include("\\script\\activitysys\\config\\32\\head.lua")
Include("\\script\\activitysys\\config\\32\\variables.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
Include("\\script\\activitysys\\config\\32\\gatherdailytask.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
Include("\\script\\lib\\log.lua")
--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
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
	%tbLog:PlayerActionLog("TinhNangKey","接沈升衣任务")
	%tbKillDailyTask:AcceptTask();
end

function pActivity:AcceptTalkTask()
	%tbLog:PlayerActionLog("TinhNangKey","接沈升衣任务")
	%tbTalkDailyTask:AcceptTask();
end

function pActivity:AcceptGatherTask()
	%tbLog:PlayerActionLog("TinhNangKey","接沈升衣任务")
	%tbGatherDailyTask:AcceptTask();
end

function pActivity:CompletKillTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbKillDailyTask:CompleteTask() == 1) then
		--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "KillTask");
		--更改每日杀怪任务奖励- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("完成每日任务(%s) 收到%d 个%s", "杀怪任务", 15000000, "经验"));
		Talk(1,"",format("%s,你果真是位大侠，这个是我送给你的小礼品，还请接受，明天再见哦", GetSex() == 1 and "姐姐" or "哥哥"));
		
	end
end

function pActivity:CompletTalkTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbTalkDailyTask:CompleteTask() == 1) then
		--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "TalkTask");
		--更改每日对话任务奖励- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("完成每日任务(%s) 获得%d个%s", "对话任务", 15000000, "经验"));
		Talk(1,"",format("%s, 你果真是位大侠，这个是我送给你的小礼品，还请接受，明天再见哦", GetSex() == 1 and "姐姐" or "哥哥"));
		
	end
end

function pActivity:CompletGatherTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbGatherDailyTask:CompleteTask() == 1) then
		--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "GatherTask");
		--更改每日收集任务奖励- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 10000000}, format("完成每日任务(%s) 获得%d个%s", "收集任务", 10000000, "经验"));
		Talk(1,"",format("%s, 你果真是位大侠，这个是我送给你的小礼品，还请接受，明天再见哦", GetSex() == 1 and "姐姐" or "哥哥"));
		
	end
end

function pActivity:TalkToNpc()
	%tbTalkDailyTask:TalkToNpc();
end