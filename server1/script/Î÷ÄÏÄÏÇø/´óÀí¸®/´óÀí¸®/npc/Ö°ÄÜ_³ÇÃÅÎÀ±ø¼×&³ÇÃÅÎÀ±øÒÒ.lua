-- 大理　职能　城门卫兵甲&城门卫兵乙
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-27) 小儿失踪任务

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\map_helper.lua")
npc_name = "<#>城门卫兵"

function default_talk()
--	UTask_world42 = GetTask(42)	-- 设置任务变量
--	if ((UTask_world42 == 0) and (GetLevel() >= 80) and (GetReputeLevel(GetRepute()) >= 7)) then		-- 任务启动，声望等级和声望值的关系不是很明确，要问明白
--		Talk(6,"U42_get","城门卫兵甲：听说城里最近老有小孩无故失踪？","城门卫兵乙：是啊。我原来的姘头叶花，她二小子也不见了，最近常来烦我帮她找儿子。","玩家：两位，究竟怎么回事？","城门卫兵甲：呵呵，这位大侠仪表堂堂，英明神武，看来是想管管这档子事咯？","玩家：客气，路见不平拔刀相助是我辈本分。","城门卫兵乙：哎呀，今晚的酒钱好象没带够啊！")
--	else
		Talk(4,"","今天我看到9个美人，不看就可惜了，看不用钱","小子活腻了吧!","闲暇就有闲暇，看这看那，大了也好!","没错，身段很美! ")
--	end;
end;

function U42_get()
	Say("对了，是5万两.",2,"两位大哥真有趣/yes1","骗得了他人，骗不了我!/no")
end;

function yes1()
	if (GetCash()>=50000) then 
		Pay(50000)
		Talk(1,"","阁下出手豪放，快去药王谷问拐脚真人，他知道这些秘密.")
		SetTask(42, 10)
		AddNote("小儿失踪任务：接任务，去药王谷找拐脚道人询问小孩的消息 ")
		Msg2Player("小儿失踪任务：接任务，去药王谷找拐脚道人询问小孩的消息")
	else
		Talk(1,"","走吧，没钱做什么大侠，回去做农吧!")
	end
end;

function no()
	Talk(1,"","走吧，没钱做什么大侠，回去做农吧!")
end;
