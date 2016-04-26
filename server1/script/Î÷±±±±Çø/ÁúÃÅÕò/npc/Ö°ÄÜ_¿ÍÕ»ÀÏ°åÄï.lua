--龙门镇 路人 客栈老板娘 新手任务：介绍工作
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world25 = GetTask(25)
	UTask_world27 = GetTask(27)
	if (UTask_world25 == 3) then		-- 任务“介绍工作”进行中
		Talk(5,"W25_step","老板，要人手帮忙吗?","帮忙？现在还差一个打扫的小二","有人想来可以吗?","要看看!","从中原到这，混口饭吃不容易啊")
	elseif (UTask_world27 == 0) and (GetLevel() >= 5) then
		Say("去！给我找3块野猪肉待客!",2,"知道了/W27_get_yes","烦死了，找别人去! /W27_get_no")
	elseif (UTask_world27 == 5) then
		i = GetItemCount(228)
		if (i >= 3) then
			for j = 1,i do DelItem(228) end
			Talk(1,"","哦！动作很快嘛！给！这顶帽子我也用不到！送给你了!")
			SetTask(27,10)
			AddRepute(9)
			AddNote("把野猪肉带去交给老板，完成任务")
			Msg2Player("把野猪肉带去交给老板，完成任务")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 7, 6, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("得到一块手绢")
			else
				AddItem(0, 7, 10, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("会得到一块圆形铁")
			end
			Msg2Player("你的声望增加9点")
		else
			Talk(1,"","干嘛站在这里？看你那样，还不快走!")
		end
	elseif (UTask_world25 == 6) then
		Talk(1,"","啊！你说那个人叫什么上官秋，叫他来。我这里还确认!")
	else				-- 非任务对话
		Talk(1,"","哇哇！客官不住店啊？方圆百里还没有哪家可以比得上我这龙门镇呢，不信你可以去问问!")
	end
end;

function W25_step()
	Talk(1,"","好了，赶快去叫医生过来帮我!")
	SetTask(25,6)
	AddNote("老板答应让上官秋来帮忙了！快把这个好消息告诉他！! ")
	Msg2Player("老板答应让上官秋来帮忙了！快把这个好消息告诉他！! ")
end

function W27_get_yes()
	SetTask(27,5)
	AddNote("接任务！到树林里拿到3块野猪肉回来交给老板 ")
	Msg2Player("接任务！到树林里拿到3块野猪肉回来交给老板 ")
end

function W27_get_no()
end
