function main()
	local eattime = GetTask(1502)
	local eatexp = GetTask(1501)
	local eatmsg = {"<#>你吃了太多的粽子，已经不能继续吃了！",
		"<#>你觉得很饱，要等一段时间才可以吃粽子！",
		"<#>你吃了足够多的粽子，这已经是最后一个！"
		}
	local randomexp = {10000, 20000, 50000}
	if(eatexp > 20000000)  then   --使用经验大于20,000,000，不能再吃
		Msg2Player(eatmsg[1])
		return 1
	else
		if (GetGameTime() > eattime + 60 * 60) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501, eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --记录当前在线时间
			if(GetTask(1501) > 20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0
		elseif  (eattime == 0) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501,eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --记录当前在线时间
			if(GetTask(1501) >20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0	
		else
			Msg2Player(eatmsg[2])
			return 1
		end

	end
end