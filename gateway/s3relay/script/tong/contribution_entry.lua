--活动价值量->取80%加到个人贡献度->(周累积贡献度累加(周累积贡献度上限)->个人总贡献度累加，(如果是周目标活动)个人周目标贡献度累加->帮会周目标贡献度累加)，
	--取5%加到师傅，取15%加到储备贡献度，%60价值量到建设基金->帮会周累积帮会基金(上限)->帮会总累积建设基金，40%价值量到战备基金
--活动价值量入口函数：ContriValueAdd(nValue, nEntry)，返回０表示失败(无帮会)，１表示成功
Include("\\script\\tong\\tong_setting.lua")
Include("\\script\\tong\\log.lua")


--缓存到一定价值量才发到Relay
TONG_VALUE_SYNC = 1000000 --储备贡献度及周目标累积贡献度价值量缓存上限
TONG_FUND_SYNC = 5000000 --建设基金缓存上限

--转化系数
coefPersonal = 0.8
coefTongStore = 0.15
coefMaster = 0.05
coefBuildFund = 0.6
coefWarFund = 0.4


function TongFundAdd(nTongID, nCurValue)
	local nTongWeekBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	nCurValue = nCurValue / 10000
	--_dbgMsg("目前周累积建设基金："..nTongWeekBuildFund.."/"..nWeekBuildUpper)
	local nBuildFund = floor(nCurValue*coefBuildFund)	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildFund)
	if (nTongWeekBuildFund < nWeekBuildUpper) then
		--周累积即将达上限
		if (nTongWeekBuildFund + nBuildFund >= nWeekBuildUpper) then
			local nLeft = nWeekBuildUpper - nTongWeekBuildFund				 
			--_dbgMsg("建设基金即达周上限，余额将增加到储备建设基金！")
			-- 帮会事件记录
			cTongLog:WriteInf("FUND", "THRESHOLD\t"..tostring(TONG_GetName(nTongID)).."\tTongWeek:\t"..
				TONG_GetWeek(nTongID).."\tTongDay:\t"..TONG_GetDay(nTongID))
			TONG_ApplyAddEventRecord(nTongID, "获得建设基金已达周上限，此后获得建设基金将加到储备建设基金")
			TONG_ApplyAddStoredBuildFund(nTongID, nBuildFund - nLeft)
			nBuildFund = nLeft
		end
		--_dbgMsg("增加帮会建设基金"..nBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nBuildFund)		
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildFund)
		--_dbgMsg("增加帮会周累积建设基金"..(nBuildFund))
		TONG_ApplyAddTotalBuildFund(nTongID, nBuildFund)
		--_dbgMsg("增加帮会总累积建设基金"..(nBuildFund))
	else
		TONG_ApplyAddStoredBuildFund(nTongID, nBuildFund)
		--_dbgMsg("增加储备建设基金"..nBuildFund)
	end
	--_dbgMsg("增加帮会战备基金"..floor(nCurValue*coefWarFund))
	TONG_ApplyAddWarBuildFund(nTongID, nCurValue*coefWarFund)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nCurValue*coefWarFund)
end

--活动价值量入口逻辑（HEAD大陆版本）
function ContriValueEntryLogic_HEAD(nValue, nEntry) --nValue 价值量，nEntry入口
	--nValue = nValue * 10
	--_dbgMsg("X*X*X*X*X*X*X*X*X*X*X*X*X**X*X")
	--_dbgMsg("价值入口（10倍）"..nValue)
	local nRet = 1
	local _TongName, nTongID = GetTongName()
	if (nTongID == 0) then
		return 0
	end
	--隐士不能使用
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		return -2
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nWeekTotal = GetWeeklyOffer()
	local WeekGoal = TONG_GetWeekGoalEvent(nTongID)
	local nWeekGoalValue = GetWeekGoalOffer()	
	---------------------------------转化到个人-------------------------------------------
	local nPersonal = coefPersonal*nValue	
	local nMaster = coefMaster*nValue
	--个人
	local nValuePlayer = GetTask(TASKID_CONTRIVALUE) + nPersonal
	--_dbgMsg("总缓存"..nValuePlayer)
	local nContribution = floor(nValuePlayer/COEF_CONTRIB_TO_VALUE)
	if (nContribution > 0) then
		--如果是周目标活动
		if (nEntry == WeekGoal) then
			--个人周目标贡献度累加
			AddWeekGoalOffer(nContribution)
			--帮会周目标累积贡献度累加
			local nCurValue = TONG_GetTaskTemp(nTongID, TONG_WEEKTEMP) + nContribution
			if (nCurValue * COEF_CONTRIB_TO_VALUE > TONG_VALUE_SYNC) then
				TONG_ApplyAddWeekGoalValue(nTongID, nCurValue)
				nCurValue = 0
			end
			TONG_SetTaskTemp(nTongID, TONG_WEEKTEMP, nCurValue)
		end
		--周累积贡献度
		--_dbgMsg("目前周累积贡献度"..nWeekTotal.."/"..MAX_WEEK_CONTRIBUTION)
		if (nWeekTotal < MAX_WEEK_CONTRIBUTION)	then
			--获取的贡献度将超出上限
			--_dbgMsg("增加贡献度"..nContribution)
			if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION) then
				nContribution = MAX_WEEK_CONTRIBUTION - nWeekTotal
				--_dbgMsg("贡献度已达周上限，本次只增加贡献度"..nContribution)
				AddContribution(nContribution)
				AddCumulateOffer(nContribution)
				SetWeeklyOffer(MAX_WEEK_CONTRIBUTION)
				--剩余价值量
				nValuePlayer = 0
				--总价值量取获得比
				--nValue = nContribution/coefPersonal*COEF_CONTRIB_TO_VALUE
			else
				AddContribution(nContribution)
				AddCumulateOffer(nContribution)
				AddWeeklyOffer(nContribution)
				nValuePlayer = mod(nValuePlayer, COEF_CONTRIB_TO_VALUE)
			end
			--储备贡献度
			local nTongStore = coefTongStore*nValue
			--帮会储备
			local nValueTong = TONG_GetTaskTemp(nTongID, TONG_STORETEMP) + nTongStore			
			--_dbgMsg("目前帮会储备缓存"..nValueTong)
			if (nValueTong > TONG_VALUE_SYNC)then
				local nStore = floor(nValueTong/COEF_CONTRIB_TO_VALUE)
				--_dbgMsg("增加帮会储备"..nStore)
				TONG_ApplyAddStoredOffer(nTongID, nStore)
				nValueTong = mod(nValueTong, COEF_CONTRIB_TO_VALUE)
			end
			TONG_SetTaskTemp(nTongID, TONG_STORETEMP, nValueTong)
		else
			--_dbgMsg("贡献度已达上限！")
			--已达周上限
			nRet = -1
		end
	end
	if (nRet == 1)then
		--剩余缓存：nValuePlayer
		SetTask(TASKID_CONTRIVALUE, nValuePlayer)
		--师徒关系
		local nMasterValue = GetTongMTask(TONGMTSK_TOMASTER) + nMaster
		if (nMasterValue > MAX_SHITU_VALUE_STORE) then
			nMasterValue = MAX_SHITU_VALUE_STORE
		end	
		SetTongMTask(TONGMTSK_TOMASTER, nMasterValue)
	end
	
	-----------------------------------------转化到帮会基金-----------------------------
	local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
	nCurValue = nCurValue + nValue
	--_dbgMsg("目前帮会基金缓存"..nCurValue)
	if (nCurValue > TONG_FUND_SYNC) then
		TongFundAdd(nTongID,  nCurValue)
		nCurValue = 0
	end
	TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, nCurValue)
	return nRet
end

--活动价值量入口逻辑（IB版本）
function ContriValueEntryLogic_IB(nValue, nEntry) --nValue 价值量，nEntry入口
	local _TongName, nTongID = GetTongName();
	-- 判断是否有帮会
	if (nTongID == 0) then
		return 0;
	end
	-- 判断是否周目标活动
	if (nEntry ~= TONG_GetWeekGoalEvent(nTongID)) then
		return 0;
	end
	-- 将价值量换算成贡献度，加到玩家和帮会里，玩家最多只能加到周目标所需贡献度
	local nValuePlayer = GetTask(TASKID_CONTRIVALUE) + nValue;
	--_dbgMsg("总缓存"..nValuePlayer)
	local nContribution = floor(nValuePlayer / COEF_CONTRIB_TO_VALUE);
	local nWeekGoalGap = TONG_GetWeekGoalPlayer(nTongID) - GetWeekGoalOffer();
	if (nContribution >= nWeekGoalGap) then
		nContribution = nWeekGoalGap;
		nValuePlayer = 0;
	end
	if (nContribution > 0) then
		-- 个人周目标贡献度累加
		AddWeekGoalOffer(nContribution);
		-- 帮会周目标累积贡献度累加
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_WEEKTEMP) + nContribution;
		if (nCurValue * COEF_CONTRIB_TO_VALUE > TONG_VALUE_SYNC) then
			TONG_ApplyAddWeekGoalValue(nTongID, nCurValue);
			nCurValue = 0;
		end
		TONG_SetTaskTemp(nTongID, TONG_WEEKTEMP, nCurValue)
	end
	--剩余缓存：nValuePlayer
	SetTask(TASKID_CONTRIVALUE, mod(nValuePlayer, COEF_CONTRIB_TO_VALUE));
	return 1;
end

ContriValueEntryLogic = ContriValueEntryLogic_HEAD;

--function Test(nValue, nEvent)
--	if (nEvent == nil)then
--		nEvent = EVE_XINSHI
--	end	
--	ContriValueEntryLogic(nValue, nEvent)
--end