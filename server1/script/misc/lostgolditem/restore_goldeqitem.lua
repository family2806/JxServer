IncludeLib("ITEM")
Include("\\script\\lib\\common.lua")
-- Include("\\script\\misc\\lostgolditem\\lost_golditem_info.lua")

if(not g_golditem_info_tab) then
	g_golditem_info_tab = {{0},{0}}
end;

--ExtPoint
RS_EXTPOINT_GOLDITEM	= 6			--领取黄金装备扩展点
--TaskID
RS_TASKID_ISTAKED		= 1190		--领取黄金装备任务变量，-1不能领取，1领取过，0未领取
RS_TASKID_ITEMINDEX	= 1191		--已经领取到第 x 个装备
--Common
RS_GOLDITEM_ACCOUNT				= 1
RS_GOLDITEM_ROLENAME			= 2
RS_GOLDITEM_LEVEL				= 3
RS_GOLDITEM_SERIES				= 4
RS_GOLDITEM_SEX					= 5
RS_GOLDITEM_OLTOTALTIME			= 6
RS_LEVEL_RANGE					= 0					--等级误差 ？级
RS_TOTALTIME_RANGE				= 3 * 24 * 60 * 60	--在线时间误差3天

RS_ZONEID_BIT			= g_golditem_info_tab[1][1]		--使用扩展点的第n位至（n+3）位
RS_BIT_EXTPOINT_RANGE	= 3
--RS_BIT_BASE = RS_BIT_EXTPOINT_RANGE^(RS_ZONEID_BIT - 1) + (RS_ZONEID_BIT - 1);
RS_BIT_BASE = RS_BIT_EXTPOINT_RANGE * (RS_ZONEID_BIT - 1);

RS_ACCOUNT_MAXCOUNT		= g_golditem_info_tab[2][1]		--帐号数量

--帐号角色关系表
TB_ACCOUNT_ROLENAME_INFO = {};
--角色装备关系表
TB_ROLENAME_GOLDITEM_INFO ={};

function RS_Init_Account_Name_Info()
	for i = 3, getn(g_golditem_info_tab) do
		local tb = g_golditem_info_tab[i];
		local szAccount = tb[1][1];
		local nRoleCnt = tb[1][2];
		TB_ACCOUNT_ROLENAME_INFO[szAccount] = {};
		local count = 0;
		for j = 2, getn(tb) do
			local szName = tb[j][1][2];
			count = count + 1;
			TB_ACCOUNT_ROLENAME_INFO[szAccount][count] = tb[j][1];
			TB_ROLENAME_GOLDITEM_INFO[szName] = {};
			for k = 3, getn(tb[j]) do
				TB_ROLENAME_GOLDITEM_INFO[szName][getn(TB_ROLENAME_GOLDITEM_INFO[szName]) + 1] = tb[j][k];
			end;
		end;
		if (count ~= nRoleCnt) then
			print("Init AccountInfo Error!!!", i);
		end;
	end;
end;
--初始化
print("RS_Init_Account_Name_Info");
RS_Init_Account_Name_Info();


function rs_error_talk(nErr)
	if (nErr == 1) then
		Describe("对不起，你不能失去任何准备!", 1, "结束对话/gsp_cancel");
	elseif (nErr == 2) then
		Describe("你领回了自己的黄金装备了!", 1, "结束对话/gsp_cancel");
	elseif(nErr == 3) then
		Describe("你的装备不足空位 <color=red>没有空位了<color>!", 1, "结束对话/gsp_cancel");
	elseif (nErr == 4) then
		Describe("你领回装备遇到点困难，请联系服务部帮助解决!", 1, "结束对话/gsp_cancel");
	else
		print("Error Talk!!");
	end;
end;

function rs_check_istaked()
	local bTaked = GetTask(RS_TASKID_ISTAKED)
	if (bTaked == -1) then	--角色没有领取资格
		rs_error_talk(1);
		return 0;
	end;
	if (bTaked == 1) then	--角色领取过
		rs_error_talk(2);
		return 0;
	end;
	
--	if (rs_Is_Bit_Extpoint() == 0) then	--帐号中角色已全领过了
--		rs_error_talk(1);
--		return 0;
--	end;
	
	local szAccount = GetAccount();
	local szName = GetName();
	local nLevel = GetLevel();
	local nSeries = GetSeries();
	local nSex = GetSex();
	local nTotalTime = GetGameTime();
	local szTabName = "";
	local bNotUseExtpoint = 0;
	local nRoleIdx = 0;
	
	local tbroleinfo = TB_ACCOUNT_ROLENAME_INFO[szAccount];
	if (tbroleinfo) then
	--for szaccount, tbroleinfo in TB_ACCOUNT_ROLENAME_INFO do
		--if (szaccount == szAccount) then		
		for nR = 1, getn(tbroleinfo) do
			if (tbroleinfo[nR][RS_GOLDITEM_ROLENAME] == szName) then
				SetTask(RS_TASKID_ISTAKED, 2); -- 标记帐号在此表中(角色名匹配)
			end
			
			if (nLevel >= tbroleinfo[nR][RS_GOLDITEM_LEVEL] and nSeries == tbroleinfo[nR][RS_GOLDITEM_SERIES] and nSex == tbroleinfo[nR][RS_GOLDITEM_SEX] and nTotalTime > tbroleinfo[nR][RS_GOLDITEM_OLTOTALTIME]) then
				SetTask(RS_TASKID_ISTAKED, 2); -- 标记帐号在此表中(角色数据匹配)
			end
			szTabName = tbroleinfo[nR][RS_GOLDITEM_ROLENAME];
			bNotUseExtpoint = rs_Is_NotUseBit_Extpoint(nR);
			nRoleIdx = nR;
			break;
		end
		
		local nFindTask = GetTask(RS_TASKID_ISTAKED);
		local nItemIdxTask = GetTask(RS_TASKID_ITEMINDEX);
		
		if (nFindTask >= 2) then
			-- 确保此行未被领取...
			if (bNotUseExtpoint == 1) then
				return nRoleIdx, szTabName;
			--如果是领取过的,看是否还未领取完
			elseif (nFindTask >= 2 and nItemIdxTask > 0 and nItemIdxTask < getn(TB_ROLENAME_GOLDITEM_INFO[szTabName])) then
				print("rs_check_istaked Idx:"..nRoleIdx.." Name:"..szTabName);
				return nRoleIdx, szTabName;
			end;

			rs_error_talk(1); -- 帐号在表中，但不能领取(可能有异常)
			
			if (nFindTask == 2) then
				local szLogMsg = "[GoldEqItem Restore] Error\t"..date().."\tName:"..szName.."\tAccount:"..szAccount.."\tMaybe_Need_ResetExtPoint"
				WriteLog(szLogMsg);
				SetTask(RS_TASKID_ISTAKED, 3); -- 在此表中，且已写Log
			end
			return 0;
		end -- if (nFindTask >= 2)
	end;--if Account Table
	
	SetTask(RS_TASKID_ISTAKED, -1); -- 不在此表中
	rs_error_talk(1);
	return 0;
end

--main
function restore_golditem()
	-- 只有越南版本才有此功能
	if (SYSCFG_PRODUCT_REGION_ID ~= DEF_PRODUCT_REGION_VN) then
		return
	end;
	local nRoleIdx, szRoelName = rs_check_istaked();
	if (nRoleIdx == 0) then
		return
	end;	
	
	local szMsg = rs_getitem_msg(szRoelName);
	Describe("你失去的装备包括: <enter>"..szMsg.."<enter>b﹜现在收回吗？<enter>首先请<color=red>整理装备<color> 来 <color=red>留够空位<color>放装备", 2, "现在领吗？/sure2restore_golditem", "稍候回来/cancel");
end;

function sure2restore_golditem()
	local nRoleIdx, szRoleName = rs_check_istaked();
	if (nRoleIdx == 0) then
		return
	end;
	
	if (CalcFreeItemCellCount() < 60) then
	--要至少一半以上的空间
		rs_error_talk(3);
		return
	end;
	
	local tbLostGlodItem = TB_ROLENAME_GOLDITEM_INFO[szRoleName];
	local nGoldItemIdx = GetTask(RS_TASKID_ITEMINDEX);
	local nItemCount = getn(tbLostGlodItem);
	if (nGoldItemIdx < 0 and nGoldItemIdx > nItemCount) then
		print("Error!!!Take LostGoldItem Error!")
		return 
	end;
	local nAddCount = nGoldItemIdx + 10;
	if (nAddCount > nItemCount) then
		nAddCount = nItemCount;
	end;
	local nCount = 0;
	for i = nGoldItemIdx + 1, nAddCount do
		local szGoldEqName, nItemVer, nRandseed, nQ, nG, nD, nL, nS, nLucky, nMagic0, nMagic1, nMagic2, nMagic3, nMagic4, nMagic5, nMagic6, _, nMaxD, nCurD, _ = unpack(tbLostGlodItem[i]);
		local nItemIdx = AddItemEx(nItemVer, nRandseed, nQ, nG, nD, nL, nS, nLucky, nMagic0, nMagic1, nMagic2, nMagic3, nMagic4, nMagic5, nMagic6);
		if (nItemIdx > 0) then
			nCount = nCount + 1;
			
			if (nMaxD ~= -1) then
				SetMaxDurability(nItemIdx, nMaxD);
				SetCurDurability(nItemIdx, nCurD);
			end;
			
			local szItemName = GetItemName(nItemIdx);
			local szLogMsg = "[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t taked "..szItemName
			if (GetName() ~= szRoleName) then
				szLogMsg = "[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."(OrgName:"..szRoleName..")\tAccount:"..GetAccount().."\t taked "..szItemName;
			end;
			WriteLog(szLogMsg);
		else
			print("[GoldEqItem Restore] Error!!! AddItem Failed!!! GoldEqItem Name :"..szGoldEqName);
			WriteLog("[GoldEqItem Restore] Error!!! AddItem Failed!!! GoldEqItem Name :"..join(tbLostGlodItem[i]));
			break
		end;
	end;
	
	SetTask(RS_TASKID_ITEMINDEX, nAddCount);
	
	if (rs_Is_NotUseBit_Extpoint(nRoleIdx) == 1) then
		rs_Set_Bit_Extpoint(RS_EXTPOINT_GOLDITEM, nRoleIdx);
	end;
	
	local szMsg = "";
	local szLog = "";
	if (nAddCount == nItemCount) then
		SetTask(RS_TASKID_ISTAKED, 1);
		szMsg = "<enter>你已领够已失去的装备了!";
		szLog = " Taked Over!!";
	else
		szMsg = "<enter>你还有 <color=red>"..(nItemCount - nAddCount).."<color>套装备未领。请<color=red>整理装备<color> 先!";
		szLog = " Leave "..(nItemCount - nAddCount).."";
	end;
	
	if (nCount == (nAddCount - nGoldItemIdx)) then
		Describe("请领取已失去的装备，真诚感谢你"..szMsg, 1, "结束对话/gsp_cancel");
		WriteLog("[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t Taked LostGoldEqItem Count:"..(nAddCount)..szLog);
	else
		rs_error_talk(4);
		WriteLog("[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t Taked Error!! The Count Is Wrong!!"..nCount.."/"..(nAddCount - nGoldItemIdx).."(takedcount/totalcount)");
	end;
end;

-- 根据索引(1-3)，获取扩展点位的位置
function rs_Get_Bit_Extpoint(nIndex)
	return (RS_BIT_BASE + nIndex);
end

function rs_Is_Bit_Extpoint() --nExtP, nZone)
	--local nBit = RS_BIT_EXTPOINT_RANGE^(nZone - 1) + (nZone - 1);
	local nExtPointV = GetExtPoint(RS_EXTPOINT_GOLDITEM);
	for i = 1, 3 do
		if (GetBit(nExtPointV, rs_Get_Bit_Extpoint(i)) == 0) then
			return i;
		end;
	end;
	return 0;
end;

-- 是否未使用的扩展点位(nIndex:1-3)
function rs_Is_NotUseBit_Extpoint(nIndex) --nExtP, nZone)
	--local nBit = RS_BIT_EXTPOINT_RANGE^(nZone - 1) + (nZone - 1);
	local nExtPointV = GetExtPoint(RS_EXTPOINT_GOLDITEM);
	local nBit = rs_Get_Bit_Extpoint(nIndex);
	if (GetBit(nExtPointV, nBit) == 0) then
			return 1;
	end;
	return 0;
end;

function rs_Set_Bit_Extpoint(nExtP, nIndex)
	local nBit = rs_Get_Bit_Extpoint(nIndex);
	local nPoint = 2^(nBit-1); -- nBit从1开始计数
	AddExtPoint(nExtP, nPoint);
end;

function rs_getitem_msg(szName)
	local szMsg = "总共 "..getn(TB_ROLENAME_GOLDITEM_INFO[szName]).."套";
	local nGoldItemIdx = GetTask(RS_TASKID_ITEMINDEX);
	if (nGoldItemIdx < 0  or nGoldItemIdx > getn(TB_ROLENAME_GOLDITEM_INFO[szName])) then
		return
	end;
	szMsg = szMsg.."还剩 <color=yellow>"..(getn(TB_ROLENAME_GOLDITEM_INFO[szName]) - nGoldItemIdx).."<color> 套未领<enter>";
	for i = (nGoldItemIdx + 1), getn(TB_ROLENAME_GOLDITEM_INFO[szName]) do
		szMsg = szMsg.."<color=yellow>"..TB_ROLENAME_GOLDITEM_INFO[szName][i][1].."<color>,";
	end;
	--szMsg = szMsg.."共<color=yellow>"..getn(TB_ROLENAME_GOLDITEM_INFO[szName]).."<color>件！";
	return szMsg;
end;
