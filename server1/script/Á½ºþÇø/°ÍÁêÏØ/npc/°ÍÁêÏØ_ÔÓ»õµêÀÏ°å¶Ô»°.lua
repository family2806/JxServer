--两湖区 巴陵县 杂货店老板对话　天王40级任务
-- Update: Dan_Deng(2003-08-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main(sel)
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local tbDailog = DailogClass:new(szNpcName)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = "<npc>杂货铺老板：我以前是做货郎担的，积攒了一点本钱之后，就在此地安定下来，开了这间小小的杂货店。"
	if (GetTask(3) == 40*256+50) and (GetTask(14) == 5) and (HaveItem(148) == 0) then 		--天王帮40级任务
		tbDailog:AddOptEntry("有莲子卖吗?", lotus)
	end
	tbDailog:AddOptEntry("交易", yes)
	tbDailog:AddOptEntry("不交易", no)
	tbDailog:AddOptEntry("我是来做教育任务", zboss);
                 tbDailog:Show()
end

function lotus()
Say("杂货店老板：莲子可是咱们这里的特产啊，当然有啦，只要十两银子。", 2, "买/yes1", "不买/no");
end;

function yes1()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(148)
		Msg2Player("买到莲子")
--		SetTask(14, 3)	
		AddNote("在巴陵县杂货店买到莲子 ")
	else
	Say("杂货店老板：等存够了银子再来买吧，先看看其它的东西。", 2, "交易/yes", "不交易/no")		
	end
end;

function yes()
Sale(38);  			
end;

function no()
end;
