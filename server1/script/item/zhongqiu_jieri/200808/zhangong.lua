--zhongchaolong

--ս��
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("����Ʒ�ѹ���.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("������50�����ϵĳ�ֵ���", 0)
		return 1
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("Ϊ����Ʋ���ʧ����ȷ��װ����ʣ %d ��λ.", nCellFreeLimit),0)
		return 1
	end
	
	local nCurExp = GetTask(zhongqiu0808_TSK_ZhangGongExp)
	
	if nCurExp >= zhongqiu0808_TSKV_ZhangGongMaxExp then
		Say(format("ʹ�ø���Ʒ�Ѵ�����%d����.", zhongqiu0808_TSKV_ZhangGongMaxExp), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(tbItemAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_ZhangGongExp, nCurExp + tbItemAward[1].nExp)
end