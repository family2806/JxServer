Include("\\script\\missions\\zhaojingling\\game\\game.lua")
Include("\\script\\lib\\objbuffer_head.lua")

Game.nInterval = 15 --单位秒 
Game.nPassTime = 0 --已经过了多少时间,单位秒
Game.nRemindInterval = 30 --系统每30秒提示玩家排名和找到傀儡木人的数量

local szRemoteScript = "\\script\\event\\zhaojingling\\event.lua"

function Game:InitTimer()
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	self.nPassTime = 0
	self.nTimeIndex = AddTimer(self.nInterval * 18, "Game:OnTime", 0)
end

function Game:OnTime(nTimerId, nParam)
	self.nPassTime = self.nPassTime + self.nInterval
	local nTimeDis = self.nPassTime - GAMETIME * 60
	local nValue = mod(self.nPassTime, self.nRemindInterval)
	if nValue == 0 then
		self:SortPaiMing(nTimeDis)
	end
		
	if nTimeDis >= 0 then
		--比赛结束,停止计时器
		self:Over()
		return 0, 0
	end
	
	local nNotAddMuRen = 0
	if self.nPassTime == self.nInterval then
		--比赛开始前15秒钟的时候不加载傀儡木人
		nNotAddMuRen = 1
	end
	
	if self.nPassTime >= (GAMETIME * 60 - self.nRemindInterval) then
		--比赛最后30秒不加载傀儡木人
		nNotAddMuRen = 1
	end
	
	if nNotAddMuRen ~= 1 then
		self:AddAllMuRen() --每过15秒加载一次傀儡木人
	end
	return self.nInterval * 18, 0
end

function Game:SortPaiMing(nTimeDis)
	if self.tbPlayer == nil then
		return
	end
	for key, value in self.tbPlayer do
		self:SortPaiMingOneMap(key, value, nTimeDis)
	end
end

function Game:SortPaiMingOneMap(nMapId, tbMapPlayer, nTimeDis)
	for key, value in tbMapPlayer do
		self:SortPaiMingOneRoom(nMapId, value, nTimeDis)
	end
end

function Game:SortPaiMingOneRoom(nMapId, tbRoomPlayer, nTimeDis)
	local tbPlayerName = {}
	for key, value in tbRoomPlayer do
		local nPlayerIndex = SearchPlayer(value)
		if nPlayerIndex > 0 then
			local nCount = CallPlayerFunction(nPlayerIndex, GetTask, TSK_COUNT_ONETIME)
			if nCount > 0 then
				tinsert(tbPlayerName, {value, nCount})
			end
		end
	end
	sort(tbPlayerName, self.SortCompare)
	local nIndex = 1
	for key, value in tbPlayerName do
		if key ~= "n" then
			local nPlayerIndex = SearchPlayer(value[1])
			if nPlayerIndex > 0 then
				local nCurMapId = getplayermapid(nPlayerIndex)
				if nCurMapId == nMapId then
					CallPlayerFunction(nPlayerIndex, SetTask, TSK_RANK, nIndex)
					local szMsg = format("你已找到%d木人，目前排名第%d", value[2], nIndex)
					CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
					local nRoomId = CallPlayerFunction(nPlayerIndex, GetTask, TSK_GROUPID)
					local szAccount = CallPlayerFunction(nPlayerIndex, GetAccount)
					WriteLog(format("[ 木人时间 :%s 房间号: %d 排名:%d account: %s 人物: %s 数量: %s", GetLocalDate("%Y-%m-%d %H:%M"), nRoomId, nIndex, szAccount, value[1], value[2]))
					nIndex = nIndex + 1
					if nTimeDis >= 0 then --一局结束的时候
						self:AddMuRenCount(value[1], value[2])
					end
				end
			end
		end
	end
end

--按找到傀儡木人的数量从大到小排列
Game.SortCompare = function(tbA, tbB)
	return tbA[2] > tbB[2]
end

function Game:AddMuRenCount(szName, nCount)
	if nCount == 0 then
		return
	end
	local obj = ObjBuffer:New()
	obj:Push(szName)
	obj:Push(nCount)
	RemoteExecute(%szRemoteScript, "tbJingLing:g2s_AddCount", obj.m_Handle)
	obj:Destroy()
end
