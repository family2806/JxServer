--冰穴迷宫 冰牢入口 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	UTask_kl = GetTask(9)
	if (UTask_kl == 50*256+64) and (HaveItem(213) == 1) and (HaveItem(10) == 0) then		-- 昆仑50级任务中
		SetTask(9,50*256+128)
		DelItem(213)		-- 钥匙应使用ID号
		Msg2Player("你用钥匙打开牢门 ")
		AddNote("你用钥匙打开牢门 ")
	elseif (UTask_kl == 50*256+128) then
--		SetPos()
		Msg2Player("你走进牢房 ")
	else
		Msg2Player("牢房门被关了 ")
	end
end;
