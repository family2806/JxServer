Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\29\\head.lua")

--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
tbLanHuanCaoPos = 
	{
		{153,1745,3213,},
		{153,1724,3192,},
		{153,1757,3197,},
	}
tbLanHuaCao = {
		szName = "野兰花粉", 
		nLevel = 95,
		nNpcId = 1782,
		nIsboss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\29\\lanhuacao.lua",
	}

local _Limit = function(nNpcIdx)
	local tbAllowTime = {
		{123000,130000},
		{200000,203000},
	}
	
	if not pActivity:CheckDate() then
		Msg2Player(format("活动时间已过，不能再继续收集了."))
		return
	end
	
	if (not PlayerFunLib:CheckTotalLevel(120,"你的等级不足120级",">=")) then
		return
	end
	
	if (not lib:CheckTime(tbAllowTime,"目前不是收集时间，每天12:30 到13:00 以及20:00 到 20:30 来哦?")) then
		return
	end
	
	return 1
end

local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	local nLimit = %_Limit(nNpcIdx)
	
	if not nLimit then
		return 0
	end

	local nNpcParam = GetNpcParam(nNpcIdx, 1)
	--一分钟后重生
	--HideNpc(nNpcIdx, 60*18)--不知道为什么，这里隐藏掉NPC后NPC就不会再出现了,改成删掉再call的方式
	DelNpc(nNpcIdx)
	DynamicExecute("\\script\\activitysys\\config\\29\\lanhuacao.lua","AddTimer", 60*18, "_GenLanHuaCao", nNpcParam)
	--print(nNpcIdx)
	--print(dwNpcId)
	
	AddStatData("jiefangri_zhailanhua")
	
	tbAwardTemplet:Give({tbProp={6,1,1977,1,0,0},nBindState = -2,nExpiredTime=10080}, 1, {"EventTangHoa042011", "NhanDuocHoaLan"});
	
	local nCount = CalcItemCount(-1, 6, 1, 1977, -1)
	if nCount > 2 then
		Msg2Player(format("每天只允许送2朵野兰花给士兵，你已经达到 %d朵了.",nCount))
	end
	--Msg2Player("你得到了一朵兰花。");
end

function _GenLanHuaCao(nNpcParam)
--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
	for i=1, 1 do
		local nMapId, nPosX, nPosY = unpack(%tbLanHuanCaoPos[nNpcParam])
		%tbLanHuaCao.tbNpcParam[1] = nNpcParam
		%basemission_CallNpc(%tbLanHuaCao, nMapId, nPosX*32, nPosY*32)	
	end
	--%tbLanHuanCaoPos[nNpcIdx] = nil
	return 0--返回0表示不需要再定时
end

local _OnBreak = function()
	Msg2Player("收集间断")
end

function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if not %_Limit(nNpcIdx) then
		return
	end
	--开启进度条
	tbProgressBar:OpenByConfig(7, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;