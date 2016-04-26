Include("\\script\\event\\pingzi\\200805\\pingzi.lua");	-- 拼字游戏
Include("\\script\\event\\young_hero\\hero.lua");		-- 少年英雄
Include("\\script\\task\\system\\task_string.lua");
function main()
	wannianjia_main();
end


function wannianjia_main()
	local nDateH = tonumber(GetLocalDate("%Y%m%d%H"));
	local tbSay = 
	{
		"<dec><npc>武林传奇已到了第三岁，祝国泰民安，家家幸福，人人温饱。大侠是否需要什么呢？",
	}
	if pingzi0805:IsActTime() then
		tinsert(tbSay, "我想进行合成字/#pingzi0805:main()");
	end
	if (nDateH >= hero_nDate_S and nDateH <= hero_nDate_E) then
		tinsert(tbSay, "我想参加少年英雄活动/#here_main()");
	end
	tinsert(tbSay, "了解换取奖励方法/wannianjia_Detailed");
	tinsert(tbSay, "我稍候再来/OnCancel");
	CreateTaskSay(tbSay);
end
--了解兑换奖励
function wannianjia_Detailed(nStep)
	local tbSay = 
	{
		"<dec><npc>有两个大活动，大侠想了解哪个活动？",
		"了解合成字活动#pingzi0805:Detailed()",
		"了解少年英雄活动/#hero_intruduction()",
		"返回/wannianjia_main"
	}
	
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end