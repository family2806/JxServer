Include("\\script\\activitysys\\config\\28\\extend.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbPool = {
	[100] = {{nX = 1658, nY = 3019, nR = 200}, {nX = 1661, nY = 3031, nR = 120},},
	[153] = {{nX = 1710, nY = 2941, nR = 150}, {nX = 1723, nY = 2949, nR = 350}, {nX = 1699, nY = 2950, nR = 150},
						{nX = 1710, nY = 2957, nR = 300}, {nX = 1718, nY = 5959, nR = 150},},
	[174] = {{nX = 1788, nY = 3039, nR = 150},}
}

function IsInDistance(nX, nY, tbPosList)
	for _, tbPos in tbPosList do
		local nDis = (nX - tbPos.nX)^2 + (nY - tbPos.nY)^2
--		print("nX, nY, nR,nDis", tbPos.nX, tbPos.nY, tbPos.nR, nDis)
		if tbPos.nR > nDis then
			return 1
		end
	end
	return
end

local _OnBreak = function()
	Msg2Player("取水被间断.")
end

local _GetAward = function(nItemIndex)
	if nItemIndex ~= nil and nItemIndex <= 0 then
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"装备不足") ~= 1 then
		return 0
	end
	Msg2Player("取水完成")
	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2736,1,0,0},},1)
	local tbAward =  {{szName = "满桶水", tbProp = {6, 1, 2737, 1, 0, 0}, nBindState = -2, nExpiredTime = 20110405},}
	tbAwardTemplet:GiveAwardByList(tbAward, "2011植树节, 获得满桶水")
end

function InMap(nMapId)
	local nFlag = 0
	for nTmpMapId, _ in %tbPool do
		if nTmpMapId == nMapId then
			nFlag = 1
			break
		end
	end
	return nFlag
end

function main(nItemIndex)
	local nMapId, nX, nY = GetWorldPos()
	if InMap(nMapId) ~= 1 then
		Msg2Player("请在地图制定地点取水")
		return 1
	end
	
	if IsInDistance(nX, nY, %tbPool[nMapId]) ~= 1 then
		Msg2Player("请靠近水潭取水")
		return 1
	end
	
	Msg2Player("开始取水")
	tbProgressBar:OpenByConfig(6, %_GetAward, {nItemIndex}, %_OnBreak)
	return 1
end