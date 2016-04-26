--description: 峨嵋派猛虎洞穴敌人
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em >= 20*256+50) and (UTask_em < 20*256+53) then	
		UTask_em = UTask_em + 1
		SetTask(1,UTask_em)
		if (UTask_em == 20*256+53) then
			Talk(1,"","白虎精虽然凶悍，但是被你收伏了三次以后，终于乖乖地降服了。虎患已除，你可以回去复命了!")
			SetTask(1,20*256+80)
			Msg2Player("恭喜你收复猛虎")
			AddNote(" 在后山猛虎洞，连续3次打败白虎精，成功收复猛虎")
		else
			Msg2Player("你已打败白虎精，但是白虎精头硬，不一定能收复它. ")
		end
	end
end;
