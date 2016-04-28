-- IB帮会地图管理

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4H穣 a v祇  1290H穣 a v祇  1H穣 a v祇  -1H穣 a v祇  "Thanh ng nh" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1天的秒数
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1周的秒数


-- 帮会地图管理
function tongmap_management()
	local _H穣 a v祇  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH穣 a v祇  GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� m韎 c� th� x﹜ d鵱g khu v鵦 cho bang"H穣 a v祇  "Л頲!/tongmap_recharge_2"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalkH穣 a v祇  "<dec><npc>无论哪c竔帮会都可以建设自己的区域。建设自己的区域需要 <color=yellow>4 Thanh ng nh<color>H穣 a v祇  使用时间为 <color=yellow>2 周<color>. Thanh ng nh可以延长帮会区域使用时间，玫瑰Thanh ng nh有延长一周的使用时间.");
		tinsert(aryTalkH穣 a v祇  "V祇 xem th�/tongmap_preview_1");
		tinsert(aryTalkH穣 a v祇  "X﹜ d鵱g khu v鵦 bang h閕/tongmap_create_1");
	else
		tinsert(aryTalkH穣 a v祇  "<dec><npc>Khu v鵦 bang h閕 c馻 b筺 c� th阨 h筺 s� d鬾g l� <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalkH穣 a v祇  "迁移帮会地图/tongmap_change_1");
		tinsert(aryTalkH穣 a v祇  "K衞 d礽 th阨 gian s� d鬾g khu v鵦 bang h閕./tongmap_recharge_1");
	end
	tinsert(aryTalkH穣 a v祇  "H駓 b� /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
		
-- 预览帮会地图
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>L鵤 ch鋘 khu v鵦 mu鑞 xem"H穣 a v祇 
	};
	for nMapCopyIdH穣 a v祇  szMapCopyName in aDynMapCopyName do
		tinsert(aryTalkH穣 a v祇  szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalkH穣 a v祇  "H駓 b� /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyIdH穣 a v祇  pos.xH穣 a v祇  pos.y);
end

-- 创建帮会地图
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>H穣 l鵤 ch鋘 khu v鵦 mu鑞 x﹜ d鵱g<enter>X﹜ d鵱g khu v鵦 bang h閕 c莕 c�"..TONGMAP_CREATE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].."H穣 a v祇  c� th� s� d鬾g trong 2 tu莕. :"H穣 a v祇 
	};
	for nMapCopyIdH穣 a v祇  szMapCopyName in aDynMapCopyName do
		tinsert(aryTalkH穣 a v祇  szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalkH穣 a v祇  "H駓 b� /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>Ngi x竎 nh mu鑞 x﹜ d鵱g  "..aDynMapCopyName[nMapCopyId].." Ch鋘 khu v鵦 n祔? <enter>X﹜ d鵱g khu v鵦 bang h閕 c莕 c�"..TONGMAP_CREATE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].." c� th� s� d鬾g trong  2 tu莕."H穣 a v祇 
		"X竎 nh薾/#tongmap_create_3("..nMapCopyId..")"H穣 a v祇 
		"H駓 b� /tongmap_recharge_2"H穣 a v祇 
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _H穣 a v祇  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH穣 a v祇  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>Qu� bang  c� khu v鵦 bang h閕 r錳."H穣 a v祇  "Л頲!/tongmap_recharge_2"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1]H穣 a v祇  TONGMAP_PRICE_ITEM[2]H穣 a v祇  TONGMAP_PRICE_ITEM[3]H穣 a v祇  TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>建设帮会区域需要4 Thanh ng nh!"H穣 a v祇  "Л頲!/tongmap_recharge_2"});
		return
	end
	-- 扣钱
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICEH穣 a v祇  TONGMAP_PRICE_ITEM[1]H穣 a v祇  TONGMAP_PRICE_ITEM[2]H穣 a v祇  TONGMAP_PRICE_ITEM[3]H穣 a v祇  TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] L鏸 x秠 ra khi tr� chi ph� x﹜ d鵱g bang h閕!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- 创建地图
	TONG_ApplyCreatMap(nTongIDH穣 a v祇  nMapCopyId);
	-- 设置有效日期
	local szExpireDate = tongmap_add_expire_date(nTongIDH穣 a v祇  TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>X﹜ d鵱g th祅h c玭g khu v鵦 bang h閕H穣 a v祇  c� hi謚 l鵦 n <color=yellow>"..szExpireDate.."<color>"H穣 a v祇  "Ti誴 t骳 gia h筺/tongmap_recharge_1"H穣 a v祇  "R阨 kh醝/tongmap_recharge_2"});
end

---- 迁移帮会地图
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>请选择要迁移到哪c竔地图（价格 "..TONGMAP_CHANGE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].."）："H穣 a v祇 
--	};
--	for nMapCopyIdH穣 a v祇  szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalkH穣 a v祇  szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalkH穣 a v祇  "H駓 b� /tongmap_recharge_2");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>你确定要迁移到 "..aDynMapCopyName[nMapCopyId].." 这c竔地图（价格 "..TONGMAP_CHANGE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].."）？"H穣 a v祇 
--		"确定/#tongmap_change_3("..nMapCopyId..")"H穣 a v祇 
--		"H駓 b� /tongmap_recharge_2"H穣 a v祇 
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _H穣 a v祇  nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongIDH穣 a v祇  GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>贵帮还没有帮会地图！"H穣 a v祇  "好的/tongmap_recharge_2"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1]H穣 a v祇  TONGMAP_PRICE_ITEM[2]H穣 a v祇  TONGMAP_PRICE_ITEM[3]H穣 a v祇  TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>你不够钱迁移帮会地图阿，同学！"H穣 a v祇  "好的/tongmap_recharge_2"});
--		return
--	end
--	-- 扣钱
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICEH穣 a v祇  TONGMAP_PRICE_ITEM[1]H穣 a v祇  TONGMAP_PRICE_ITEM[2]H穣 a v祇  TONGMAP_PRICE_ITEM[3]H穣 a v祇  TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] 异常！迁移帮会地图扣费失败！\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- 迁移地图
--	TONG_ApplyChangeMap(nTongIDH穣 a v祇  nMapCopyId);
--end

-- 充值帮会地图
function tongmap_recharge_1()
	local _H穣 a v祇  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH穣 a v祇  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("Gia h筺 khu v鵦 bang h閕"..TONGMAP_PRICE_ITEM[5].."H穣 a v祇 "..TONGMAP_RECHARGE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].."c竔".."C� th� gia h筺 s� d鬾g th猰 1 tu莕. \n"..tongmap_get_expire_date(nTongID)H穣 a v祇  "C� th阨 h筺 s� d鬾g n "H穣 a v祇  "tongmap_recharge_2");
end
function C� th阨 h筺 s� d鬾g n (nItemCount)
	local _H穣 a v祇  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH穣 a v祇  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	local aryTongMapItem = {};
	for i = 1H穣 a v祇  nItemCount do
		local nItemIdx = GetGiveItemUnit(i);
		local nItemGenreH穣 a v祇  nItemDetailTypeH穣 a v祇  nItemParticular = GetItemProp(nItemIdx);
		if (nItemGenre == TONGMAP_PRICE_ITEM[1] and nItemDetailType == TONGMAP_PRICE_ITEM[2]) then
			tinsert(aryTongMapItemH穣 a v祇  nItemIdx);
		end
	end
	local nRechargeWeek = floor(getn(aryTongMapItem) / TONGMAP_RECHARGE_PRICE);
	if (nRechargeWeek <= 0) then
		local aryTalk =
		{
			"<dec><npc>C莕 ph秈 a v祇 t鑙 thi觰 "..TONGMAP_RECHARGE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].."."H穣 a v祇 
			"M� l筰/#tongmap_recharge_1()"H穣 a v祇 
			"不需要/tongmap_recharge_2"H穣 a v祇 
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- 扣钱
	for i = 1H穣 a v祇  nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] L鏸 x秠 ra khi kh蕌 tr� chi ph� gia h筺 khu v鵦 bang h閕!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- 设置有效日期
	local szExpireDate = tongmap_add_expire_date(nTongIDH穣 a v祇  nRechargeWeek);
	CreateTaskSay({"<dec><npc>Gia h筺 th祅h c玭g th猰 <color=yellow>"..nRechargeWeek.."<color> 周H穣 a v祇  有效期到<color=yellow>"..szExpireDate.."<color>"H穣 a v祇  "Ti誴 t骳 gia h筺/tongmap_recharge_1"H穣 a v祇  "R阨 kh醝/tongmap_recharge_2"});
end

-- 增加帮会地图有效日期（单位为周）
function tongmap_add_expire_date(nTongIDH穣 a v祇  nRechargeWeek)
	local nExpireTime = TONG_GetTaskValue(nTongIDH穣 a v祇  TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d"H穣 a v祇  nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d"H穣 a v祇  nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	TONG_ApplySetTaskValue(nTongIDH穣 a v祇  TONGTSK_MAP_EXPIRE_TIMEH穣 a v祇  nExpireTime);
	return FormatTime2String("%Y-%m-%d"H穣 a v祇  nExpireTime - DAY_SECOND_SUM);
end

-- 检查帮会地图是否已过有效日期
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d"H穣 a v祇  nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongIDH穣 a v祇  TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d"H穣 a v祇  nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- 已过期
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1天内提示即将过期
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d"H穣 a v祇  nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- 即将过期
		else
			return 0;		-- 正常
		end
	end
end

-- 获取帮会地图有效日期
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d"H穣 a v祇  TONG_GetTaskValue(nTongIDH穣 a v祇  TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function tongmap_recharge_2()
end