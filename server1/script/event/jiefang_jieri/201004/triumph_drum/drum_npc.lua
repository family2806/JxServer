-- 凯旋鼓
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

tbDrumNpc = {};
tbDrumNpcList = {};

function OnTime(NpcIndex)
	local tbDrumNpc = tbDrumNpcList[NpcIndex];
	if (tbDrumNpc) then
		return tbDrumNpc:OnTime()
	else
		return 0, 0
	end
end

function tbDrumNpc:New(szTongName, nTongId)
	
	local tb = clone(tbDrumNpc)
	local w,x,y = GetWorldPos();
	tb.Pos = {SubWorldID2Idx(w), x*32, y*32};
	tb.NpcIndex = AddNpc(tbTriumphDrum.nNPCID, 1, tb.Pos[1], tb.Pos[2], tb.Pos[3], 0, format("凯旋鼓 <%s>",szTongName));
	tb.nTongId = nTongId;
	tb.TimerCount = tbTriumphDrum.nTimerCount;
	
	if (tb.NpcIndex <= 0) then
		return nil;
	end

	tbDrumNpcList[tb.NpcIndex] = tb;
	AddTimer(tbTriumphDrum.nTimerOut, "OnTime", tb.NpcIndex);
	return tb;
end

function tbDrumNpc:OnTime()
	
	self.TimerCount = self.TimerCount - 1;
	
	if self.TimerCount < 0 then
		if (self.TimerCount * -1) > tbTriumphDrum.nTimerShow then
			DelNpc(self.NpcIndex);
			tbDrumNpcList[self.NpcIndex] = nil;
			return 0, 0;
		else
			return tbTriumphDrum.nTimerOut, self.NpcIndex;
		end 
	end
	
	local nOldPlayer = PlayerIndex;
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(self.NpcIndex, tbTriumphDrum.nSercherRange);
	local tbGoodPlayer = {};
	
	for i = 1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i];
		local szTongName, nTongId = GetTongName();
		if nTongId == self.nTongId and GetLevel() >= tbTriumphDrum.nLimit_Level then
			tbGoodPlayer[getn(tbGoodPlayer)+ 1] = PlayerIndex;
		end 
	end
		
	local nGoodPlayerCount = getn(tbGoodPlayer);
	local nGoodPlayerExp = tbTriumphDrum:GetExp(nGoodPlayerCount);
	local tbAwardItem = {nExp = nGoodPlayerExp};
	local szMsg = format("现在有 %d成员站在凯旋鼓旁. 可以得到 %d经验.", nGoodPlayerCount, nGoodPlayerExp);
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	Msg2Tong(self.nTongId, szMsg);
	
	for i = 1, nGoodPlayerCount do
		PlayerIndex = tbGoodPlayer[i];
		--Fix凯旋鼓只能有1次经验- Modified By DinhHQ - 20111202
		--local nTaskLastAward  = tbTriumphDrum.tbTaskGroup:GetTask(tbTriumphDrum.nTaskID_LastAward);
		--local nTaskAwardCount = tbTriumphDrum.tbTaskGroup:GetTask(tbTriumphDrum.nTaskID_AwardCount);
			
--		if nTaskLastAward ~= nCurDay then
--			nTaskLastAward = nCurDay;
--			nTaskAwardCount = 0;
--			tbTriumphDrum.tbTaskGroup:SetTask(tbTriumphDrum.nTaskID_LastAward, nCurDay);
--			tbTriumphDrum.tbTaskGroup:SetTask(tbTriumphDrum.nTaskID_AwardCount, 0);
--		end
		local nDailyAwardCount = PlayerFunLib:GetTaskDailyCount(tbTriumphDrum.nTaskID_DailyAwardLimit)
		
		if nDailyAwardCount < tbTriumphDrum.nLimit_DayAward then
			--tbTriumphDrum.tbTaskGroup:AddTask(tbTriumphDrum.nTaskID_AwardCount, 1);
			PlayerFunLib:AddTaskDaily(tbTriumphDrum.nTaskID_DailyAwardLimit, 1)
			tbAwardTemplet:GiveAwardByList(tbAwardItem, "凯旋鼓奖励");
		else
			Msg2Player("今天各位领取的奖励已经超过了规定数量!");
		end
	end
	
	PlayerIndex = nOldPlayer;
	return tbTriumphDrum.nTimerOut, self.NpcIndex;
end