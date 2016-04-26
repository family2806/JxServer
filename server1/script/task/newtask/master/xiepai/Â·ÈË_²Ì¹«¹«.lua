
-- 路人蔡公公脚本
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==10) or (myTaskValue==20) then
		task_level20_02(); -- 与蔡公公对话
		return
	elseif (myTaskValue==40) then -- 已经杀死小太监
		task_level20_05();
		return
	end
	
	Say("嘿，这圣上今日看上了城外李家的一个姑娘，据说吹拉弹唱无所不能，正差我去把他接来以慰圣颜呢。",0);

end