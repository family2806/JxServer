--description: 天忍教20级任务 小灰驴
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+50) and (HaveItem(126) == 0) then
		SetPropState()
		AddEventItem(126)
		Msg2Player("找到丢失的小灰驴. ")
		AddNote("找到丢失的小灰驴. ")
	end
end;	
