Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");
Include("\\script\\lib\\awardtemplet.lua")



function main(nItemIndex)
--	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
--		Talk(1,"", "��Ʒ�ѹ���")
--		return 0
--	end
	
	if GetLevel() < 50 then
		Talk(1,"", "�ȼ�����50�������ϰ")
		return 1
	end
	
	IpResetTask();
	
	if GetTask(TASKID_GREEN_USE_TIMES) >= 6 then
		Talk(1,"", "ÿ����ֻ��ʹ�ø���Ʒ���6��")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("װ����λ���� %d ��λ�����ٰ���һ��.", 2))
		return 1
	end
	
--	local nTotalExp = GetTask(TASKID_CUR_GREEN_EXP)*GREEN_ITEM_EXP
--	if nTotalExp >= MAX_GREEN_EXP then
--		Talk(1,"","���Ѵﵽ3000000000����ֵ����, ���ܼ���ʹ��.")
--		return 1
--	end
		
	local nAddExp = GREEN_ITEM_EXP
	if GetTask(TASKID_CUR_GREEN_EXP) + GREEN_ITEM_EXP > MAX_GREEN_EXP then
		nAddExp = MAX_GREEN_EXP - GetTask(TASKID_CUR_GREEN_EXP) 
	end
	
	SetTask(TASKID_CUR_GREEN_EXP, GetTask(TASKID_CUR_GREEN_EXP) + 1)
	SetTask(TASKID_GREEN_USE_TIMES, GetTask(TASKID_GREEN_USE_TIMES) + 1)
	--AddOwnExp(nAddExp)
	--Msg2Player("����"..nAddExp.." ����ֵ.")
	tbExpAward = {szName = "�i����ֵ", nExp_tl = nAddExp}
	tbAwardTemplet:GiveAwardByList(tbExpAward, "Use Lam Bao Hap");
	
	--WriteLog(format("[IPBonus]\t%s\t%s\t%s","ʹ��������",GetAccount(),GetName()))		
	return 0;
end