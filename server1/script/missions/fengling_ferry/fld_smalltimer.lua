Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

function OnTimer()
	t = GetMissionV(MS_TIMEACC_20SEC) + 1
	SetMissionV(MS_TIMEACC_20SEC, t)
	local npcindex
	if (t == ENDSIGN_TIME) then		--报名时间结束，开船
		RunMission(MISSIONID)
		Msg2MSAll(MISSIONID, "船开了，30分钟后降到风陵渡北岸.")
		
		-- 日常任务刷新对话NPC
		%tbTalkDailyTask:AddTalkNpc(SubWorldIdx2ID(SubWorld), SubWorldIdx2ID(SubWorld));
	end
	
	if (mod(t, 3) == 0) then				--每分钟计数
		SetMissionV(MS_TIMEACC_1MIN, GetMissionV(MS_TIMEACC_1MIN) + 1)
	end
	
	if (t < ENDSIGN_TIME and mod(t, 9) == 0) then
		local bf_mint = 10 - GetMissionV(MS_TIMEACC_1MIN)
		Msg2MSAll(MISSIONID, "还剩"..bf_mint.." 分钟离港")
	end
	
	if (t >= ENDSIGN_TIME and mod(t, 15) == 0) then
		local mint = 39 - GetMissionV(MS_TIMEACC_1MIN)
		Msg2MSAll(MISSIONID, "还剩"..mint.." 分钟后到风陵渡北岸")
	end
	
	if (t == REPORT_TIME) then
		local mint = 39 - GetMissionV(MS_TIMEACC_1MIN)
		Msg2MSAll(MISSIONID, "还剩"..mint.." 分钟后到风陵渡北岸")
	end
	
	if (t == UPBOSS_TIME) then		-- 15分钟
		posx, posy = fld_getadata(npcthiefpos)
		npcindex = AddNpc(725, 85, SubWorld, posx, posy, 1, "水贼头领", 1)
		SetNpcDeathScript(npcindex, "\\script\\missions\\fengling_ferry\\bossdeath.lua");
		Msg2MSAll(MISSIONID, "水贼头领已出现.")
	end
	
	if (t == UPBOSS_TIME2) then		-- 20分钟
		posx, posy = fld_getadata(npcthiefpos)
		npcindex = AddNpc(725, 85, SubWorld, posx, posy, 1, "水贼头领", 1)
		SetNpcDeathScript(npcindex, "\\script\\missions\\fengling_ferry\\bossdeath.lua");
		Msg2MSAll(MISSIONID, "水贼头领已出现.")
		
		if (check_new_shuizeitask() == 1) then
			for i = 1, 2 do
				posx, posy = fld_getadata(npcthiefpos)
				AddNpc(1692, 85, SubWorld, posx, posy, 1, "水贼大头领.", 1)
				Msg2MSAll(MISSIONID, "水贼大头领 出现了")
			end
		end
	end
	
	if (t == UPBOSS_TIME3) then
		posx, posy = fld_getadata(npcthiefpos)
		npcindex = AddNpc(725, 85, SubWorld, posx, posy, 1, "水贼头领", 1)
		SetNpcDeathScript(npcindex, "\\script\\missions\\fengling_ferry\\bossdeath.lua");
		Msg2MSAll(MISSIONID, "水贼头领已出现.")
	end		
	
	-- 活跃度
	fld_addhuoyuedu(t)
end


function fld_addhuoyuedu(nPassedTime)
	local nMapId = SubWorldIdx2ID(SubWorld)
	if nMapId == boatMAPS[3] or nPassedTime ~= (ENDSIGN_TIME + HUOYUEDU_TIME) then
		return
	end
	
	local nIndex = 0
	local nPlayerIndex = 0
	local nCount = GetMSPlayerCount(MISSIONID, 0);
	for i=1, nCount do 
		nIndex, nPlayerIndex = GetNextPlayer(MISSIONID, nIndex, 0)
		if (nPlayerIndex > 0) then
			DynamicExecuteByPlayer(nPlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "fenglingdu")
 		end
		if (nIndex == 0) then
	 		break
	 	end
	end
end