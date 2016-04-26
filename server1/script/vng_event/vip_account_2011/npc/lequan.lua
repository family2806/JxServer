Include("\\script\\vng_event\\vip_account_2011\\npc\\head.lua")

if not tbVNG_VipAcc2011_LeQuan then
	tbVNG_VipAcc2011_LeQuan = {}
end

tbVNG_VipAcc2011_LeQuan.nExtPointID = 3
tbVNG_VipAcc2011_LeQuan.nBitPos = 1
tbVNG_VipAcc2011_LeQuan.nBitPos2 = 5
tbVNG_VipAcc2011_LeQuan.nStartDay = 20110203
tbVNG_VipAcc2011_LeQuan.nEndDay = 20110207

function tbVNG_VipAcc2011_LeQuan:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end

function tbVNG_VipAcc2011_LeQuan:addDialog(tbDialog)
	if (self:isActive() ~= 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.nBitPos) ~= 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.nBitPos2) ~= 0) then 
		return
	end	
	tbDialog:AddOptEntry("��������", tbVNG_VipAcc2011_LeQuan.main, {tbVNG_VipAcc2011_LeQuan})
end

function tbVNG_VipAcc2011_LeQuan:main()
	local tbMainDialog = tbVNG_Vip_NpcHead:CreateDialog()
	tbMainDialog.szTitleMsg = "ף������"
	tbMainDialog:AddOptEntry("��", tbVNG_VipAcc2011_LeQuan.GetAward, {tbVNG_VipAcc2011_LeQuan})
	tbMainDialog:Show()
end

function tbVNG_VipAcc2011_LeQuan:GetAward()
	if (CalcFreeItemCellCount() < 10) then
		Talk(1, "", "Ϊ�����Ʋ���������10����λ�����ʹ�ø���Ʒ!")
		return
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBitPos2) == 0 and tbExtPointLib:SetBitValue(self.nExtPointID, self.nBitPos2, 1) == 1) then
		local tbAward = {szName="������",tbProp={6,1,30091,1,0,0},nCount=1,nExpiredTime=20110207,nBindState = -2}
		tbVNG_Vip_NpcHead:GiveAward(tbAward, "[VNG][VIPAcc2011][�����NPC������]")
	end
end