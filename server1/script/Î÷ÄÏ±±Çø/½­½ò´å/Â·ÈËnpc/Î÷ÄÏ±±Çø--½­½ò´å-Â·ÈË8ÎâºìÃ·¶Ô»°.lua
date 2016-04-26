--西南北区 江津村 路人8吴红梅对话
--江津村新手任务：吴老爹的药
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world21 = GetTask(49);
	if (UTask_world21 == 3) then
		Talk(1,"","谢谢你给我爹抓药，这是我刚做的鞋，你要是不嫌弃就拿着吧!")
		SetTask(49, 10)
		AddRepute(6)
		AddNote("完成帮吴老抓药任务")
		Msg2Player("完成帮吴老抓药任务")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0)then
			AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("获得一对草鞋")
		else
			AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("获得一对绣花鞋")
		end
		Msg2Player("你的名望增加6点")
	else
		Talk(1,"","吴红梅：我娘想吃蒜泥白肉，可是卖肉的好像没出来，这可如何是好？")
	end
end;
