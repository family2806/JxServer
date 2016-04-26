Include("\\script\\bonusvlmc\\head.lua");
Include("\\script\\bonusvlmc\\killmonster.lua");
Include("\\script\\task\\task_addplayerexp.lua");

function AcceptQuest()
	SetTask(VLMC_Task_IsQuest, 1)
	VLMC:AcceptTask(1, 21)
end

function FinishQuest()
	if (VLMC:CheckTaskComplete() ~= 1) then
		return
	end
	 VLMC:CompleteTask()
	 SetTask(VLMC_Task_IsFinishQuest, 1)-- settask 已完成任务
	 tl_addPlayerExp(20000000); -- add 20 tr EXP co cong don
	 WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."完成任务收20000000积分")
end

function ReviewQuest()
		 VLMC:ReviewCurKillMonsterTask()
end
