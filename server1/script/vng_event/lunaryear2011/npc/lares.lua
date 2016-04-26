Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
if not tbLares then
	tbLares = {}
end
tbLares.TSK_ID = 2755
tbLares.BIT_POS = 1
tbLares.nEndDay = 20110127
tbLares.nStartDay = 20110126
function main()
	if tbLares:isActive() ~= 1 then
		return
	end
	local tbMainDialog = tbNpcHead:createDialog()
	if tbLares:getBitValue() == 1 then
		Talk(1, "", "现在我很忙.")
		return
	else
		tbMainDialog.szTitleMsg = "我要准备回天庭报告玉皇大帝世间的情况，阁下需要什么就快点说!"
		tbMainDialog:AddOptEntry("我只想祝你一路平安", tbLares.giveAward, {tbLares})
	end	
	tbMainDialog:Show()
end

function tbLares:giveAward()
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "你不足条件使用物品，要求50级以上且已充值")
		return
	end
	local nValue = GetTask(self.TSK_ID)
	nValue = SetBit(nValue, self.BIT_POS, 1)
	SetTask(self.TSK_ID, nValue)
	local tbExp = {nExp=50000000}
	tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][送造神回天]")
	Talk(2, "", "...阁下真是好心，春节到了，我也有礼物送给你.", " 多谢.")
end

function tbLares:getBitValue()
	local nValue = GetTask(self.TSK_ID)
	return GetBit(nValue, self.BIT_POS)
end

function tbLares:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end