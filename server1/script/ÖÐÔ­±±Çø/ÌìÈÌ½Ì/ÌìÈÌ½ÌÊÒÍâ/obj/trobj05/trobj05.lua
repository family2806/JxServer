--description: 天忍教20级任务 小黄狗
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+50) and ( HaveItem(125) == 0) then				--取消对任务物品有无的判断，以便重做任务
		SetPropState()
		AddEventItem(125)
		Msg2Player("找到丢失的小黄狗. ")
		AddNote("找到丢失的小黄狗. ")
	end
end;
