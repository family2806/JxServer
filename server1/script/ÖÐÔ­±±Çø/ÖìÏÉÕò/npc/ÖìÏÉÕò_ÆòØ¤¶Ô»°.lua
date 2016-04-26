--中原北区 朱仙镇 路人乞丐的对话
--朱仙镇新手任务: 找手环
--by Dan_Deng(2003-07-21)

--使用变量: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 2) then
		Talk(6,"","听说你拣到了一对手环，是吗？那是村里双双姑娘掉的，你能还给她吗?"," 天下没有白吃的饭，你要给点我好处才行.","?. (你不就是吃白饭的么?) ......你要什么?","我要酒店的五香豆腐干一份.","你的要求还真多.","爱要不要，你自己看着办.")
		Msg2Player("乞丐想用双双姑娘的戒指换五香豆腐. ")
		AddNote("乞丐想用双双姑娘的戒指换五香豆腐. ")
		SetTask(68,3)
	elseif ((UTask_world40 == 3) and (HaveItem(187) == 1)) then
		Talk(3,"","你的五香豆腐.","真是朱仙镇正宗豆腐，真香","那就给我戒指吧.")
		DelItem(187)
		AddEventItem(191)
		Msg2Player("拿到双双姑娘的戒指. ")
		AddNote("把豆腐给乞丐，拿到双双姑娘的戒指. ")
--		SetTask(68,5)
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","请给穷人施舍一碗饭吧!")
		else
			Talk(1,"","躺着晒太阳，抓虱子，这样的日子，神仙也不换!")
		end
	end
end;
