Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

function main(nItemIndex)
--	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
--		Talk(1,"", "����Ʒ�ѹ���")
--		return 0
--	end
	
	if GetLevel() < 50 then
		Talk(1,"", "�ȼ�����50����������ϰ")
		return 1
	end
	
	local nMonth = tonumber(date("%m"))
	if GetByte(GetTask(TASKID_YELLOW_USE_DATE),1) == nMonth then
		Talk(1,"", "ÿ����ֻ��ʹ�ø���Ʒ���һ��")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("װ����λ���� %d ��λ�����ٰ���һ��.", 2))
		return 1
	end
	
	local nAddExp = YELLOW_ITEM_EXP
	SetTask(TASKID_YELLOW_USE_DATE, SetByte(GetTask(TASKID_USE_TIMES),1,nMonth))
	AddOwnExp(nAddExp)
	Msg2Player("����"..nAddExp.."����ֵ.")
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","ʹ�ûƱ���",GetAccount(),GetName()))		
	return 0;
end