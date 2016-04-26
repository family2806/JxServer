Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

if (not tbVipAcc2012) then
	tbVipAcc2012 = {};
end

tbVipAcc2012.nStartDate = 20120123;
tbVipAcc2012.nEndDate = 20120220;
tbVipAcc2012.nExtpointID  = 4;
tbVipAcc2012.nBit1   = 9;--acc ��������
tbVipAcc2012.nBit2   = 10;--acc �� ���콱


function tbVipAcc2012:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate >= self.nStartDate) and (nCurDate < self.nEndDate) then
		return 1;
	end
	return 0;
end

function tbVipAcc2012:main()
	local tbOpt = {}
	tinsert(tbOpt, {"��ȡ", tbVipAcc2012.GetAward, {tbVipAcc2012}})
	tinsert(tbOpt, {"��ng"})	
	CreateNewSayEx("��VIP�Ľ���Ϊ6�ڲ����Ӿ���ֵ����������ȡ��?", tbOpt)
end

function tbVipAcc2012:GetAward()
		if( self:IsActive() ~= 1) then
			Talk(1,"","Ŀǰ�����콱ʱ�䣬�뵽��ҳ������.!")
			return
		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit1) ~= 1 ) then
 			Talk(1,"","�Բ��𣬴���û���콱����.")
 			return
 		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit2) ~= 0 ) then
 			Talk(1,"","�������콱������������.")
 			return
 		end
 		
 		 if (tbExtPointLib:SetBitValue(self.nExtpointID, self.nBit2, 1) ~= 1) then
	 		return
	 	end
	 	
		 local tbAward = {szName = "��ȡ����ֵ", nExp=600e6};
		 	
 		tbAwardTemplet:Give(tbAward, 1,{"VipAcc2012","NhanPhanThuongDiemKinhNghiem"})
end

local pEventType = EventSys:GetType("AddNpcOption")
if (tbVipAcc2012:IsActive() ~= 0) then
	nId = pEventType:Reg("��VIP�Ľ���Ϊ6�ڲ����Ӿ���ֵ", tbVipAcc2012.main,{tbVipAcc2012})
end	