Include("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua")

PrepareGame.nPassTime = 0 --每场报名开始到现在走过的时间


function PrepareGame:InitTimer()
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return
	end
	
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	
	self.nPassTime = 0
	local nTime = 1 * 60
	self.nTimeIndex = AddTimer(nTime * 18, "PrepareGame:OnTime", 0)
	Msg2Map(PREPARE_MAP, "训练新木人比赛已经开始")
	AddGlobalNews("皇城训练宫报名开始，请各位大侠快去临安提点官处参加报名")
end

function PrepareGame:OnTime(nTimerId, nParam)
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return 0, 0
	end
	
	self.nPassTime = self.nPassTime + 60
	local nRestTime = PREPARETIME * 60 - self.nPassTime
	if nRestTime > 0 then
		Msg2Map(PREPARE_MAP, format("还有 %d分钟寻找木人活动将开始", floor(nRestTime / 60)))
		return 60 * 18, 0
	end
	
	------开启比赛,将玩家传送进比赛场---
	self:GoToGame()
	DynamicExecute("\\script\\missions\\zhaojingling\\game\\gametimer.lua", "Game:InitTimer")
	return 0, 0
end

