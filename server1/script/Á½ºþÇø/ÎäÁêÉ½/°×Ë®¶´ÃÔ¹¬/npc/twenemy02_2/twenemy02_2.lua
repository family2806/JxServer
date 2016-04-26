--description: 武陵山 白水洞敌人2　天王20级任务
--author: yuanlan	
--date: 2003/4/25
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 20*256+50) then
		UTask_twtmp20 = SetBit(GetTaskTemp(10),2,1)
		SetTaskTemp(10,UTask_twtmp20)
		if (UTask_twtmp20 == 7) then		-- bin: 100 + 010
			Msg2Player("打败土匪，附近村民送出一面锦旗作为感谢. ")
			AddEventItem(92) 
--			SetTask(3, 28)
			AddNote("在武夷山白水洞打败3名冒充天王帮弟子的土匪，得到附近村民送的锦旗. ")
		end
	end
end;
