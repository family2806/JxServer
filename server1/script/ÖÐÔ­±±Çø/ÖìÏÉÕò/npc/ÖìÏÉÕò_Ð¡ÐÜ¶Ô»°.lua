--中原北区 朱仙镇 路人小熊的对话
--朱仙镇新手任务: 找手环
--by Dan_Deng(2003-07-21)

--使用变量: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 1) then
		Talk(2,"","小兄弟，看到双双姐姐的戒指了吗?","我看到你镇西边的乞丐捡到一个戒指，不懂是不是双双姐姐的?")
		AddNote("双双姑娘的戒指可能被乞丐拿走了. ")
		SetTask(68,2)
		Msg2Player("双双姑娘的戒指可能被乞丐拿走了. ")
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","双双姐姐对我很好.")
		else
			Talk(1,"","感觉镇西边的乞丐有点奇怪.")
		end
	end
end;
