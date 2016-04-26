--description: 中原北区 汴京府 路人3小海对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 2) then 
		Talk(2, "", "玩家：小海乖，快点回家去吧，你娘正担心你呢！", "小海：哦，你告诉我娘，我再玩一会儿，很快就回去，叫她别担心。")
			SetTask(28, SetByte(GetTask(28),3,4))
			AddNote("在城内广场找到小海，劝他回家")
			Msg2Player("在城内广场找到小海，劝他回家")
		elseif (UTask_trsub60 >= 4) then 
			Talk(1,"","小海：我再玩一会儿，很快就回去。")
		end
	else
		Talk(1,"","小海：我最爱吃唐老爹卖的冰糖葫芦了，可是娘不肯给我买，说吃多了会闹肚子。")
	end
end;
