--龙泉村 路人 彭放
--龙泉村新手任务：修刀
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world19 = GetTask(19)
	if (UTask_world19 == 0) and (GetLevel() >= 2) then 		--修刀任务启动
		if (GetSex() == 0) then
			W19_rank = "后生"
		else
			W19_rank = "姑娘"
		end
		Talk(2,"W19_get","彭放:"..W19_rank.."可以帮助在下吗?","帮什么吗? ")
	elseif (UTask_world19 == 2) and (HaveItem(229) == 0) then
		AddEventItem(229)
		Talk(1,"", 10903)
	elseif (UTask_world19 == 8) and HaveItem(230) then		-- 任务完成
		Talk(1,"", 10904)
		DelItem(230)
		SetTask(19,10)
		AddNote("把修好的宝刀给彭放, 完成任务")
		Msg2Player("把修好的宝刀给彭放, 完成任务")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0, 8, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("得到鱼皮护腕")
		else
			AddItem(0, 8, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("得到鱼皮护腕")
		end
		AddRepute(6)
		Msg2Player("你的名望增加了6点")
	else
		Talk(1,"", 10905)
	end
end;

function W19_get()
	Say(10906 ,2,"帮助他! /W19_get_yes","不要犹豫/W19_get_no")
end

function W19_get_yes()
	SetTask(19,2)
	AddEventItem(229)
	Talk(1,"", 10907)
	AddNote("接受任务：帮助彭放带刀去修")
	Msg2Player("接受任务：帮助彭放带刀去修")
end

function W19_get_no()
end
