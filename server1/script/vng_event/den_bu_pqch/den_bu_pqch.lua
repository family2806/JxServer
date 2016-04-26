Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

DenBuPQCH2011 = {}

DenBuPQCH2011.nEndDate = 20111023

DenBuPQCH2011.EXTPOINT_CHECK_GET_AWARD = 5
 
DenBuPQCH2011.BIT_GET_AWARD = 1

DenBuPQCH2011.EXTPOINT_AWARD_COUNT = 6


function DenBuPQCH2011:GetAward()
	local nCountPQCH = GetExtPoint(self.EXTPOINT_AWARD_COUNT)
	
	if (GetExtPoint(self.EXTPOINT_CHECK_GET_AWARD) < 0) then
		Talk(1,"","大侠此时不能领奖，请联系管理处")
		return
	end
	
	if (nCountPQCH < 1) then
		Talk(1,"","大侠不足领奖条件!")
		return
	end
	 
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_CHECK_GET_AWARD, self.BIT_GET_AWARD) ~= 1 ) then
 		Talk(1,"","大侠已领奖")
 		return
 	end
 	
	if (CalcFreeItemCellCount() < 5 ) then
		Talk(1, "", "大侠的装备不足5空位!")
		return
	end
	
	 if (tbExtPointLib:SetBitValue(self.EXTPOINT_CHECK_GET_AWARD, self.BIT_GET_AWARD, 0) ~= 1) then
	 	return
	 end
	 local tbAward = {szName = "藏箱", tbProp = {6,1,30145,1,0,0}, nCount = 1, nBindState = -2, nExpiredTime = 43200, tbParam = {nCountPQCH}}
 	tbAwardTemplet:Give(tbAward, 1,{"DenBuPQCH2011",format("NhanThuongDenBu%dPQCH",nCountPQCH)})
end

function DenBuPQCH2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate <= self.nEndDate) then
		return 1
	else
		return 0
	end
end

function DenBuPQCH2011:CheckAccount()
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_CHECK_GET_AWARD, self.BIT_GET_AWARD) ~= 1 or GetExtPoint(self.EXTPOINT_AWARD_COUNT) <= 0) then
 		return 0
	else
		return 1
	end
end
