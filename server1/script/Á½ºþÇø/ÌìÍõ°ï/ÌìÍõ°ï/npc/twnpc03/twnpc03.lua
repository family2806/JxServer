--description: 天王帮右使杨湖　天王20级任务
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)
-- by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tw = GetTask(3)
	Uworld121 = GetTask(121)
--	if (UTask_tw == 70*256) and (Uworld121 == 245) then		-- 白名做完90级任务后又入了天王的，直接给技能
--		Talk(1,"","杨湖：小兄弟果然英雄出众，这里有天王秘笈一部，在你手中定能发扬光大。")
--  	AddMagic("破天斩")
--		AddMagic("追风诀")
--		AddMagic("追星逐月")
--   	Msg2Player("获得天王技能破天斩、追风诀、追星逐月")
--   	SetTask(121,255)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 20*256+50) and (HaveItem(92) == 1 ) then	-- 只检测道具，若道具丢失只要重打最后一个土匪就可重新打出。
			L20_prise()
		elseif (UTask_tw == 20*256) and (GetLevel() >= 20) then
			Say("探子回报：今日在<color=Red>武陵山<color>出现一群<color=Red>土匪<color>,冒充天王帮的名头打家劫舍，百姓怨声载道，你愿意去一探土匪的巢穴，并消灭他们吗?", 2, "属下会尽力的/L20_get_yes", "弟子武功低微，恐难担此重任/L20_get_no")
		elseif (UTask_tw < 20*256) then								--尚未接20级任务
			Talk(1,"","我们天王帮名声大噪，因此常有一些小人假冒本帮弟子做坏事")
		elseif (UTask_tw > 20*256) and (UTask_tw < 20*256+80) then					--已经接到20级任务，尚未完成
			Talk(1,"","那群土匪常出现在<color=Red>白水洞<color>在<color=Red>武陵山东边<color>.")
		else					--已经完成20级任务，尚未出师（缺省对话）
			Talk(1,"","我们天王帮和老百姓唇齿相依，你要记住绝对不能用武功压迫老百姓，记住了吗?")
		end
	elseif (Uworld121 == 20) and (HaveItem(10) == 1) then
		Talk(7,"Uworld121_yanghu","杨右使","阁下好像有什么难言之隐，是不是发生什么事了?","啊... 这里有蔷薇仙子的一撮头发!","啊？暮雪?她怎么样了？","放心！夏姑娘只是有点憔悴!","知道了!","仙子要我传话给你: 如果7月之前你不到翠烟见她，今后你们两人将再也见不到了")
	elseif(Uworld121 == 50 ) then
		Talk(8,"Uworld121_yanghu2","怎么了? ","诶。蔷薇仙子一定不会回心转意的","杨湖... ","她告诉我去找邱英，他已经让墙尽告诉我了昆仑派的计划","暮雪，她果然为了我去求邱英这个小人，我服了他了。","真没有什么可以填补那个空吗","不要说今天唱歌开心，今天我喝的也很尽兴，喝到微醺。青丝和白发是50年的事情了，事情易如反掌. ","玩家:. ")
	else
		Talk(1,"","人心在江湖，只有怀大志，不管在哪里也要保持自身的青天白日，如果你心里还想着什么污秽的事情的话不管到哪里都会被人背叛!")
	end
end;

function L20_get_yes()
	Talk(1,"","那群土匪常出现在<color=Red>白水洞<color>在<color=Red>ph武陵山东边<color>.")
	SetTask(3, 20*256+50)
	AddNote("到天王帮东天殿入口(218, 198) , 接<color=red>白水洞任务<color>, 到武陵山白水洞消灭土匪")
	Msg2Player("在天王帮东天殿的入口处见杨湖接任务去武陵山白水洞消灭土匪")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","你单枪匹马冲进土匪的巢穴为民除害，做的真好！本座看你的资质只要练习一阵子一定会成为闻名天下的人物！")
	DelItem(92)
	SetRank(45)
	SetTask(3, 30*256)
--	AddMagic(33)
	add_tw(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你！完成了白水洞任务被封为守寨悍将，学到武功天王帮的静心诀")
	AddNote("回到天王岛带着锦旗交给杨湖完成白水洞任务，被封为守寨悍将")
end;

function Uworld121_yanghu()
	Talk(6,"","暮雪！你何必这样呢？","何仙子是人间难找的仙女! 杨右使！你就好好拿着吧，过去的错就忘记吧","如果生在太平时代，我要这个天王右使的虚名干吗呢?只要和你平安地活在洞庭湖。但是现在世道不太平，我怎么呢个不管帮会里的兄弟呢？",".....啊","听说今日昆仑派有意图进军南方. 在洞庭湖发现了昆仑派弟子的踪迹，怕的是之前他们图谋残害我们天王帮，本帮的在危及存亡之际，我怎么能置身事外，事已至此我必须要一五一十地和她说清楚","也只有这个方法了!")
	SetTask(121,30) --设置任务变量30
	DelItem(10)
	Msg2Player("昆仑派企图进攻我天帮，杨湖不能离开")
	AddNote("杨湖没有脸见何暮雪，你去劝劝她吧")
end

function Uworld121_yanghu2()
   if(GetTask(3) >= 70*256) and (GetTask(3) ~= 75*256) then			-- 是天王弟子或出师弟子
		Talk(2,"","辛苦你了，告诉在下知道昆仑派的侵略计划！这里有天王秘籍！请拿着!","我一定加强联系武艺，同杨右使一起保卫宋朝江山")
		if (HaveMagic(322) == -1) then		-- 必须没有技能的才给技能
			AddMagic(322,1)
		end
		if (HaveMagic(323) == -1) then		-- 必须没有技能的才给技能
			AddMagic(323,1)
		end
		if (HaveMagic(325) == -1) then		-- 必须没有技能的才给技能
			AddMagic(325,1)
   	end
   	Msg2Player("学到天王帮技法破天斩，追星逐月，追风诀")
   	SetTask(121,255)
	else
		SetTask(121,245)
	end
	add_repute = ReturnRepute(30,95,4)			-- 声望奖励：最大30点，从100级起每级递减4%
	AddRepute(add_repute)
	Msg2Player("任务完成，你的名望点增加"..add_repute.."点.")
	AddNote("悲恋暮雪任务：告诉杨湖昆仑侵略计划但是依旧没有办法修复何暮雪和杨湖的关系，任务完成. ")
end
