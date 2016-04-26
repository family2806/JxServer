Include("\\script\\event\\other\\jilixinwanjia\\200908\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")


local tbAwardList = 
{
	[2101] = 
	{
		{nExp_tl = 5e7},
		
	},
	[2102] = 
	{
		{nExp_tl = 1e8},
	},
	[2103] = 
	{
		{nExp_tl = 45e7},
	},
	[2104] = 
	{
		{nExp_tl = 9e8},
	},
	[2105] = 
	{
		{nExp_tl = 35e8},
	}
}
function tbJILIWanJia0908:UseHongBao(nItemIndex)
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate >= 20090923 then
		Talk(1, "" ,"活动结束.")
		return 0
	end
	
	if GetLevel() < 150 and ST_IsTransLife() ~= 1 then
		Talk(1, "", "未重生的要有150级或重生的才可以用.")
		return 1
	end
	
	local _, _, nP = GetItemProp(nItemIndex)
	
	if self.tbTask:GetUseItemState(nP - 2101 + 1) == 1 then
		Talk(1, "", "每个人只能使用这个物品1次")
		return 1
	end
	
	
	local tbItem = %tbAwardList[nP]
	tbAwardTemplet:GiveAwardByList(tbItem, "use "..GetItemName(nItemIndex))

	self.tbTask:SetUseItemState(nP - 2101 + 1, 1)
end

function tbJILIWanJia0908:UseTuanYuanHongBao(nItemIndex)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"))

	
	if GetLevel() < 150 and ST_IsTransLife() ~= 1 then
		Talk(1, "", "未重生的要有150级或重生的才可以.")
		return 1
	end
	
	local _, _, nP = GetItemProp(nItemIndex)
	local nTime = GetCurServerTime() - self.tbTask:GetTuanYuanUseTime()
	if nTime < 60 * 60 * 24 * 60 then --60天
		local nDspTime = 60 * 60 * 24 * 60 - nTime
		nDay		= floor(nDspTime  / (24*60*60) )
		nDspTime		= mod( nDspTime, 24*60*60)
		local nHour	= floor( nDspTime / (60*60) )
		nDspTime		= mod(nDspTime, 60*60)
		local nMin	= floor(nDspTime / 60 )
		local nSec	= mod(nDspTime, 60)
		szTime 		= format("%d 日 %d时 %d分  %d秒﹜", nDay, nHour, nMin, nSec);
		Talk(1, "", format("要换 %s 才可以使用.", szTime))
		return 1
	end
	
	
	local tbItem = %tbAwardList[nP]
	tbAwardTemplet:GiveAwardByList(tbItem, "use "..GetItemName(nItemIndex))

	self.tbTask:SetTuanYuanUseTime(GetCurServerTime())
	
end

function tbJILIWanJia0908:UseAnKanHongBao(nItemIndex)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"))

	
	if GetLevel() < 150 and ST_IsTransLife() ~= 1 then
		Talk(1, "", "未重生的要有150级或重生的才可以.")
		return 1
	end
	
	local _, _, nP = GetItemProp(nItemIndex)
	local nTime = GetCurServerTime() - self.tbTask:GetAnKanUseTime()
	if nTime < 60 * 60 * 24 * 60 then --60天
		local nDspTime = 60 * 60 * 24 * 60 - nTime
		nDay		= floor(nDspTime  / (24*60*60) )
		nDspTime		= mod( nDspTime, 24*60*60)
		local nHour	= floor( nDspTime / (60*60) )
		nDspTime		= mod(nDspTime, 60*60)
		local nMin	= floor(nDspTime / 60 )
		local nSec	= mod(nDspTime, 60)
		szTime 		= format("%d 日 %d 时%d 分 %d 秒﹜", nDay, nHour, nMin, nSec);
		Talk(1, "", format("要换 %s 才可以使用.", szTime))
		return 1
	end
	
	
	local tbItem = %tbAwardList[nP]
	tbAwardTemplet:GiveAwardByList(tbItem, "use "..GetItemName(nItemIndex))

	self.tbTask:SetAnKanUseTime(GetCurServerTime())
	
end