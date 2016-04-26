--description: 新手村_苏大妈
--author: wangzg	
--date: 2003/7/22
--71	UTask_world43
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)

function main()
	UTask_world43=GetTask(71)
	if ((UTask_world43==0) and (GetLevel() >= 3)) then		-- 加入等级限制
		Talk(2, "select", "我调皮的儿子，你想怎么样，有什么事?")
	elseif (UTask_world43==2) then
		Talk(2, "", "我劝苏弟努力学习，你不用担心.", "很好，我不懂怎么感谢你，这是金疮药，你拿起吧!")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,4)
		AddNote("和苏大妈说，已说服了家中的苏中，任务完成. ")
		Msg2Player("和苏大妈说，已说服了家中的苏中，任务完成. ")
		Msg2Player("有三包金疮药. ")
		AddRepute(6)
		Msg2Player("你的江湖名望增加3点. ")
	elseif (UTask_world43==3) then
		Talk(2, "", "大妈，我知道苏中有志气，他想到战场杀敌，男儿志在四方。让他按照自己的理想去做吧.", ", 儿子大了，不能留了。他有志向，我也不能阻止，谢谢你，这个金疮药你拿去吧!")
		Msg2Player("有3包金疮药. ")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,5)
		AddNote("帮助苏大妈理解苏中的选择, 任务完成")
		Msg2Player("帮助苏大妈理解苏中的选择, 任务完成")
		Msg2Player("有3包金疮药. ")
		AddRepute(4)
		Msg2Player("你的江湖名望增加4点. ")
	else	
		Say("这些年，我们母子两生活艰苦，想到战死的相公，我就想哭，希望我儿子平安无事", 0)	
	end
end;

function select()
Say("他本来就好学，最近又想从军杀敌，真不懂他想什么?", 2, "我帮你去问他/yes", "这个我不懂/no")
end

function yes()
SetTask(71,1)
AddNote("接任务：帮苏大妈了解儿子的想法. ")
Msg2Player("接任务：帮苏大妈了解儿子的想法. ")
end 

function no()
end
