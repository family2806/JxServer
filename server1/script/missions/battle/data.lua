IncludeLib("BATTLE")
IncludeLib("TITLE")
Include("\\script\\trip\\define.lua")

BattleData = {}

PL_DATA = 
{
	TOTALPOINT = {1, 751},
	KILLPLAYER = {2,702},
	KILLNPC = {3, 703},	
	BEKILLED = {4, 704},
	MAXSERIESKILL = {13, 713},		--玩家整个战局的最大连斩数
	SERIESKILL = {14, 714},			--玩家当前的连斩数
	CURRANK = {27, 727},
	BATTLECAMP = {43, 743},
	--BATTLEPOINT = {47, 747},	--记录玩家本战役的总积分，总积分是玩家所参加的各场战局的积分总和, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
}
GAME_DATA = 
{
	
	MAP_ID = 4,
	RESTTIME = 8,
}

CAMP_SONG = 1
CAMP_KIM = 2
CAMP_NAME = {[CAMP_SONG] = "宋方", [CAMP_KIM] = "金方"}
TITLE = {"<color=white>士兵<color>", "<color=0xa0ff>校尉<color>", "<color=0xff>统领<color>", "<color=yellow>副将<color>", "<bclr=red>大将<bclr><color>"}
TITLE_EFFECT = 
{
	[CAMP_SONG] = {89,90,91,92,93},
	[CAMP_KIM] = {94,95,96,97,98},
}

function BattleData:NewPlayer(szName, nCamp)
	
	--self:ClearUIData(szName)
	if not self.tbPlayer[szName] then
		self.tbPlayer[szName]  = {}
		for k, v in PL_DATA do
			self:SetPLData(szName, k, 0)
		end
	else
		for k, v in PL_DATA do
			self:SetPLData(szName, k, self.tbPlayer[szName][k])
		end
	end
	self:SetPLData(szName, "BATTLECAMP", nCamp)
	self:SetPLData(szName, "CURRANK", 1)
	self:SyncData(szName)
	return self.tbPlayer[szName]
end


function BattleData:AddTotalPoint(szName, nPoint)
	self:SetTotalPoint(szName, self:GetTotalPoint(szName) + nPoint)
end

function BattleData:GetTotalPoint(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 0
	end
	return CallPlayerFunction(nPlayerIndex, GetTask, %TSK_TRIP_BATTLE_POINT)
end

function BattleData:SetTotalPoint(szName, nPoint)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 
	end
	CallPlayerFunction(nPlayerIndex, SetTask, %TSK_TRIP_BATTLE_POINT, nPoint)
end

function BattleData:GetPLData(szName, szKey)
	local pPlayer = self.tbPlayer[szName]
	if not pPlayer then
		return 0
	end
	if not szKey then
		return pPlayer
	end
	return pPlayer[szKey]
end

function BattleData:SetPLData(szName, szKey, nValue)
	local pPlayer = self.tbPlayer[szName]
	if not pPlayer then
		return 0
	end
	if not szKey then
		return pPlayer
	end
	local tbDataId = PL_DATA[szKey]
	if not tbDataId then
		return 0
	end
	if szKey == "CURRANK" then
		self:RemoveTitle(szName)
	end
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex,  BT_SetData, tbDataId[1], nValue)
	end
	pPlayer[szKey] = nValue
	if szKey == "CURRANK" then
		self:ActiveTitle(szName)
	end
end

function BattleData:ActiveTitle(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 
	end
	local nCamp = self:GetPLData(szName, "BATTLECAMP")
	local nCurRank = self:GetPLData(szName, "CURRANK")
	if nCamp and nCurRank and TITLE_EFFECT[nCamp] then
		local nTitleEffectId = TITLE_EFFECT[nCamp][nCurRank]
		if nTitleEffectId then
			CallPlayerFunction(nPlayerIndex, Title_AddTitle, nTitleEffectId, 0, 9999999)
			CallPlayerFunction(nPlayerIndex, Title_ActiveTitle, nTitleEffectId)
		end
	end
end

function BattleData:RemoveTitle(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 
	end
	local nCamp = self:GetPLData(szName, "BATTLECAMP")
	local nCurRank = self:GetPLData(szName, "CURRANK")
	if nCamp and nCurRank and TITLE_EFFECT[nCamp] then
		local nTitleEffectId = TITLE_EFFECT[nCamp][nCurRank]
		if nTitleEffectId then
			CallPlayerFunction(nPlayerIndex, Title_RemoveTitle, nTitleEffectId)
			CallPlayerFunction(nPlayerIndex, Title_ActiveTitle, 0)
		end
	end
end

function BattleData:AddPLData(szName, szKey, nValue)
	local nCurValue = self:GetPLData(szName, szKey)
	self:SetPLData(szName, szKey, nCurValue + nValue)
end

function BattleData:GetCampPoint(nCamp)
	if self.tbCampPoint[nCamp] then
		return self.tbCampPoint[nCamp]
	else
		return 0
	end
end
function BattleData:AddCampPoint(nCamp, nValue)
	if self.tbCampPoint[nCamp] then
		self.tbCampPoint[nCamp] = self.tbCampPoint[nCamp] + nValue
	end
end

function BattleData:_init()	
	self.tbPlayer = {}
	self.tbCampPoint = {}
	self.tbCampPoint[CAMP_SONG] = 0
	self.tbCampPoint[CAMP_KIM] = 0
	
end

function BattleData:SyncCampSize(nSize1, nSize2, tbPlayerIndex)
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SendMemberCount(nSize1, nSize2, tbPlayerIndex)
	self:UseMapIdx(nMapIndex)
end

function BattleData:SetRestTime(nRestTime)
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SetGameData(GAME_DATA.RESTTIME, nRestTime)
	self:UseMapIdx(nMapIndex)
end

function BattleData:InitData(nMapId)
	self.nMapId = nMapId
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SetGameData(GAME_DATA.MAP_ID, nMapId)
	for k, v in PL_DATA do
		if v and v[1] and v[2] then
			BT_SetType2Task(v[1], v[2])
		end
	end	
	BT_SetView(PL_DATA.TOTALPOINT[1])
	BT_SetView(PL_DATA.KILLPLAYER[1])
	BT_SetView(PL_DATA.BEKILLED[1])
	BT_SetView(PL_DATA.MAXSERIESKILL[1])
	
	self:UseMapIdx(nMapIndex)
end

function BattleData:new()
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb:_init()
	return tb
end

function BattleData:SyncLadder(nLadderNo, tbPlayerIndex)
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SendLadderNo(nLadderNo, tbPlayerIndex)
	self:UseMapIdx(nMapIndex)
end

function BattleData:ClearUIData(szName)
	self:RemoveTitle(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
		CallPlayerFunction(nPlayerIndex, BT_ClearPlayerData)
		CallPlayerFunction(nPlayerIndex, BT_LeaveBattle)
		self:UseMapIdx(nMapIndex)
	end
end

function BattleData:UseMapIdx(nMapIndex)
	local nCurMapIndex = SubWorld
	SubWorld = nMapIndex
	return nCurMapIndex
end

function BattleData:SetGameInfo(tbInfo)
	
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	if tbInfo then
		BT_SetBattleName(tbInfo.szBattleName)
		BT_SetMissionName(tbInfo.szMissionName)
		BT_SetMissionDesc(tbInfo.szMissionDesc)
		self.szMiniMap = tbInfo.szMiniMap
	end
	self:UseMapIdx(nMapIndex)
end

function BattleData:SyncData(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))		
		CallPlayerFunction(nPlayerIndex, BT_ChangeMiniMap,self.nMapId, self.szMiniMap)
		CallPlayerFunction(nPlayerIndex, BT_BroadGameData)
		CallPlayerFunction(nPlayerIndex, BT_BroadBattleDesc)
		CallPlayerFunction(nPlayerIndex, BT_ViewBattleStart)
		CallPlayerFunction(nPlayerIndex, BT_BroadView)
		CallPlayerFunction(nPlayerIndex, BT_BroadSelf)
		for i=1, 10 do
			self:SyncLadder(i-1, {nPlayerIndex})
		end
		self:UseMapIdx(nMapIndex)
	end
end