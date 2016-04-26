-------------------------------------------------------------------------
-- FileName		:	enemy_turebugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 21:07:14
-- Desc			:   千宝库关卡的小怪脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断



function turesure_killbugbear()
	--local Uworld1205 = nt_getTask(1205)  --信使积分
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
		if  ( GetGameTime() - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("你的增加双倍经验的时间已结束!")
		else
			AddOwnExp(TUREBUGBEAR_EXP)    --给予一倍的经验
		end
	end
	--messenger_killnpc_jifen(TUREBUGBEAR_MESSENGEREXP,TUREBUGBEAR_MAPID)
	messenger_killbugbear_inteam(TUREBUGBEAR_EXP,TUREBUGBEAR_MAPID)   --增加队伍内玩家经验
end

