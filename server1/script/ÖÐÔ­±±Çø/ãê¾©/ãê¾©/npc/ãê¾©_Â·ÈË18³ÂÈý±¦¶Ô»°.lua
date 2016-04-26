--中原北区 汴京府 路人18陈三宝对话

-- 修改后与邪教主线相关的汴京陈三宝脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==310) then
		task_level50_05();
		return
	elseif (myTaskValue==329) then
		task_level50_06();
		return
	elseif (myTaskValue==330) then -- 玩家拿到了蓝花瓷瓶后回来与陈三宝的对话
		Say("如果你可以帮我找到那个花瓶，你就是我家族的恩人!",0);
		return
	elseif (myTaskValue==340) then
		task_level50_10();
		return
	end

	
-- 新任务系统与邪教主线相关的脚本 --

Say("陈三宝：这些都是上好的汝窑青瓷，您瞧瞧，这釉色如湖水晴空，灰而不暗，蓝而不浓，绿而不翠，釉质莹厚滋润，有玉石之感，这可是青瓷里面的上上品啊，宫里用的官窑也不过如此！",0)

end;

