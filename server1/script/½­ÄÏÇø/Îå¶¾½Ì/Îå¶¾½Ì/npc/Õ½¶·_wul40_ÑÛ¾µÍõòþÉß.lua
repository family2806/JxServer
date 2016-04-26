-- 五毒金蛇血潭迷宫 战斗NPC 眼镜王蟒蛇01（五毒40级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(143) == 0) and (random(0,99) < 60) then		-- 在任务中，按机率打出。
		if (HaveItem(142) == 1) then
			if (random(0,99) < 60) then
				AddEventItem(143)
				DelItem(142)
				AddNote("抓来了眼镜王蟒蛇")
				Msg2Player("你用麝香来控制它最后也抓到了")
			else
				Msg2Player("你试用麝香来抓眼镜王蟒蛇，但是不小心被他逃跑了")
			end
		else
			Msg2Player("眼镜王蟒蛇的剧毒不能解，要是没有麝香克制它是无法抓住的")
		end
	end
end;
