--龙泉村任务 修刀 计时器
-- By: Dan_Deng(2003-09-03)

function OnTimer()
	StopTimer()
	Msg2Player("B秓 產o  s鯽 xong r錳! ")
	AddNote("B秓 產o  s鯽 xong r錳! 铁匠正在等你去拿! ")
	SetTask(19, 6)
end;
