--description: 天王帮 天王岛山洞敌人
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 10*256+20) and (GetItemCount("鸡血石") < 3) then
		AddEventItem(91)
		Msg2Player("得到一颗鸡血石")
		AddNote("在天王岛山洞里找到一颗鸡血石. ")
	end
end;	
