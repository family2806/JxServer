-- 见性峰山洞 宝箱 昆仑40级任务
-- by：Dan_Deng(2003-07-30)

function main()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 40*256+20) and (HaveItem(212) == 1)) then		-- 钥匙应使用ID号
		Msg2Player("你得到血魂神剑")
		DelItem(212)
		AddEventItem(9)
		AddNote("你得到血魂神剑")
		Msg2Player("你得到血魂神剑")
	else
		Talk(1,"","宝箱锁住了")
	end
end;
