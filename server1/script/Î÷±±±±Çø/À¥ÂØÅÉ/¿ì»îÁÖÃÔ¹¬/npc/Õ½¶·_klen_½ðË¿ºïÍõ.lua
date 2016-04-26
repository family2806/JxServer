-- 龙门镇快活林迷宫 战斗NPC 金丝猴王 入门任务
-- by：Dan_Deng(2003-07-30)

function OnDeath()
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 0) and (HaveItem(117) == 1) then
			DelItem(117)
			AddEventItem(8)
			Msg2Player("金丝猴霸占了山里红，你趁机去抓到金丝猴. ")
			AddNote("抓到金丝猴. ")
		else
			Msg2Player("金丝猴趁你不注意逃跑了. ")
		end
	end
end;
