Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")
tbCTL = 
{
	{szName = "功状令", tbProp = {6,1, 30048,1,0,0}, nExpiredTime = 20101025, nCount = 1},
}
function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("物品过使用期，自动消失.")
		return 0;
	end
	if (GetLevel() < 50) then
		Talk(1, "", "等级小于50不能使用!");
		return 1
	end
	if CalcFreeItemCellCount() < 10 then
			Talk(1, "", "装备不足10个空位.");
			return 1
	end
	local nGenre, nDetailType, nPartType = GetItemProp(nItemIndex)
	if (nPartType == 30052) then
		TieuLongControl()
	else
		TrungDaiLongControl(nPartType)
	end
	
end

function TieuLongControl()
	if (GetTask(Task_Use_TieuLong) >= 1000) then
		Talk(1, "", "(已使用该物品最多了，不能再使用了!.");
		return 1
	end
	SetTask(Task_Use_TieuLong, GetTask(Task_Use_TieuLong) + 1)
	tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 年升龙, Use 小龙");
	AddOwnExp(2000000)
	Msg2Player("你获得2000000 经验值")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 年升龙"..GetAccount().."\t"..GetName().."\t".."使用小龙领取2000000 点EXP ")
end
function TrungDaiLongControl(nPartType)
	if (GetTask(Task_Use_TrungDaiLong) >= 60000) then
		Talk(1, "", "(已使用该物品最多了，不能再使用了!.");
		return 1
	end
	if (nPartType == 30054) then--如果是大龙
		tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 年升龙, Use 大龙");		
		tbAwardTemplet:GiveAwardByList(tbAwardItemUseDaiLong, "Event 1000 年升龙");
		local nExp, nTaskValue = GetValueByRandom(tbAwardExp)
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + nTaskValue)
		AddOwnExp(nExp)
		Msg2Player(format("大侠获得%d 经验值", nExp))
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000年升龙"..GetAccount().."\t"..GetName().."\t".."使用中龙获得经验值  " .. nExp)
	else
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + 20)
		AddOwnExp(2000000)
		Msg2Player("大侠获得 2000000 经验值!")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 年升龙"..GetAccount().."\t"..GetName().."\t".."使用中龙获得经验值 2000000")
	end
	
	
end
