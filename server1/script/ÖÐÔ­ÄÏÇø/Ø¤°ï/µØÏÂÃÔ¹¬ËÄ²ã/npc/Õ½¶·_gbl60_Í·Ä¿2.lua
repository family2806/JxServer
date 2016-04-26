-- 丐帮秘洞 战斗NPC02 出师任务（对应宝箱4）
-- by：Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(204) == 0) then			--带着任务并且没有钥匙
		AddEventItem(204)
		AddNote("在密洞第四层，获得一把钥匙 ")
		Msg2Player("在密洞第四层，获得一把钥匙 ")
	end
end;
