--description: 西南北区 成都府 铁匠铺老板 峨嵋派10级任务
--author: yuanlan	
--date: 2003/5/24
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>铁匠：有没有兴趣来我这儿当学徒？包吃包住喔！"

function main(sel)
	UTask_em = GetTask(1)
	if ((UTask_em == 10*256+20) and (HaveItem(18) == 1) and (HaveItem(19) == 1)) then
		Talk(5, "", "铁匠大哥，你能不能帮我把这两半铜镜重新复原在一起?", "要是换了别人，想复原一面铜镜是难于登天，可是我却有一种祖传的手艺，专门用来修补铜镜，你算是找对人了，只不过...", "你要多少钱才肯修复铜镜?", "只要你能帮我找到一种叫做亮银矿的矿石，我就帮你修补好这个铜镜，听说城西的树林中就有亮银矿，不过因为那里有很多吃人的野兽，所以平时没人敢去采矿.","行了，我方两块镜子在这里，立即去找亮银矿.")
		DelItem(18)
		DelItem(19)
		SetTask(1, 10*256+40)
		AddNote("到成都找到铁匠，知道需要亮银矿来复原铜镜")
		Msg2Player("到成都找到铁匠，知道需要亮银矿来复原铜镜")
	elseif (UTask_em == 10*256+40) then
		if (HaveItem(118) == 1) then
			Talk(1, "", "很好，有亮银矿了，我就帮你复原镜子.")
			DelItem(118)
			AddEventItem(20)
			SetTask(1, 10*256+60)
			AddNote("交亮银矿给铁匠，拿到复原的铜镜")
			Msg2Player("拿到复原的铜镜")
		else
			tiejiang_city("<dec><npc>听说城西的树林中就有亮银矿，没有亮银矿就不能复原镜子.");
		end
	elseif ((UTask_em == 10*256+60) and (HaveItem(20) == 0)) then		-- 任务中，铜镜丢了
		AddEventItem(20)
		Msg2Player("获得复原的铜镜.")
		Talk(1,"","你放在这里的镜子不拿了啊?")
	else
		tiejiang_city(TIEJIANG_DIALOG);
	end
end;

function yes()
Sale(13)  			--弹出交易框
end;

