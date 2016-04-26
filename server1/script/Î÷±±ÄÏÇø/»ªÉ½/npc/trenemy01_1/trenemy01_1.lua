--description: 华山敌人
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_world30 = GetByte(GetTask(30),1)
	if ((UTask_world30 == 5) and (HaveItem(50) == 0) and (random(0,99) < 50)) then
		Talk(1,"","你得到一把禹王剑！但是才拿起来它就断成了3段！原来是假的。")
		Msg2Player("发现禹王剑是假的")
	end
end;
