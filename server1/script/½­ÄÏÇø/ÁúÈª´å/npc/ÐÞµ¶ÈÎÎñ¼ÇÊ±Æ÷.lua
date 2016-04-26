--龙泉村任务 修刀 计时器
-- By: Dan_Deng(2003-09-03)

function OnTimer()
	StopTimer()
	Msg2Player("宝刀已经修好了! ")
	AddNote("宝刀已经修好了! 铁匠正在等你去拿! ")
	SetTask(19, 6)
end;
