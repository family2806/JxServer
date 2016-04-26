--description: 汴京府铁塔一层敌人
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetBit(GetTask(21),1)
	if (UTask_tr == 50*256+20) and (UTask_trsub01 == 0) and (HaveItem(160) == 0) then
		AddEventItem(160)
		Msg2Player("获得第一把钥匙")
		AddNote("在铁塔第一层，打败宋卫兵，拿到开第一个机关的钥匙")
	end
end;
