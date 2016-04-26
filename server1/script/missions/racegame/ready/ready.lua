if racegame_tbReadyMission then
	return 
end
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
Include("\\script\\missions\\racegame\\racegame.lua")
Include("\\script\\missions\\racegame\\base\\head.lua")
Include("\\script\\lib\\mem.lua")

racegame_tbReadyMission = new(tbMission)

racegame_tbReadyMission.nMissionId = 52 
racegame_tbReadyMission.tbTimer =  {{90, 18*1}}
racegame_tbReadyMission.nLatencyTime = 60     -- 等待时间60秒
racegame_tbReadyMission.nSignUpTime = 50     -- 50秒后不能报名
racegame_tbReadyMission.nMapId = 582     -- 地图Id
racegame_tbReadyMission.nPlayerCountLimit = 120     -- 最多120人参加
racegame_tbReadyMission.nLevelLimit	= 50
racegame_tbReadyMission.tbWaitPos = 
{
	{1589, 3029},
	{1595, 2964},
	{1582, 2972},
	{1562, 2946},
	{1560, 2965},
	{1558, 2989},
	{1569, 3029},
}
racegame_tbReadyMission.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	
}

racegame_tbReadyMission.tbMissionS =
{
	
}


function racegame_tbReadyMission:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	
	nTimerCount = nTimerCount + 1
	local szMsg = format("剩余时间为 <color=yellow>%d<color> 秒.", self.nLatencyTime - nTimerCount)
	
	if nTimerCount >= self.nSignUpTime and GetMissionV(self.tbMissionV.MISSION_STATE) ~= 3 then
		SetMissionV(self.tbMissionV.MISSION_STATE, 3)
		gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 3)
	end
	
	
	if nTimerCount >= self.nLatencyTime then
		self:CloseGame()
		return
	elseif nTimerCount >= self.nLatencyTime - 10 or mod(nTimerCount, 10) == 0 or nTimerCount == 1 then
		Msg2MSAll(self.nMissionId, szMsg)
	end
	
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
end



function racegame_tbReadyMission:OnClose()
	gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 0)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	if (nPlayerCount <= 0) then
		return
	end;
	local bIsOpen = racegame_tbMission:StartGame()
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, 0);
		if (pidx > 0) then
			tinsert(tbPlayer, pidx)
			
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	for i = 1, getn(tbPlayer) do
		if bIsOpen ~= 1 then
			doFunByPlayer(tbPlayer[i], jiefang_0804_ResetTask)
			local nPlayerMapId = doFunByPlayer(tbPlayer[i], GetTask, jiefang_0804_TSK_MapId)
			if nPlayerMapId == 0 then
				nPlayerMapId = 524
			end
			doFunByPlayer(tbPlayer[i], NewWorld, nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
			doFunByPlayer(tbPlayer[i], Msg2Player, "前面路不通，请等下场比赛.")
		else
			local nX, nY = getadata("\\settings\\battles\\maps\\river\\大营2.txt")
			doFunByPlayer(tbPlayer[i], NewWorld, racegame_tbMission.nMapId, nX/32, nY/32)	
		end
		
	end
	
end


function racegame_tbReadyMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
	gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 1)
	
end

function racegame_tbReadyMission:OnRun()
	SetMissionV(self.tbMissionV.MISSION_STATE, 2)
	gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 2)
end

function racegame_tbReadyMission:OnPlayerJoin()
	--传送到赛场
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	if nPlayerCount >= self.nPlayerCountLimit or GetLevel() < self.nLevelLimit then	
		jiefang_0804_ResetTask()
		local nPlayerMapId = GetTask(jiefang_0804_TSK_MapId)
		if nPlayerMapId == 0 then
			nPlayerMapId = 524
		end
		NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
		if nPlayerCount >= self.nPlayerCountLimit then
			Msg2Player("参加活动人数已够了，你参加下一场吧!")
			Say("参加活动人数已够了，你参加下一场吧!", 0)
		elseif GetLevel() < self.nLevelLimit then
			Msg2Player(format("等级不足 %s, 不能参加活动.", self.nLevelLimit))
			Say(format("等级不足 %s, 不能参加活动.", self.nLevelLimit), 0)
		end
		return 0
	end
	
	ForbitSkill(1);
	SetMoveSpeed(18);

	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);
	--设置战斗状态
	SetFightState(0);
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	--无死亡惩罚
	SetPunish(0);
	--关闭组队功能
	SetCreateTeam(0);
	
	--禁止光环
	ForbitAura(1)
	--设置仇杀
	ForbidEnmity( 1 )
	--打开PK开关 
	--开始应该都不能PK
	SetPKFlag(0)
	--禁止交易;
	DisabledStall(1);
	ForbitTrade(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);	--禁止使用回程；
	
	return 1;
end

function racegame_tbReadyMission:OnLeave()
	ForbitSkill(0);
	SetMoveSpeed(-1);
	
	--关闭禁止光环
	ForbitAura(0)
	--关闭设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,0);
	--设置战斗状态
	SetFightState(0);
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	--SetLogoutRV(0);
	--死亡惩罚
	SetPunish(1);
	--开启组队功能
	SetCreateTeam(0);
	--打开PK开关 
	
	--设置仇杀
	ForbidEnmity( 0 )
	--开始应该都不能PK
	SetPKFlag(0)
	--关闭禁止交易;
	DisabledStall(0);
	ForbitTrade(0);
	
	local nCamp = GetCamp();
	SetCurCamp(nCamp);
	
	ForbidChangePK(0);
	DisabledUseTownP(0);	--关闭禁止使用回程；
	
end