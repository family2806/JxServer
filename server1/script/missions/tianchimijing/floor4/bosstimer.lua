Include("\\script\\missions\\tianchimijing\\floor4\\gamefloor4.lua")

local nMapId = 947

function GameFloor4:CallBossInit()
	if SubWorldID2Idx(%nMapId) <= 0 then
		return
	end
	local nTime = self:RandomTime()	
	if nTime < 0 then
		nTime = nTime + 24 * 60 * 60
	end
	
	AddTimer(nTime * 18, "GameFloor4:OnTime", 0)
end

function GameFloor4:TestCallBoss(nTime)
	AddTimer(nTime * 18, "GameFloor4:OnTime", 0)
end


function GameFloor4:RandomTime()
	local nYear = tonumber(GetLocalDate("%Y"))
	local nMonth = tonumber(GetLocalDate("%m"))
	local nDay = tonumber(GetLocalDate("%d"))
	--Change Boss time - Modified By DinhHQ - 20120403
	local nHour = random(8, 19)
	local nMinute = random(0, 59)
	local nNextTime = Tm2Time(nYear, nMonth, nDay, nHour, nMinute)
	local nCurTime = GetCurServerTime()
	local nTime = nNextTime - nCurTime
	return nTime
end

function GameFloor4:OnTime(nTimerId, nParam)
	if SubWorldID2Idx(%nMapId) <= 0 then
		return 0,0
	end
	self:CallBoss()
	local nTime = self:RandomTime()
	
	nTime = nTime + 24 * 60 * 60
	
	return nTime * 18, 0
end

function GameFloor4:CallBoss()
	if SubWorldID2Idx(%nMapId) <= 0 then
		return
	end	
	local tbNpc = self.tbNpcTypeList
	local tbBoss = tbNpc["boss"]
	self:AddANpc("boss", tbBoss.szPosPath)
	AddGlobalNews("完颜广阳在天池秘境出来了吗")
	self:WriteLog(4, "Boss完颜广阳在天池秘境出现")
end