--description: 唐门30级任务 青城山白云洞绑匪2
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 0) and (random(0,99) < 50) then		-- 概率由33%改为50%
		AddEventItem(98)
		Msg2Player("得到一把钥匙")
		AddNote("打败绑匪头目，得到一把钥匙")
	end
end;
