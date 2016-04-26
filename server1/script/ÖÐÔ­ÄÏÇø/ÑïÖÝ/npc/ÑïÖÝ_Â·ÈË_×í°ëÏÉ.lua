-- 扬州 路人NPC 醉半仙（丐帮10级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+20) then		--10级任务中
		SetTask(8,10*256+30)
		Talk(5,"L10_question_1","好酒啊好酒，一开封就香气扑鼻!...","你是醉半仙吗？这坛就是惠泉酒吗?","不错，我就是醉半仙，这就是惠泉酒，你又是谁!","在下丐帮弟子，久仰大名，不知可否将这坛惠泉酒让给在下？","如果你回答对我的问题，这瓶酒就送给你!")
	elseif (UTask_gb == 10*256+30) then		--重新尝试
		Talk(1,"L10_question_1","还不服？那我继续!")
	elseif ((UTask_gb == 10*256+40) and (HaveItem(76) == 0)) then		--如果玩家把酒弄丢了
		Talk(3,"","什么？你弄丢了酒?","我的酒啊!","很好，看起来你也对酒有见识。送给你!")
		AddEventItem(76)
		Msg2Player("有惠泉酒")
	else
		Talk(1,"","和我干一杯，干！")
	end
end;

function L10_question_1()
	Say("第一问：惠泉酒的惠泉是指什么?",4,"人名 /L10_wrong","地名/L10_wrong","泉水/L10_question_2","湖的名字 /L10_wrong")
end;

function L10_question_2()
	Say("举头望明月，对影成几人，是什么?",4,"很多人/L10_wrong","3 人 /L10_question_3","2 人 /L10_wrong","1 人 /L10_wrong")
end;

function L10_question_3()
	Say("第三问:下面哪个字是指酒的名字",4,"玉驿 /L10_wrong","琼让/L10_wrong","绿拟 /L10_wrong","翡翠 /L10_correct")
end;

function L10_wrong()
	Talk(1,"","错了，看来你和酒无缘!")
end;

function L10_correct()
	Talk(1,"","很好，看起来你对酒也有见识。送给你!")
	AddEventItem(76)
	SetTask(8,10*256+40)
	AddNote("有惠泉酒 ")
	Msg2Player("有惠泉酒 ")
end;
