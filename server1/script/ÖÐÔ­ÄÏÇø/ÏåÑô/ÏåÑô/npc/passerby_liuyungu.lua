-- 拓跋怀川对话脚本

Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include([[\script\global\yuenan_feiyunrenwu.lua]]);	--by liaozhishan 11/15/2006

function main()
	local tab_Content = {
		"我来做支线任务/branch_liuyungu", "顺便路过/no"
	};
	if (v_fy_is_active() == 1) then
		tinsert(tab_Content, "领取100级奖励/v_fy_100_entrance")
		Say("我可以帮什么吗？ ", getn(tab_Content), tab_Content);
		return
	end;	
	branch_liuyungu();
end