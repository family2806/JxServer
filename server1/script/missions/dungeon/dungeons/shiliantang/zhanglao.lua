Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")

function main()	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>大侠真是游离，你有试炼卡在身，在江湖上肯定是一位豪杰。一会儿后试炼堂将打开，在等待之余，我给你解释一下试炼堂的一些规定。"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	
	tbDailog:AddOptEntry("请长老指教.",readRule);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() ~= 1) then
		tbDailog:AddOptEntry("我想换一次召唤弓箭手的机会",buyChance);
	end

	tbDailog:AddOptEntry("来领取召唤符",getCallItem);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() == 1) then
		tbDailog:AddOptEntry("跳过准备步骤",skipPrepareTime);
	end
	
	tbDailog:AddOptEntry("看此轮成绩",queryKillCount);
	tbDailog:AddOptEntry("看获得多少勋章",queryMedalCount);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() == 1) then
		tbDailog:AddOptEntry("我来领奖",getAward);
	end

	tbDailog:AddOptEntry("我想离开试炼堂",leave);
	
	--弹出对话框
	tbDailog:Show()
end

function buyChance()
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:BuyChance();
	end
end

function getAward()
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:GetAward();
	end
end

function leave()
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	if (tbDungeon ~= nil) then
		tbDungeonManager:LeaveDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end

function getCallItem()
	if (CalcEquiproomItemCount(6,1,2315,-1) >= 1) then
		Talk(1,"","你已有召唤符了.");
		return
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") == 1) then
		PlayerFunLib:GetItem("return {tbProp={6,1,2315,1,0,0},}",1,"领取试炼堂召唤符")
	end
end

function skipPrepareTime()
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:SkipPrepare();
	end
end

function queryMedalCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("目前阁下有 <color=green>%d<color> 试炼堂勋章.", tbDungeon:GetMedal()));
	end
end

function queryKillCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("你已打退了<color=green>%d<color> 刺客", tbDungeon:GetKillCount()));
	end
end

function readRule()
	local szTitle =  "<npc>大侠可以先看看本唐的光景，一会儿后将出现一批刺客。你的工作就是调兵来防守。本唐有10个隐蔽机关，阁下只需要走近召唤弓箭手的地方寻求帮助就行，每次打开一个机关需要100点精炼石值和5个试炼勋章。你还可以调到其他位置来发挥作用，每次调动花费2个勋章。几乎每个来的刺客都有试炼勋章，打败他们有机会获得。100名刺客出现后，打败的越多，奖励越丰厚，老夫也将准备更加丰厚的奖励。 <enter>打败1-49个刺客获得木质宝盒<enter>打败50-69个刺客，获得铜质宝盒<enter>打败70-89个刺客，获得银质宝盒<enter>打败90-99个刺客获得黄金宝盒<enter>打败100个以上刺客可以获得玄铁宝盒<enter>关于宝盒里有什么，就要看你的运气了?."
	local tbOpt = {}
	tinsert(tbOpt, {"多谢长老指教."})
	CreateNewSayEx(szTitle, tbOpt);
end


function OnExit()

end;
