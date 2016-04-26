--tong_action.lua
--帮会操作，程序访问的接口
function DefFun2(n1, n2)
	return 1
end
function DefFun3(n1, n2, n3)
	return 1
end
Include("\\script\\tong\\workshop\\workshop_setting.lua")

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
IncludeLib("TONG")
Include("\\script\\tong\\contribution_entry.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\addtongnpc.lua")

if MODEL_GAMESERVER == 1 then
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
end

-------------------资金转化关系----------------------
--存取钱
function MONEYFUND_ADD_R(nTongID, nAdd)
	if (TONG_GetMoney(nTongID) + nAdd < 0)then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg;
	if (nAdd > 0) then
		szMsg = szMember.." 捐献了"..nAdd.."两银子到帮会资金"
	else
		szMsg = szMember.." 从帮会资金取走了"..(-nAdd).."两银子"
	end	
	Msg2Tong(nTongID, szMsg)
	if (abs(nAdd) >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		cTongLog:WriteInfTB("FUND", "moneyadd", nTongID, {add = nAdd})
	end
	return 1
end

function APPLY_JOIN_TONG(nTongID, szApplyerName)
	if szApplyerName == nil then
		return 0
	end
	
	local szMsg = szApplyerName.."加入帮会"
	Msg2Tong(nTongID, szMsg)
	return 1
end

function SAVE_ZHAO_MU(nTongID)	
	local szMsg = "记录招募!"
	Msg2Tong(nTongID, szMsg)
	return 1
end
function MONEYFUND_ADD_G_1(nTongID, nAdd)
	if (CheckGlobalTradeFlag() == 0) then
		return 0
	end
	local nCash = GetCash()
	if (nCash < nAdd)then
		Msg2Player("你没这么多钱！")
		return 0
	end
	local nMax = 2000000000	--20亿
	if (abs(nAdd) > nMax) then
		Msg2Player("存取数额过大！")
		return 0
	end
	--先付钱再加资金
	if (nAdd > 0)then	--存钱
		if Pay(nAdd) ~= 1 then
			return 0
		end
	else				--取钱
		if nCash > nMax + nAdd then --取出后大于nMax
			Msg2Player("取出后所带现金超过上限，不能取！")
			return 0
		end
	end
	return 1
end
function MONEYFUND_ADD_G_2(nTongID, nAdd)
	--先扣资金再给钱
	if (nAdd < 0)then
		Earn(-nAdd)
	end
	return 1
end

--帮会资金转建设基金
function MONEYFUND2BUILDFUND_R(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	local nAdd = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	if (nCurFund +  nAdd > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		return 0
	end
	if (TONG_ApplyAddMoney(nTongID, -nOffer) == 1 and TONG_ApplyAddBuildFund(nTongID, nAdd) == 1)then
		TONG_ApplyAddWeekBuildFund(nTongID, nAdd)
		local szMember = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMember.." 将"..nOffer.."帮会资金转为"..nAdd.."万帮会建设基金"
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYFUND2BF, nAdd)
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "moneyfund2buildfund", nTongID, {money = nOffer, buildfund = nAdd})
		return 1
	end
	return 0
end
function MONEYFUND2BUILDFUND_G_1(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		Msg2Player("帮会资金没这么多")
		return 0
	end
	if (nOffer < 10000)then
		Msg2Player("每次转换数额最少为1万两！")
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	if (nCurFund + nOffer/COEF_CONTRIB_TO_VALUE > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		Msg2Player("转换此数额后本周累积获得的建设基金将超出上限，不能转换！")
		return 0
	end
	return 1
end
MONEYFUND2BUILDFUND_G_2 = DefFun2

--建设基金转战备基金
function BUILDFUND2WARFUND_R(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) >= nOffer)then
		if (TONG_ApplyAddBuildFund(nTongID, -nOffer) == 1 and TONG_ApplyAddWarBuildFund(nTongID, nOffer) == 1) then
			local szMember = TONGM_GetName(nTongID, ExecutorId);
			local szMsg = szMember.." 将"..nOffer.."万帮会建设基金转为帮会战备基金"
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_BF2WF, nOffer)	
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
			Msg2Tong(nTongID, szMsg);
			cTongLog:WriteInfTB("FUND", "buildfund2warfund", nTongID, {buildfund2warfund = nOffer})
			return 1
		end		
	end
	return 0
end
function BUILDFUND2WARFUND_G_1(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) <  nOffer)then
		Msg2Player("帮会建设基金不足！")
		return 0
	end
	return 1
end
BUILDFUND2WARFUND_G_2 = DefFun2

--成员金钱转建设基金
function MONEY2BUILDFUND_R(nTongID, nOffer)
	local nTotalBuildfundAdd = floor(nOffer / 10000)
	local nBuildfundAdd = 0
	local nStoredAdd = 0
	local nCurBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	if (nCurBuildFund >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd
		nBuildfundAdd = 0
	elseif (nCurBuildFund + nTotalBuildfundAdd >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd -  (nWeekBuildUpper - nCurBuildFund)
		nBuildfundAdd = nTotalBuildfundAdd - nStoredAdd
	else
		nStoredAdd = 0
		nBuildfundAdd = nTotalBuildfundAdd
	end
	if (nBuildfundAdd > 0)then
		TONG_ApplyAddBuildFund(nTongID, nBuildfundAdd)
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildfundAdd)
	end
	if (nStoredAdd > 0)then
		TONG_ApplyAddStoredBuildFund(nTongID, nStoredAdd)
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." 捐献了"..(nOffer / 10000).."万两银子到帮会建设基金"
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEY2BF, nTotalBuildfundAdd)
	if (nOffer >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "money2buildfund", nTongID, {money = nOffer, buildfund = nBuildfundAdd, storebuildfund = nStoredAdd})
	return 1
end
function MONEY2BUILDFUND_G_1(nTongID, nOffer)
	if (nOffer < 10000)then
		Msg2Player("每次捐献最少数额为1万两银子！")
		return 0
	end
	if (GetCash() < nOffer)then
		Msg2Player("你的现金不足！")
		return 0
	end
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		Msg2Player("隐士不能捐献！")
		return 0
	end
	local nContribution = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	local nWeekTotal = GetWeeklyOffer()
	if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION)then
		Msg2Player("捐献此数额后本周累积获得的贡献度将超出上限，不能捐献！")
		return 0
	end
	Pay(nOffer)
	AddWeeklyOffer(nContribution)
	AddCumulateOffer(nContribution)
	if (AddContribution(nContribution) ~= 1)then
		return 0
	end
	Msg2Player("你捐献了<color=gold>"..nOffer.."<color>两银子到帮会建设基金，并获得<color=green>"..nContribution.."<color>点贡献度")
	return 1
end
MONEY2BUILDFUND_G_2 = DefFun2

--成员贡献度转储备贡献度
function CONTRIBUTION2STOREOFFER_R(nTongID, nExecutor, nOffer)
	-- if (TONG_ApplyAddStoredOffer(nTongID, nOffer) ~= 1)then
	if (TONG_ContributeOffer(nTongID, nExecutor, nOffer) ~= 1) then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." 捐献了"..nOffer.."点贡献度到帮会储备贡献度"
	if (nOffer >= 100) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "contribution2storeoffer", nTongID, {contribution2storeoffer = nOffer})
	return 1
end
function CONTRIBUTION2STOREOFFER_G_1(nTongID, nExecutor, nOffer)
	-- 扣除贡献度时不向relay申请，因为relay也会执行相应脚本函数 wangbin 2009-4-13
	if (GetContribution() < nOffer or AddContribution(-nOffer, 0) ~= 1)then
		Msg2Player("你没有这么多贡献度！")
		return 0
	end
	return 1
end
CONTRIBUTION2STOREOFFER_G_2 = DefFun3

-- 储备贡献度转成员贡献度（群发）
g_szFigure = { "全体帮众", "帮主", "长老", "队长", "帮众", "隐士" }
function STOREOFFER2CONTRIBUTION1_R(nTongID, nFigure, nOffer)
	if (TONG_IsExist(nTongID) ~= 1)then
		return 0
	end
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	-- if (TONG_GetStoredOffer(nTongID) >= nCounts * nOffer)then
		-- if (TONGM_ApplyAddOfferEx(nTongID, nFigure, nOffer) ~= 1)then		
		--	return 0
		-- end		
		-- if (TONG_ApplyAddStoredOffer(nTongID, -nCounts * nOffer) ~= 1)then
		-- return 0
		-- end	
	if (TONG_DistributeOfferToGroup(nTongID, nFigure, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMaster.."向在线的"..g_szFigure[nFigure+2].."("..nCounts.."人)各发放了"..nOffer.."点储备贡献度！"
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution1", nTongID, {storeoffer2contribution = nOffer})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION1_G_1(nTongID, nFigure, nOffer)
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	if (TONG_GetStoredOffer(nTongID) < nCounts * nOffer)then
		Msg2Player("帮会储备贡献度不足以发放此数额！")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION1_G_2 = DefFun3

-- 储备贡献度转成员贡献度（单人）
function STOREOFFER2CONTRIBUTION2_R(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		return 0
	end
	-- if (TONG_GetStoredOffer(nTongID) >= nOffer)then
	-- 	TONG_ApplyAddStoredOffer(nTongID, -nOffer)
	-- 	TONGM_ApplyAddOffer(nTongID, nMemberID, nOffer)
	if (TONG_DistributeOfferToMember(nTongID, nMemberID, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = format("%s向%s发放了%d点帮会储备贡献度",szMaster,szMember,nOffer);
		if (nOffer > 100)then
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		end
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution2", nTongID, {storeoffer2contribution = nOffer, member = szMember})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION2_G_1(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		Msg2Player("储备贡献度只能向本帮成员发放！")
		return 0
	end
	if (TONG_GetStoredOffer(nTongID) < nOffer)then
		Msg2Player("帮会储备贡献度不足！")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION2_G_2 = DefFun3

-- 成员被踢出帮会
function MEMBER_KICK_R(nTongID, nMemberID, nFlag)
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, TB_TONG_FIGURE_NAME[nMemberFigure].."不能被踢出帮会！");
		return 0;
	end
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0) then
		local szExcutor = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = szExcutor.." 把"..szMember.." 踢出了帮会！"
		Msg2Tong(nTongID, szMsg)
		--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录	
		cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember})
		return 1
	end
	-- 扣掉5%贡献度（向上取整）
	local nDel = (nOffer + 19) / 20
	TONGM_ApplyAddOffer(nTongID, nMemberID, -nDel)
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	--战备基金不够减
	if (nWarFund < nWarBuildDec)then
		return 0
	end
	--储备不够减
	if (nStoredBuildFund < nBuildDec)then
		--再加建设还是不够减
		if (nBuildFund < nBuildDec - nStoredBuildFund)then
			return 0
		end
		TONG_ApplyAddStoredBuildFund(nTongID, -nStoredBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nStoredBuildFund - nBuildDec)
	else
		TONG_ApplyAddStoredBuildFund(nTongID, -nBuildDec)		
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nBuildDec)
	TONG_ApplyAddWarBuildFund(nTongID, -nWarBuildDec)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nWarBuildDec)
	--帮会扣完了
	local szExcutor = TONGM_GetName(nTongID, ExecutorId);
	local szMember = TONGM_GetName(nTongID, nMemberID);
	local szMsg = szExcutor.." 把"..szMember.." 踢出了帮会，储备建设基金减少"..nBuildDec..
		"万，战备基金减少"..nWarBuildDec.."万！"
	Msg2Tong(nTongID, szMsg)	
	if (nStoredBuildFund < nBuildDec)then
		Msg2Tong(nTongID, "踢人时储备建设基金不足，不足部分以扣除建设基金代替！")	
	end
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录	
	cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember, builddec = nBuildDec, warbuilddec = nWarBuildDec})
	return 1
end
function MEMBER_KICK_G_1(nTongID, nMemberID, nFlag)
	
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2Player(TB_TONG_FIGURE_NAME[nMemberFigure].."不能被踢出帮会！");
		return 0;
	end
	
	local nKickCount = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT);	--剔除帮会成员的计数
	local nKickDate  = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE);	--剔除帮会成员的计数日期
	local nDate 	 = tonumber(GetLocalDate("%Y%m%d"));						--当前日期
	
	if (nKickDate ~= nDate) then
		nKickCount = 0;
		nKickDate  = nDate;
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, 	nKickCount);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE, 	nKickDate);
	end
	
	if(nKickCount >= MAX_KICK_COUNT) then
		local szMsg = format("当前日期超过可踢出最大人数限制，暂时无法踢出帮会!",MAX_KICK_COUNT);
		Msg2Player(szMsg);
		return 0;
	end
	
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0)then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	if (nFlag == 1)then
		Say("<#>踢掉此人将扣除帮会储备建设基金"..nBuildDec.."万（如储备建设基金不足将从建设基金扣）及帮会战备基金"..nWarBuildDec.."万，确定吗？", 
			2, "踢掉/#KickConfirm("..nTongID..","..nMemberID..")", "取消/#Cancel")
	elseif (nFlag == 2)then
		--战备基金不够减
		if (nWarFund < nWarBuildDec)then
			Msg2Player("踢掉此人后战备基金将扣成负数，暂时无法踢除此人！")
			return 0
		end
		--储备不够减
		if (nStoredBuildFund < nBuildDec)then
			--再加战备还是不够减
			if (nBuildFund < nBuildDec - nStoredBuildFund)then
				Msg2Player("踢掉此人后建设基金将扣成负数，暂时无法踢除此人！")
				return 0
			end
		end	
		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	return 0
end
function MEMBER_KICK_G_2(nTongID, nMemberID, nFlag)
	-- 直接在relay扣除5%贡献度。 wangbin 2009-4-15
	--注意当前的PlayerID是被踢者
	-- local nContribution = GetContribution()
	-- local nDel = (nContribution + 20 - 1) / 20	--扣掉5%贡献度（向上取整）
	-- AddContribution(-nDel)
	return 1
end
function KickConfirm(nTongID, nMemberID)
	TONG_ApplyKickMember(nTongID, nMemberID, 2)
end

-- 成员退隐
function MEMBER_RETIRE_R(nTongID, nMemberID, bRetireOrNot)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szMemberName = TONGM_GetName(nTongID, nMemberID);
	local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (ExecutorId == nMemberID) then
				szPerson = "您";
			end
			Msg2PlayerByName(szExecutorName, szPerson.."在帮中担任要职，不能退隐，只有队长和普通帮众才允许退隐！");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2PlayerByName(szExecutorName, "当前帮会退隐人数已达上限，无法继续进行退隐操作"..nRetiredMemberCount);
			return 0;
		end
		local szMsg = ""
		if (ExecutorId ~= nMemberID) then
			if (TONGM_GetOnline(nTongID, nMemberID) == 1 or
				nTodayDate - TONGM_GetLastOnlineDate(nTongID, nMemberID) < TONGMEMBER_RETIRE_REQUIRE_DAY) then
					Msg2PlayerByName(szExecutorName, "您只能对"..TONGMEMBER_RETIRE_REQUIRE_DAY.."天以上不上线的帮会成员进行强制退隐操作！");
					return 0;
			end
			szMsg = szExecutorName.."对"..szMemberName.."进行退隐操作"
		else
			szMsg = szMemberName.."从帮会退隐了"
		end
		Msg2Tong(nTongID, szMsg);
		TONGM_ApplySetRetireDate(nTongID, nMemberID, nTodayDate);
		cTongLog:WriteInfTB("MEMBER", "retire", nTongID, {member = szMemberName})
	elseif (bRetireOrNot == 0) then
		if (nFigure ~= 4) then
			cTongLog:WriteErr("MEMBER", "unretire", nTongID, {member = szMemberName})
			return 0;
		end
		if (nTodayDate - TONGM_GetRetireDate(nTongID, nMemberID) < TONGMEMBER_UNRETIRE_REQUIRE_DAY) then
			Msg2PlayerByName(szExecutorName, "退隐之日起"..TONGMEMBER_UNRETIRE_REQUIRE_DAY.."天后方可解除退隐！");
			return 0;
		end
		Msg2PlayerByName(szExecutorName, "您已成功解除退隐！");
		TONGM_ApplySetRetireDate(nTongID, nMemberID, 0);
		cTongLog:WriteInfTB("MEMBER", "unretire", nTongID, {member = szMemberName})
	end
	--周维护战备基金更新
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0级帮会无周维护
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1;
end
function MEMBER_RETIRE_G_1(nTongID, nMemberID, bRetireOrNot)
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		local szMemberName = TONGM_GetName(nTongID, nMemberID);
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (GetTongMemberID() == nMemberID) then
				szPerson = "您";
			end
			Msg2Player(szPerson.."在帮中担任要职，不能退隐，只有队长和普通帮众才允许退隐！");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2Player("当前帮会退隐人数已达上限，无法继续进行退隐操作");
			return 0;
		end
	else
		if (nFigure ~= 4) then	-- 不是隐士不允许退隐
			return 0;
		end
	end
	return 1;
end
MEMBER_RETIRE_G_2 = DefFun3

-- 成员上下线
function MEMBER_ONLINE_R(nTongID, nMemberID, bOnline)
	-- 上线
	if (bOnline == 1) then
	-- 下线
	else
		local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
		TONGM_ApplySetLastOnlineDate(nTongID, nMemberID, nTodayDate);
	end
	return 1;
end
MEMBER_ONLINE_G_1 = DefFun3
MEMBER_ONLINE_G_2 = DefFun3

function MEMBER_REMOVE_R(nTongID, nMemberID)
	--周维护战备基金更新
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "remove", nTongID, {member = szMember});
	--0级帮会无周维护
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_REMOVE_G_1 = DefFun2
MEMBER_REMOVE_G_2 = DefFun2

-- 成员加入帮会
function MEMBER_ADD_R(nTongID, nMemberID, nOfferBring)
	local nBuildAdd = floor(nOfferBring * 0.6)
	local nWarBuildAdd = floor(nOfferBring * 0.4)
	TONG_ApplyAddStoredBuildFund(nTongID, nBuildAdd)
	TONG_ApplyAddWarBuildFund(nTongID, nWarBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWarBuildAdd)
	local szMember = TONGM_GetName(nTongID, nMemberID)
	local szMsg = szMember.."加入本帮，帮会建设基金增加"..nBuildAdd..
		"万，帮会战备基金增加"..nWarBuildAdd.."万!"
	Msg2Tong(nTongID, szMsg)
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	local szExecutor = TONGM_GetName(nTongID, ExecutorId);
	cTongLog:WriteInfTB("MEMBER", "add", nTongID, {member = szMember, buildadd = nBuildAdd, warbuildadd = nWarBuildAdd})
	--周维护战备基金更新
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0级帮会无周维护
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_ADD_G_1 = DefFun3
MEMBER_ADD_G_2 = DefFun3

function MEMBER_SETFIGURE_R(nTongID, nMemberID, nFigure)
	if (nFigure == TONG_ELDER)then
		if TONG_GetMemberCount(nTongID, TONG_ELDER) >= MAX_ELDER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "长老数量已达上限！");
			end	
			return 0
		end
	elseif (nFigure == TONG_MANAGER)then
		if TONG_GetMemberCount(nTongID, TONG_MANAGER) >= MAX_MANAGER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "队长数量已达上限！");
			end					
			return 0	
		end
	end
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "setfigure", nTongID, {member = szMember, figure = nFigure});
	return 1
end
MEMBER_SETFIGURE_G_1 = DefFun3
MEMBER_SETFIGURE_G_2 = DefFun3

-- 设置地图
function MAP_SET_R(nTongID, nMapID)
	if (TONG_GetTongMap(nTongID) ~= 0)then
		return 0
	end
	local szMsg = "贵帮已拥有公共帮会地图，帮众可点击<进入本帮>按钮进入！"
	Msg2Tong(nTongID, szMsg)		
	TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- 帮会历史记录
	TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
	cTongLog:WriteInfTB("MAP", "set", nTongID, {mapid = nMapID});
	return 1
end
MAP_SET_G_1	= DefFun2
MAP_SET_G_2	= DefFun2

function GenParam(aInfo)
	local i = aInfo[1]
	aInfo[1] = i+1
	local mapcopy = aDynMapCopy[i]
	return aDynMapCopyName[mapcopy]..aInfo[2]..mapcopy..")"
end

function EnterMap(nTongID, nMapCopy)
	if (GetFightState() ~= 0)then
		Msg2Player("在非战斗地图才能进入！")
		return
	end
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(nMapCopy, pos.x, pos.y)
end

function CreatMap(nTongID, nMapCopy)
	TONG_ApplyCreatMap(nTongID, nMapCopy)
end

function BrowseMap(nTongID)
	local aInfo = {1, "/#EnterMap("..nTongID..","}		
	Say("<#>请选择要预览的地图", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"不看了/#Cancel")
end

function SelectMap(nTongID)
	local aInfo = {1, "/#CreatMap("..nTongID..","}		
	Say("<#>贵帮想在哪里安家？", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"再考虑考虑/#Cancel")
end

--地图创建申请
MAP_CREAT_R		= DefFun2
function MAP_CREAT_G_1(nTongID, nMapCopy)
	local nTongMap = TONG_GetTongMap(nTongID) 
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongMap > DYNMAP_ID_BASE) then
		Say("<#>你的帮会已经有自己的地图了！", 0)
		return 0
	elseif (nMapCopy == 0 and nTongLevel < 2) then
		if(nTongMap > 0)then
			Say("<#>帮会已经有公共地图了，帮会建设等级到2级时才能拥有自己的地图！", 0)
			return 0
		else
			local nrand = mod(nTongID, 4) + 1
			local aNum = {
				gb_GetTask("TONG_PUBLIC_MAP", 1),
				gb_GetTask("TONG_PUBLIC_MAP", 2),
				gb_GetTask("TONG_PUBLIC_MAP", 3),
				gb_GetTask("TONG_PUBLIC_MAP", 4),
				}
			Say("<#>现在帮会建设等级小于2级，只能拥有公共地图，请选择一个公共地图（建议选择已有帮会较少的地图）：", 6,
			"随机选择/#PublicMap("..nTongID..","..nrand..")", 
			"公共地图一（已有"..aNum[1].."个帮会）/#PublicMap("..nTongID..",1)", 
			"公共地图二（已有"..aNum[2].."个帮会）/#PublicMap("..nTongID..",2)",
			"公共地图三（已有"..aNum[3].."个帮会）/#PublicMap("..nTongID..",3)", 
			"公共地图四（已有"..aNum[4].."个帮会）/#PublicMap("..nTongID..",4)",
			"取消/#Cancel"
			)
			return 0
		end
	end
	if (nMapCopy == 0) then
		Say("<#>帮会现在可以拥有私有地图，你要创建么？", 2, "预览地图/#BrowseMap("..nTongID..")", 
			"创建地图/#SelectMap("..nTongID..")")
		return 0
	end
	return 1
end
MAP_CREAT_G_2	= DefFun2

function PublicMap(nTongID, nSelect)
	gb_AppendTask("TONG_PUBLIC_MAP", nSelect, 1)
	TONG_ApplySetTongMap(nTongID, aPublicMap[nSelect])
end

--地图创建成功
function MAP_CREATED_R(nTongID, dwMapID, nMapCopy)
	--首次创建的时候公告一下
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE and nMapCopy > 0)then
		local mapname = aDynMapCopyName[nMapCopy]
		if (mapname == nil)then
			mapname = "不知道什么地方"
		end
		local szMsg = "恭喜，贵帮已拥有帮会私有地图，帮众可点击<进入本帮>按钮进入！"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- 帮会历史记录
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- 帮会事件记录
		cTongLog:WriteInfTB("MAP", "create", nTongID, {mapid = dwMapID, mapname = mapname})
	end
	return 1
end
MAP_CREATED_G_1 = DefFun2
--地图创建成功
function MAP_CREATED_G_2(nTongID, nMapID, nMapCopy)
	nMapIdx = SubWorldID2Idx(nMapID)
	-- 地图不在此服务器
	if nMapIdx < 0 or nMapCopy <= 0 then
		return 
	end
	-- 设置小地图名字
	SetWorldName(nMapIdx, TONG_GetName(nTongID).."的领地")
	-- 设置类型为帮会地图
	SetMapType(nMapIdx, 1);
	-- 设置参数为TongID
	SetMapParam(nMapIdx, 0, nTongID);
	-- 加载所有帮会地图Npc
	add_one_citytong_npc(nMapIdx, nMapCopy);
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID)
	local npcid
	while(nWorkshopID ~= 0)do
		local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		if (nUseLevel > 0)then
			npcid = add_one_building(nMapIdx, nMapCopy, TWS_GetType(nTongID, nWorkshopID), nUseLevel)
			TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
		end	
		nWorkshopID = TWS_GetNextWorkshop(nTongID, nWorkshopID)
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
		if (nCurLevel == 4) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "帮会图腾之柱")--右
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "城市图腾之柱")--左
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "帮会图腾之柱")--右
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "城市图腾之柱")--左
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nStuntID ~= 0 and nCitySTID ~= 0 and TB_STUNTID_INFO[nStuntID].skillid ~= nil) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	return 1
end

-- GameSvr帮会模块释放
function RELEASE_G()
	--处理数据缓存
	local nTongID = TONG_GetFirstTong()
	while nTongID ~= 0 do
		--帮会基金
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
		TongFundAdd(nTongID,  nCurValue)
		TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, 0)
		nTongID = TONG_GetNextTong(nTongID)
	end
	return 1
end

-- 进入帮会地图
function ENTER_TONG_MAP_G(nTongID)
	if (GetLevel() < 10) then
		Msg2Player("10级以上玩家才能进入帮会地图！");
		return 0;
	end
	local dwSelfMapID = SubWorldIdx2ID(SubWorld);
	if (GetFightState() == 1 or (IsCityMap(dwSelfMapID) ~= 1 and IsFreshmanMap(dwSelfMapID) ~= 1 and IsTongMap(dwSelfMapID) ~= 1)) then
		Msg2Player("只能在城市和新手村的非战斗区域才能进入帮会地图！");
		return 0;
	end
	local szTongName = TONG_GetName(nTongID);
	if (szTongName == nil or szTongName == "") then
		Msg2Player("该帮会不存在，无法进入其帮会地图！");
		return 0;
	end
	local _,SelfTong = GetTongName()
--	if (SelfTong ~= nTongID)then
--		if TONG_GetTongMapBan(nTongID) ~= 0 then
--			Msg2Player(szTongName.." 没有开放地图禁制，无法进入！");
--	 		return 0;
--		end
--	end
	local dwTargetMapID = TONG_GetTongMap(nTongID);
	if (dwTargetMapID <= 0) then
		Msg2Player(szTongName.." 没有帮会地图，无法进入！");
	 	return 0;
	end
	if (dwTargetMapID == dwSelfMapID) then
		Msg2Player("您已在目标帮会地图中了！");
		return 0;
	end
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(dwTargetMapID, pos.x, pos.y);	-- 以后地图进入点最好作为地图的一个属性
end

--设置地图
function CONFIGURE_TONG_MAP_G(nTongID)
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE) then
		Msg2Player("帮会拥有私有地图时才能使用此功能！")
		return 0		
	end
	local ban = TONG_GetTongMapBan(nTongID)
	local szBan = {[0]="设置地图禁制/#SetTongMapBan("..nTongID..",1)",
				 [1]="取消地图禁制/#SetTongMapBan("..nTongID..",0)"}
	local szState = {[0]="<color=green>开放<color>",
				[1]="<color=red>禁止<color>"}
	if (ban ~= 0)then
		ban = 1
	end	
	local szMsg = "你可以设置帮会地图是否允许非帮会成员入，当前地图禁制为："
	Say(szMsg..szState[ban], 2, szBan[ban], "取消操作/#Cancel")
	return 1
end

function SetTongMapBan(nTongID, bOpen)
	TONG_ApplySetTongMapBan(nTongID, bOpen)
	local szExcutor = GetName();
	local szState = {[0]="开放",
				[1]="禁止"}	
	local szMsg = szExcutor.." 更改帮会地图禁制为："..szState[bOpen]
	Msg2Player("更改地图禁制成功！")
	TONG_ApplyAddEventRecord(nTongID, szMsg);
end

MAP_BAN_R = DefFun2
MAP_BAN_G_1 = DefFun2
function MAP_BAN_G_2(nTongID, bBan)
	local nMap = TONG_GetTongMap(nTongID)
	if (nMap <= DYNMAP_ID_BASE)then
		return 1
	end
	nMap = SubWorldID2Idx(nMap)
	if(bBan == 1 and nMap >= 0)then
		local nMapCopy = SubWorldIdx2MapCopy(nMap)
		local nPlayer = GetFirstPlayerAtSW(nMap)
		while(nPlayer > 0)do
			PlayerIndex = nPlayer
			local _,b = GetTongName()
			if (b ~= nTongID)then
				SetFightState(0)
				local pos = GetMapEnterPos(nMapCopy)
				SetPos(pos.x, pos.y)
				Msg2Player("你所在地图的帮会已设置了地图禁制，你不能再进入！")
			end
			nPlayer = GetNextPlayerAtSW(nMap)
		end
	end
	return 1
end

function CITY_OCCUPY_R(nOwner, nPreOwner, nCityMap)
	TONG_ApplySetOccupyCityDay(nOwner, TONG_GetDay(nOwner));
	if (nPreOwner == 0)then
		return 1
	end
	-- 降低建设等级放到七城大战脚本中处理 wangbin 2010.8.11
	-- TONG_ApplySetOccupyCityDay(nPreOwner, 0);
	--失去城池，5级帮降为4级
	-- if (TONG_GetBuildLevel(nPreOwner) >= 5) then
	-- 	TONG_ApplyDegrade(nPreOwner)
	-- 	local szMsg="帮会城池丢失，建设等级降为4级"
	-- 	Msg2Tong(nPreOwner, szMsg)
	-- 	TONG_ApplyAddEventRecord(nPreOwner, szMsg);	
	-- end
	cTongLog:WriteInfTB("TONG", "occupy_city", nOwner, {preowner = nPreOwner, city = nCityMap});
	return 1
end

--帮会特技
--TONGTSK_STUNT_ID = 1011
--stunt开启/设置帮会特技
function CONFIGURE_TONG_STUNT_G()
	local _, nTongID = GetTongName()
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	
	-- 关闭灵参力
	if (nStuntID == 6) then
		nStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
	end
	
	if (nStuntID == 0) then	--没有开启特技
		Describe("请为您的帮会选择一种特技：", 7,
					TB_STUNTID_INFO[1].name.."/#StuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#StuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#StuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#StuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#StuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#StuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#StuntConfirm(7)",
					"稍后设置/Cancel"		)
	else
		local szMsg = "帮会当前特技:"..
						"<enter><color=yellow>　　"..TB_STUNTID_INFO[nStuntID].name.."<color>"..
						"<enter>特技领取权限:"..
						"<enter><color=yellow>　　"..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
						"<enter>特技维护金额:"..
						"<enter><color=yellow>　??"..(TB_STUNTID_INFO[nStuntID].consume).."万战备资金".."<color>"..
						"<enter>特技具体作用:"..
						"<enter><color=yellow>　　"..TB_STUNTID_INFO[nStuntID].describe.."<color>"
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		Describe(szMsg, 3, "更改特技/#CHANGE_STUNT_G_1("..nTongID..")", "开启（暂停）特技维护/#PAUSED_STUNT_G_1("..nTongID..")", "离开对话/OnCancel")
	end
end

function PAUSED_STUNT_G_1(nTongID)
	local nPause = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	local nswitch = 0
	local szMsg = ""
	if (nPause < 0 and nPause >= 4) then
		nPause = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nPause)
	end
	szMsg = "当前帮会特技状态为："..TB_STUNT_PAUSESTATE[nPause][1].."<enter>并将于本周维护后："..TB_STUNT_PAUSESTATE[nPause][2]
	nswitch = TB_STUNT_PAUSESTATE[nPause][3]
	Describe(szMsg.."<enter>您想要？", 2, "开启（关闭）/#Paused_Stunt_Sure("..nTongID..","..nswitch..")", "取消操作/Cancel")
	return 1
end

function Paused_Stunt_Sure(nTongID, nSwitch)
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nSwitch)
	if (nSwitch == 1 or nSwitch == 3) then
		Msg2Player("您的帮会特技状态将在下一周改变为："..TB_STUNT_PAUSESTATE[nSwitch][2])
	else
		Msg2Player("您的帮会特技状态将在下一周改变为："..TB_STUNT_PAUSESTATE[nSwitch][2])
	end
end

function StuntConfirm(nStuntID)
	--local nStuntID = nSel + 1
	local szMsg = "贵帮当前选择的特技:"..
					"<enter><color=yellow>　　"..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>特技领取权限:"..
					"<enter><color=yellow>　　"..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>特技维护金额:"..
					"<enter><color=yellow>　　"..(TB_STUNTID_INFO[nStuntID].consume).."万战备资金<color>"..
					"<enter>特技具体作用:"..
					"<enter><color=yellow>　　"..TB_STUNTID_INFO[nStuntID].describe.."<color>"
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "确定选择/#StuntSureConfirm("..nStuntID..")", "返回上一层/CONFIGURE_TONG_STUNT_G", "离开对话/OnCancel")
end

function getStuntHelp(nStuntID, nRight, nCycle, nMaxMem)
	local szMsg = ""
	if (nRight == 1) then
		szMsg = "<enter>当前帮会特技持续周期一周，在此天数内只能领取"..nMaxMem.."次。"
	else
		szMsg = "<enter>当前帮会特技持续周期一周，在此周期内每人每天仅只能领取一次该特技，仅允许"..nMaxMem.."人次领取。"
	end
	return szMsg
end

function CHANGE_STUNT_G_1(nTongID)
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nSwith = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
	if (nStuntID ~= 0) then	
		local szMsg = "帮会当前特技:"..TB_STUNTID_INFO[nStuntID].name
		if (nSwith ~= 0 and nSwith ~= nStuntID) then
			szMsg = szMsg .."<enter>决定转换的帮会特技是:"..TB_STUNTID_INFO[nSwith].name
		else
			szMsg = szMsg .."<enter>决定转换的帮会特技是:[无]"
		end
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		szMsg = szMsg.."<enter>您想要将帮会特技更改为哪一种？"
		
		Describe(szMsg, 7,
					TB_STUNTID_INFO[1].name.."/#ChangeStuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#ChangeStuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#ChangeStuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#ChangeStuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#ChangeStuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#ChangeStuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#ChangeStuntConfirm(7)",
					"稍后设置/Cancel"		)
	end
	return 1
end

function ChangeStuntConfirm(nStuntID)
	local _, nTongID = GetTongName()
	--local nStuntID = nSel + 1
	local szMsg = "贵帮当前选择的特技:"..
					"<enter><color=yellow>　　"..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>特技领取权限:"..
					"<enter><color=yellow>　　"..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>特技维护金额:"..
					"<enter><color=yellow>　　"..(TB_STUNTID_INFO[nStuntID].consume).."万战备资金<color>"..
					"<enter>特技具体作用:"..
					"<enter><color=yellow>　　"..TB_STUNTID_INFO[nStuntID].describe.."<color>";
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "确定选择/#StuntSureConfirm("..nStuntID..")", "返回上一层/#CHANGE_STUNT_G_1("..nTongID..")", "离开对话/OnCancel")
end

function StuntSureConfirm(nStuntID)
	local _, nTongID = GetTongName()
	TONG_ApplySetStunt(nTongID, nStuntID)
end

function STUNT_SET_R(nTongID, nStuntID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId)
	if (TONG_GetBuildLevel(nTongID) < 4) then
		Msg2PlayerByName(szExecutorName, "4级以下帮会不能使用帮会特技！");
		return 0
	end
	local nOldStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	-- 关闭灵参力
	if (nOldStuntID == 6) then
		nOldStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nOldStuntID)
	end
	
	-- 如果原来没有特技，则为启动特技（立即生效），否则为更改特技（维护后生效）
	if (nOldStuntID == 0) then
		local nday = TONG_GetDay(nTongID);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, 3)
		Msg2Tong(nTongID, "帮会特技开启，特技为"..TB_STUNTID_INFO[nStuntID].name)
		TONG_ApplyAddEventRecord(nTongID, "帮会特技开启，特技为"..TB_STUNTID_INFO[nStuntID].name)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, nStuntID)
		Msg2PlayerByName(szExecutorName, "贵帮本周期帮会特技结束后，帮会特技将变更为"..TB_STUNTID_INFO[nStuntID].name.."。")
		return 0
	end
	cTongLog:WriteInfTB("TONG", "setstunt", nTongID, {stuntid = nStuntID});
	return 1
end
STUNT_SET_G_1	= DefFun2

function STUNT_SET_G_2(nTongID, nStuntID)
	if (nStuntID ~= 0) then
		for i = 1, getn(TONGTSK_TOTEMINDEX) do
			local nNpcIndex = TONG_GetTaskValue(nTongID, TONGTSK_TOTEMINDEX[i])
			if (nNpcIndex > 0) then
				for j=1, getn(TB_STUNTID_INFO) do
					RemoveNpcSkillState(nNpcIndex, TB_STUNTID_INFO[j].skillid)
				end
				AddNpcSkillState(nNpcIndex, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
end

---------客户端的全放在这。。。。。。。。。。。。
else
-----------------如果是客户端---------------
MONEYFUND_ADD_C_1 = DefFun2
MONEYFUND_ADD_C_2 = DefFun2
MONEYFUND2BUILDFUND_C_1 = DefFun2
MONEYFUND2BUILDFUND_C_2 = DefFun2
MAP_CREATED_C_1 = DefFun2
MAP_CREATED_C_2 = DefFun2
MAP_CREAE_C_1	= DefFun2
MAP_CREAT_C_2	= DefFun2
MAP_SET_C_1	= DefFun2
MAP_SET_C_1	= DefFun2
CONTRIBUTION2STOREOFFER_C_1 = DefFun3
CONTRIBUTION2STOREOFFER_C_2 = DefFun3
BUILDFUND2WARFUND_C_1 = DefFun2
BUILDFUND2WARFUND_C_2 = DefFun2
MONEY2BUILDFUND_C_1 = DefFun2
MONEY2BUILDFUND_C_2 = DefFun2
STOREOFFER2CONTRIBUTION1_C_1 = DefFun3
STOREOFFER2CONTRIBUTION1_C_2 = DefFun3
STOREOFFER2CONTRIBUTION2_C_1 = DefFun3
STOREOFFER2CONTRIBUTION2_C_2 = DefFun3
MEMBER_KICK_C_1 = DefFun3
MEMBER_KICK_C_2 = DefFun3
MEMBER_RETIRE_C_1 = DefFun3
MEMBER_RETIRE_C_2 = DefFun3
MEMBER_ONLINE_C_1 = DefFun3
MEMBER_ONLINE_C_2 = DefFun3
MEMBER_ADD_C_1 = DefFun3
MEMBER_ADD_C_2 = DefFun3
MEMBER_SETFIGURE_C_1 = DefFun3
MEMBER_SETFIGURE_C_2 = DefFun3
STUNT_SET_C_1	= DefFun2
STUNT_SET_C_2	= DefFun2

aPrompt= {"您确定要建造该作坊吗?",
"您确定要拆除该作坊吗?",
"您确定要开启该作坊吗?",
"您确定要关闭该作坊吗?",
"您确定要升级该作坊吗?",
"您确定要调整该作坊使用等级吗?",
}
function GET_WORKSHOP_PROMPT(nTongID, nWorkshopID, nOpt)
	if (nOpt == 3)then
		return "关闭该作坊后重新开启需要"..
		wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), 
			TWS_GetUseLevel(nTongID, nWorkshopID)).."万建设基金，确认要关闭吗？"
	end
	return aPrompt[nOpt+1]
end

end

-------------------公共的全放这。。。。。。。。。
-- 获取帮会建设基金周上限
function GET_WEEKBUILD_THRESHOLD(nTongID)
	return tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
end

--周累积贡献度上限
function GET_WEEKLYOFFER_THRESHOLD()
	return MAX_WEEK_CONTRIBUTION
end

-- 获取帮会作坊数量上限	
function GET_WORKSHOP_COUNT_THRESHOLD(nTongID)
	return tongGetMaxWorkshopNum(nTongID, TONG_GetBuildLevel(nTongID))
end	

-- 获取帮会作坊等级上限
function GET_WORKSHOP_LEVEL_THRESHOLD(nTongID)
	return tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
end

function GET_WORKSHOP_DATA(nTongID, nWorkshopID, nFlag)
	if (nFlag == 0)then
		return wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), TWS_GetUseLevel(nTongID, nWorkshopID))
	end
	return 0
end

-- 取消
function Cancel()
end
