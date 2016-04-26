--description: 新手村_花花
--author: wangzg	
--date: 2003/7/22
--73	UTask_world45
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 0) then		-- 任务启动
		Say("你看见我的小龙了吗？我叫他去买糖，等了很久都不见回来，去那里找也不见，我担心得要死! ", 2, "我帮你去找/yes", "我不能帮你/no")
	elseif (UTask_world45 == 1) then
		Talk(1,"","麻烦你帮我找他!")
	elseif (UTask_world45 >= 10) then
		Talk(1,"","谢谢你帮我找到他.")
	else				-- 非任务对话
		Talk(1,"","我的小龙真是调皮!")
	end	
end

function yes()
	Talk(1,"","麻烦你了! ")
	SetTask(73,1)
	AddNote("接任务：帮助花花找回小龙. ")
	Msg2Player("接任务：帮助花花找回小龙. ")
end

function no()
end
