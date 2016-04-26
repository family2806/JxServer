--龙门镇 路人 乞丐 新手任务：捎口信
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world26 = GetTask(26)
	if (UTask_world26 == 0) and (GetLevel() >= 2) then		-- 任务启动
		if (GetSex() == 0) then
			Talk(4,"W26_get","这位大侠，请帮我个忙. ","怎么了?","你可以帮我给镇上的眉儿姑娘捎个口信吗? ","什么话")
		else
			Talk(4,"W26_get","这位大侠，请帮我个忙. ","怎么了?","你可以帮我给镇上的眉儿姑娘捎个口信吗? ","什么话")
		end
	elseif (UTask_world26 == 6) then
		Talk(1,"W26_prise","最后你告诉我说出来让赵眉儿痛苦绝望有什么意义。真可怜!")
	elseif (UTask_world26 >= 10) then
		Talk(1,"","月早不亮，疼到心肝！谁说春天美，只见花凋零。到这个地步还有什么脸见人呢!")
	else				-- 非任务对话
		Talk(1,"","什么？施舍我啊？走走！我不要钱，不要觉得我是乞丐.")
	end
end;

function W26_get()
	Say("告诉她肖已影已经死了，还有不要说是我说的!",2,"帮忙 /W26_get_yes","不帮忙 /W26_get_no")
end

function W26_get_yes()
	Talk(1,"","不知道你说什么！但我也是要去一趟的!")
	SetTask(26,3)
	AddNote("接下来的任务：帮乞丐捎口信给赵眉儿")
	Msg2Player("接下来的任务：帮乞丐捎口信给赵眉儿")
end

function W26_get_no()
	Talk(2,"","真是奇怪的请求！你不说清楚我不帮.","这样的话我找别人帮忙好了!")
end

function W26_prise()
	Talk(1,"",":一言难尽，这是一点意思，请收下!")
	SetTask(26,10)
	AddNote("把赵眉儿的反应告诉丐帮，完成任务")
	Msg2Player("把赵眉儿的反应告诉丐帮，完成任务")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
	if(GetSex() == 0) then
		AddItem(0, 8, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("得到一个鱼皮护腕. ")
	else
		AddItem(0, 8, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("得到一个青铜玉镯. ")
	end
	AddRepute(5)
	Msg2Player("你的名望增加5点")
end
