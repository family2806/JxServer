Include("\\script\\trip\\define.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--local nExchangeTaskId = 2906
--local nExchangeTaskId_Date = 2907
local tbXunJinYuPai = {szName = "玄金玉牌", tbProp = {6, 1, 3035, 1, 0, 0},}
local POINT2EXP_RATE = 3000

tbTripBattlePoint2Exp = {}



function tbTripBattlePoint2Exp:DialogMain()
	local szTitle = format("连接server贡献和经验兑换的比例是:%d", %POINT2EXP_RATE)
	local tbOpt =
	{
		{"检查连接server贡献", self.QueryPoint,{self}},
		{"兑换经验", self.ToExp,{self}},
		{"结束对话"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function tbTripBattlePoint2Exp:QueryPoint()
	local nTaskValue = GetTask(%TSK_TRIP_BATTLE_POINT)
	local szName = GetName()
	local szTitle = format("<npc><color=yellow>%s<color>连接server贡献是<color=yellow>%d<color>", szName, nTaskValue)
	local tbOpt =
	{
		{"返回", self.DialogMain, {self}},
		{"知道了!"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbTripBattlePoint2Exp:ToExp()
	
	local nMaxValue = GetTask(%TSK_TRIP_BATTLE_POINT)
	if nMaxValue <= 0 then
		return Talk(1, "", "抱歉你的连接server贡献已经兑换完了")
	end
	
	g_AskClientNumberEx(0, nMaxValue, format("还剩 %d可以兑换", nMaxValue), {self.GetExp, {self}})
end

function tbTripBattlePoint2Exp:GetExp(nValue)
	local nCurValue = GetTask(%TSK_TRIP_BATTLE_POINT)
	if nCurValue < nValue then
		nValue = nCurValue
	end
	if nValue <= 0 then
		return
	end
	SetTask(%TSK_TRIP_BATTLE_POINT, nCurValue - nValue)
	
	local nAddExp = nValue * %POINT2EXP_RATE
	
	tbAwardTemplet:Give( {nExp_tl = nAddExp}, 1, {"TRIP", "EXCHANGE EXP"})
end
