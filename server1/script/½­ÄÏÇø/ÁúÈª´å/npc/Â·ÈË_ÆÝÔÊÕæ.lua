-- 龙泉村　路人　戚允真
-- by：Dan_Deng(2003-09-16)
-- 五毒教90级任务
-- update by xiaoyang(2004\4\13)

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	Uworld124 = GetTask(124)
	Uworld37 = GetByte(GetTask(37),2)
	if(Uworld124 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld37 == 127) and (GetFaction() ~= "wudu") then
		Talk(6,"Uworld_wuget","在龙泉见到戚允真,你见到戚允真发现他面貌奇怪. 看到这个人脸上肌肉怪异的扭曲着，仿佛憋出来的冷笑僵硬的挂在脸上。","这位大哥!遇到什么不开心的事情了吗?","呵呵！朋友快去吧！呵呵！","我见你面色发青,全身抽搐,是中毒了吗?","已经被你认出来了我也不隐瞒了。我中了阴阳笑的阴狠毒药,现在每隔3小时就发作一次，笑到全身发僵，男女不分，样子怪异，畜物都不敢靠近。笑到全身干枯，生不如死","是谁用这种奇毒害你?")
	elseif(Uworld124 == 40) and (HaveItem(387) == 1) then
		Talk(5,"Uworld_wufinish","威兄解药在这，赶快服下!","哇! 舒服多了!多谢大侠救命.威某做牛做马也无法报答! ","惩奸除恶是行侠江湖的人的本分。不必留心！","现在人心叵测. 像兄台这样有侠义的人更是少见. 不瞒你说, 我正是五毒教弟子, 恶人的帮凶. 最后被云老把我变成了试毒工具. 人生百苦已经尝尽了。","浪子回头金不换，希望你以后可以用慈悲心肠对待世人","大侠放心！经过这件事，我再也不会有害人之心了")
	elseif(Uworld124 > 10) and (Uworld124 < 40) then
		Talk(1,"","呵呵")
	else
		Talk(1,"","你听过山河社稷图吗？真有这个地图吗？如果有它在手那么荣华富贵将会享不尽")
	end
end

function Uworld_wuget()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","呵呵. 看样子去也不能你了，说出这件事有什么好处，算了。呵呵。")
	else
		Say("五毒教, 云不邪",2,"你等下, 我要让你知道什么是正道/Uworld_wduok","云不邪医一生用毒，我不想置你于死地，你好自为之/Uworld_wduno")
	end
end

function Uworld_wduok()
	SetTask(124,10)
	Msg2Player("答应戚允真，去找云不邪拿阴阳笑的解药")
	AddNote("答应戚允真，去找云不邪拿阴阳笑的解药")
end

function Uworld_wduno()
end

function Uworld_wufinish()
	DelItem(387)
	if (GetTask(10) >= 70*256) and (GetTask(10) ~= 75*256) then				-- 是五毒出师的，可以学到技能
		Talk(2,"","这里有一卷五毒教的秘药经，送给大侠，告辞","这样你也就不必客气！我研究一下这卷秘经，看能否解救天下")
		if (HaveMagic(353) == -1) then		-- 必须没有技能的才给技能
			AddMagic(353,1)
		end
		if (HaveMagic(355) == -1) then		-- 必须没有技能的才给技能
			AddMagic(355,1)
		end
		if (HaveMagic(390) == -1) then		-- 必须没有技能的才给技能
			AddMagic(390)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("学到技能:阴阳蚀骨,玄阴斩,断筋腐骨")
		SetTask(124,255)
	else
		SetTask(124,245)								--获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("给戚允真带来解药，完成任务，名望增加"..add_repute.."点.")
   AddNote("给戚允真带来解药，完成任务")
end
