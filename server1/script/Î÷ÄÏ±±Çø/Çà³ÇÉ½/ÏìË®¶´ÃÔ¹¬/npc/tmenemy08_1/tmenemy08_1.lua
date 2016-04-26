--description: 唐门50级任务 青城山响水洞唐禾
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+60) then
		Talk(1,"","哼！反正我已身败名裂，打败了我，你也休想得到《暗器谱》！我把它藏在这山洞里，你一辈子也休想找到。")
		SetTask(2, 50*256+80)
		Msg2Player("打败青城山响水洞唐禾，知道暗器谱放在洞内")
		AddNote("打败青城山响水洞唐禾，知道暗器谱放在洞内")
	end
end;
