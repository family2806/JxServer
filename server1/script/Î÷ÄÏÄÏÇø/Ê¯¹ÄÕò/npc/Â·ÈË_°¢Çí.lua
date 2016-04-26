--石鼓镇 路人 阿琼 新手任务：阿琼的戒指
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world24 = GetTask(24)
	if (UTask_world24 == 0) and (GetLevel() >= 5) then		-- 任务启动
		Say("我的戒指找不到，一定是灵猫叼走了. ",2,"帮她找. /W24_get_yes","假装没听到/W24_get_no")
	elseif (UTask_world24 == 5) and (HaveItem(234) == 1) then		-- 任务完成
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
		if (GetSex() == 0) then
			W24_rank = "<#> 这个护身符我拿也没用，拿去算是谢礼"
			AddItem(0, 4, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("获得护身符令绿公石. ")
		else
			W24_rank = "<#> 这条项链虽然很好看，但是，是一个我讨厌的人送的，现在我拿给你."
			AddItem(0, 4, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("得到一条铜项链. ")
		end
		Talk(1,"","<#> 哎呀，这不是我的戒指吗？真是感谢你帮我找到!"..W24_rank)
		SetTask(24,10)
		DelItem(234)
		AddRepute(7)
		AddNote("交戒指给阿琼，完成任务 ")
		Msg2Player("交戒指给阿琼，完成任务")
		Msg2Player("你的名望增加7点. ")
	else				-- 非任务对话
		Talk(1,"","我村的女孩都很心灵手巧，经常剪拜佛神纸，我最喜欢的是这个戒指，做的很精致.")
	end
end;

function W24_get_yes()
	SetTask(24,5)
	Talk(1,"","不用担心，我帮你去找!")
	AddNote("接任务：帮阿琼找丢失的戒指. ")
	Msg2Player("接任务：帮阿琼找丢失的戒指. ")
end

function W24_get_no()
end
