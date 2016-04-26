-- 昆仑雪豹山洞 战斗NPC 雪豹 入门任务
-- by：Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 30*256+10) and (GetItemCount("D?Minh Ch﹗") < 3) and (random(0,99) < 60) then
			AddEventItem(111) 
			Msg2Player("拿到夜明珠")
			AddNote("找到夜明珠")
	end
end;
