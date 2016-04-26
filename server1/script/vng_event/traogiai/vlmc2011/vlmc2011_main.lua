Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_globalvar.lua")
Include("\\script\\vng_lib\\extpoint.lua")
IncludeLib("TITLE")
Include("\\script\\lib\\log.lua")

function tbVLMC2011_Tittle:AddDialog(tbDialog)
	if self:IsActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("领取武林盟主豪光圈", tbVLMC2011_Tittle.ShowDialog, {tbVLMC2011_Tittle})
end

function tbVLMC2011_Tittle:ShowDialog()
	local strTittle = "我复制颁发武林盟主和十大高手豪光圈，你找我有什么事吗?"
	Describe(strTittle, 2, "我想领奖/#tbVLMC2011_Tittle:GetTittle()", "сng/OnCancel")
end

function tbVLMC2011_Tittle:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEND_DATE or now < self.nSTART_DATE) then
		return 0;
	end
	local strPlayerAccount = GetAccount()
	if not self.tbAccount[strPlayerAccount] then		
		return 0;
	end
	if tbExtPointLib:GetBitValue(self.nEXTPOINT_ID, self.nEXTPOINT_BIT) == 1 then
		return 0;
	end
	return 1;
end

function tbVLMC2011_Tittle:GetTittle()	
	if (tbExtPointLib:GetBitValue(self.nEXTPOINT_ID, self.nEXTPOINT_BIT) == 1) then
		Talk(1, "", "大侠不是已经领奖了吗?")
		return
	end
	local nTittleType = self.tbAccount[GetAccount()]
	if nTittleType ~= 1 and nTittleType ~= 2 then
		return
	end
	if (tbExtPointLib:SetBitValue(self.nEXTPOINT_ID, self.nEXTPOINT_BIT, 1) ~= 1)then
		return
	end
	local tbTittleSet = self.tbTITTLE_SETS[nTittleType]	
	local nTime = GetCurServerTime() + floor(self.nTITTLE_EXPIREDTIME/18)
	nTime = tonumber(FormatTime2String("%m%d%H%M", nTime))
	Title_RemoveTitle(tbTittleSet.nTittleID)
	Title_AddTitle(tbTittleSet.nTittleID,2,nTime);
	Title_ActiveTitle(tbTittleSet.nTittleID)
	SetTask(self.nTSK_ACTIVE_TITTLE, tbTittleSet.nTittleID)
	if tbTittleSet.tbExtSkill then
		local tbSkills = tbTittleSet.tbExtSkill
		for i = 1, getn(tbSkills) do	
			RemoveSkillState(tbSkills[i].nID)	
			AddSkillState(tbSkills[i].nID, tbSkills[i].nLevel, 2, nTime, 1)
		end
	end
	local nTittleName = Title_GetTitleName(tbTittleSet.nTittleID)
	Msg2Player(format("你领取称号<color=green>%s<color> 成功",nTittleName ))
	tbLog:PlayerActionLog("VLMC2011","NhanHaoQuang", "Tittle:  "..nTittleName)
end

function OnCancel()
end