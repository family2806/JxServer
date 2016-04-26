-------------------------------------------------------------------------
-- FileName		:	lib_messenger.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 14:25:25
-- Desc			:	信使任务中怪物死亡后组队的所有玩家任务变量皆改变的类
-------------------------------------------------------------------------

-- messengertask1 ：信使任务统一使用当前关卡杀怪记数器
-- mssengertask2   ：相对任务关卡杀怪记数器
-- taskgiveexp  ：当前地图相对怪物死亡的经验奖励

Include("\\script\\event\\great_night\\huangzhizhang\\event.lua") --增加辉煌之夜活动
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan

function SetMessengerPlayer(messengertask1,messengertask2,taskgiveexp,MapId) --大怪挂掉后调用的给队内所有玩家加经验和杀怪记数的脚本
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	taskgiveexp = taskgiveexp * greatnight_huang_event(2)
	
		if (nMemCount == 0 ) then
			myMemberTask = GetTask(messengertask1) + 1
			myMemberTaskTwo = GetTask(messengertask2) + 1
			nt_setTask(messengertask1,myMemberTask )
			nt_setTask(messengertask2,myMemberTaskTwo )
			if ( nt_getTask(1273) < 14000000 ) then
				AddOwnExp(taskgiveexp)
				local today_exp = nt_getTask(1273)
				nt_setTask(1273,today_exp+taskgiveexp)
			end
				PlayerIndex = nPreservedPlayerIndex;
			return
		else
			for i = 1, nMemCount do
				PlayerIndex = GetTeamMember(i)
				local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --获得当前玩家所在位置
				if ( MapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) then   --判断是否在杀死怪物的玩家的所在地图
					myMemberTask = GetTask(messengertask1) + 1
					myMemberTaskTwo = GetTask(messengertask2) + 1
					nt_setTask(messengertask1,myMemberTask )
					nt_setTask(messengertask2,myMemberTaskTwo )
					if ( nt_getTask(1273) < 14000000 ) then
						AddOwnExp(taskgiveexp)
						local today_exp = nt_getTask(1273)
						nt_setTask(1273,today_exp+taskgiveexp)
					end
				end
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
		
	if ( nt_getTask(1273) >= 14000000 ) then
		Msg2Player("对不起，你今天在信使关获得的经验值已超过上限，明天再来吧，谢谢!")
	end
end;

function messenger_killbugbear_inteam(taskgiveexp,BMapId)  --小怪挂掉后调用的给队内所有玩家加经验的脚本
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local nTaskExp = taskgiveexp * greatnight_huang_event(2)
	
	if ( nt_getTask(1273) < 14000000 ) then
		if (nMemCount == 0 ) then
			AddOwnExp(nTaskExp)	
			AddExp_Skill_Extend(taskgiveexp)
			local today_exp = nt_getTask(1273)
			nt_setTask(1273,today_exp+taskgiveexp)
			PlayerIndex = nPreservedPlayerIndex;
			return
		else
			for i = 1, nMemCount do
				PlayerIndex = GetTeamMember(i)
				local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --获得当前玩家所在位置
				if ( BMapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) and (nt_getTask(1273) < 14000000) then   --判断是否在杀死怪物的玩家的所在地图
					AddOwnExp(nTaskExp)
					AddExp_Skill_Extend(taskgiveexp)
					local today_exp = nt_getTask(1273)
					nt_setTask(1273,today_exp+taskgiveexp)
				end
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
	elseif ( nt_getTask(1273) >= 14000000 ) then
		Msg2Player("对不起，你今天在信使关获得的经验值已超过上限，明天再来吧，谢谢!")
	end
end;

function messenger_killnpc_jifen(realjifen,BMapId)
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1274 = nt_getTask(1274)
	local nOrgRealjifen = realjifen;
	local nBeishu = greatnight_huang_event(2);
	realjifen = realjifen * nBeishu
	
	local xianzhijifen = 3500 
	if ( nBeishu == 2 or nBeishu == 3 ) then
		  xianzhijifen = 7000
	end
	
	if ( nt_getTask(1274) < xianzhijifen ) then
		if (nMemCount == 0 ) then
			nt_setTask(1205,Uworld1205+realjifen)
			nt_setTask(1274,Uworld1274+realjifen)
			if ( nt_getTask(1224) == 0 ) then
				nt_setTask(1223,nt_getTask(1223)+realjifen)
			end
			if (nBeishu > 0) then
				nOrgRealjifen = floor(nOrgRealjifen / nBeishu);
			end;
			tongaward_message(nOrgRealjifen);	--by 小山
			PlayerIndex = nPreservedPlayerIndex;
			return
		else
			local i = random(1,nMemCount)
			PlayerIndex = GetTeamMember(i)
			local Uworld1205 = nt_getTask(1205)
			local Uworld1274 = nt_getTask(1274)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --获得当前玩家所在位置
			if ( BMapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) and ( nt_getTask(1274) < xianzhijifen ) then   --判断是否在杀死怪物的玩家的所在地图
				nt_setTask(1205,Uworld1205+realjifen)
				nt_setTask(1274,Uworld1274+realjifen)
				if ( nt_getTask(1224) == 0 ) then
					nt_setTask(1223,nt_getTask(1223)+realjifen)
				end
				if (nBeishu > 0) then
					nOrgRealjifen = floor(nOrgRealjifen / nBeishu);
				end;
				tongaward_message(nOrgRealjifen);	--by 小山
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
	elseif ( nt_getTask(1274) >= xianzhijifen ) then
		Msg2Player("对不起，你今天在信使关获得的经验值已超过上限，明天再来吧，谢谢!")
	end
end

function SetTask2Team(nGetTaskid, nRealTaskid, nGoalIdx)
	local nDate = tonumber(GetLocalDate("%y%d%m"));
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	
	local ntaskidx = GetTask(nGetTaskid);
	if (nMemCount == 0 ) then
		if (ntaskidx == nGoalIdx) then
			SetTask(nRealTaskid, GetTask(nRealTaskid) + 1);
		end
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --获得当前玩家所在位置
			local nmembertaskidx = GetTask(nGetTaskid);
			if (nmembertaskidx == nGoalIdx and nmembertaskidx == ntaskidx) then   --判断是否在杀死怪物的玩家的所在地图
				SetTask(nRealTaskid, GetTask(nRealTaskid) + 1);
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
	end
end