--description: ÆßÉ±¶´ËÀÇô6¡¡ÌìÈÌ10¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(56) == 0)) then
		AddEventItem(56)
		Msg2Player("ÄÃµ½ÁîÅÆËéÆ¬6. ")
		AddNote("ÄÃµ½ÆßÉ±¶´ÁîÅÆËéÆ¬6. ")
	end
end;
