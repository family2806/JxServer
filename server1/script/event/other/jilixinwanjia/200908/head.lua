
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\event\\other\\jilixinwanjia\\200908\\taskctrl.lua")
local tbActData = 
{
	nStartDate			= 20090821,
	nEndDate			= 20090920,
	nComposeEndDate		= 20090906,
	nItemExpiredTime	= 20090913,
	
	szClassName = "tbJILIWanJia0908",
	tbTask	= tbJILIWanJia0908_tbTasktCtrl,
}
tbJILIWanJia0908 = tbBaseClass:new()
function tbJILIWanJia0908:_init(tbActData)
	for i,j in tbActData do
		self[i] = j
	end
	if self.tbTask then
		self.tbTask:_init(self.nStartDate, self.nItemExpiredTime)
	end
	
end

function tbJILIWanJia0908:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return self.nStartDate <= nCurDate and nCurDate <= self.nEndDate
end

function tbJILIWanJia0908:IsPlayerEligible()
	if ST_IsTransLife() == 1 then
		return nil, "各位已重生了."
	end
	
	if GetExtPoint(5) ~= 1 then
		return nil, "只有在21/08/2009到24h，20/09/2009登记过的账户才可以参加并领奖"
	end
	return 1
end

tbJILIWanJia0908:_init(tbActData)