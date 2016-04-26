--两湖区 天王帮入门任务酿酒计时脚本
-- Update: Dan_Deng(2003-08-16)

function OnTimer()
	StopTimer()						--结束计时
	Msg2Player("酿酒时间已到！")
	SetTask(38,SetByte(GetTask(38),1,80))
end;
