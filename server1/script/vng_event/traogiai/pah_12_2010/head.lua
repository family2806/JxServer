Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\traogiai\\pah_12_2010\\pah_award.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbPAH122010_Head = {}
tbPAH122010_Head.nExtPointID = 3
tbPAH122010_Head.nBitPos = 9

function tbPAH122010_Head:isActive()
	if(tbList[GetAccount()] ~= nil and  tbExtPointLib:GetBitValue(self.nExtPointID, self.nBitPos) == 0) then
		return 1
	end
	return 0
end

function tbPAH122010_Head:addDialog(tbDialog)
	if self:isActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("领取12月方英豪奖励",tbPAH122010_Head.main,{tbPAH122010_Head})
end

function tbPAH122010_Head:main()	
	if(tbPAH122010_Head:isActive() ~= 1) then 
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	tbMainDialog.szTitleMsg = format("此次比赛的奖励为<color=red>%d<color> [红包俱乐部]大侠想马上领吗?", tbList[GetAccount()])
	tbMainDialog:AddOptEntry("领", tbPAH122010_Head.getAward, {tbPAH122010_Head})
	tbMainDialog:Show()
end

function tbPAH122010_Head:getAward()
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBitPos) == 1) then
		Talk(1, "", "大侠不是领奖了吗?不要太贪心了。")
		return
	end
	local strAccount = GetAccount()
	local nAwardCount = tbList[strAccount]
	if (CalcFreeItemCellCount() < nAwardCount) then
		Talk(1, "", format("为确保财产安全，请最少留下<color=red>%d<color> 装备空位.", nAwardCount))
		return
	end
	if (tbExtPointLib:SetBitValue(self.nExtPointID, self.nBitPos, 1) == 1)then
		local tbAward = {szName="红包俱乐部",tbProp={6,1,30032,1,0,0},nCount=nAwardCount,nExpiredTime = 43200}
		tbAwardTemplet:GiveAwardByList(tbAward, "领取12月方英豪奖励")
	end
end