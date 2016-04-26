-- 华山派箭头对话脚本

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_jiantou()
	else
		Talk(1,"","听说武林传奇有黄金任务，华山弟子已经下山做任务了，你一会要回来!");
	end
end
