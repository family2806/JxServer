-- 丐帮秘洞 宝箱4 出师任务（四楼，一个，对应布袋6、布袋7）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(204) == 1)) then
		Msg2Player("你试打开箱子看看 ")
		DelItem(204)
		if (HaveItem(206) == 0) then
			AddEventItem(206)
			AddNote("你获得第6个布袋")
			Msg2Player("你获得一个布袋")
		elseif (HaveItem(207) == 0) then
			AddEventItem(207)
			AddNote("你获得第7个布袋 ")
			Msg2Player("你获得一个布袋 ")
		else
			Msg2Player("你很失望，因为箱子空空的.")
		end
	else
		Talk(1,"","箱子锁了")
	end
end;
