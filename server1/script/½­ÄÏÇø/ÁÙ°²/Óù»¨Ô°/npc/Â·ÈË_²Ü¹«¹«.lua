-- 临安 路人NPC 曹公公（丐帮50级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		--带着50级任务
		Talk(3,"","这位公公，我想拜见皇上，有一件重要的东西要交给他. ","皇上正在休息，你把东西交给我就行了，我会替你转交的","这样啊.......","怎么？你信不过我？也不打听打听我曹公公是什么人，皇上是我从小带大的，难道我还会骗你不成? ","V藋 c騨g 頲!")
		AddNote("把山河社稷图交给曹公公. ")
		Msg2Player("把山河社稷图交给曹公公. ")
		DelItem(199)
		SetTask(8,50*256+30)
		NewWorld(176, 1627, 3206)
	else
		Talk(1,"","把山河社稷图交给曹公公")
	end
end;
