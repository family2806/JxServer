--description: 汴京府铁塔三层敌人
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetBit(GetTask(21),3)
	if (UTask_tr == 50*256+20) and (UTask_trsub01 == 0) and (HaveItem(162) == 0) and (random(0,99) < 25) then
		AddEventItem(162)
		Msg2Player("获得第三把钥匙")
		AddNote("在铁塔第三层，打败宋卫兵，拿到开第三个机关的钥匙")
	end
end;
