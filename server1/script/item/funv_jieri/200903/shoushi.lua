Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")

local tbExpAward = 
{
	{nMaxDetailId = 1967, tbAward = {nExp = 1e6}},
	{nMaxDetailId = 1969, tbAward = {nExp = 3e6}},
}
local tbItemAwardRate = 
{
	{nMaxDetailId = 1967, nRate = 10},
	{nMaxDetailId = 1969, nRate = 30},
}
function main(nItemIndex)
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "该物品已过期")
		return 0
	end
	local _,_, nDetailId = GetItemProp(nItemIndex)
	
	local bRet, szFailMsg = tbFunv0903:IsPlayerEligible() 
	if bRet ~= 1 then
		Talk(1, "", szFailMsg.."不符合条件使用该物品.")
		return 1
	end
	
	if tbFunv0903.tbTask:CheckExpFromOther() ~= 1 then
		Talk(1, "", format("在该活动物品中，每人最多只能获得%u  经验值.", tbFunv0903.tbTask.nMaxExpFromOther))
		return 1
	else
		for i=1, getn(%tbExpAward) do
			
			if nDetailId <= %tbExpAward[i].nMaxDetailId then
				local tbExp = %tbExpAward[i].tbAward
				tbAwardTemplet:GiveAwardByList(tbExp, "use "..GetItemName(nItemIndex))
				tbFunv0903.tbTask:AddCurExpFromOther(tbExp.nExp)
				break
			end
		end
		
		for i=1, getn(%tbItemAwardRate) do
			if nDetailId <= %tbItemAwardRate[i].nMaxDetailId then
				local tbItem = {szName="玫瑰卡", tbProp={6, 1, 1958, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}
				tbItem.nRate = %tbItemAwardRate[i].nRate
				tbAwardTemplet:GiveAwardByList({tbItem}, "use "..GetItemName(nItemIndex))
				break
			end
		end		
	end
end