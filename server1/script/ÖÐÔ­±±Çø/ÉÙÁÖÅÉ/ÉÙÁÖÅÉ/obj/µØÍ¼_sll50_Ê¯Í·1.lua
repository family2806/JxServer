-- 地图物品 少林寺后松林 石头1 少林50级任务
-- by：Dan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+30) and (HaveItem(28) == 0) then		--少林50级任务中
		i = GetTaskTemp(47)
		if (i == 2) then
			Talk(1,"","石头慢慢被挪动，看到下面好像有本书")
			AddEventItem(28)
			AddNote("拿到易筋经. ")
			Msg2Player("拿到易筋经. ")
			SetTaskTemp(47,0)			--复位临时变量，万一再来打...
		elseif (i == 1) then
			Talk(1,"","你用力推石头, 好像有点转动")
			SetTaskTemp(47,2)
		else
			Talk(1,"","你用力推石头, 但是，它依然不动 ")
			SetTaskTemp(47,1)
		end
	else
		Talk(1,"","你用力推石头, 但是，它依然不动")
	end
end;
