--中原南区 武当派30级任务画眉草计时脚本
-- Update: Dan_Deng(2003-08-17)

function OnTimer()
	StopTimer()
	Msg2Player("取画眉草时间已到! ")
	SetTask(5, 30*256+50)
end;

