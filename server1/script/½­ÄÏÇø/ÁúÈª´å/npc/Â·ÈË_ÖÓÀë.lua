--龙泉村 路人 钟离
--龙泉村新手任务：阳春白雪羹
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world20 = GetTask(20)
	if (UTask_world20 == 0) and (GetLevel() >= 5) then 		--任务启动
		Talk(2,"W20_get","天下还没有我不会做的食物. 但是有一个叫阳春白雪羹的一直做不好","怎么会这样?")
	elseif (UTask_world20 == 5) then
		if (HaveItem(231) == 1) and (HaveItem(232) == 1) then		-- 任务完成
			SetTask(20,10)
			DelItem(231)
			DelItem(232)
			Talk(1,"","阳春灵芝! 白雪百合. 真好! 不知该怎么感谢你. 这是一点心意，请收下")
			AddNote("带阳春灵芝和白雪百合交给钟离，完成任务")
			Msg2Player("带阳春灵芝和白雪百合交给钟离，完成任务")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("得到一块玉佩")
			else
				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("得到一个黑色麝香包")
			end
			AddRepute(8)
			Msg2Player("你的名望增加8点")
		else
			Talk(1,"","什么？那两件东西你都找回来了啊?")
		end
	elseif (UTask_world20 == 10) then		-- 任务已经完成
		Talk(1,"","真感谢你")
	else
		Talk(1,"","走遍天下，吃遍天下。我毕生心血就是吃尽天下美食")
	end
end;

function W20_get()
	Say("这道菜要有阳春灵芝和白雪百合,听说只有龙泉村才有这两样. 我找了很久都还没有找到",2,"帮助他/W20_get_yes","没带来/W20_get_no")
end

function W20_get_yes()
	SetTask(20,5)
	Talk(1,"","我来帮你找!")
	AddNote("接任务帮助钟离找阳春灵芝和白雪百合")
	Msg2Player("接任务帮助钟离找阳春灵芝和白雪百合")
end

function W20_get_no()
end
