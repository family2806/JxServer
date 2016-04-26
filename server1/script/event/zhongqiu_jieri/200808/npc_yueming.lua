Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\longzhu\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	zhongqiu0808_npc_main()
end
function zhongqiu0808_npc_main()
	if zhongqiu0808_IsActDate() ~= 1 then
		return Say("活动已结束.", 0)
	end
	local tbSay = 
	{
		"<dec><npc>中秋活动从05-09-2008 到 05-10-2008 24:00时举行 ,包括6大活动，想了解哪个活动?",
		"赏月中秋饼活动/zhongqiu0808_hecheng_dialog",
		"龙州-凤羽活动/zhongqiu0808_longzhuhecheng_dialog",
		"五彩灯笼活动/#zhongqiu0808_ActContent(1)",
		"北斗老人活动/#zhongqiu0808_ActContent(4)",
		"战功勋章活动/#zhongqiu0808_ActContent(3)",
		"委托收集活动/#zhongqiu0808_ActContent(2)",
		"在下只是顺便路过!/OnCancel",
	}
	CreateTaskSay(tbSay);
end



function zhongqiu0808_ActContent(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>五彩灯笼活动从05-09-2008 到05-10-2008 24点举行. 具体时间为：每周从周一到周四19:00 - 19:59, 21:30 - 22:29; 周五、周六和周日为：11:00 - 11:59, 19:00 - 19:59, 21:30 - 22:29. 活动开始后，五彩灯笼将会在所用版图出现，玩家可以用红蜡烛(可以在NPC小贩处购买) 来点灯笼(需要根据东西南北的次序来点)才能获得奖励.",
			"结束对话/OnCancel"
		}
		
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>从05-09-2008 到05-10-2008 24时, 玩家以白驹丸在线委托将获得仙羽盒",
			"结束对话/OnCancel"
		}
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>在活动时间从05-09-2008 到05-10-2008 24时, 在争夺金方大将称号或者宋方大将称号的战场的头20人将获得战功勋章。此外，玩家可以到宋方或者金方NPC军需官那里使用2000积分换取一个功状令牌。使用战功勋章和功状令牌将获得经验值和有价值的物品。",
			"结束对话/OnCancel"
		}
		
	elseif nStep == 4 then
		tbSay = 
		{
			"<dec><npc>在活动时间内，(05-09-2008 到05-10-2008 24时), 在每周周五、周六、周日将举行北斗老人活动.",
			"结束对话/OnCancel"
		}
	end
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end
