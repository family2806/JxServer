Include("\\script\\lib\\awardtemplet.lua")
Include ("\\script\\lib\\pay.lua")
Include("\\script\\event\\pingzi\\200805\\head.lua")
ruyijixiangdangao_tbItemList= 

{
	[1761] = {szName="���⵰��", nExp = 1500000 },
	[1762] = {szName="���鵰��", nExp = 3000000 },

}

function main(nItemIndex)
	pingzi0805:ResetTask()
	local nItemData	= 20080731;	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nCurExp = GetTask(pingzi0805.TSK_ExpLimit)
	if nDate > nItemData then
		Msg2Player("��Ʒ����ʹ���ڣ��Զ���ʧ.")
		return 0;
	end
	
	local _, _, nId	= GetItemProp(nItemIndex);

	if GetLevel() < 50 or IsCharged() == 0 then
		Say("50���ѳ�ֵ��Ҳ���ʹ��.", 0)
		return 1;
	end
	
	if nCurExp >= pingzi0805.nMaxExpLimit then
		Say("�Ѵﱾ�λ�������ޣ����ܼ���ʹ����.", 0)
		return 1
	end
	local tbItem = ruyijixiangdangao_tbItemList[nId]
	tbAwardTemplet:GiveAwardByList(tbItem, "ף�����ִ���3���군��.")
	SetTask(pingzi0805.TSK_ExpLimit, nCurExp + tbItem.nExp)
	return 0
end

function GetDesc(nItemIndex)
	local nYear		= 2008
	local nMonth	= 07
	local nDay		= 31
	if nYear == 0 and nMonth == 0 and nDay == 0 then
		return "<color=red>��Ʒ�ѹ�ʹ����<color>"
	end
	return format("<color=green>ʹ������g: %d-%d-%d<color>",nDay, nMonth, nYear)
end