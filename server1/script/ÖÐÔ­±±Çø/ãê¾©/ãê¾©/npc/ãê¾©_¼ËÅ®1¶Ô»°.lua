--中原北区 汴京府 妓女1对话

-- 修改后与邪教主线相关的汴京如玉脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==300) then -- 在汴京与如玉的对话
		task_level50_03();
		return
	end

	
-- 新任务系统与邪教主线相关的脚本 --

if ( GetSex() == 0 ) then      -- 玩家性别为男
Say("妓女：对不起，我在等人，不接客，公子还是找别的姑娘吧！",0)
else			       -- 玩家性别为女
Say("妓女：我是个苦命人，你何必拿我开心呢？", 0)
end;

end;


