--description: 峨嵋派钻天坡敌人
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) and (HaveItem(17) == 0) and (random(0,100) < 40) then			--没有白玉如意时，40%概率
		AddEventItem(17)
		Msg2Player("得到白玉如意")
		AddNote("打败钻天坡，得到白玉如意")
	end
end;
