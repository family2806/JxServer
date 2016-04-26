--石鼓镇 路人 阿玛&阿全 新手任务：还钱
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 0) and (GetLevel() >= 3) then		-- 任务启动
		Talk(3,"W23_get","阿全，你不要去，这个身体，去哪里啊?","阿玛不要拦我，如果我不去摘蘑菇，哪里有钱？沈爷不会放过我们的!","发生什么事了?")
	elseif (UTask_world23 == 6) then
		Talk(2,"W23_prise","我已经帮你们还钱了!","真是感谢大侠!")
	else				-- 非任务对话
		if (random(0,1) == 0) then
			Talk(1,"","看到旁边的阿娟又漂亮又懂事，我也想有一个孩纸，但是，我们这么穷，又欠人家债，怎么有钱来养呢.")
		else
			Talk(1,"","之前我的身体很好，因为有一次去摘菱角，掉下水，从此之后，病就没有治好过")
		end
	end
end;

function W23_get()
	Say("哎，我们欠村里沈爷的钱，但是阿全生病很久了，没有钱还。沈爷说把我们的房子卖了或者抵押了还钱.",2,"不用急，让我来帮你. /W23_get_yes","既然欠债，大家要更加努力. /W23_get_no")
end;

function W23_get_yes()
	SetTask(23,3)
	Talk(1,"","放心，交给我吧，你们在这等我的消息.")
	AddNote("接任务帮助阿玛阿全解决困难，让沈爷放弃债务 ")
	Msg2Player("接任务帮助阿玛阿全解决困难，让沈爷放弃债务 ")
end

function W23_get_no()
end

function W23_prise()
	Talk(1,"","这个是我亲手缝制的衣服，你收下吧!")
	SetTask(23,10)
	AddNote("和阿玛阿全说已还清债务，完成任务. ")
	Msg2Player("和阿玛阿全说已还清债务，完成任务. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("接受衣服 ")
	else
		AddItem(0, 2, 10, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("接受锦衫")
	end
	AddRepute(7)
	Msg2Player("你的名望增加7点. ")
end;
