--西南北区 江津村 路人3虎子对话
--江津村新手任务：虎子的弹弓
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	if ((UTask_world45 == 0) and (GetLevel() >= 5)) then		-- 任务启动，需要5级以上
		if(GetSex() == 0)then
	Say("虎子：大哥哥，铁匠大叔答应送给我一把弹弓，不知道做好了没有，你能帮我去问问他么？", 2 , "帮忙/yes", "不帮/no")
		else
	Say("虎子：大姐姐，铁匠大叔答应送给我一把弹弓，不知道做好了没有，你能帮我去问问他么？", 2 , "帮忙/yes", "不帮/no")
		end
	elseif(UTask_world45 == 10) then
		Talk(1,"","快去帮我问问呀，大叔做好了没有呀?")
	elseif(UTask_world45 == 20) then
		if(HaveItem(176) == 1) then
			Talk(1,"","太好了，太好了，一会儿我就去找天天出去玩儿。这把武器是我在村外找到的，我留着没什么用就送给你吧!")
			DelItem(176)
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			AddItem(0,0,random(0,5),2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)		-- 一把随机二级武器
			SetTask(45, 100)
			AddRepute(8)
			AddNote("完成任务，带弹弓回去给虎子")
			Msg2Player("带弹弓回去给虎子")
			Msg2Player("获得一兵器 ")
			Msg2Player("你的名望增加8点")
		else
			Talk(1,"","等大叔帮我做好了弹弓，我要去村外打鸟，不过可不要告诉我娘，她一定不会让我去的!")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","怎么还不下雪呀？下了雪我就可以堆雪人、打雪仗，多带劲儿啊!")
		else
			Talk(1,"","哎，不知道铁匠大叔答应送我的弹弓打好了没有，大叔的手艺真的很好啊，他的名剑铁铺远近闻名，打出来的武器特别好呢!")
		end
	end
end;

function yes()
	Talk(1,"","铁匠大叔的铺子就在村口，很容易找到的!")
	SetTask(45, 10)
	AddNote("接任务，帮虎子去问铁匠做好弹弓了没有")
	Msg2Player("接任务，帮虎子去问铁匠做好弹弓了没有")
end;

function no()
	Talk(1,"","我去帮你问问他人!")
end;
