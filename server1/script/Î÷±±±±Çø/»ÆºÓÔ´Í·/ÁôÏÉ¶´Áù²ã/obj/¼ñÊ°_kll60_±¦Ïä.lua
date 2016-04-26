-- 黄河源头迷宫 宝箱 昆仑出师任务
-- by：Dan_Deng(2003-07-31)

function main()
	UTask_kl = GetTask(9)
	if (UTask_kl == 60*256+20) then
		if ((HaveItem(11) == 1) and (HaveItem(12) == 1) and (HaveItem(13) == 1) and (HaveItem(14) == 1) and (HaveItem(15) == 1)) then
			DelItem(11)
			DelItem(12)
			DelItem(13)
			DelItem(14)
			DelItem(15)
			AddEventItem(16)
			AddNote("被派去拿五色石")
			Msg2Player("你用上方的5把钥匙打开箱子拿五彩石")
		else
			Talk("没有那5把钥匙，你无法开箱子拿石头")
		end
	else
		Talk(1,"","这个宝箱锁起了")
	end
end;
