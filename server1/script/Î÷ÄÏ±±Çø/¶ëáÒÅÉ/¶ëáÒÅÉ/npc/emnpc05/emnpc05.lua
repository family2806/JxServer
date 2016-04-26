--description: 峨嵋派谢云萝
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 60) then		--入门任务
		Msg2Player("接钻天坡武功考验，获得白玉如意")
		Say("三位师姐都难不倒你，那么'文'这一关你算是通过了，但是还要过'武'关，这一关里你必须通过钻天坡迎客阵，并且得到<color=Red>白玉如意<color>，你要闯阵吗？", 2, "闯/yes", "不闯/no")
	elseif (Uworld36 == 70) then
		if (HaveItem(17) == 0) then
			Talk(1,"","拿到<color=Red>白玉如意<color>后，请从山上的出口离开钻天坡")
		else
			Talk(1,"","将<color=Red>白玉如意<color>交给<color=Red>掌门<color>，就可以加入本派了。掌门在<color=Red>正殿<color>里.")
		end
--	elseif ((UTask_em > 5*256) and (UTask_em < 5*256+60)) then 					--尚未完成前三关
--		Talk(1,"","谢云萝：要想加入本派，必须先通过茶琴书的考验，你都做到了吗？")
--	elseif (GetFaction() == "emei") then   				--已经入门，尚未出师
--		Talk(1,"","谢云萝：你已经是本派弟子，不必再闯钻天坡了。")
	elseif (UTask_em == 70*256) then   						--已出师
		Talk(1,"","有空常回来看看我们啊!")
	else
		Talk(1,"","庭前昨夜一枝梅")
	end
end;

function yes()
--	SetPos(1766, 5136);				--把玩家传送入迷宫
	Uworld36 = SetByte(GetTask(36),1,70)
	SetTask(36,Uworld36)
	AddNote("进入钻天坡需要接受谢云萝的考验，进入钻天坡夺走白玉如意")
	Msg2Player("进入钻天坡需要接受谢云萝的考验，进入钻天坡夺走白玉如意")
end;

function no()
end;
