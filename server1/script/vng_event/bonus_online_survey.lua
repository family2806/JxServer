Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

BonusOnlineSurvey2011 = {}

BonusOnlineSurvey2011.nEndDate = 20111207

BonusOnlineSurvey2011.EXTPOINT_BONUS_ATM = 3

BonusOnlineSurvey2011.BIT_AWARD = 11
 
BonusOnlineSurvey2011.BIT_GET_AWARD = 12


function BonusOnlineSurvey2011:GetAward()
	
	if (self:IsActive() ~= 1) then
		Talk(1,"","活动已结束!")
		return
	end
	
	if (self:CheckAccount() ~=1) then
		Talk(1,"","大侠不够条件领奖!")
		return
	end

	if (GetExtPoint(self.EXTPOINT_BONUS_ATM) < 0) then
		Talk(1,"","现在大侠不能领奖，请联系管理处")
		return
	end
	
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD) ~= 0 ) then
 		Talk(1,"","大侠已领奖了")
 		return
 	end
	
	 if (tbExtPointLib:SetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD, 1) ~= 1) then
	 	return
	 end
	 
	 local tbAward = {szName = "经验值", nExp_tl = 100000000}
 	tbAwardTemplet:Give(tbAward, 1,{"BonusOnlineSurvey2011","NhanThuongBonusOnlineSurvey2011"})
end

function BonusOnlineSurvey2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate <= self.nEndDate) then
		return 1
	else
		return 0
	end
end

function BonusOnlineSurvey2011:CheckAccount()
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_AWARD) ~= 1) then
 		return 0
	else
		return 1
	end
end

local pEventType = EventSys:GetType("AddNpcOption")
if (BonusOnlineSurvey2011:IsActive() ~= 0) then
	nId = pEventType:Reg("礼官", "领取收集意见奖励", BonusOnlineSurvey2011.GetAward,{BonusOnlineSurvey2011})
end	