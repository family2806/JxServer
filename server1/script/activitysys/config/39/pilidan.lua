Include("\\script\\activitysys\\config\\39\\extend.lua")
Include("\\script\\activitysys\\config\\39\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local tbMapList = {950, 951, 952, 953, 954, 955, 956,}
MAX_EXP = 10
PER_EXP = 1
ValenAct_nStartDate = 20120209
ValenAct_nEndDate = 20120301
function IsInMap(nMapId)
	for i = 1, getn(%tbMapList) do
		if nMapId == %tbMapList[i] then
			return 1
		end
	end
	return 0
end

function GetDistance(nX1, nY1, nX2, nY2)
	return (nX1-nX2)^2+(nY1-nY2)^2 
end

function main(nItemIndex)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate < ValenAct_nStartDate then
		Msg2Player("活动时间还未到!")
		return 1
	elseif nDate >= ValenAct_nEndDate then
		Msg2Player("活动时间已过，道具过期")
		return
	end
	
	local tbNpc, nCount = GetAroundNpcList(15, 8)
	local nMapId, nX, nY = GetWorldPos()

	if IsInMap(nMapId) ~= 1 then
		Msg2Player("该道具只能在恶狼谷使用!")
		return 1
	end
	
	local nDis, nSignIndex = -1, -1
	local nX32, nY32, nMapIndex
	for i = 1, nCount do 
		nX32, nY32, nMapIndex = GetNpcPos(tbNpc[i])
		local nTmpDis = GetDistance(nX, nY, nX32/32, nY32/32)
		if nDis < 0 or nDis > nTmpDis then
			nDis = nTmpDis
			nSignIndex = tbNpc[i]
		end
	end
	if nSignIndex < 0 then
		Msg2Player("与恶狼左使的距离太远，请走近后使用!")
		return 1
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return 1
	end
	
	nX32, nY32, nMapIndex = GetNpcPos(nSignIndex)
	CastSkill(362, 20, nX32, nY32)
	local nPlayerIdxToNpcIdx = PIdx2NpcIdx(PlayerIndex)
	KillNpcWithIdx(nSignIndex, nPlayerIdxToNpcIdx)
	
	if pActivity:CheckTask(TSK_PILIDAN,MAX_EXP,"打败恶狼左使获得经验达到上限.","<") == 1 then
		pActivity:AddTask(TSK_PILIDAN, PER_EXP)
		PlayerFunLib:AddExp(PER_EXP, 1, EVENT_LOG_TITLE, "use pilidan exp")
	end

	local tbAward = {
		{szName="玄晶",tbProp={6,1,147,1,0,0},nExpiredTime=20120301,},
	}
	tbAwardTemplet:Give(tbAward, 1, {EVENT_LOG_TITLE, "use pilidan item"})
end