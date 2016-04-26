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
		Talk(1, "", "�����Һ�æ.")
		return
	else
		tbMainDialog.szTitleMsg = "��Ҫ׼������ͥ������ʴ������������������Ҫʲô�Ϳ��˵!"
		tbMainDialog:AddOptEntry("��ֻ��ף��һ·ƽ��", tbLares.giveAward, {tbLares})
	end	
	tbMainDialog:Show()
end

function tbLares:giveAward()
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "�㲻������ʹ����Ʒ��Ҫ��50���������ѳ�ֵ")
		return
	end
	local nValue = GetTask(self.TSK_ID)
	nValue = SetBit(nValue, self.BIT_POS, 1)
	SetTask(self.TSK_ID, nValue)
	local tbExp = {nExp=50000000}
	tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][���������]")
	Talk(2, "", "...�������Ǻ��ģ����ڵ��ˣ���Ҳ�������͸���.", "�a ��л.")
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