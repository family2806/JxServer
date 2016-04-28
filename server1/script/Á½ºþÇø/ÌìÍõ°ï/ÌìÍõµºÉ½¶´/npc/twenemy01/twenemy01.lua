--description: ÌìÍõ°ï ÌìÍõµºÉ½¶´µĞÈË
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 10*256+20) and (GetItemCount("Kª HuyÕt Th¹ch ") < 3) then
		AddEventItem(91)
		Msg2Player("µÃµ½Ò»¿ÅKª HuyÕt Th¹ch ")
		AddNote("ÔÚÌìÍõµºÉ½¶´ÀïÕÒµ½Ò»¿ÅKª HuyÕt Th¹ch . ")
	end
end;	
