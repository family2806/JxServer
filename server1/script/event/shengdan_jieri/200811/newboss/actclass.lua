Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\pay.lua")

Include("\\script\\event\\shengdan_jieri\\200811\\taskctrl.lua")

shengdan0811_tbXiaoDaoZeiAct = tbBaseClass:new()

function shengdan0811_tbXiaoDaoZeiAct:_init()
	
	self.TSK_PLAYER_LOGIN_TIME = 601
	
	self.TSK_Version = 1909
	self.TSK_GETAWARD_STATE = 1911
	self.TSK_USE_STATE = 1912
	self.TSK_USE_EXP = 1913
	
	self.nActStartDate = 20081205
	self.nActEndDate = 20090104
	self.tbActWeek = {[6] = 1, [0] = 1}
	self.nBossAppearTime = 1200
	self.nGetAwardEndTime = 1400
	self.nMinLevelLimit = 10
	self.nMinUseLevelLimit = 50
	self.nUseLimitDaily = 4
	self.nUseExpLimit = 4e8
	self.GB_TSKG_ACTNAME = "shengdan0811_ThiefBoss"---��relay�Ǳ�һ��Ķ�
	self.GB_TSK_THIEF_STATE = 1
	self.GB_TSK_THIEF_DEATH_TIME = 2
end

function shengdan0811_tbXiaoDaoZeiAct:UseXueHuaDanGao(nItemIndex)
	self:ResetTask()
	if GetLevel() < self.nMinUseLevelLimit or IsCharged() ~= 1 then
		Talk(1,"", "50�����ϳ�ֵ��Ҳſɲμ�.")
		return 1
	end
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "����Ʒ�ѹ���")
		return 0
	end
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	local nUseState = GetTask(self.TSK_USE_STATE)
	local nCurUseExp = GetTask(self.TSK_USE_EXP)
	if floor(nUseState/256) ~= nCurDate then
		nUseState = nCurDate * 256
		SetTask(self.TSK_USE_STATE, nUseState)
	end
	if mod(nUseState, 256) >= self.nUseLimitDaily then
		Talk(1,"", format("ÿ�����ÿ��ֻ��ʹ�ô���Ʒ %d ��.", self.nUseLimitDaily))
		return 1
	end
	if nCurUseExp >= self.nUseExpLimit then
		Talk(1,"", format("ÿ������ʹ��[ѩ������]���ֻ�ܵõ� %d ����.", self.nUseExpLimit))
		return 1
	end
	local tbAward = {nExp = 15e6}
	tbAwardTemplet:GiveAwardByList(tbAward, "shengdan0811_newboss_Award")
	SetTask(self.TSK_USE_STATE, nUseState + 1)
	SetTask(self.TSK_USE_EXP, nCurUseExp + tbAward.nExp)
end


function shengdan0811_tbXiaoDaoZeiAct:IsActDay()
	return self:IsActPeriod() and self.tbActWeek[tonumber(GetLocalDate("%w"))]
end



function shengdan0811_tbXiaoDaoZeiAct:IsActPeriod ()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	return self.nActStartDate <= nDate and nDate <= self.nActEndDate 
end


function shengdan0811_tbXiaoDaoZeiAct:GetServerAwardState()
	local nTimeHM = tonumber(GetLocalDate("%H%M"));
	local nCurDate = tonumber(GetLocalDate("%y%m%d"));
	local nCurServerTime = GetCurServerTime()
	local nThiefState = gb_GetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_STATE)
	local nThiefDeathTime =  gb_GetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_DEATH_TIME)

	if nTimeHM < self.nBossAppearTime or nTimeHM >= self.nGetAwardEndTime then
		return 0,"�콱ʱ�仹δ�������λ����������."
	end
	
	if nThiefState == 1 or tonumber(FormatTime2String("%y%m%d", nThiefDeathTime)) ~= nCurDate then
		return 0,"���ڻ�û��С��������Ϣ����˲����콱��."
	elseif nThiefState == 2 then
		return 1
	elseif nThiefState == 3 then
		return 0, "�콱ʱ�仹δ�������λ��������."
	end
end

function shengdan0811_tbXiaoDaoZeiAct:GetPlayerAwardState()
	self:ResetTask()
	local nPlayerLoginTime = GetTask(self.TSK_PLAYER_LOGIN_TIME)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	
	local nThiefDeathTime =  gb_GetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_DEATH_TIME)

	if nPlayerLoginTime >= nThiefDeathTime then
		return 0,"��λ��֮ǰ����С������ʱ��û��¶�棬��˲����콱."
	end
	
	if GetLevel() < self.nMinLevelLimit then
		return 0, format("�ȼ����� %d�������콱.", self.nMinLevelLimit)
	end
	
	local nGetAwardState = GetTask(self.TSK_GETAWARD_STATE)		
	
	
	if floor(nGetAwardState/256) ~= nCurDate then
		nGetAwardState = nCurDate * 256
		SetTask(self.TSK_GETAWARD_STATE, nGetAwardState)
	end
	
	if mod(nGetAwardState, 256) >= 1 then
		return 0, "���մ������������!"
	end
	
	return 1
end

function shengdan0811_tbXiaoDaoZeiAct:ResetTask()
	shengdan0811_ResetTask()
end


function shengdan0811_tbXiaoDaoZeiAct:SetBossDeathFlag()
	local nTimeHM = tonumber(GetLocalDate("%H%M"))
	if nTimeHM <= 1400 then
		LG_ApplyDoScript(RELAYTASK_LEAGUEID, self.GB_TSKG_ACTNAME, "", "\\script\\event\\shengdan\\200811\\setbossdeath.lua", "shengdan0811_tbXiaoDaoZeiAct_SetBossDeathFlag", "", "", "")
		--gb_SetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_STATE, 2)
		--gb_SetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_DEATH_TIME, GetCurServerTime())
	end
end

function shengdan0811_tbXiaoDaoZeiAct:LiGuanDailog()
	self:ResetTask()
	if not self:IsActDay() then
		return Talk(1,"", "���ڻ�ڼ�.")
	end
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nState, szMsg = self:GetServerAwardState()
	
	if nState ~= 1 then
		return Talk(1,"",szMsg)
	end
	nState, szMsg = self:GetPlayerAwardState()
	
	if nState ~= 1 then
		return Talk(1,"",szMsg)
	end
	
	local tbItem = {szName="ѩ������", tbProp={6, 1, 1839, 1, 0, 0}}
	
	tbItem.nExpiredTime = 60 * 24 - tonumber(GetLocalDate("%H")) * 60 - tonumber(GetLocalDate("%M"))
	
	
	
	
	
	
	tbAwardTemplet:GiveAwardByList(tbItem, "shengdan0811_newboss_Award")
	SetTask(self.TSK_GETAWARD_STATE, GetTask(self.TSK_GETAWARD_STATE) + 1)
end
shengdan0811_tbXiaoDaoZeiAct:_init()