-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   风之骑关卡的定点小怪脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断

function messenger_killpoint()
	local Uworld1205 = nt_getTask(1205)  --信使积分
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	local Uworld1214 = nt_getTask(1214)  --定点打怪开关
	
		if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("你的增加双倍经验值的时间已结束!")
			else
				AddOwnExp(FLYPOINT_EXP)    --给予一倍的经验，只有打死该怪物的人有任务变量才可以
			end
		end
		
		messenger_killnpc_jifen(FLYPOINT_MESSENGEREXP,FLYPOINT_MAPID)
		messenger_killbugbear_inteam(FLYPOINT_EXP,FLYPOINT_MAPID)   --增加队伍内玩家经验
		nt_setTask(1214,0)
	
		Msg2Player("恭喜你完成任务 "..killfly[Uworld1214][3].."!")
end