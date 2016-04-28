-- IB°ï»áµØÍ¼¹ÜÀí

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4H·y ®­a vµo  1290H·y ®­a vµo  1H·y ®­a vµo  -1H·y ®­a vµo  "Thanh ®ång ®Ønh" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1ÌìµÄÃëÊý
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1ÖÜµÄÃëÊý


-- °ï»áµØÍ¼¹ÜÀí
function tongmap_management()
	local _H·y ®­a vµo  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH·y ®­a vµo  GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>ChØ cã bang chñ míi cã thÓ x©y dùng khu vùc cho bang"H·y ®­a vµo  "§­îc!/tongmap_recharge_2"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalkH·y ®­a vµo  "<dec><npc>ÎÞÂÛÄÄc¸i°ï»á¶¼¿ÉÒÔ½¨Éè×Ô¼ºµÄÇøÓò¡£½¨Éè×Ô¼ºµÄÇøÓòÐèÒª <color=yellow>4 Thanh ®ång ®Ønh<color>H·y ®­a vµo  Ê¹ÓÃÊ±¼äÎª <color=yellow>2 ÖÜ<color>. Thanh ®ång ®Ønh¿ÉÒÔÑÓ³¤°ï»áÇøÓòÊ¹ÓÃÊ±¼ä£¬Ãµ¹åThanh ®ång ®ØnhÓÐÑÓ³¤Ò»ÖÜµÄÊ¹ÓÃÊ±¼ä.");
		tinsert(aryTalkH·y ®­a vµo  "Vµo xem thö/tongmap_preview_1");
		tinsert(aryTalkH·y ®­a vµo  "X©y dùng khu vùc bang héi/tongmap_create_1");
	else
		tinsert(aryTalkH·y ®­a vµo  "<dec><npc>Khu vùc bang héi cña b¹n cã thêi h¹n sö dông lµ <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalkH·y ®­a vµo  "Ç¨ÒÆ°ï»áµØÍ¼/tongmap_change_1");
		tinsert(aryTalkH·y ®­a vµo  "KÐo dµi thêi gian sö dông khu vùc bang héi./tongmap_recharge_1");
	end
	tinsert(aryTalkH·y ®­a vµo  "Hñy bá /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
		
-- Ô¤ÀÀ°ï»áµØÍ¼
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>Lùa chän khu vùc muèn xem"H·y ®­a vµo 
	};
	for nMapCopyIdH·y ®­a vµo  szMapCopyName in aDynMapCopyName do
		tinsert(aryTalkH·y ®­a vµo  szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalkH·y ®­a vµo  "Hñy bá /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyIdH·y ®­a vµo  pos.xH·y ®­a vµo  pos.y);
end

-- ´´½¨°ï»áµØÍ¼
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>H·y lùa chän khu vùc muèn x©y dùng<enter>X©y dùng khu vùc bang héi cÇn cã"..TONGMAP_CREATE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].."H·y ®­a vµo  cã thÓ sö dông trong 2 tuÇn. :"H·y ®­a vµo 
	};
	for nMapCopyIdH·y ®­a vµo  szMapCopyName in aDynMapCopyName do
		tinsert(aryTalkH·y ®­a vµo  szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalkH·y ®­a vµo  "Hñy bá /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>Ng­¬i x¸c ®Þnh muèn x©y dùng  "..aDynMapCopyName[nMapCopyId].." Chän khu vùc nµy? <enter>X©y dùng khu vùc bang héi cÇn cã"..TONGMAP_CREATE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].." cã thÓ sö dông trong  2 tuÇn."H·y ®­a vµo 
		"X¸c nhËn/#tongmap_create_3("..nMapCopyId..")"H·y ®­a vµo 
		"Hñy bá /tongmap_recharge_2"H·y ®­a vµo 
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _H·y ®­a vµo  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH·y ®­a vµo  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>Quý bang ®· cã khu vùc bang héi råi."H·y ®­a vµo  "§­îc!/tongmap_recharge_2"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1]H·y ®­a vµo  TONGMAP_PRICE_ITEM[2]H·y ®­a vµo  TONGMAP_PRICE_ITEM[3]H·y ®­a vµo  TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>½¨Éè°ï»áÇøÓòÐèÒª4 Thanh ®ång ®Ønh!"H·y ®­a vµo  "§­îc!/tongmap_recharge_2"});
		return
	end
	-- ¿ÛÇ®
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICEH·y ®­a vµo  TONGMAP_PRICE_ITEM[1]H·y ®­a vµo  TONGMAP_PRICE_ITEM[2]H·y ®­a vµo  TONGMAP_PRICE_ITEM[3]H·y ®­a vµo  TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] Lçi x¶y ra khi trõ chi phÝ x©y dùng bang héi!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- ´´½¨µØÍ¼
	TONG_ApplyCreatMap(nTongIDH·y ®­a vµo  nMapCopyId);
	-- ÉèÖÃÓÐÐ§ÈÕÆÚ
	local szExpireDate = tongmap_add_expire_date(nTongIDH·y ®­a vµo  TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>X©y dùng thµnh c«ng khu vùc bang héiH·y ®­a vµo  cã hiÖu lùc ®Õn <color=yellow>"..szExpireDate.."<color>"H·y ®­a vµo  "TiÕp tóc gia h¹n/tongmap_recharge_1"H·y ®­a vµo  "Rêi khái/tongmap_recharge_2"});
end

---- Ç¨ÒÆ°ï»áµØÍ¼
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>ÇëÑ¡ÔñÒªÇ¨ÒÆµ½ÄÄc¸iµØÍ¼£¨¼Û¸ñ "..TONGMAP_CHANGE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].."£©£º"H·y ®­a vµo 
--	};
--	for nMapCopyIdH·y ®­a vµo  szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalkH·y ®­a vµo  szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalkH·y ®­a vµo  "Hñy bá /tongmap_recharge_2");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>ÄãÈ·¶¨ÒªÇ¨ÒÆµ½ "..aDynMapCopyName[nMapCopyId].." Õâc¸iµØÍ¼£¨¼Û¸ñ "..TONGMAP_CHANGE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].."£©£¿"H·y ®­a vµo 
--		"È·¶¨/#tongmap_change_3("..nMapCopyId..")"H·y ®­a vµo 
--		"Hñy bá /tongmap_recharge_2"H·y ®­a vµo 
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _H·y ®­a vµo  nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongIDH·y ®­a vµo  GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>¹ó°ï»¹Ã»ÓÐ°ï»áµØÍ¼£¡"H·y ®­a vµo  "ºÃµÄ/tongmap_recharge_2"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1]H·y ®­a vµo  TONGMAP_PRICE_ITEM[2]H·y ®­a vµo  TONGMAP_PRICE_ITEM[3]H·y ®­a vµo  TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>Äã²»¹»Ç®Ç¨ÒÆ°ï»áµØÍ¼°¢£¬Í¬Ñ§£¡"H·y ®­a vµo  "ºÃµÄ/tongmap_recharge_2"});
--		return
--	end
--	-- ¿ÛÇ®
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICEH·y ®­a vµo  TONGMAP_PRICE_ITEM[1]H·y ®­a vµo  TONGMAP_PRICE_ITEM[2]H·y ®­a vµo  TONGMAP_PRICE_ITEM[3]H·y ®­a vµo  TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] Òì³££¡Ç¨ÒÆ°ï»áµØÍ¼¿Û·ÑÊ§°Ü£¡\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- Ç¨ÒÆµØÍ¼
--	TONG_ApplyChangeMap(nTongIDH·y ®­a vµo  nMapCopyId);
--end

-- ³äÖµ°ï»áµØÍ¼
function tongmap_recharge_1()
	local _H·y ®­a vµo  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH·y ®­a vµo  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("Gia h¹n khu vùc bang héi"..TONGMAP_PRICE_ITEM[5].."H·y ®­a vµo "..TONGMAP_RECHARGE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].."c¸i".."Cã thÓ gia h¹n sö dông thªm 1 tuÇn. \n"..tongmap_get_expire_date(nTongID)H·y ®­a vµo  "Cã thêi h¹n sö dông ®Õn "H·y ®­a vµo  "tongmap_recharge_2");
end
function Cã thêi h¹n sö dông ®Õn (nItemCount)
	local _H·y ®­a vµo  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH·y ®­a vµo  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	local aryTongMapItem = {};
	for i = 1H·y ®­a vµo  nItemCount do
		local nItemIdx = GetGiveItemUnit(i);
		local nItemGenreH·y ®­a vµo  nItemDetailTypeH·y ®­a vµo  nItemParticular = GetItemProp(nItemIdx);
		if (nItemGenre == TONGMAP_PRICE_ITEM[1] and nItemDetailType == TONGMAP_PRICE_ITEM[2]) then
			tinsert(aryTongMapItemH·y ®­a vµo  nItemIdx);
		end
	end
	local nRechargeWeek = floor(getn(aryTongMapItem) / TONGMAP_RECHARGE_PRICE);
	if (nRechargeWeek <= 0) then
		local aryTalk =
		{
			"<dec><npc>CÇn ph¶i ®­a vµo tèi thiÓu "..TONGMAP_RECHARGE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].."."H·y ®­a vµo 
			"Më l¹i/#tongmap_recharge_1()"H·y ®­a vµo 
			"²»ÐèÒª/tongmap_recharge_2"H·y ®­a vµo 
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- ¿ÛÇ®
	for i = 1H·y ®­a vµo  nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] Lçi x¶y ra khi khÊu trõ chi phÝ gia h¹n khu vùc bang héi!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- ÉèÖÃÓÐÐ§ÈÕÆÚ
	local szExpireDate = tongmap_add_expire_date(nTongIDH·y ®­a vµo  nRechargeWeek);
	CreateTaskSay({"<dec><npc>Gia h¹n thµnh c«ng thªm <color=yellow>"..nRechargeWeek.."<color> ÖÜH·y ®­a vµo  ÓÐÐ§ÆÚµ½<color=yellow>"..szExpireDate.."<color>"H·y ®­a vµo  "TiÕp tóc gia h¹n/tongmap_recharge_1"H·y ®­a vµo  "Rêi khái/tongmap_recharge_2"});
end

-- Ôö¼Ó°ï»áµØÍ¼ÓÐÐ§ÈÕÆÚ£¨µ¥Î»ÎªÖÜ£©
function tongmap_add_expire_date(nTongIDH·y ®­a vµo  nRechargeWeek)
	local nExpireTime = TONG_GetTaskValue(nTongIDH·y ®­a vµo  TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d"H·y ®­a vµo  nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d"H·y ®­a vµo  nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	TONG_ApplySetTaskValue(nTongIDH·y ®­a vµo  TONGTSK_MAP_EXPIRE_TIMEH·y ®­a vµo  nExpireTime);
	return FormatTime2String("%Y-%m-%d"H·y ®­a vµo  nExpireTime - DAY_SECOND_SUM);
end

-- ¼ì²é°ï»áµØÍ¼ÊÇ·ñÒÑ¹ýÓÐÐ§ÈÕÆÚ
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d"H·y ®­a vµo  nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongIDH·y ®­a vµo  TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d"H·y ®­a vµo  nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- ÒÑ¹ýÆÚ
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1ÌìÄÚÌáÊ¾¼´½«¹ýÆÚ
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d"H·y ®­a vµo  nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- ¼´½«¹ýÆÚ
		else
			return 0;		-- Õý³£
		end
	end
end

-- »ñÈ¡°ï»áµØÍ¼ÓÐÐ§ÈÕÆÚ
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d"H·y ®­a vµo  TONG_GetTaskValue(nTongIDH·y ®­a vµo  TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function tongmap_recharge_2()
end