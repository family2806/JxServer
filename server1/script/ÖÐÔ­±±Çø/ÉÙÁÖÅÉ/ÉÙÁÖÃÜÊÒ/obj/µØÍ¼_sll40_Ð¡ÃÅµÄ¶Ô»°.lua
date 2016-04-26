--少林后山密室 内室 小窗前的对话
-- by：Dan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl >= 40*256+20) and (UTask_sl < 50*256) then		-- 必须在任务中才能进入，并且每次进入都要回答问题
		Say("贫僧正在闭关修炼，如果想传话给他们，就要通过这两句口诀，听清了!",4,"按摩尼八迷红/L40_S2_wrong","红贝迷摩尼按/L40_S2_wrong","八迷尼红按摩/L40_S2_wrong","按八尼摩迷红. /L40_S2_correct")
	elseif (UTask_sl == 40*256+50) then
		Talk(3,"","这么重要的口诀，你怎么能忘记，我再说一次，记住了!","第一句是，世事无常，国土危险；第二句是，四大苦空，五阴无我；第三句是，生灭变异。虚伪无主；第四句：心是恶源,行为罪数；第五句：如是观察，渐离生死","这次不要再忘了，去吧!")
	else
		Msg2Player("神僧正在闭关修炼，请不要打扰")
	end
end;

function L40_S2_correct()
	Talk(9,"L50_step2","弟子拜见师叔祖","掌门派弟子来请两位师叔祖出关，谈论天下事","空寂：天下儿子，我们不懂，你转达给掌门5句话，他就明白了","第一句：世事无常，国土危险。","空寂：第二句：四大苦空，五阴无我","第三句：生灭变异。虚伪无主","空寂：第四句：心是恶源,行为罪数","第五句：如是观察，渐离生死")
end;

function L40_S2_wrong()
	Talk(1,"","读完口诀后，小门没有任何动静，是否你念错了?")
end;

function L50_step2()
	Talk(1,"","五句口诀的顺序要记清楚，去吧!")
	SetTask(7,40*256+50)
	AddNote("见寂灭二僧，求传达给方丈的指示. ")
	Msg2Player("见寂灭二僧，求传达给方丈的指示. ")
end;
