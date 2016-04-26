--江南区\临安\临安\npc\路人_张小泉.lua 
--by xiaoyang (2004\4\20)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld121 = GetTask(121)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld121 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld38 == 127) and (GetFaction() ~= "tianwang") then
		Talk(3,"Uworld121_get","各位朋友好!","在下早已久仰张家的做剪刀技术﹗, 今日一见，果然名不虚传","不知阁下可否帮我一事呢?","说吧!")
	elseif (Uworld121 == 10) and (HaveItem(373) == 0) then
		Talk(1,"","我也很佩服阁下! 剪刀还没拿就这么急着走! 见神仙也不用这么急吧!")
		AddEventItem(373)
		Msg2Player("接过张小泉的剪刀 ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","我家3代都打剪刀，原来在这一带也是小有名气的。我父亲希望我传承手艺，之后将会再开一家见到点，但我不同 ")
		else
			Talk(1,"","张小泉：我家三代都是打制剪刀的，在临安城也有点名气，爹一直想让我子承父业，将来也做一个剪刀匠，可我不愿意。")
		end
	end
end

function Uworld121_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","不行! 我干不了这个事")
	else
		Say("者有一把精炼的剪刀，希望阁下可以转交给翠烟门的何暮雪使者",2,"S早就耳闻何仙子. 这可真是相见的好机会啊/Uworld121_getjd","但是我干嘛要去那么远？再说我和你又不熟！不好意思，我看我帮不了你! /Uworld121_no") --任务启动
	end
end

function Uworld121_getjd()
	AddEventItem(373)
	Msg2Player("拿到张小泉的剪刀")
	AddNote("拿到剪刀后直接向翠烟门的方向走去")
	SetTask(121,10) --设置任务变量为10
end

function Uworld121_no()
end
