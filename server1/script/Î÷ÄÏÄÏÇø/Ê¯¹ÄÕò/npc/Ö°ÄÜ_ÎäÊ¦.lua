--石鼓镇 武师 新手任务送饭、练轻功
-- By: Dan_Deng(2003-09-04)
-- Update: Dan_Deng(2003-11-04)改为模板方式，全服统一调用一个函数以利于维护、扩展

Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\各派接引弟子\\轻功_武师模板.lua")

function main(sel)
	UTask_world22 = GetTask(22)		-- 送饭任务
	if (UTask_world22 == 5) and (HaveItem(233) == 1) then			-- 送饭任务完成
		Talk(4,"W22_prise","柳叶儿叫你带饭给我？他这么小要考虑那么多事，我不是好爷爷。记得那时他3岁.....然后.....还有.....","你吃吧!","谢谢，我还有很多话，你想听吗?",".....不用!")
	else
		learn()
	end
end;

function W22_prise()
	Talk(1,"","那 ....谢谢你，请收下这个武器防身.")
	DelItem(233)
	SetTask(22,10)
	AddNote("带饭给武师，任务完成 ")
	Msg2Player("带饭给武师，任务完成 ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,7)
	i = random(0,8)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("获得一件兵器")
	AddRepute(3)
	Msg2Player("你的名望增加3点")
end;
