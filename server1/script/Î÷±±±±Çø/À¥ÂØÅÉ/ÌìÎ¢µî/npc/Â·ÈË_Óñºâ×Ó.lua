-- 昆仑 弟子 玉衡子 50级任务
-- by：Dan_Deng(2003-07-31)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (HaveItem(10) == 1)) then		--50级任务完成
			L50_prise()
		elseif ((UTask_kl == 50*256) and (GetLevel() >= 50)) then		--50级任务
			Say("昆仑后山有一个洞穴，里面有怪人，这个怪人口口声声说要铲平昆仑，结果被掌门打败，关在洞里。本派有一个规定，要升为50级弟子必须去打败他，拿到他的一撮头发证明",2,"让弟子去试试看/L50_get_yes","弟子武艺不精，恐怕不能打赢 /L50_get_no")
		else
			Talk(1,"","你要发挥你的长处，随机应变!")
		end
	else
		Talk(1,"","我最看重的是友情，仁慈的人最无敌。哈哈哈!")
	end
end;

function L50_get_yes()
	Talk(1,"","有志气，那我就给你这个机会!")
	SetTask(9,50*256+64)
	AddNote("接昆仑派50级任务：打败冰雪怪人，同时拿到他的一撮头发证明. ")
	Msg2Player("接昆仑派50级任务：打败冰雪怪人，同时拿到他的一撮头发证明. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(2,"","护法！弟子幸运没有丧命!","好了！你可以晋升为授符天将。要记住，只要对我效忠不会少了你的好处的。")
	DelItem(10)
	SetTask(9,60*256)
	SetRank(24)
--	AddMagic(176)
--	AddMagic(90)
	add_kl(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你成为授符天将，学会狂风骤电、迷踪幻影！")
	AddNote("拿到冰雪怪人的头发，完成昆仑派50级任务。被封为授符天将. ")
end;
