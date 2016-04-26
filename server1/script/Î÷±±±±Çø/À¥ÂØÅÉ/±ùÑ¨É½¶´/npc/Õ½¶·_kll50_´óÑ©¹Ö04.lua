-- 冰穴迷宫 战斗NPC ??04（昆仑50级任务）
-- by：Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	x = 4
	if (UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (GetBit(UTask_kl,x) == 0) then		--50级任务中且未杀过此只雪怪
		i = SetBit(UTask_kl,x,1)
		if (i == 50*256+64+31) then		-- 符合出钥匙条件
			SetTask(9,50*256+127)
			AddNote("在杀了无数雪怪的路上，最后找到怪人的居所")
			Msg2Player("在杀了无数雪怪的路上，最后找到怪人的居所")
		else
			SetTask(9,i)		-- 否则就保存变量
			Msg2Player("你进入山洞深处，在路上杀了一个雪怪")
		end
	end
end;
