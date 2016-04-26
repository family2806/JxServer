-- 五毒 路人NPC 金蛇寨主云不邪 40级任务
-- by：Dan_Deng(2003-08-05)
-- update by: xiaoyang(2004\4\13) 加入90级门派任务

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
	tbDailog.szTitleMsg = "<npc>我们五毒教有无数种毒药，有一些毒药是用几百种毒物练成了，这种密练的毒只要碰到一点点就会不漏痕迹的死去"
	G_TASK:OnMessage("五毒", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("我来找你有别的事情", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld124 = GetTask(124)
	if(GetSeries() == 1) and (GetFaction() == "wudu") then
		if((UTask_wu == 40*256+10) and (HaveItem(143) == 1)) then		-- 任务进行中
			L40_prise()
		elseif((UTask_wu == 40*256) and (GetLevel() >= 40)) then		--40级任务
			Say("你到金蛇血潭去给我捉一条眼镜王蟒蛇来，我要吸它的血来增强功力 ",2,"Tu﹏ l謓h!/L40_get_yes","属下还有一事. /L40_get_no")
		else							-- 常规对话
			Skill150Dialog("这是一个强者生存的世界，要想继续活就赶快练功去!")
		end
	elseif (Uworld124 == 10) then
		Talk(9,"Uworld_envelop","云不邪","谁!真是个帅哥! 找小云有什么事吗?","快把阴阳笑的解药拿出来!","原来是想做英雄的人啊!好吧! 只要你在这陪我就什么都可以"," 呸！你是个阴险毒恶的人竎, 要是不把解药拿出来,那别人就连你的尸体都认不出来了!","哼！你真是不知好歹！好了，我这有一封信，你帮我带到唐门交给绝春叟唐野，之后你就会得到你想要的. ","我凭什么信你?","老子在江湖上也是有臭名的。你可以去问问看，我还是知道信字怎么写的","暂时相信他")
	elseif (Uworld124 == 20 ) and (HaveItem(385) == 0) then
      Talk(1,"","朋友!别急! 我的信还没有带,你用什么去见唐野")
      AddEventItem(385)
      Msg2Player("接过云不邪的信")
	elseif (Uworld124 == 30) and (HaveItem(386) == 1) then
		DelItem(386)
		SetTask(124,35)
      Talk(5,"Uworld124_jump","什么?","被他发现了其中有毒!","这怎么可能！我下毒十分小心，他怎么会发现呢!","啊!...在这封信上还有另一种奇毒!","云不邪！害人终有被害时！你活不过今天了!")        
	elseif (Uworld124 == 35) then
		Talk(1,"Uworld124_jump","过来!来和小云一起玩!")
	elseif (Uworld124 == 40) and (HaveItem(387) == 0) then
		SetTask(124,35)
		Talk(2,"Uworld124_jump","云老贼!快把另一种解药拿出来!","呸！我一时疏忽才中了你的计！不要妄想！看这! ")
	elseif (Uworld124 >= 40) then			-- 任务完成
		Talk(1,"","你真是狠毒! ")
	else
		Skill150Dialog("我们五毒教有无数种毒药，有一些毒药是用几百种毒物练成了，这种密练的毒只要碰到一点点就会不漏痕迹的死去")
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
	G_TASK:OnMessage("云不邪", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function L40_get_yes()
	Talk(1,"","很好，记得先找一块麝香，不然你制不住它")
	SetTask(10,40*256+10)
	AddNote("进入金蛇血潭给云不邪捉眼镜王蟒蛇")
	Msg2Player("进入金蛇血潭给云不邪捉眼镜王蟒蛇")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","你可是少数几个进入金蛇血潭后能活着出来的人，看来还有点本事")
	SetTask(10,50*256)
	DelItem(143)
	SetRank(53)
--	AddMagic(356)
--	AddMagic(73)
	add_wu(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你!: 晋升为: 无恸罗刹! 学得武功：天罡地煞手、穿心毒刺、万蛊蚀心 ")
	AddNote("进入金蛇血潭捉眼镜王蟒蛇，可以晋升为无恸罗刹")
end;

function Uworld_envelop()
	AddEventItem(385)
	SetTask(124,20)
	Msg2Player("接受云不邪的书信")
	AddNote("接受云不邪的书信，去找唐野")
end

function Uworld124_jump()
	SetFightState(1)
	NewWorld(234,1616,3195)
end
