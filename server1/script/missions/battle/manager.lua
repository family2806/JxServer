Include("\\script\\missions\\battle\\battle.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\battle\\lib.lua")
Include("\\script\\trip\\define.lua")

MAX_BATTLE_COUNT = 10
BattleManagerDef = 
{
	{"S¬ cÊp Tèng Kim liªn server", 972, 5000, 35000},
	{"Trung cÊp Tèng Kim liªn server", 973, 30000, 50000},
	{"Cao cÊp Tèng Kim liªn server", 974, 45000},
}

NPC_LIST = 
{
	{235, "³µ·ò", {1535,3154},"\\script\\missions\\battle\\npc\\chefu.lua"},
	{55, "¾üÐè¹Ù", {1546,3159}, "\\script\\missions\\battle\\npc\\doctor.lua"},
	{62,"Ä¼±ø¹Ù", {1549,3179}, "\\script\\activitysys\\npcdailog.lua"},
}

START_TIME = 0900
END_TIME = 2400

BattleManagerList = {}
BattleManager = {}
BattleManagerPlayer = {}
BattleManager.tbBattle = {}
BattleManager.tbSignUpPos = {20,3546,6226}

function BattleManager:new(szName, nMapId, nMinEqValue, nMaxEqValue)
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb:_init(szName, nMapId, nMinEqValue, nMaxEqValue)
	BattleManagerList[nMapId] = tb
	return tb
end

function BattleManager:_init(szName, nMapId, nMinEqValue, nMaxEqValue)
	self.nMapId = nMapId
	self.szName = szName
	self.nMinEqValue = nMinEqValue
	self.nMaxEqValue = nMaxEqValue
	self.tbSignUpPos = {self.nMapId,1541, 3178}
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		self.tbBattle = %Array.new()
		AutoFunctions:Add(self.OnSeverStart, self)
	end
end


function BattleManager:OnSeverStart()
	if SubWorldID2Idx(self.nMapId) < 0 then
		return
	end
	ClearMapNpc(self.nMapId)
	for i=1, getn(NPC_LIST) do
		local tbNpc = NPC_LIST[i]
		self:AddNpc(unpack(tbNpc))
	end
	local nHM = tonumber(GetLocalDate("%H%M"))
	if START_TIME <= nHM and nHM <= END_TIME then
		self:Run()
	end
	self:OpenTimer()
end

function BattleManager:AddNpc(nNpcId, szName, tbPos, szLuaFile)
	NpcFunLib:AddObjNpc(szName, nNpcId, {{self.nMapId, tbPos[1] ,tbPos[2]}}, szLuaFile )
end



function BattleManager:SignUp(nId, nCamp)
	local pBattle = %Array.get(self.tbBattle, nId)
	if not pBattle then
		return 
	end
	local szName = GetName()
	local pPrevBattle = BattleManagerPlayer[szName]
	
	if pPrevBattle then
		if pPrevBattle.nId == nId then
			local nOldCamp = pPrevBattle.Data:GetPLData(szName, "BATTLECAMP")
			if nOldCamp ~= 0 and nOldCamp ~= nCamp then
				print(szName, pPrevBattle.Data:GetPLData(szName, "BATTLECAMP"))
				return Talk(1, "", "Ng­¬i kh«ng thÓ ®æi qu©n doanh trong cïng mét trËn Tèng Kim")
			end
		end
		local bRet = pPrevBattle:IsInPlaying(szName)
		if bRet then
			return Talk(1, "", "Ng­¬i ®ang ë trong mét chiÕn tr­êng kh¸c")
		end
		pPrevBattle:CancelWaiting(szName)
	end
	if pBattle:JoinWaiting(szName, nCamp) then
		BattleManagerPlayer[szName] = pBattle
		--Fix lçi text - Modified by DinhHQ - 20111025
		Msg2Player(format("Ng­¬i ®· thµnh c«ng gia nhËp vµo %s danh s¸ch b¸o danh", %CAMP_NAME[nCamp]));
	end
	
end

function BattleManager:PlayerLeaveQueue(szName)
	%BattleManagerPlayer[szName] = nil
end

function BattleManager:Run()
	local nCount = %Array.size(self.tbBattle)
	if nCount > 0 then
		local pBattle = %Array.last(self.tbBattle)
		if pBattle.nState == SIGNUP_STATE then
			pBattle:Run()
		end
	else
		self:CreateBattle()
	end
end

function BattleManager:CreateBattle()
	local nHM = tonumber(GetLocalDate("%H%M"))
	if START_TIME <= nHM and nHM <= END_TIME then
		if %Array.size(self.tbBattle) < %MAX_BATTLE_COUNT then
			local nId = %Array.new_id(self.tbBattle)
			%Array.add(self.tbBattle, BattleClass:new(nId, self))
		end
	end
end

function BattleManager:GetBattle(nId)
	return %Array.get(self.tbBattle, nId)
end

function BattleManager:GetList()
	local tb = {}
	for k, v in %Array.pairs(self.tbBattle) do
		if v then
			tinsert(tb, v:GetInfo())
		end
	end
	return tb
end



function BattleManager:DelBattle(nId)
	%Array.del(self.tbBattle, nId)
end

function BattleManager:OpenTimer()
--	local nYear = tonumber(GetLocalDate("%Y"))
--	local nMonth = tonumber(GetLocalDate("%m"))
--	local nDay = tonumber(GetLocalDate("%d"))
--	local nHM = tonumber(GetLocalDate("%H%M"))
	
--	local nTime = Tm2Time(nYear, nMonth, nDay, floor(START_TIME/100), mod(START_TIME,100))
--	local nNextTime = nTime - GetCurServerTime() 
	
--	if nNextTime <= 0 then
--		nNextTime = nNextTime + 24 * 60 * 60
--	end
	TimerList:AddTimer(self, 60 * 18)
end

function BattleManager:OnTime()
	
	local nHM = tonumber(GetLocalDate("%H%M"))
	if START_TIME <= nHM and nHM <= END_TIME then
		if %Array.size(self.tbBattle) <= 0 then
			self:CreateBattle()
		end	
	end
	return 1
end
	
for i=1, getn(BattleManagerDef) do
	BattleManager:new(unpack(BattleManagerDef[i]))
end