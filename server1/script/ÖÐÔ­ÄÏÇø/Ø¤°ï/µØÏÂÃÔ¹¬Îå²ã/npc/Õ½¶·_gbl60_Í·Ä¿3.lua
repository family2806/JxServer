-- 丐帮秘洞 战斗NPC03 出师任务（对应宝箱5）
-- by：Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(202) == 0) then			--带着任务并且没有钥匙
		AddEventItem(202)
		AddNote("在密洞第五层，获得一个钥匙")
		Msg2Player("在密洞第五层，获得一个钥匙")
	end
end;
