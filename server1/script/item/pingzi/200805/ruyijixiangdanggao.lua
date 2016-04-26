Include("\\script\\lib\\awardtemplet.lua")
Include ("\\script\\lib\\pay.lua")
Include("\\script\\event\\pingzi\\200805\\head.lua")
ruyijixiangdangao_tbItemList= 

{
	[1761] = {szName="如意蛋糕", nExp = 1500000 },
	[1762] = {szName="吉祥蛋糕", nExp = 3000000 },

}

function main(nItemIndex)
	pingzi0805:ResetTask()
	local nItemData	= 20080731;	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nCurExp = GetTask(pingzi0805.TSK_ExpLimit)
	if nDate > nItemData then
		Msg2Player("物品过了使用期，自动消失.")
		return 0;
	end
	
	local _, _, nId	= GetItemProp(nItemIndex);

	if GetLevel() < 50 or IsCharged() == 0 then
		Say("50级已充值玩家才能使用.", 0)
		return 1;
	end
	
	if nCurExp >= pingzi0805.nMaxExpLimit then
		Say("已达本次活动经验上限，不能继续使用了.", 0)
		return 1
	end
	local tbItem = ruyijixiangdangao_tbItemList[nId]
	tbAwardTemplet:GiveAwardByList(tbItem, "祝贺武林传奇3周岁蛋糕.")
	SetTask(pingzi0805.TSK_ExpLimit, nCurExp + tbItem.nExp)
	return 0
end

function GetDesc(nItemIndex)
	local nYear		= 2008
	local nMonth	= 07
	local nDay		= 31
	if nYear == 0 and nMonth == 0 and nDay == 0 then
		return "<color=red>物品已过使用期<color>"
	end
	return format("<color=green>使用期限g: %d-%d-%d<color>",nDay, nMonth, nYear)
end