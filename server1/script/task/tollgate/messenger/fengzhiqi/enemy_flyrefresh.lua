-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   风之骑关卡的定点小怪脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_killrefresh()
	
	local _, _, nMapIndex = GetPos()
	local Uworld1205 = nt_getTask(1205)  --信使积分
	local Uworld1213 = nt_getTask(1213)  --双倍经验时间
	local Uworld1215 = nt_getTask(1215)  --boss身边刷怪的打怪开关
	
		if ( Uworld1213 ~= 0 ) then       --判断是否双倍经验时间
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("你的增加双倍经验值的时间已结束!")
			else
				AddOwnExp(FLYREFRESH_EXP)    --给予一倍的经验
			end
		end
		
		nt_setTask(1215,Uworld1215+1)
		
		if ( nt_getTask(1215) >= 13 ) then
			local w = random(1,5) --随机得到一样好东西
			if ( w== 3 ) then  
				--AddItem()
			end
						
			nt_setTask(1215,0)
			Msg2Player("你想消灭金国虎豹骑吗?")
		end
		
		SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 2);
		if ( SubWorldIdx2ID( nMapIndex ) == 387 ) and ( GetGlbValue(811) >= 1 ) then  --判断地图内虎豹骑的数量
			SetGlbValue(811,GetGlbValue(811) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) and ( GetGlbValue(812) >= 1 ) then
			SetGlbValue(812,GetGlbValue(812) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) and ( GetGlbValue(813) >= 1 ) then
			SetGlbValue(813,GetGlbValue(813) - 1 )
		end	
		
		messenger_killnpc_jifen(FLYREFRESH_MESSENGEREXP,FLYREFRESH_MAPID)
		messenger_killbugbear_inteam(FLYREFRESH_EXP,FLYREFRESH_MAPID)   --增加队伍内玩家经验

end