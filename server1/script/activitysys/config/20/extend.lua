
Include("\\script\\activitysys\\config\\20\\head.lua")
Include("\\script\\activitysys\\config\\20\\variables.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\caiji\\rule.lua")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
pActivity.nPak = curpack()

tbSheduleDate =
{
	{16,00},
	{16,20},
	{16,40},
	{20,00},
	{20,20},
	{20,40},
}

function pActivity:CalcNextTime()	
	local nCurTime = GetCurServerTime()
	local nYear = tonumber(GetLocalDate("%Y"))
	local nMonth = tonumber(GetLocalDate("%m"))
	local nDay = tonumber(GetLocalDate("%d"))
	for i=1, getn(%tbSheduleDate) do
		local pTime = %tbSheduleDate[i]
		local nStartTime = Tm2Time(nYear, nMonth, nDay, pTime[1],pTime[2])
		if nCurTime < nStartTime then
			return nStartTime - nCurTime		
		end
	end
	local nNextDayTime = Tm2Time(nYear, nMonth, nDay, %tbSheduleDate[1][1],%tbSheduleDate[1][2]) + 24*60*60
	return nNextDayTime - nCurTime
end


function pActivity:InitRule()
	%PlayerHandle:Init(self.TaskGroup, TSKI_RANK, TSKI_AWARD_FLAG, TSKI_SIGNUP_COUNT)
	local nNextTime = self:CalcNextTime()
	
	if SubWorldID2Idx(11) > 0 then
		PreApplyDungeonMap(TEMPLATE_MAP_ID, 0, 0)
		AddTimer(nNextTime * 18, "pActivity:OnShedule", 0)
	end
end

function pActivity:OnShedule()
	if self:IsExpired() then
		return 0
	end
	if self:CheckDate() then			
		local pDungeonType = DungeonType["collection rice plant"]
		if pDungeonType then
			local pDungeon = pDungeonType:new_dungeon(TEMPLATE_MAP_ID)
			if pDungeon then
				self.nCurDungeonMapId = pDungeon.nMapId
			end
		end
		
	end
	return INTERVAL_MINUTE * 60 * 18
end

function pActivity:SignUp()
	if not self.nCurDungeonMapId then
		return Talk(1, "", "本活动依然未打开，打开时间从16h 到 17h 以及20h 到 21h")
	end
	local pDungeon = DungeonList[self.nCurDungeonMapId]
	if pDungeon then
		if pDungeon.szState ~= "ready" then
			return Talk(1, "", "目前不是报名阶段")
		end
		
		if pDungeon:GetTotalMemberCount() >= 150 then
			return Talk(1, "", "参加登记成员数已购，请等下一次.")
		end
		
		if ST_IsTransLife() ~= 1  and GetLevel() < 150 then
			return Talk(1, "", format("不够登记%d 或者是没有重生，不能参加该活动", 150))
		end
		local nBagUsedCount = PlayerFunLib:GetTaskDailyCount(VN_TSK_USE_BAG_DAILY)
		if PlayerHandle:GetSignUpCount() >= MAX_SIGNUP_COUNT + nBagUsedCount then
			return Talk(1, "", format("每天最多只能参加%d场", MAX_SIGNUP_COUNT + nBagUsedCount))
		end
		
		local nRank = PlayerHandle:GetRank()
		local nFlag = PlayerHandle:GetAwardFlag()
		if nRank > 0 and nRank <= 10 and nFlag == 0 then
			return Talk(1, "", "你需要先领取排名榜上的奖励才能参加")
		end
		
		local pMember = pDungeon:NewMember()
		local nMapId, nX, nY = pDungeon:GetReadyScenePos()
		
		pMember:MoveTo(nMapId, nX, nY)
	else
		return Talk(1, "", "该活动还未打开，打开时间从16h到17h以及20h到21h")
	end
end

function pActivity:GetRankAward()
	local nRank = PlayerHandle:GetRank()
	local nFlag = PlayerHandle:GetAwardFlag()
	if nFlag == 1 then
		return Talk(1, "", "你已领取奖励了")
	end
	if nRank <= 0 then
		return Talk(1, "", "你没有排名，所以不能领该奖品")
	end
	
	local szRankMsg = format("你的排名是%d", nRank)
	if nRank > 10 then
		return Talk(1, "", format("%s,%s", szRankMsg, "不能领取奖励"))
	end
	local tbAward = RANK_AWARD[nRank]
	if tbAward then
		PlayerHandle:SetAwardFlag(1)
		Msg2Player(format("%s.", szRankMsg))
		%tbAwardTemplet:Give(tbAward, 1, {"Event_Thang6", "get rank award"})
	end
end

function pActivity:UseBagLog()
	%tbLog:PlayerActionLog("Event_Thang6", "SuDungTuiHuong")
end