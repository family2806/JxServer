-- 点苍山恶霸洞 路人NPC 机关（翠烟门40级任务）
-- by：Dan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) then
		if (HaveItem(197) == 1) and (HaveItem(196) == 1) and (HaveItem(198) == 1) then		--带着40级任务并且钥匙齐全
			DelItem(197)
			DelItem(196)
			DelItem(198)
			SetTask(6,40*256+30)
			AddNote("打败恶霸的助手，拿3把钥匙打开3个黑房间，救出被困的少女. ")
			Msg2Player("打败恶霸的助手，拿3把钥匙打开3个黑房间，救出被困的少女. ")
		else
			Msg2Player("你找出困少女的黑暗房间机关，但是只需要3把钥匙才能打开这个机关. ")
		end
	else
		Msg2Player(" 这里有一个机关，但是不懂用来做什么的")
	end
end;
