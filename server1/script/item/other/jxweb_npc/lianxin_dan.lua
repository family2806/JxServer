Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

function main(nItemIndex)
	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "该物品已过期")
		return 0
	end
	
	if IsCharged() ~= 1 then 
		Talk(1,"", "已充值人物才能使用该物品.")
		return 1
	end
	
	if GetLevel() < 50 then
		Talk(1,"", "等级不足50，再练习吧")
		return 1
	end
	
	IpResetTask();
	
	if GetTask(TASKID_USE_TIMES) >= 6 then
		Talk(1,"", "每人只能使用该物品最多为6次")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("装备空位不足 %d 个，请重新安排.", 2))
		return 1
	end
	
	if GetTask(TASKID_CUR_EXP) >= MAX_EXP then
		Talk(1,"","你已达到上限1500000000 经验值，不能再继续使用了.")
		return 1
	end
		
	local nAddExp = ITEM_EXP
	if GetTask(TASKID_CUR_EXP) + ITEM_EXP > MAX_EXP then
		nAddExp = MAX_EXP - GetTask(TASKID_CUR_EXP) 
	end
	
	SetTask(TASKID_CUR_EXP, GetTask(TASKID_CUR_EXP) + nAddExp)
	SetTask(TASKID_USE_TIMES, GetTask(TASKID_USE_TIMES) + 1)
	AddOwnExp(nAddExp)
	Msg2Player("您获得 "..nAddExp.." 经验值.")
end