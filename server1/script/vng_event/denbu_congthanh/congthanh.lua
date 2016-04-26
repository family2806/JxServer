Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\vng_event\\denbu_congthanh\\head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

function tbDenbuCT2011:ShowDialog()
	if (tbDenbuCT2011:IsActive() ~= 1) then
		Talk(1,"","活动已结束!")
		return
	end
	
	local strTittle = "攻城补偿奖励，如果大侠不加入帮会，将不能获得<color=red>挑战令奖励<color>"
	Describe(strTittle, 2, "我想领/#tbDenbuCT2011:GetAward()", "关闭/OnCancel")
end

function tbDenbuCT2011:GetAward()
	if not self.tbListaward[GetAccount()] then	
		Talk(1, "", "大侠没有在领奖名单内")	
		return
	end
	
	if (tbExtPointLib:GetBitValue(self.nExtpoint_Is_DBCT, self.nBit_Is_DBCT) == 1) then
		Talk(1, "", "大侠不是已经领奖了吗?")
		return
	end
	
	if (tbExtPointLib:SetBitValue(self.nExtpoint_Is_DBCT, self.nBit_Is_DBCT, 1) ~= 1)then
		return
	end
	
	local tbPlayerAward = self.tbListaward[GetAccount()]
	tbAwardTemplet:Give(tbPlayerAward, 1, {"DenbuCT2011","NhanDenbuCongThanh"});
	
	if(self:CheckBangHoi() == 1) then
		local szTongName, nTongID = GetTongName();
		checkCreatLG(szTongName);
		checkJoinLG(szTongName);
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 2000, "", "");
		Msg2Player("成功给帮会交2000挑战令!")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."DenbuCT2011"..GetAccount().."\t"..GetName().."\t".."成功给帮会交2000挑战令")
	end
	Msg2Player("恭喜大侠成功领取攻城补偿奖励.");
end

function tbDenbuCT2011:IsActive()
	local now = tonumber(date("%Y%m%d"));
	if (now < tbDenbuCT2011.nEndDate) then
		return 1;
	end
	return 0;
end

--检查帮会
function tbDenbuCT2011:CheckBangHoi()
	local TongName,TongID = GetTongName();
	if TongName == "" or TongName == nil then
		return 0;
	else
		return 1;
	end
end

function OnCancel()
end

local pEventType = EventSys:GetType("AddNpcOption")

if (tbDenbuCT2011:IsActive() ~= 0) then
	nId = pEventType:Reg("L?Quan", "领取攻城补偿", tbDenbuCT2011.ShowDialog,{tbDenbuCT2011})
end	
