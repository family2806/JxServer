--翠烟门20级任务 大曼陀罗花计时脚本
-- Update: Dan_Deng(2003-09-09)
-- Timer: 8

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	UTask_cy = GetTask(6)
	StopTimer()
	if (UTask_cy == 20*256+20) then		-- 中毒第一阶段到时
		PutMessage("你感到头晕目眩，看起来毒性已发作了. ")
		Msg2Player("你感到头晕目眩，看起来毒性已发作了. ")
		SetTask(6, 20*256+30)
		SetTimer(3 * CTime * FramePerSec, 8)						--计时器定为半小时（3个时辰）
	elseif (UTask_cy == 20*256+30) then		-- 中毒第二阶段到时
		PutMessage("你感到四肢无力，可能毒性已经侵入体内很深了. ")
		Msg2Player("你感到四肢无力，可能毒性已经侵入体内很深了. ")
		SetTask(6, 20*256+40)
		SetTimer(3 * CTime * FramePerSec, 8)						--计时器定为半小时（3个时辰）
	elseif (UTask_cy == 20*256+40) then		-- 中毒第三阶段到时
		PutMessage("全身开始不动，手脚没有反应. ")
		Msg2Player("全身开始不动，手脚没有反应. ")
		SetTask(6, 20*256+50)
		SetTimer(3 * CTime * FramePerSec, 8)						--计时器定为半小时（3个时辰）
	else							-- 第四阶段超时！毒发身亡！！
		SetTask(6, 20*256+10)
		for i=1,GetItemCount(1) do DelItem(1) end
		PutMessage("大曼陀罗花毒素已经发散，你因为毒发身亡")
		Msg2Player("大曼陀罗花毒素已经发散，你因为毒发身亡")
		SetFightState(1)
		KillPlayer()
	end
end;
