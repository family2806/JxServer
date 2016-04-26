IncludeLib("ITEM")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
if not tbVNG_VIPAcc_ItemHead then
	tbVNG_VIPAcc_ItemHead = {}
end
tbVNG_VIPAcc_ItemHead.tbTaskInfo =
	{
		nTaskID = 2754,
		nStartBit = 12,
		nBitCount = 1,
		nMaxValue = 1
	}
function tbVNG_VIPAcc_ItemHead:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end
function tbVNG_VIPAcc_ItemHead:useItem(strItemType)
	if tbVNG_BitTask_Lib:getBitTask(self.tbTaskInfo) == 1 then
		return 0, "每人每周只能使用一次该物品."
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbTaskInfo, 1)
	local tbAward = {}
	local strItemName = ""
	if(strItemType == "小") then
		tbAward = {nExp=200000000}
		strItemName = "领小礼包"
	elseif (strItemType == "中") then
		tbAward = {nExp=300000000}
		strItemName = "领中礼包"
	elseif (strItemType == "大") then
		tbAward = {nExp=400000000}
		strItemName = "领大礼包"
	end
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][VipAcc2011][使用物品经验奖励%s]", strItemName))	
	return 1
end
