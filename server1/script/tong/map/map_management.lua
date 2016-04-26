-- IB帮会地图管理

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4, 1290, 1, -1, "青铜鼎" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1天的秒数
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1周的秒数


-- 帮会地图管理
function tongmap_management()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>只有帮主才能为帮会建设区域", "可以!/cancel"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalk, "<dec><npc>无论哪个帮会都可以建设自己的区域。建设自己的区域需要 <color=yellow>4 青铜鼎<color>, 使用时间为 <color=yellow>2 周<color>. 青铜鼎可以延长帮会区域使用时间，玫瑰青铜鼎有延长一周的使用时间.");
		tinsert(aryTalk, "进去看看 \tongmap_preview_1");
		tinsert(aryTalk, "建设帮会区域/tongmap_create_1");
	else
		tinsert(aryTalk, "<dec><npc>你的帮会区域使用时间为 <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalk, "迁移帮会地图/tongmap_change_1");
		tinsert(aryTalk, "延长帮会区域使用时间./tongmap_recharge_1");
	end
	tinsert(aryTalk, "取消/cancel");
	CreateTaskSay(aryTalk);
end
		
-- 预览帮会地图
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>选择想看区域",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "取消 /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyId, pos.x, pos.y);
end

-- 创建帮会地图
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>请选择想建设的区域<enter>建设帮会区域需要有"..TONGMAP_CREATE_PRICE.."个"..TONGMAP_PRICE_ITEM[5]..", 可以在两周内使用. :",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "取消/cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>你确定建设  "..aDynMapCopyName[nMapCopyId].." 选择该区域<enter>建设帮会区域需要有"..TONGMAP_CREATE_PRICE.."个"..TONGMAP_PRICE_ITEM[5].." 可以在两周内使用.",
		"确认/#tongmap_create_3("..nMapCopyId..")",
		"取消/cancel",
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>贵帮已有帮会区域了.", "好的!/cancel"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>建设帮会区域需要4 青铜鼎!", "好的!/cancel"});
		return
	end
	-- 扣钱
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] 当扣除帮会建设费用时发生错误!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- 创建地图
	TONG_ApplyCreatMap(nTongID, nMapCopyId);
	-- 设置有效日期
	local szExpireDate = tongmap_add_expire_date(nTongID, TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>建设成果帮会区域，有效期到<color=yellow>"..szExpireDate.."<color>", "继续延时/tongmap_recharge_1", "离开/cancel"});
end

---- 迁移帮会地图
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>请选择要迁移到哪个地图（价格 "..TONGMAP_CHANGE_PRICE.."个"..TONGMAP_PRICE_ITEM[5].."）：",
--	};
--	for nMapCopyId, szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalk, szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalk, "取消/cancel");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>你确定要迁移到 "..aDynMapCopyName[nMapCopyId].." 这个地图（价格 "..TONGMAP_CHANGE_PRICE.."个"..TONGMAP_PRICE_ITEM[5].."）？",
--		"确定/#tongmap_change_3("..nMapCopyId..")",
--		"取消/cancel",
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _, nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>贵帮还没有帮会地图！", "好的/cancel"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>你不够钱迁移帮会地图阿，同学！", "好的/cancel"});
--		return
--	end
--	-- 扣钱
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] 异常！迁移帮会地图扣费失败！\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- 迁移地图
--	TONG_ApplyChangeMap(nTongID, nMapCopyId);
--end

-- 充值帮会地图
function tongmap_recharge_1()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("延长帮会区域，请放入 "..TONGMAP_PRICE_ITEM[5]..","..TONGMAP_RECHARGE_PRICE.."个"..TONGMAP_PRICE_ITEM[5].."可以延期使用1周. \n".."可以使用到"..tongmap_get_expire_date(nTongID), "tongmap_recharge_2", "cancel");
end
function tongmap_recharge_2(nItemCount)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	local aryTongMapItem = {};
	for i = 1, nItemCount do
		local nItemIdx = GetGiveItemUnit(i);
		local nItemGenre, nItemDetailType, nItemParticular = GetItemProp(nItemIdx);
		if (nItemGenre == TONGMAP_PRICE_ITEM[1] and nItemDetailType == TONGMAP_PRICE_ITEM[2]) then
			tinsert(aryTongMapItem, nItemIdx);
		end
	end
	local nRechargeWeek = floor(getn(aryTongMapItem) / TONGMAP_RECHARGE_PRICE);
	if (nRechargeWeek <= 0) then
		local aryTalk =
		{
			"<dec><npc>需要放入最少 "..TONGMAP_RECHARGE_PRICE.."个"..TONGMAP_PRICE_ITEM[5]..".",
			"再开 /#tongmap_recharge_1()",
			"不需要/cancel",
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- 扣钱
	for i = 1, nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] 扣除帮会区域延期时发生异常!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- 设置有效日期
	local szExpireDate = tongmap_add_expire_date(nTongID, nRechargeWeek);
	CreateTaskSay({"<dec><npc>延期成功 <color=yellow>"..nRechargeWeek.."<color> 周, 有效期到<color=yellow>"..szExpireDate.."<color>", "继续延时/tongmap_recharge_1", "离开/cancel"});
end

-- 增加帮会地图有效日期（单位为周）
function tongmap_add_expire_date(nTongID, nRechargeWeek)
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME, nExpireTime);
	return FormatTime2String("%Y-%m-%d", nExpireTime - DAY_SECOND_SUM);
end

-- 检查帮会地图是否已过有效日期
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- 已过期
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1天内提示即将过期
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d", nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- 即将过期
		else
			return 0;		-- 正常
		end
	end
end

-- 获取帮会地图有效日期
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d", TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function cancel()
end