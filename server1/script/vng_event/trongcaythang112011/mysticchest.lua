Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\objbuffer_head.lua")	
local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>恭喜高手 <color=yellow>%s<color=green>  已获得<color=yellow><%s><color=green> 从<color=yellow><神秘箱子 <color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
function main(nIdx)
	local tbAward = {
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 20, CallBack = %_Message},
		{szName="经验值", nExp_tl=1, nCount = 500000000, nRate = 55},
		{szName="王者面具",tbProp={0,11, 561,1,0,0},nCount=1, nExpiredTime = 20160, nRate = 25, CallBack = %_Message},
	}
	local tbBitTask = {
		nTaskID = 2912,
		nStartBit = 15,
		nBitCount = 4,
		nMaxValue = 2,
	}
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTask, tbBitTask.nMaxValue, "使用物品达上限，不能使用了<enter>", "<") ~= 1 then
		return 1
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "请留下最少一个空位后才能领奖")
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbBitTask, 1)
	local tbTranslog = {strFolder ="201111_EventTrongCay/", nPromID = 19, nResult = 1}
	tbAwardTemplet:Give(tbAward, 1, {"Event_TrongCay", "SuDungRuongThanBiNhanVatPham", tbTranslog})
end