-- 武夷山玉华洞迷宫 战斗NPC 流寇01（五毒50级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 50*256+10) then
		SetTask(10,50*256+20)
		AddNote("去罗霄山打败强盗, 拿回玉珊瑚")
		Msg2Player("抓到头领,才回到玉珊瑚被武夷山的强盗抢去了, 他们和在罗霄的强盗是一伙的")
	end
end;
