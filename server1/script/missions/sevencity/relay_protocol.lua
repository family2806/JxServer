Include("\\script\\missions\\sevencity\\war.lua")

RelayProtocol = {m_Step = 0}

function RelayProtocol:StartSignup(param, result)
	if (self.m_Step == 0) then
		BattleWorld:StartSignup()
		self.m_Step = 1
	end
end

function RelayProtocol:CloseSignup(param, result)
	if (self.m_Step == 1) then
		BattleWorld:CloseSignup()
		self.m_Step = 2
	end
end

function RelayProtocol:Prepare(param, result)
	if (self.m_Step == 2) then
		BattleWorld:Create()
		self.m_Step = 3
	end
end

function RelayProtocol:Start(param, result)
	if (self.m_Step == 3) then
		BattleWorld:Start()
		self.m_Step = 4
	end
end

function RelayProtocol:Close(param, result)
	WriteLog(format("[SEVENCITY]Notify to close, step(%d)", self.m_Step))
	BattleWorld:Close()
	if (self.m_Step == 4) then
		self.m_Step = 0
	end
end

function RelayProtocol:SyncTongWarriorCount(param, result)
	local tong = ObjBuffer:PopObject(param)
	local count = ObjBuffer:PopObject(param)
	if (type(tong) == "string" and type(count) == "number") then
		BattleWorld:SyncTongWarriorCount(tong, count)
	end
end

function RelayProtocol:SyncSignup(param, result)
	local tong = ObjBuffer:PopObject(param)
	if (type(tong) == "string") then
		BattleWorld:SyncSignup(tong)
	end
end

function RelayProtocol:SyncEmploy(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local tong = buff:Pop()
	BattleWorld:SetWarriorTong(name, tong)
end

function RelayProtocol:SyncTopList(param, result)
	local buff = ObjBuffer:New(param)
	local toplist = buff:Pop()
	BattleWorld:SetTopList(toplist)
end

function RelayProtocol:SyncViceroy(param, result)
	local buff = ObjBuffer:New(param)
	local mapid = buff:Pop()
	local tong = buff:Pop()
	local flag = buff:Pop()
	local msg = nil
	local city = MAP_INFO[mapid].CityName
	if (flag == 1 and tong ~= "") then
		msg = format("帮会<color=red>%s<color> 已经占领成功 <color=red>%s<color> !",
					tong,
					city)
	elseif (tong ~= "") then
		msg = format("<color=red>%s<color> 守城成功，继续占领 <color=red>%s<color>!",
					tong,
					city)
	else
		msg = format("<color=red>%s<color> 无人占领.", city)
	end
	AddGlobalCountNews(msg, 3)
end
