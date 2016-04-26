--龙门镇 路人 上官秋 新手任务：介绍工作
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world25 = GetTask(25)
	if (UTask_world25 == 0) then		-- 任务启动
		Talk(2,"W25_get","为躲避战乱，在下从中原到这。但是不知道现在该去向何方!","你可以找个工作，再慢慢想以后的事情!")
	elseif (UTask_world25 == 6) then
		Talk(1,"W25_prise","旅馆老板同意让你去帮忙!")
	else				-- 非任务对话
		Talk(1,"","诶！中原的战争真的是太惨烈了，我被抓去打战已经两年了，实在是受不了了才逃走，希望可以在这个小镇平安的过一世！")
	end
end;

function W25_get()
	Say("在下对这一带一点都不知道，也不知道哪里容得下我!",2,"帮他想办法! /W25_get_yes","鼓励他! /W25_get_no")
end

function W25_get_yes()
	Talk(1,"","等我帮你问问有没有合适的工作!")
	SetTask(25,3)
	AddNote("接受任务给上官秋介绍工作")
	Msg2Player("接受任务给上官秋介绍工作")
end

function W25_get_no()
	Talk(1,"","这样我就帮不了你了。但是你要相信天无绝人之路。打起精神来。会有办法的!")
end

function W25_prise()
	Talk(1,"","我真不知道怎么感谢你才好，这是我逃走路上防身的东西，希望你可以用的上")
	SetTask(25,10)
	AddRepute(3)
	AddNote("告诉上官秋找到工作了，完成任务")
	Msg2Player("告诉上官秋找到工作了，完成任务")
	i = random(0,8)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 1, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("得到一把兵器")
	Msg2Player("你的名望增加3点")
end
