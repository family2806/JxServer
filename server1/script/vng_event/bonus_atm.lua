Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

BonusATM2011 = {}
--�콱���ڵ�18/12/2011 - Modified By DinhHQ - 20111213
--BonusATM2011.nEndDate = 20111130
BonusATM2011.nEndDate = 20111218

BonusATM2011.EXTPOINT_BONUS_ATM = 3

BonusATM2011.BIT_AWARD = 9
 
BonusATM2011.BIT_GET_AWARD = 10


function BonusATM2011:GetAward()
	
	if (self:IsActive() ~= 1) then
		Talk(1,"","��ѽ���!")
		return
	end
	
	if (self:CheckAccount() ~=1) then
		Talk(1,"","�������������콱!")
		return
	end

	if (GetExtPoint(self.EXTPOINT_BONUS_ATM) < 0) then
		Talk(1,"","���ڴ��������콱������ϵ����")
		return
	end
	
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD) ~= 0 ) then
 		Talk(1,"","�������콱��")
 		return
 	end
 	
	if (CalcFreeItemCellCount() < 5 ) then
		Talk(1, "", "������װ������5����λ!")
		return
	end
	
	 if (tbExtPointLib:SetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD, 1) ~= 1) then
	 	return
	 end
	 local tbAward = {szName = "�������", tbProp = {6,1,2105,1,0,0}, nCount = 1, nExpiredTime = 86400}
 	tbAwardTemplet:Give(tbAward, 1,{"BonusATM2011","NhanThuongBonusATM"})
end

function BonusATM2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate <= self.nEndDate) then
		return 1
	else
		return 0
	end
end

function BonusATM2011:CheckAccount()
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_AWARD) ~= 1) then
 		return 0
	else
		return 1
	end
end

local pEventType = EventSys:GetType("AddNpcOption")
if (BonusATM2011:IsActive() ~= 0) then
	nId = pEventType:Reg("���", "�콱�������", BonusATM2011.GetAward,{BonusATM2011})
end	