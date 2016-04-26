-- 罗霄山孽龙洞 战斗NPC 强盗（五毒50级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 50*256+20) and (random(0,99) < 33) then		-- 在任务中，按机率打出。
		AddEventItem(88)
		AddNote("拿来玉珊瑚")
		Msg2Player("拿来玉珊瑚")
	end
end;
