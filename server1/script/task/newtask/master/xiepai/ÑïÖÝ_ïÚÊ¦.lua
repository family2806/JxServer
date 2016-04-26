
-- 与邪教相关人物扬州镖师脚本
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

myTaskValue = GetTask(1003)

	if (myTaskValue==100) then
		task_level30_03();
		return
	elseif (myTaskValue==109) then
		task_level30_03_01(); -- 再判断一次等级是否达到 30 级
		return
	end

Say("镖师：干我们这一行的，穿山入岭那是家常便饭，每次护镖都不知道这次自己能不能活着回来。",0);

end