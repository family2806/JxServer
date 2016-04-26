Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\battles\\battlehead.lua")
IncludeLib("SETTING")
function branchTask_BW1()		--比武场的报名点，报名成功时调用
	if (nt_getTask(1011) == 10 and nt_getTask(1052) == 20) then		--傲云宗让你去演武场打一场比赛
		nt_setTask(1011, 20)		
		return
	end
	
	if (nt_getTask(1012) == 10 and nt_getTask(1056) == 20) then		--柳南云让你去演武场打一场比赛
		nt_setTask(1012, 20)
		return
	end
	
	if (nt_getTask(1013) == 10 and nt_getTask(1060) == 40) then		--与刘蕴古对话，你决定亲自去演武场参加一场pk比赛。
		nt_setTask(1013, 20)
		return
	end
end


function branchTask_GainBW1()		--比武场，当玩家赢的比赛时调用
	if (nt_getTask(1011) == 10 and nt_getTask(1052) == 60) then	--混混让你进入比武场打赢一场比赛
		nt_setTask(1011, 20)
		Msg2Player("您赢得了比武，可以回去找混混完成任务了")
		return
	end
	
	if (nt_getTask(1012) == 10 and nt_getTask(1056) == 40) then			--柳南云让你去演武场打胜一场比赛
		nt_setTask(1012, 20)
		Msg2Player("您赢得了比武，可以回去找柳南云完成任务了")
		return
	end
	
	if (nt_getTask(1013) == 10 and nt_getTask(1060) == 80) then	--拓跋怀川让你去演武场战胜一场，为大金国争口气。
		nt_setTask(1013, 20)
		Msg2Player("您赢得了比武，可以回去找拓拔怀川完成任务了")
		return
	end
end

function branchTask_JoinSJend1()
	if (nt_getTask(1053) == 20 and nt_getTask(1011) == 10 and BT_GetData(PL_TOTALPOINT) >= 200 ) then--混混让你去宋金战场参加两国间的大战，并获得二百个积分
		nt_setTask(1011, 20)
		Msg2Player("您已获得200积分，可以回去找混混完成任务了")
		return
	end
	
	if (nt_getTask(1057) == 20 and nt_getTask(1012) == 10 and BT_GetData(PL_TOTALPOINT) >= 200) then--柳南云让你去参加宋金大战，拿200个积分回来
		nt_setTask(1012, 20)
		Msg2Player("您已获得200积分，可以回去找柳南云完成任务了")
		return
	end
	
	if (nt_getTask(1061) == 20 and nt_getTask(1013) == 10 and BT_GetData(PL_TOTALPOINT) >= 200) then--拓跋怀川让你去参与宋金大战，获取二百个积分。	
		nt_setTask(1013, 20)
		Msg2Player("您已获得200积分，可以回去找拓拔怀川完成任务了")
		return
	end

end