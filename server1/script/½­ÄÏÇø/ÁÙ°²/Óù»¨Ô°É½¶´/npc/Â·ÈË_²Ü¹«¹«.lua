-- 临安皇宫秘道 路人NPC 曹公公（丐帮50级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		-- 50级任务，第一次进宫
		Talk(3,"L50_after1","这位公公，我想拜见皇上，有一件重要的东西要交给他. "," 皇上正在休息，你把东西交给我就行了，我会替你转交的","这样啊.......","怎么？你信不过我？也不打听打听我曹公公是什么人，皇上是我从小带大的，难道我还会骗你不成? ","那好吧!")
	elseif (UTask_gb == 50*256+50) then		--50级任务，第二次进宫打败了卫士之后
		Talk(7,"L50_after2","饶命!","说！中原地形图在哪里在我这！在我这!","本来我要杀了你!","英雄饶命!","但是我不想让皇上受惊，就姑且饶你一命，你要好自为之！如果再敢勾结金人，卖国求荣，天下人都不会饶你. ","是！是！")
	elseif (UTask_gb == 50*256+40) then			-- 50级任务，第二次进未打卫士
		Talk(1,"","不能过去！卫士！快来救命!")
	else
		Talk(1,"","有刺客!卫士！")
		SetFightState(0)
		NewWorld(176, 1627, 3206)
	end
end;

function L50_after1()
	AddNote("交地图给曹公公. ")
	Msg2Player("交地图给曹公公. ")
	DelItem(199)
	SetTask(8,50*256+30)
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end

function L50_after2()
	AddEventItem(199)
	AddNote("夺来中原地图. ")
	Msg2Player("夺来中原地图. ")
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end
