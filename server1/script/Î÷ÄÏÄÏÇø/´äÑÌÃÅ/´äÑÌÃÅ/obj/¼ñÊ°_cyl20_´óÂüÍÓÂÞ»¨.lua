-- 任务物品 大曼陀罗花 翠烟20级任务
-- by：Dan_Deng(2003-07-26)

Include("\\Script\\Global\\TimerHead.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") and (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--翠烟20级任务中才能捡此道具
		i = GetTimerId()
		if (i ~= 0) and (i ~= 8) then		-- 另有计时器在运行中
			Talk(1,"","你任务紧急，还乱跑啊?")
			return
		end
		SetPropState()
		AddEventItem(1)
		Msg2Player("摘一朵大曼陀罗花. ")
		if (i == 0) then									-- 尚未中毒则让他中毒
			SetTimer(3 * CTime * FramePerSec, 8)									--计时器定为半小时（3个时辰）
			SetTask(6,20*256+20)				-- 变量置为中毒第一阶段
--			PutMessage("你感到手中一阵麻庠，已经中毒了。")
			Msg2Player("你感到手中一阵麻庠，已经中毒了. ")
		end
	else
		Msg2Player("你用手摘了一朵曼陀罗花")
		Msg2Player("刚刚触摸到花，你就感到手中一阵麻痒，好像花有毒，你立刻伸手回来. ")
	end
end;
