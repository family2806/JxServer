Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");
Include("\\script\\lib\\awardtemplet.lua")



function main(nItemIndex)
--	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
--		Talk(1,"", "物品已过期")
--		return 0
--	end
	
	if GetLevel() < 50 then
		Talk(1,"", "等级不足50，请多练习")
		return 1
	end
	
	IpResetTask();
	
	if GetTask(TASKID_GREEN_USE_TIMES) >= 6 then
		Talk(1,"", "每个月只能使用该物品最多6次")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("装备空位不足 %d 空位，请再安排一下.", 2))
		return 1
	end
	
--	local nTotalExp = GetTask(TASKID_CUR_GREEN_EXP)*GREEN_ITEM_EXP
--	if nTotalExp >= MAX_GREEN_EXP then
--		Talk(1,"","你已达到3000000000经验值上限, 不能继续使用.")
--		return 1
--	end
		
	local nAddExp = GREEN_ITEM_EXP
	if GetTask(TASKID_CUR_GREEN_EXP) + GREEN_ITEM_EXP > MAX_GREEN_EXP then
		nAddExp = MAX_GREEN_EXP - GetTask(TASKID_CUR_GREEN_EXP) 
	end
	
	SetTask(TASKID_CUR_GREEN_EXP, GetTask(TASKID_CUR_GREEN_EXP) + 1)
	SetTask(TASKID_GREEN_USE_TIMES, GetTask(TASKID_GREEN_USE_TIMES) + 1)
	--AddOwnExp(nAddExp)
	--Msg2Player("你获得"..nAddExp.." 经验值.")
	tbExpAward = {szName = "经验值", nExp_tl = nAddExp}
	tbAwardTemplet:GiveAwardByList(tbExpAward, "Use Lam Bao Hap");
	
	--WriteLog(format("[IPBonus]\t%s\t%s\t%s","使用兰宝盒",GetAccount(),GetName()))		
	return 0;
end