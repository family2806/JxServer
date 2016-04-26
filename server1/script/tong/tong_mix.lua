--tong_action.lua
--��������������ʵĽӿ�
function DefFun2(n1, n2)
	return 1
end
function DefFun3(n1, n2, n3)
	return 1
end
Include("\\script\\tong\\workshop\\workshop_setting.lua")

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
IncludeLib("TONG")
Include("\\script\\tong\\contribution_entry.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\addtongnpc.lua")

if MODEL_GAMESERVER == 1 then
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
end

-------------------�ʽ�ת����ϵ----------------------
--��ȡǮ
function MONEYFUND_ADD_R(nTongID, nAdd)
	if (TONG_GetMoney(nTongID) + nAdd < 0)then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg;
	if (nAdd > 0) then
		szMsg = szMember.." ������"..nAdd.."�����ӵ�����ʽ�"
	else
		szMsg = szMember.." �Ӱ���ʽ�ȡ����"..(-nAdd).."������"
	end	
	Msg2Tong(nTongID, szMsg)
	if (abs(nAdd) >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		cTongLog:WriteInfTB("FUND", "moneyadd", nTongID, {add = nAdd})
	end
	return 1
end

function APPLY_JOIN_TONG(nTongID, szApplyerName)
	if szApplyerName == nil then
		return 0
	end
	
	local szMsg = szApplyerName.."������"
	Msg2Tong(nTongID, szMsg)
	return 1
end

function SAVE_ZHAO_MU(nTongID)	
	local szMsg = "��¼��ļ!"
	Msg2Tong(nTongID, szMsg)
	return 1
end
function MONEYFUND_ADD_G_1(nTongID, nAdd)
	if (CheckGlobalTradeFlag() == 0) then
		return 0
	end
	local nCash = GetCash()
	if (nCash < nAdd)then
		Msg2Player("��û��ô��Ǯ��")
		return 0
	end
	local nMax = 2000000000	--20��
	if (abs(nAdd) > nMax) then
		Msg2Player("��ȡ�������")
		return 0
	end
	--�ȸ�Ǯ�ټ��ʽ�
	if (nAdd > 0)then	--��Ǯ
		if Pay(nAdd) ~= 1 then
			return 0
		end
	else				--ȡǮ
		if nCash > nMax + nAdd then --ȡ�������nMax
			Msg2Player("ȡ���������ֽ𳬹����ޣ�����ȡ��")
			return 0
		end
	end
	return 1
end
function MONEYFUND_ADD_G_2(nTongID, nAdd)
	--�ȿ��ʽ��ٸ�Ǯ
	if (nAdd < 0)then
		Earn(-nAdd)
	end
	return 1
end

--����ʽ�ת�������
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
		local szMsg = szMember.." ��"..nOffer.."����ʽ�תΪ"..nAdd.."���Ὠ�����"
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYFUND2BF, nAdd)
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "moneyfund2buildfund", nTongID, {money = nOffer, buildfund = nAdd})
		return 1
	end
	return 0
end
function MONEYFUND2BUILDFUND_G_1(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		Msg2Player("����ʽ�û��ô��")
		return 0
	end
	if (nOffer < 10000)then
		Msg2Player("ÿ��ת����������Ϊ1������")
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	if (nCurFund + nOffer/COEF_CONTRIB_TO_VALUE > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		Msg2Player("ת������������ۻ���õĽ�����𽫳������ޣ�����ת����")
		return 0
	end
	return 1
end
MONEYFUND2BUILDFUND_G_2 = DefFun2

--�������תս������
function BUILDFUND2WARFUND_R(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) >= nOffer)then
		if (TONG_ApplyAddBuildFund(nTongID, -nOffer) == 1 and TONG_ApplyAddWarBuildFund(nTongID, nOffer) == 1) then
			local szMember = TONGM_GetName(nTongID, ExecutorId);
			local szMsg = szMember.." ��"..nOffer.."���Ὠ�����תΪ���ս������"
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_BF2WF, nOffer)	
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
			Msg2Tong(nTongID, szMsg);
			cTongLog:WriteInfTB("FUND", "buildfund2warfund", nTongID, {buildfund2warfund = nOffer})
			return 1
		end		
	end
	return 0
end
function BUILDFUND2WARFUND_G_1(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) <  nOffer)then
		Msg2Player("��Ὠ������㣡")
		return 0
	end
	return 1
end
BUILDFUND2WARFUND_G_2 = DefFun2

--��Ա��Ǯת�������
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
	local szMsg = szMember.." ������"..(nOffer / 10000).."�������ӵ���Ὠ�����"
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEY2BF, nTotalBuildfundAdd)
	if (nOffer >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "money2buildfund", nTongID, {money = nOffer, buildfund = nBuildfundAdd, storebuildfund = nStoredAdd})
	return 1
end
function MONEY2BUILDFUND_G_1(nTongID, nOffer)
	if (nOffer < 10000)then
		Msg2Player("ÿ�ξ�����������Ϊ1�������ӣ�")
		return 0
	end
	if (GetCash() < nOffer)then
		Msg2Player("����ֽ��㣡")
		return 0
	end
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		Msg2Player("��ʿ���ܾ��ף�")
		return 0
	end
	local nContribution = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	local nWeekTotal = GetWeeklyOffer()
	if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION)then
		Msg2Player("���״���������ۻ���õĹ��׶Ƚ��������ޣ����ܾ��ף�")
		return 0
	end
	Pay(nOffer)
	AddWeeklyOffer(nContribution)
	AddCumulateOffer(nContribution)
	if (AddContribution(nContribution) ~= 1)then
		return 0
	end
	Msg2Player("�������<color=gold>"..nOffer.."<color>�����ӵ���Ὠ����𣬲����<color=green>"..nContribution.."<color>�㹱�׶�")
	return 1
end
MONEY2BUILDFUND_G_2 = DefFun2

--��Ա���׶�ת�������׶�
function CONTRIBUTION2STOREOFFER_R(nTongID, nExecutor, nOffer)
	-- if (TONG_ApplyAddStoredOffer(nTongID, nOffer) ~= 1)then
	if (TONG_ContributeOffer(nTongID, nExecutor, nOffer) ~= 1) then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." ������"..nOffer.."�㹱�׶ȵ���ᴢ�����׶�"
	if (nOffer >= 100) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "contribution2storeoffer", nTongID, {contribution2storeoffer = nOffer})
	return 1
end
function CONTRIBUTION2STOREOFFER_G_1(nTongID, nExecutor, nOffer)
	-- �۳����׶�ʱ����relay���룬��ΪrelayҲ��ִ����Ӧ�ű����� wangbin 2009-4-13
	if (GetContribution() < nOffer or AddContribution(-nOffer, 0) ~= 1)then
		Msg2Player("��û����ô�๱�׶ȣ�")
		return 0
	end
	return 1
end
CONTRIBUTION2STOREOFFER_G_2 = DefFun3

-- �������׶�ת��Ա���׶ȣ�Ⱥ����
g_szFigure = { "ȫ�����", "����", "����", "�ӳ�", "����", "��ʿ" }
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
		local szMsg = szMaster.."�����ߵ�"..g_szFigure[nFigure+2].."("..nCounts.."��)��������"..nOffer.."�㴢�����׶ȣ�"
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution1", nTongID, {storeoffer2contribution = nOffer})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION1_G_1(nTongID, nFigure, nOffer)
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	if (TONG_GetStoredOffer(nTongID) < nCounts * nOffer)then
		Msg2Player("��ᴢ�����׶Ȳ����Է��Ŵ����")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION1_G_2 = DefFun3

-- �������׶�ת��Ա���׶ȣ����ˣ�
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
		local szMsg = format("%s��%s������%d���ᴢ�����׶�",szMaster,szMember,nOffer);
		if (nOffer > 100)then
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		end
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution2", nTongID, {storeoffer2contribution = nOffer, member = szMember})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION2_G_1(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		Msg2Player("�������׶�ֻ���򱾰��Ա���ţ�")
		return 0
	end
	if (TONG_GetStoredOffer(nTongID) < nOffer)then
		Msg2Player("��ᴢ�����׶Ȳ��㣡")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION2_G_2 = DefFun3

-- ��Ա���߳����
function MEMBER_KICK_R(nTongID, nMemberID, nFlag)
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, TB_TONG_FIGURE_NAME[nMemberFigure].."���ܱ��߳���ᣡ");
		return 0;
	end
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0) then
		local szExcutor = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = szExcutor.." ��"..szMember.." �߳��˰�ᣡ"
		Msg2Tong(nTongID, szMsg)
		--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼	
		cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember})
		return 1
	end
	-- �۵�5%���׶ȣ�����ȡ����
	local nDel = (nOffer + 19) / 20
	TONGM_ApplyAddOffer(nTongID, nMemberID, -nDel)
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	--ս�����𲻹���
	if (nWarFund < nWarBuildDec)then
		return 0
	end
	--����������
	if (nStoredBuildFund < nBuildDec)then
		--�ټӽ��軹�ǲ�����
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
	--��������
	local szExcutor = TONGM_GetName(nTongID, ExecutorId);
	local szMember = TONGM_GetName(nTongID, nMemberID);
	local szMsg = szExcutor.." ��"..szMember.." �߳��˰�ᣬ��������������"..nBuildDec..
		"��ս���������"..nWarBuildDec.."��"
	Msg2Tong(nTongID, szMsg)	
	if (nStoredBuildFund < nBuildDec)then
		Msg2Tong(nTongID, "����ʱ������������㣬���㲿���Կ۳����������棡")	
	end
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼	
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
		Msg2Player(TB_TONG_FIGURE_NAME[nMemberFigure].."���ܱ��߳���ᣡ");
		return 0;
	end
	
	local nKickCount = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT);	--�޳�����Ա�ļ���
	local nKickDate  = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE);	--�޳�����Ա�ļ�������
	local nDate 	 = tonumber(GetLocalDate("%Y%m%d"));						--��ǰ����
	
	if (nKickDate ~= nDate) then
		nKickCount = 0;
		nKickDate  = nDate;
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, 	nKickCount);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE, 	nKickDate);
	end
	
	if(nKickCount >= MAX_KICK_COUNT) then
		local szMsg = format("��ǰ���ڳ������߳�����������ƣ���ʱ�޷��߳����!",MAX_KICK_COUNT);
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
		Say("<#>�ߵ����˽��۳���ᴢ���������"..nBuildDec.."���索����������㽫�ӽ������ۣ������ս������"..nWarBuildDec.."��ȷ����", 
			2, "�ߵ�/#KickConfirm("..nTongID..","..nMemberID..")", "ȡ��/#Cancel")
	elseif (nFlag == 2)then
		--ս�����𲻹���
		if (nWarFund < nWarBuildDec)then
			Msg2Player("�ߵ����˺�ս�����𽫿۳ɸ�������ʱ�޷��߳����ˣ�")
			return 0
		end
		--����������
		if (nStoredBuildFund < nBuildDec)then
			--�ټ�ս�����ǲ�����
			if (nBuildFund < nBuildDec - nStoredBuildFund)then
				Msg2Player("�ߵ����˺�����𽫿۳ɸ�������ʱ�޷��߳����ˣ�")
				return 0
			end
		end	
		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	return 0
end
function MEMBER_KICK_G_2(nTongID, nMemberID, nFlag)
	-- ֱ����relay�۳�5%���׶ȡ� wangbin 2009-4-15
	--ע�⵱ǰ��PlayerID�Ǳ�����
	-- local nContribution = GetContribution()
	-- local nDel = (nContribution + 20 - 1) / 20	--�۵�5%���׶ȣ�����ȡ����
	-- AddContribution(-nDel)
	return 1
end
function KickConfirm(nTongID, nMemberID)
	TONG_ApplyKickMember(nTongID, nMemberID, 2)
end

-- ��Ա����
function MEMBER_RETIRE_R(nTongID, nMemberID, bRetireOrNot)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szMemberName = TONGM_GetName(nTongID, nMemberID);
	local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (ExecutorId == nMemberID) then
				szPerson = "��";
			end
			Msg2PlayerByName(szExecutorName, szPerson.."�ڰ��е���Ҫְ������������ֻ�жӳ�����ͨ���ڲ�����������");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2PlayerByName(szExecutorName, "��ǰ������������Ѵ����ޣ��޷�����������������"..nRetiredMemberCount);
			return 0;
		end
		local szMsg = ""
		if (ExecutorId ~= nMemberID) then
			if (TONGM_GetOnline(nTongID, nMemberID) == 1 or
				nTodayDate - TONGM_GetLastOnlineDate(nTongID, nMemberID) < TONGMEMBER_RETIRE_REQUIRE_DAY) then
					Msg2PlayerByName(szExecutorName, "��ֻ�ܶ�"..TONGMEMBER_RETIRE_REQUIRE_DAY.."�����ϲ����ߵİ���Ա����ǿ������������");
					return 0;
			end
			szMsg = szExecutorName.."��"..szMemberName.."������������"
		else
			szMsg = szMemberName.."�Ӱ��������"
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
			Msg2PlayerByName(szExecutorName, "����֮����"..TONGMEMBER_UNRETIRE_REQUIRE_DAY.."��󷽿ɽ��������");
			return 0;
		end
		Msg2PlayerByName(szExecutorName, "���ѳɹ����������");
		TONGM_ApplySetRetireDate(nTongID, nMemberID, 0);
		cTongLog:WriteInfTB("MEMBER", "unretire", nTongID, {member = szMemberName})
	end
	--��ά��ս���������
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0���������ά��
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
				szPerson = "��";
			end
			Msg2Player(szPerson.."�ڰ��е���Ҫְ������������ֻ�жӳ�����ͨ���ڲ�����������");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2Player("��ǰ������������Ѵ����ޣ��޷�����������������");
			return 0;
		end
	else
		if (nFigure ~= 4) then	-- ������ʿ����������
			return 0;
		end
	end
	return 1;
end
MEMBER_RETIRE_G_2 = DefFun3

-- ��Ա������
function MEMBER_ONLINE_R(nTongID, nMemberID, bOnline)
	-- ����
	if (bOnline == 1) then
	-- ����
	else
		local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
		TONGM_ApplySetLastOnlineDate(nTongID, nMemberID, nTodayDate);
	end
	return 1;
end
MEMBER_ONLINE_G_1 = DefFun3
MEMBER_ONLINE_G_2 = DefFun3

function MEMBER_REMOVE_R(nTongID, nMemberID)
	--��ά��ս���������
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "remove", nTongID, {member = szMember});
	--0���������ά��
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

-- ��Ա������
function MEMBER_ADD_R(nTongID, nMemberID, nOfferBring)
	local nBuildAdd = floor(nOfferBring * 0.6)
	local nWarBuildAdd = floor(nOfferBring * 0.4)
	TONG_ApplyAddStoredBuildFund(nTongID, nBuildAdd)
	TONG_ApplyAddWarBuildFund(nTongID, nWarBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWarBuildAdd)
	local szMember = TONGM_GetName(nTongID, nMemberID)
	local szMsg = szMember.."���뱾���Ὠ���������"..nBuildAdd..
		"�򣬰��ս����������"..nWarBuildAdd.."��!"
	Msg2Tong(nTongID, szMsg)
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	local szExecutor = TONGM_GetName(nTongID, ExecutorId);
	cTongLog:WriteInfTB("MEMBER", "add", nTongID, {member = szMember, buildadd = nBuildAdd, warbuildadd = nWarBuildAdd})
	--��ά��ս���������
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0���������ά��
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
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "���������Ѵ����ޣ�");
			end	
			return 0
		end
	elseif (nFigure == TONG_MANAGER)then
		if TONG_GetMemberCount(nTongID, TONG_MANAGER) >= MAX_MANAGER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "�ӳ������Ѵ����ޣ�");
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

-- ���õ�ͼ
function MAP_SET_R(nTongID, nMapID)
	if (TONG_GetTongMap(nTongID) ~= 0)then
		return 0
	end
	local szMsg = "�����ӵ�й�������ͼ�����ڿɵ��<���뱾��>��ť���룡"
	Msg2Tong(nTongID, szMsg)		
	TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- �����ʷ��¼
	TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
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
		Msg2Player("�ڷ�ս����ͼ���ܽ��룡")
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
	Say("<#>��ѡ��ҪԤ���ĵ�ͼ", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"������/#Cancel")
end

function SelectMap(nTongID)
	local aInfo = {1, "/#CreatMap("..nTongID..","}		
	Say("<#>����������ﰲ�ң�", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"�ٿ��ǿ���/#Cancel")
end

--��ͼ��������
MAP_CREAT_R		= DefFun2
function MAP_CREAT_G_1(nTongID, nMapCopy)
	local nTongMap = TONG_GetTongMap(nTongID) 
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongMap > DYNMAP_ID_BASE) then
		Say("<#>��İ���Ѿ����Լ��ĵ�ͼ�ˣ�", 0)
		return 0
	elseif (nMapCopy == 0 and nTongLevel < 2) then
		if(nTongMap > 0)then
			Say("<#>����Ѿ��й�����ͼ�ˣ���Ὠ��ȼ���2��ʱ����ӵ���Լ��ĵ�ͼ��", 0)
			return 0
		else
			local nrand = mod(nTongID, 4) + 1
			local aNum = {
				gb_GetTask("TONG_PUBLIC_MAP", 1),
				gb_GetTask("TONG_PUBLIC_MAP", 2),
				gb_GetTask("TONG_PUBLIC_MAP", 3),
				gb_GetTask("TONG_PUBLIC_MAP", 4),
				}
			Say("<#>���ڰ�Ὠ��ȼ�С��2����ֻ��ӵ�й�����ͼ����ѡ��һ��������ͼ������ѡ�����а����ٵĵ�ͼ����", 6,
			"���ѡ��/#PublicMap("..nTongID..","..nrand..")", 
			"������ͼһ������"..aNum[1].."����ᣩ/#PublicMap("..nTongID..",1)", 
			"������ͼ��������"..aNum[2].."����ᣩ/#PublicMap("..nTongID..",2)",
			"������ͼ��������"..aNum[3].."����ᣩ/#PublicMap("..nTongID..",3)", 
			"������ͼ�ģ�����"..aNum[4].."����ᣩ/#PublicMap("..nTongID..",4)",
			"ȡ��/#Cancel"
			)
			return 0
		end
	end
	if (nMapCopy == 0) then
		Say("<#>������ڿ���ӵ��˽�е�ͼ����Ҫ����ô��", 2, "Ԥ����ͼ/#BrowseMap("..nTongID..")", 
			"������ͼ/#SelectMap("..nTongID..")")
		return 0
	end
	return 1
end
MAP_CREAT_G_2	= DefFun2

function PublicMap(nTongID, nSelect)
	gb_AppendTask("TONG_PUBLIC_MAP", nSelect, 1)
	TONG_ApplySetTongMap(nTongID, aPublicMap[nSelect])
end

--��ͼ�����ɹ�
function MAP_CREATED_R(nTongID, dwMapID, nMapCopy)
	--�״δ�����ʱ�򹫸�һ��
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE and nMapCopy > 0)then
		local mapname = aDynMapCopyName[nMapCopy]
		if (mapname == nil)then
			mapname = "��֪��ʲô�ط�"
		end
		local szMsg = "��ϲ�������ӵ�а��˽�е�ͼ�����ڿɵ��<���뱾��>��ť���룡"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- �����ʷ��¼
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		cTongLog:WriteInfTB("MAP", "create", nTongID, {mapid = dwMapID, mapname = mapname})
	end
	return 1
end
MAP_CREATED_G_1 = DefFun2
--��ͼ�����ɹ�
function MAP_CREATED_G_2(nTongID, nMapID, nMapCopy)
	nMapIdx = SubWorldID2Idx(nMapID)
	-- ��ͼ���ڴ˷�����
	if nMapIdx < 0 or nMapCopy <= 0 then
		return 
	end
	-- ����С��ͼ����
	SetWorldName(nMapIdx, TONG_GetName(nTongID).."�����")
	-- ��������Ϊ����ͼ
	SetMapType(nMapIdx, 1);
	-- ���ò���ΪTongID
	SetMapParam(nMapIdx, 0, nTongID);
	-- �������а���ͼNpc
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
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "���ͼ��֮��")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "����ͼ��֮��")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "���ͼ��֮��")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "����ͼ��֮��")--��
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

-- GameSvr���ģ���ͷ�
function RELEASE_G()
	--�������ݻ���
	local nTongID = TONG_GetFirstTong()
	while nTongID ~= 0 do
		--������
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
		TongFundAdd(nTongID,  nCurValue)
		TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, 0)
		nTongID = TONG_GetNextTong(nTongID)
	end
	return 1
end

-- �������ͼ
function ENTER_TONG_MAP_G(nTongID)
	if (GetLevel() < 10) then
		Msg2Player("10��������Ҳ��ܽ������ͼ��");
		return 0;
	end
	local dwSelfMapID = SubWorldIdx2ID(SubWorld);
	if (GetFightState() == 1 or (IsCityMap(dwSelfMapID) ~= 1 and IsFreshmanMap(dwSelfMapID) ~= 1 and IsTongMap(dwSelfMapID) ~= 1)) then
		Msg2Player("ֻ���ڳ��к����ִ�ķ�ս��������ܽ������ͼ��");
		return 0;
	end
	local szTongName = TONG_GetName(nTongID);
	if (szTongName == nil or szTongName == "") then
		Msg2Player("�ð�᲻���ڣ��޷����������ͼ��");
		return 0;
	end
	local _,SelfTong = GetTongName()
--	if (SelfTong ~= nTongID)then
--		if TONG_GetTongMapBan(nTongID) ~= 0 then
--			Msg2Player(szTongName.." û�п��ŵ�ͼ���ƣ��޷����룡");
--	 		return 0;
--		end
--	end
	local dwTargetMapID = TONG_GetTongMap(nTongID);
	if (dwTargetMapID <= 0) then
		Msg2Player(szTongName.." û�а���ͼ���޷����룡");
	 	return 0;
	end
	if (dwTargetMapID == dwSelfMapID) then
		Msg2Player("������Ŀ�����ͼ���ˣ�");
		return 0;
	end
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(dwTargetMapID, pos.x, pos.y);	-- �Ժ��ͼ����������Ϊ��ͼ��һ������
end

--���õ�ͼ
function CONFIGURE_TONG_MAP_G(nTongID)
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE) then
		Msg2Player("���ӵ��˽�е�ͼʱ����ʹ�ô˹��ܣ�")
		return 0		
	end
	local ban = TONG_GetTongMapBan(nTongID)
	local szBan = {[0]="���õ�ͼ����/#SetTongMapBan("..nTongID..",1)",
				 [1]="ȡ����ͼ����/#SetTongMapBan("..nTongID..",0)"}
	local szState = {[0]="<color=green>����<color>",
				[1]="<color=red>��ֹ<color>"}
	if (ban ~= 0)then
		ban = 1
	end	
	local szMsg = "��������ð���ͼ�Ƿ�����ǰ���Ա�룬��ǰ��ͼ����Ϊ��"
	Say(szMsg..szState[ban], 2, szBan[ban], "ȡ������/#Cancel")
	return 1
end

function SetTongMapBan(nTongID, bOpen)
	TONG_ApplySetTongMapBan(nTongID, bOpen)
	local szExcutor = GetName();
	local szState = {[0]="����",
				[1]="��ֹ"}	
	local szMsg = szExcutor.." ���İ���ͼ����Ϊ��"..szState[bOpen]
	Msg2Player("���ĵ�ͼ���Ƴɹ���")
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
				Msg2Player("�����ڵ�ͼ�İ���������˵�ͼ���ƣ��㲻���ٽ��룡")
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
	-- ���ͽ���ȼ��ŵ��߳Ǵ�ս�ű��д��� wangbin 2010.8.11
	-- TONG_ApplySetOccupyCityDay(nPreOwner, 0);
	--ʧȥ�ǳأ�5���ｵΪ4��
	-- if (TONG_GetBuildLevel(nPreOwner) >= 5) then
	-- 	TONG_ApplyDegrade(nPreOwner)
	-- 	local szMsg="���ǳض�ʧ������ȼ���Ϊ4��"
	-- 	Msg2Tong(nPreOwner, szMsg)
	-- 	TONG_ApplyAddEventRecord(nPreOwner, szMsg);	
	-- end
	cTongLog:WriteInfTB("TONG", "occupy_city", nOwner, {preowner = nPreOwner, city = nCityMap});
	return 1
end

--����ؼ�
--TONGTSK_STUNT_ID = 1011
--stunt����/���ð���ؼ�
function CONFIGURE_TONG_STUNT_G()
	local _, nTongID = GetTongName()
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	
	-- �ر������
	if (nStuntID == 6) then
		nStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
	end
	
	if (nStuntID == 0) then	--û�п����ؼ�
		Describe("��Ϊ���İ��ѡ��һ���ؼ���", 7,
					TB_STUNTID_INFO[1].name.."/#StuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#StuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#StuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#StuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#StuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#StuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#StuntConfirm(7)",
					"�Ժ�����/Cancel"		)
	else
		local szMsg = "��ᵱǰ�ؼ�:"..
						"<enter><color=yellow>����"..TB_STUNTID_INFO[nStuntID].name.."<color>"..
						"<enter>�ؼ���ȡȨ��:"..
						"<enter><color=yellow>����"..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
						"<enter>�ؼ�ά�����:"..
						"<enter><color=yellow>��??"..(TB_STUNTID_INFO[nStuntID].consume).."��ս���ʽ�".."<color>"..
						"<enter>�ؼ���������:"..
						"<enter><color=yellow>����"..TB_STUNTID_INFO[nStuntID].describe.."<color>"
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		Describe(szMsg, 3, "�����ؼ�/#CHANGE_STUNT_G_1("..nTongID..")", "��������ͣ���ؼ�ά��/#PAUSED_STUNT_G_1("..nTongID..")", "�뿪�Ի�/OnCancel")
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
	szMsg = "��ǰ����ؼ�״̬Ϊ��"..TB_STUNT_PAUSESTATE[nPause][1].."<enter>�����ڱ���ά����"..TB_STUNT_PAUSESTATE[nPause][2]
	nswitch = TB_STUNT_PAUSESTATE[nPause][3]
	Describe(szMsg.."<enter>����Ҫ��", 2, "�������رգ�/#Paused_Stunt_Sure("..nTongID..","..nswitch..")", "ȡ������/Cancel")
	return 1
end

function Paused_Stunt_Sure(nTongID, nSwitch)
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nSwitch)
	if (nSwitch == 1 or nSwitch == 3) then
		Msg2Player("���İ���ؼ�״̬������һ�ܸı�Ϊ��"..TB_STUNT_PAUSESTATE[nSwitch][2])
	else
		Msg2Player("���İ���ؼ�״̬������һ�ܸı�Ϊ��"..TB_STUNT_PAUSESTATE[nSwitch][2])
	end
end

function StuntConfirm(nStuntID)
	--local nStuntID = nSel + 1
	local szMsg = "��ﵱǰѡ����ؼ�:"..
					"<enter><color=yellow>����"..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>�ؼ���ȡȨ��:"..
					"<enter><color=yellow>����"..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>�ؼ�ά�����:"..
					"<enter><color=yellow>����"..(TB_STUNTID_INFO[nStuntID].consume).."��ս���ʽ�<color>"..
					"<enter>�ؼ���������:"..
					"<enter><color=yellow>����"..TB_STUNTID_INFO[nStuntID].describe.."<color>"
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "ȷ��ѡ��/#StuntSureConfirm("..nStuntID..")", "������һ��/CONFIGURE_TONG_STUNT_G", "�뿪�Ի�/OnCancel")
end

function getStuntHelp(nStuntID, nRight, nCycle, nMaxMem)
	local szMsg = ""
	if (nRight == 1) then
		szMsg = "<enter>��ǰ����ؼ���������һ�ܣ��ڴ�������ֻ����ȡ"..nMaxMem.."�Ρ�"
	else
		szMsg = "<enter>��ǰ����ؼ���������һ�ܣ��ڴ�������ÿ��ÿ���ֻ����ȡһ�θ��ؼ���������"..nMaxMem.."�˴���ȡ��"
	end
	return szMsg
end

function CHANGE_STUNT_G_1(nTongID)
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nSwith = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
	if (nStuntID ~= 0) then	
		local szMsg = "��ᵱǰ�ؼ�:"..TB_STUNTID_INFO[nStuntID].name
		if (nSwith ~= 0 and nSwith ~= nStuntID) then
			szMsg = szMsg .."<enter>����ת���İ���ؼ���:"..TB_STUNTID_INFO[nSwith].name
		else
			szMsg = szMsg .."<enter>����ת���İ���ؼ���:[��]"
		end
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		szMsg = szMsg.."<enter>����Ҫ������ؼ�����Ϊ��һ�֣�"
		
		Describe(szMsg, 7,
					TB_STUNTID_INFO[1].name.."/#ChangeStuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#ChangeStuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#ChangeStuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#ChangeStuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#ChangeStuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#ChangeStuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#ChangeStuntConfirm(7)",
					"�Ժ�����/Cancel"		)
	end
	return 1
end

function ChangeStuntConfirm(nStuntID)
	local _, nTongID = GetTongName()
	--local nStuntID = nSel + 1
	local szMsg = "��ﵱǰѡ����ؼ�:"..
					"<enter><color=yellow>����"..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>�ؼ���ȡȨ��:"..
					"<enter><color=yellow>����"..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>�ؼ�ά�����:"..
					"<enter><color=yellow>����"..(TB_STUNTID_INFO[nStuntID].consume).."��ս���ʽ�<color>"..
					"<enter>�ؼ���������:"..
					"<enter><color=yellow>����"..TB_STUNTID_INFO[nStuntID].describe.."<color>";
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "ȷ��ѡ��/#StuntSureConfirm("..nStuntID..")", "������һ��/#CHANGE_STUNT_G_1("..nTongID..")", "�뿪�Ի�/OnCancel")
end

function StuntSureConfirm(nStuntID)
	local _, nTongID = GetTongName()
	TONG_ApplySetStunt(nTongID, nStuntID)
end

function STUNT_SET_R(nTongID, nStuntID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId)
	if (TONG_GetBuildLevel(nTongID) < 4) then
		Msg2PlayerByName(szExecutorName, "4�����°�᲻��ʹ�ð���ؼ���");
		return 0
	end
	local nOldStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	-- �ر������
	if (nOldStuntID == 6) then
		nOldStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nOldStuntID)
	end
	
	-- ���ԭ��û���ؼ�����Ϊ�����ؼ���������Ч��������Ϊ�����ؼ���ά������Ч��
	if (nOldStuntID == 0) then
		local nday = TONG_GetDay(nTongID);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, 3)
		Msg2Tong(nTongID, "����ؼ��������ؼ�Ϊ"..TB_STUNTID_INFO[nStuntID].name)
		TONG_ApplyAddEventRecord(nTongID, "����ؼ��������ؼ�Ϊ"..TB_STUNTID_INFO[nStuntID].name)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, nStuntID)
		Msg2PlayerByName(szExecutorName, "��ﱾ���ڰ���ؼ������󣬰���ؼ������Ϊ"..TB_STUNTID_INFO[nStuntID].name.."��")
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

---------�ͻ��˵�ȫ�����⡣����������������������
else
-----------------����ǿͻ���---------------
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

aPrompt= {"��ȷ��Ҫ�����������?",
"��ȷ��Ҫ�����������?",
"��ȷ��Ҫ������������?",
"��ȷ��Ҫ�رո�������?",
"��ȷ��Ҫ������������?",
"��ȷ��Ҫ����������ʹ�õȼ���?",
}
function GET_WORKSHOP_PROMPT(nTongID, nWorkshopID, nOpt)
	if (nOpt == 3)then
		return "�رո����������¿�����Ҫ"..
		wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), 
			TWS_GetUseLevel(nTongID, nWorkshopID)).."�������ȷ��Ҫ�ر���"
	end
	return aPrompt[nOpt+1]
end

end

-------------------������ȫ���⡣����������������
-- ��ȡ��Ὠ�����������
function GET_WEEKBUILD_THRESHOLD(nTongID)
	return tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
end

--���ۻ����׶�����
function GET_WEEKLYOFFER_THRESHOLD()
	return MAX_WEEK_CONTRIBUTION
end

-- ��ȡ���������������	
function GET_WORKSHOP_COUNT_THRESHOLD(nTongID)
	return tongGetMaxWorkshopNum(nTongID, TONG_GetBuildLevel(nTongID))
end	

-- ��ȡ��������ȼ�����
function GET_WORKSHOP_LEVEL_THRESHOLD(nTongID)
	return tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
end

function GET_WORKSHOP_DATA(nTongID, nWorkshopID, nFlag)
	if (nFlag == 0)then
		return wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), TWS_GetUseLevel(nTongID, nWorkshopID))
	end
	return 0
end

-- ȡ��
function Cancel()
end
