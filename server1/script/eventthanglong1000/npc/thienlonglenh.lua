Include("\\script\\lib\\awardtemplet.lua")
--Include("\\script\\EventThangLong1000\\head.lua")
tbTTLDai= 
{
	{szName = "升天令(大)", tbProp = {6,1, 30051,1,0,0}, nExpiredTime = 20101025, nCount = 2},
}

function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("物品过了使用期，自动消失.")
		return 0;
	end

	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "装备不足5个空位.");
			return 1
	end
	tbAwardTemplet:GiveAwardByList(tbTTLDai, "Event1000年升龙, Use 升龙令");
	Msg2Player("大侠领取2个升龙令 (大)")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000年升龙"..GetAccount().."\t"..GetName().."\t".."成功使用天龙令")
end
