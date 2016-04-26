Include("\\script\\activitysys\\config\\41\\head.lua")
Include("\\script\\activitysys\\config\\41\\variables.lua")
Include("\\script\\activitysys\\config\\41\\data.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("TITLE")

local szRemoteScript = "\\script\\event\\2012april_zhushuai\\event.lua"
pActivity.tbStartDay = {2012,3,29,10,0} -- 以2012/3/1 10：00 为周四的起始时间
pActivity.nTempTime = 7 * 24 * 60 * 60		-- 每周排名一次

function pActivity:InitAddNpc()
	tbNpc = %tbActivityNpc
	tbPos = %tbActivityNpcPos
	for i=1, getn(tbNpc) do
		local tbNpcPos = tbPos[i]
		for j=1,getn(tbPos[i]) do
			local nMapId, nPosX, nPosY = unpack(tbNpcPos[j])
			basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
		end
	end
	
	self:InitHandInCompose()
	self:InitUpdateCompose()
end

function pActivity:GetCurrentDateTime()
	local nCurrDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCurrTime = tonumber(GetLocalDate("%H%M"))
	return nCurrDate, nCurrTime
end

-- 更新最近一次登录时间，若当天有登录，则不改变，
-- 否则，将最近一次登录时间改为当天的早上8点
function pActivity:UpdateLastLoginTime()
do return end
	local nLastDate = self:GetTask(%TSK_LAST_ONLINEDATE)
	local nLastTime = self:GetTask(%TSK_LAST_ONLINETIME)
	local nCurrDate, nCurrTime = self:GetCurrentDateTime()
	
	-- 连续多天没有下线
	if nLastDate ~= nCurrDate then
		nLastDate = nCurrDate
		nLastTime = %NUM_ONLINE_START_TIME
	end
	
	if nLastTime < %NUM_ONLINE_START_TIME then
		nLastTime = %NUM_ONLINE_START_TIME
	end
	
	self:SetTask(%TSK_LAST_ONLINEDATE, nLastDate)
	self:SetTask(%TSK_LAST_ONLINETIME, nLastTime)
end

function pActivity:GetOnLineAward()
	local nDate = self:GetTask(%TSK_LAST_ONLINEDATE)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then
		nLastOnLineTime = self:GetTask(%TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()	
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS		
	end
	nCount = nHour	
	if nCount <= 0 then
		Msg2Player("上次领取间隔, 在线时间不足一小时，不能领取")
		return 
	end
	local nMaxCount = %MAX_DAILY_LOGIN_MEDAL -  PlayerFunLib:GetTaskDailyCount(%TSK_DAILY_LOGIN_MEDAL)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("今天你不能再领取了，明天再来吧.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
		
	self:SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	self:SetTask(%TSK_LAST_ONLINEDATE,nNowDate)

	PlayerFunLib:GetItem(%ITEM_MEDAL_1,nMaxCount*3, %EVENT_LOG_TITLE, "NhanHuyHieuCap1TaiNPCThoMay")
	PlayerFunLib:AddTaskDaily(%TSK_DAILY_LOGIN_MEDAL, nMaxCount)	
end

-- 玩家登录
--Change online award - Modified By DinhHQ - 20120330
function pActivity:PlayerOnLogin()
--	self:UpdateLastLoginTime()
--	local nCurrDate, nCurrTime = self:GetCurrentDateTime()
--	
--	self:SetTask(%TSK_LAST_ONLINEDATE, nCurrDate)
--	self:SetTask(%TSK_LAST_ONLINETIME, nCurrTime)
	local nDate = self:GetTask(%TSK_LAST_ONLINEDATE)	
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0	
	if nDate ~= nNowDate then
		nCurrentOnLineTime = GetGameTime()		
		self:SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(%TSK_LAST_ONLINEDATE,nNowDate)		
	end
end

function pActivity:GetDateFromBuffer(ResultHandle, nCount)
	local tbResult = {}
	for i=1,nCount do
		tbResult[i] = ObjBuffer:PopObject(ResultHandle)
--		print("i = " .. i .. " tbResult[i] = " .. tbResult[i])
	end
	return unpack(tbResult)
end


-- 根据relay返回的消息判断当前玩家是不是主帅
function pActivity:IsZhuShuai(ResultHandle)
	local nResult = 1
	local szName, nMark, szPlayerName, nParam = self:GetDateFromBuffer(ResultHandle, 4)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	
--	print("--------------------------------")
--	if szName then
--	print("szName = " .. szName)
--	else
--		print("the rank name is nil")
--	end
--	print("nMark = " .. nMark)
--	print("szPlayerName = " .. szPlayerName)
--	print("--------------------------------")
	if nPlayerIndex <= 0 then
		return 0, 0, nParam
	end
	
	if not szName or szName ~= szPlayerName then
		nResult = 0
	end
	return nPlayerIndex, nResult, nParam
end

-- 检查当前玩家是不是第一主帅
-- 需要和relay交互
function pActivity:CheckPerson(szFun, nParam)
	nParam = nParam or 0
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	obj:Push(nParam)
	DynamicExecute("\\script\\activitysys\\config\\41\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbZhuShuai:g2s_PreZhuShuai", obj.m_Handle, szFun, 0)
	obj:Destroy()
end

-- 点击大主帅，选择领取第一主帅对话
function pActivity:GetTitle_1()
	self:IsClearMark()
	self:CheckPerson("pActivity:GetTitle_2")
end

-- 点击领取大主帅，从relay返回信息进行判断
function pActivity:GetTitle_2(nParam, ResultHandle)
	local nPlayerIndex,nResult,_ = self:IsZhuShuai(ResultHandle)
	if nPlayerIndex <= 0 then
		return
	end
	local szMsg = format("你不是本周主帅，不能领取%s该","名号")
	if nResult == 0 then
		CallPlayerFunction(nPlayerIndex, Say, szMsg)
		return 
	end
	CallPlayerFunction(nPlayerIndex, self.GetTitle, self)
end

-- 获得称号
function pActivity:GetTitle()
	local n_title = 246
	local nDay = 6
	local nHour = GetLocalDate("%H")
	local nMinute = GetLocalDate("%M")
	local nTime = ((24-nHour) * 60 - nMinute) + nDay * 24 * 60 + 10 * 60 -- 分
	nTime = nTime * 60 -- 秒
	nTime	= mod(FormatTime2Number(GetCurServerTime()+nTime), 100000000)--nMon * 1000000 + nDay * 10000	-- 
	local TSK_ACTIVE_TITTLE = 1122

	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(TSK_ACTIVE_TITTLE, n_title)	-- 设置下次上线之后还是这个称号

	%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, "NhanDanhHieuChuSoai")
	self:AddTaskDaily(%TSK_DAILY_GET_TITLE, 1)
	Msg2Player("恭喜大侠获得第一主帅称号")
end

function pActivity:GetZhuShuaiAward_1()
	self:IsClearMark()
	self:CheckPerson("pActivity:GetZhuShuaiAward_2")
end

function pActivity:GetZhuShuaiAward_2(nParam, ResultHandle)
	local nExp = 50000000
	local nPlayerIndex,nResult,_ = self:IsZhuShuai(ResultHandle)
	if nResult == 0 then
		CallPlayerFunction(nPlayerIndex,Say,format("你不是本周主帅，不能领取%s 该","奖励"))
		return 
	end
	CallPlayerFunction(nPlayerIndex, PlayerFunLib.AddExp, PlayerFunLib, nExp, 1, %EVENT_LOG_TITLE, "领取主帅奖励")
	CallPlayerFunction(nPlayerIndex, self.AddTaskDaily, self, %TSK_DAILY_EXP_AWARD, 1)
end

function pActivity:ActiveFunction_1(nType)
	self:IsClearMark()
	self:CheckPerson("pActivity:ActiveFunction_2", nType)
end

function pActivity:DoActiveFunction(nParam)
	local nJxb = 10000000
	if GetCash() < nJxb then
		Msg2Player(format("激活该性能需要有%d 银两,请仔细准备好再来",nJxb))
		return
	end
	Pay(nJxb)
	self:AddTaskDaily(%TSK_TB_DAILY_ACTIVE[nParam], 1)
	self:AddTaskDaily(%TSK_DAILY_ACTIVE, 1)
	%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, %tbActivLog[nParam])
	Msg2Player("您已成功激活该性能")
end

function pActivity:ActiveFunction_2(nParam, ResultHandle)
	local nPlayerIndex, nResult, nParam = self:IsZhuShuai(ResultHandle)
	if nResult ~= 1 then
		CallPlayerFunction(nPlayerIndex,Say,"您不是本周主帅，不能激活该性能")
		return
	end
	CallPlayerFunction(nPlayerIndex, self.DoActiveFunction, self, nParam)
end

function pActivity:UpdateNextClearTime()
	local nCurrTime = GetCurrentTime()
--	print("nCurrTime = " .. nCurrTime)
	local nTime = Tm2Time(unpack(self.tbStartDay))
--	print("nStartTime = " .. nTime)
	-- 更新下次更新时间
	-- 计算当前时间和2012/3/1 10:00 差了几周，根据差值，计算下次更新排名的时间
	local nCount = floor( (nCurrTime - nTime)/self.nTempTime) + 1
--	print("nCount = " .. nCount)
	nNextSortTime = nTime + nCount * self.nTempTime
	if nNextSortTime <= nCurrTime then
		nNextSortTime = nNextSortTime + self.nTempTime
	end
--	print("nNextSortTime = " .. nNextSortTime)
	self:SetTask(%TSK_NEXT_CLEAR_TIME, nNextSortTime)
	return nNextSortTime
end

-- 判断是否需要清空积分，如果需要则清空
function pActivity:IsClearMark()
	local nNextSortTime = self:GetTask(%TSK_NEXT_CLEAR_TIME)
	
	if nNextSortTime == 0 then
		nNextSortTime = self:UpdateNextClearTime()
	end
	
	local nCurrTime = GetCurrentTime()
--	print("nCurrTime = " .. nCurrTime)
--	print("nNextSortTime = " .. nNextSortTime)
	-- 当前的时间小于下次更新时间，则不处理
	if nCurrTime <= nNextSortTime then
		return 0
	end
	-- 清空当前积分,更新下次清空数据的时间
	self:SetTask(%TSK_MARK,0)
	self:UpdateNextClearTime()
	return 1
end

function pActivity:QueryMark_1()
	self:IsClearMark()
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\activitysys\\config\\41\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbZhuShuai:g2s_NowZhuShuai", obj.m_Handle, "pActivity:QueryMark_2", 0)
	obj:Destroy()
	
end

function pActivity:QueryMark_2(nParam, ResultHandle)
	local szName, nMaxMark, szPlayerName = self:GetDateFromBuffer(ResultHandle, 3)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex <= 0 then
		return
	end
	
	CallPlayerFunction(nPlayerIndex, self.IsClearMark, self)
	local nPlayerMark = CallPlayerFunction(nPlayerIndex, self.GetTask, self, %TSK_MARK)
	CallPlayerFunction(nPlayerIndex, Say, format("您目前的称号积分为%d, 目前最高积分为%d", nPlayerMark, nMaxMark))
end

function pActivity:HandInMedal(nType, nCount)
	self:IsClearMark()
	
	for k=1,nCount do
		local nRate = random(1, 100)
		local nTotalRate = 0
		tbHandInMedal = %tbHandInMedal[nType]
		local tbMark = tbHandInMedal.tbMark
		for i=1,getn(tbMark)do
			nTotalRate = nTotalRate + tbMark[i].nRate
			if nRate <= nTotalRate then
				self:AddTask(%TSK_MARK, tbMark[i].nMark)
				Msg2Player(format("您的称号和积分已增加 %d",tbMark[i].nMark))
				break
			end
		end
		PlayerFunLib:AddExp(tbHandInMedal.nExp_tl, 1, %EVENT_LOG_TITLE,format("HandIn_Medal_%d",nType))
	end
	
	self:UpdateMaxMark()
	self:AddTaskDaily(%TSK_DAILY_MEDAL, nCount)
	
	local nHandinCount = self:GetTaskDaily(%TSK_DAILY_MEDAL)
	if nHandinCount == %MAX_DAILY_HANDIN_MEDAL then
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, "每天上交100徽号")
	end
end

-- 与relay交互，更新当前的最高积分玩家
function pActivity:UpdateMaxMark()
	local szName = GetName()
	local nMark = self:GetTask(%TSK_MARK)
	local obj = ObjBuffer:New()
	obj:Push(szName)
	obj:Push(nMark)
	RemoteExecute(%szRemoteScript, "tbZhuShuai:s2g_AddDate", obj.m_Handle)
	obj:Destroy()
end

function pActivity:PlayerSignUp(nType)
	self:SetTask(%TSK_TB_NOW_DAILY_ACTIVE[nType], 0)
	
	if PlayerFunLib:CheckTotalLevel(150,"",">=") ~= 1 then
		return
	end
	local bResult = 1
	if nType == NUM_SONGJIN and self:CheckSongJinTime() == 0 then
		bResult = 0
	end
	-- 周一，二，四，六的21:00点宋金不能激活此奖励
	if bResult == 0 then
		return
	end
	
	local nCount = self:GetTaskDaily(%TSK_TB_DAILY_ACTIVE[nType])
	if nCount > 0 then
		self:AddTaskDaily(%TSK_TB_NOW_DAILY_ACTIVE[nType], 1)
		self:AddTaskDaily(%TSK_TB_DAILY_ACTIVE[nType], -1)
	end
end

function pActivity:DoubleExp_YDBZ(nPoint)
	local nTask = %TSK_TB_NOW_DAILY_ACTIVE[%NUM_YDBZ]
	if self:GetTaskDaily(nTask) == 1 then
		nPoint = nPoint * 2
	end
	return nPoint
end

function pActivity:DoubleExp_ChuangGuan(nPoint)
	local nTask = %TSK_TB_NOW_DAILY_ACTIVE[%NUM_CHUANGGUAN]
	if self:GetTaskDaily(nTask) == 1 then
		nPoint = nPoint * 2
	end
	return nPoint
end

function pActivity:CheckSongJinTime()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H"))
	local tbWeek = {1,2,4,6}
	local tbFuncHour = {20,21}
	local nAvai = 1
	for i=1, getn(tbWeek) do
		if nWeekDay == tbWeek[i] and (nHour == tbFuncHour[1] or nHour == tbFuncHour[2]) then
			nAvai = 0
		end
	end
	return nAvai
end

function pActivity:DoubleExp_Songjin(nPoint)
	local nTask = %TSK_TB_NOW_DAILY_ACTIVE[%NUM_SONGJIN]
	
	local nAvai = 1
	if self:GetTaskDaily(nTask) == 1 and self:CheckSongJinTime() == 1 then
		nPoint = nPoint * 2
	end
	return nPoint
end

function pActivity:ResetTSKNowActive(nType)
	self:SetTask(%TSK_TB_NOW_DAILY_ACTIVE[nType], 0)
end

pActivity.nPak = curpack()