Include("\\script\\event\\change_destiny\\head.lua");

-- 任务:在一场高级宋金中获得3000累积积分
function tbChangeDestiny:completeMission_Battle(tbPlayers)

	if self:isCarryOn() ~= 1 then
		return
	end

	if BT_GetGameData(GAME_LEVEL)~= 3 then
		return
	end

	local old_player = PlayerIndex;
	for i = 1, getn(tbPlayers) do
		PlayerIndex = tbPlayers[i];
		local bCanJoin = self:canJoin();
		local nBattlePoint = BT_GetData(PL_TOTALPOINT);
		local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_Battle);
		
		if (nBattlePoint >= 3000 and bCanJoin == 1 and nMissionStep == self.nStep_accepted) then
			self:setMissionInfo(self.nMissionID_Battle, self.nStep_completed, nMissionDate);
			Msg2Player("大侠已完成神农老者的宋金3000累积积分任务")
		end
	end
	PlayerIndex = old_player;
end

-- 任务:在高级闯关中打败聂弑尘
function tbChangeDestiny:completeMission_NieShiChen(nNpcSettingIdx)
	
	if self:isCarryOn() ~= 1 then
		return
	end
	
	local index = 0;
	local player = 0;
	local old_player = PlayerIndex;
	
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			PlayerIndex = player;
			
			local bCanJoin = self:canJoin();
			local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_NieShiChen);
			
			if (bCanJoin == 1 and nMissionStep == self.nStep_accepted and nNpcSettingIdx == self.nLimit_NieShiChen) then
				self:setMissionInfo(self.nMissionID_NieShiChen, self.nStep_completed, nMissionDate);
				Msg2Player("大侠已完成神农老者的打败聂弑尘任务.")
			end
		end
		if (index == 0) then
			break;
		end	
	end
	
	PlayerIndex = old_player;
end

-- 任务:在风陵渡打败水贼头领
function tbChangeDestiny:completeMission_WaterThief()
	
	if self:isCarryOn() ~= 1 then
		return
	end
	
	if self:canJoin() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_WaterThief);
	if (nMissionStep == self.nStep_accepted ) then
		self:setMissionInfo(self.nMissionID_WaterThief, self.nStep_completed, nMissionDate);
		Msg2Player("大侠已完成神农老者的打败水贼首领任务")
	end
end

-- 任务:通过4次90级杀手任务（该任务在聂弑尘处领取）
function tbChangeDestiny:completeMission_Killer(tbPlayers)
	
	if self:isCarryOn() ~= 1 then
		return
	end
	
	if self:canJoin() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_Killer);
	local nNextStep = nil;
	
	if nMissionStep == self.nStep_accepted then
		nNextStep = self.nStep_partiallyCompleted_1;
	elseif nMissionStep == self.nStep_partiallyCompleted_1 then
		nNextStep = self.nStep_partiallyCompleted_2;
	elseif nMissionStep == self.nStep_partiallyCompleted_2 then
		nNextStep = self.nStep_partiallyCompleted_3;
	elseif nMissionStep == self.nStep_partiallyCompleted_3 then
		nNextStep = self.nStep_completed;
	end
	
	if nNextStep ~= nil then
		self:setMissionInfo(self.nMissionID_Killer, nNextStep, nMissionDate);
	end
	
	if nNextStep == self.nStep_completed then
		Msg2Player("大侠已完成神农老者的打败四大杀手任务.")
	end
	
end