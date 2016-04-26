function main()
	if ( GetTask(1203) == 10 ) then
		SetPos(1414,3197);
		Msg2Player("首先要与区域驿官对话")
	elseif ( GetTask(1203) == 21 ) then
		SetPos(1414,3197);
		Msg2Player("先与地图里的驿官对话，然后继续任务")
	elseif ( GetTask(1203) == 20 ) then
		SetPos(1414,3191);
		Msg2Player("想离开该地图，请找萧镇")
	elseif ( GetTask(1203) == 30 or GetTask(1203) == 25 or   GetTask(1203) == 0 ) then
		SetPos(1414,3197);
		Msg2Player("对不起，目前你不能进关.")
	end
end