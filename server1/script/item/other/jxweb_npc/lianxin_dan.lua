Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

function main(nItemIndex)
	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "����Ʒ�ѹ���")
		return 0
	end
	
	if IsCharged() ~= 1 then 
		Talk(1,"", "�ѳ�ֵ�������ʹ�ø���Ʒ.")
		return 1
	end
	
	if GetLevel() < 50 then
		Talk(1,"", "�ȼ�����50������ϰ��")
		return 1
	end
	
	IpResetTask();
	
	if GetTask(TASKID_USE_TIMES) >= 6 then
		Talk(1,"", "ÿ��ֻ��ʹ�ø���Ʒ���Ϊ6��")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("װ����λ���� %d ���������°���.", 2))
		return 1
	end
	
	if GetTask(TASKID_CUR_EXP) >= MAX_EXP then
		Talk(1,"","���Ѵﵽ����1500000000 ����ֵ�������ټ���ʹ����.")
		return 1
	end
		
	local nAddExp = ITEM_EXP
	if GetTask(TASKID_CUR_EXP) + ITEM_EXP > MAX_EXP then
		nAddExp = MAX_EXP - GetTask(TASKID_CUR_EXP) 
	end
	
	SetTask(TASKID_CUR_EXP, GetTask(TASKID_CUR_EXP) + nAddExp)
	SetTask(TASKID_USE_TIMES, GetTask(TASKID_USE_TIMES) + 1)
	AddOwnExp(nAddExp)
	Msg2Player("����� "..nAddExp.." ����ֵ.")
end