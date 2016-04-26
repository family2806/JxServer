-- 五毒 路人NPC 毒仙子白莹莹 20级任务
-- by：Dan_Deng(2003-08-05)

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>就是有一些蠢货不知死活，难道向本仙子这么年轻漂亮也有错吗?"
	G_TASK:OnMessage("五毒", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("我来找你有别的事情", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld50 = GetTask(50)
	if (Uworld50 == 20) then			-- 点醒徐中原任务
		Talk(6,"Uworld50_20","白姑娘! 自古正邪不两立,徐大岳希望姑娘可以离开徐中原","离开他的话我活着还有什么意义?为了和他能够长相厮守我已经改了很多了，为什么你们都看不到呢？","你真要违抗令尊的决定吗?","我只想早日和中原大哥成亲，之后便退出江湖专心照顾老公孩子，不再过问乱世之事，这样有什么罪呢?","真是这样吗？","苍天在上，如小女有半句虚言就天打雷劈而死，小女毫无怨言")
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 20*256+10) then
			i = GetItemCount(85)				-- 人头
			if (i >= 7) then
				Talk(1,"L20_prise","仙子，属下已经把罗霄七鬼的脑袋给你送来了")
			else
				Talk(1,"","你不是去罗霄山了怎么还有脸在这?")
			end
		elseif ((UTask_wu == 20*256) and (GetLevel() >= 20)) then		--20级任务
			Talk(4,"L20_get","喂，新来的！懂不懂规矩啊。这么久了，怎么还没有交上“人头状”来呀","什么人头状？","就是与本教为敌的人的脑袋 ","属下愚钝，还请仙子多加指点")
		else							-- 常规对话
			Skill150Dialog("就是有一些蠢货不知死活，难道向本仙子这么年轻漂亮也有错吗?")
		end
	else
		Skill150Dialog("那些男人不请自来，对他们好一点就一个二个的自己为我卖命.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("白莹莹", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L20_get()
	Say("罗霄七鬼一直垂涎本仙子的美色，真是癞蛤蟆想吃天鹅肉！你上一趟罗霄山，把他们给我杀了",2,"是！属下这就去取他们人头. /L20_get_yes","属下武功太差，恐怕. /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "那我就在这儿等你的好消息罗")
	SetTask(10,20*256+10)
	AddNote("为白莹莹到罗霄山杀罗宵七鬼")
	Msg2Player("为白莹莹到罗霄山杀罗宵七鬼")
end;

function L20_get_no()
	Talk(1,"","我就知道你是个胆小鬼，真没用!")
end;

function L20_prise()
	Talk(1,"","咯咯咯咯，真好玩，你很有本事嘛，好，本仙子作保，升你为催命使者")
	i = GetItemCount(85)				-- 人头
	for j = 1,i do DelItem(85) end
	SetTask(10,30*256)
	SetRank(51)
--	AddMagic(70)
--	AddMagic(66)
	add_wu(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你获得催命使者的称号，学的武功赤炎蚀天，杂难药经")
	AddNote("为白莹莹去杀罗宵七鬼，被封为：催命使者")
end;

function Uworld50_20()
	SetTask(50,30)
	Msg2Player("听了白莹莹的话你很感动也伤心，但是不知道怎么办")
end
