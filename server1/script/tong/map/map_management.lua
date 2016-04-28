-- IB����ͼ����

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4H�y ��a v�o  1290H�y ��a v�o  1H�y ��a v�o  -1H�y ��a v�o  "Thanh ��ng ��nh" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1�������
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1�ܵ�����


-- ����ͼ����
function tongmap_management()
	local _H�y ��a v�o  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH�y ��a v�o  GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� m�i c� th� x�y d�ng khu v�c cho bang"H�y ��a v�o  "���c!/tongmap_recharge_2"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalkH�y ��a v�o  "<dec><npc>������c�i��ᶼ���Խ����Լ������򡣽����Լ���������Ҫ <color=yellow>4 Thanh ��ng ��nh<color>H�y ��a v�o  ʹ��ʱ��Ϊ <color=yellow>2 ��<color>. Thanh ��ng ��nh�����ӳ��������ʹ��ʱ�䣬õ��Thanh ��ng ��nh���ӳ�һ�ܵ�ʹ��ʱ��.");
		tinsert(aryTalkH�y ��a v�o  "V�o xem th�/tongmap_preview_1");
		tinsert(aryTalkH�y ��a v�o  "X�y d�ng khu v�c bang h�i/tongmap_create_1");
	else
		tinsert(aryTalkH�y ��a v�o  "<dec><npc>Khu v�c bang h�i c�a b�n c� th�i h�n s� d�ng l� <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalkH�y ��a v�o  "Ǩ�ư���ͼ/tongmap_change_1");
		tinsert(aryTalkH�y ��a v�o  "K�o d�i th�i gian s� d�ng khu v�c bang h�i./tongmap_recharge_1");
	end
	tinsert(aryTalkH�y ��a v�o  "H�y b� /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
		
-- Ԥ������ͼ
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>L�a ch�n khu v�c mu�n xem"H�y ��a v�o 
	};
	for nMapCopyIdH�y ��a v�o  szMapCopyName in aDynMapCopyName do
		tinsert(aryTalkH�y ��a v�o  szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalkH�y ��a v�o  "H�y b� /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyIdH�y ��a v�o  pos.xH�y ��a v�o  pos.y);
end

-- ��������ͼ
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>H�y l�a ch�n khu v�c mu�n x�y d�ng<enter>X�y d�ng khu v�c bang h�i c�n c�"..TONGMAP_CREATE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].."H�y ��a v�o  c� th� s� d�ng trong 2 tu�n. :"H�y ��a v�o 
	};
	for nMapCopyIdH�y ��a v�o  szMapCopyName in aDynMapCopyName do
		tinsert(aryTalkH�y ��a v�o  szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalkH�y ��a v�o  "H�y b� /tongmap_recharge_2");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>Ng��i x�c ��nh mu�n x�y d�ng  "..aDynMapCopyName[nMapCopyId].." Ch�n khu v�c n�y? <enter>X�y d�ng khu v�c bang h�i c�n c�"..TONGMAP_CREATE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].." c� th� s� d�ng trong  2 tu�n."H�y ��a v�o 
		"X�c nh�n/#tongmap_create_3("..nMapCopyId..")"H�y ��a v�o 
		"H�y b� /tongmap_recharge_2"H�y ��a v�o 
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _H�y ��a v�o  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH�y ��a v�o  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>Qu� bang �� c� khu v�c bang h�i r�i."H�y ��a v�o  "���c!/tongmap_recharge_2"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1]H�y ��a v�o  TONGMAP_PRICE_ITEM[2]H�y ��a v�o  TONGMAP_PRICE_ITEM[3]H�y ��a v�o  TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>������������Ҫ4 Thanh ��ng ��nh!"H�y ��a v�o  "���c!/tongmap_recharge_2"});
		return
	end
	-- ��Ǯ
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICEH�y ��a v�o  TONGMAP_PRICE_ITEM[1]H�y ��a v�o  TONGMAP_PRICE_ITEM[2]H�y ��a v�o  TONGMAP_PRICE_ITEM[3]H�y ��a v�o  TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] L�i x�y ra khi tr� chi ph� x�y d�ng bang h�i!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- ������ͼ
	TONG_ApplyCreatMap(nTongIDH�y ��a v�o  nMapCopyId);
	-- ������Ч����
	local szExpireDate = tongmap_add_expire_date(nTongIDH�y ��a v�o  TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>X�y d�ng th�nh c�ng khu v�c bang h�iH�y ��a v�o  c� hi�u l�c ��n <color=yellow>"..szExpireDate.."<color>"H�y ��a v�o  "Ti�p t�c gia h�n/tongmap_recharge_1"H�y ��a v�o  "R�i kh�i/tongmap_recharge_2"});
end

---- Ǩ�ư���ͼ
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>��ѡ��ҪǨ�Ƶ���c�i��ͼ���۸� "..TONGMAP_CHANGE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].."����"H�y ��a v�o 
--	};
--	for nMapCopyIdH�y ��a v�o  szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalkH�y ��a v�o  szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalkH�y ��a v�o  "H�y b� /tongmap_recharge_2");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>��ȷ��ҪǨ�Ƶ� "..aDynMapCopyName[nMapCopyId].." ��c�i��ͼ���۸� "..TONGMAP_CHANGE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].."����"H�y ��a v�o 
--		"ȷ��/#tongmap_change_3("..nMapCopyId..")"H�y ��a v�o 
--		"H�y b� /tongmap_recharge_2"H�y ��a v�o 
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _H�y ��a v�o  nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongIDH�y ��a v�o  GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>��ﻹû�а���ͼ��"H�y ��a v�o  "�õ�/tongmap_recharge_2"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1]H�y ��a v�o  TONGMAP_PRICE_ITEM[2]H�y ��a v�o  TONGMAP_PRICE_ITEM[3]H�y ��a v�o  TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>�㲻��ǮǨ�ư���ͼ����ͬѧ��"H�y ��a v�o  "�õ�/tongmap_recharge_2"});
--		return
--	end
--	-- ��Ǯ
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICEH�y ��a v�o  TONGMAP_PRICE_ITEM[1]H�y ��a v�o  TONGMAP_PRICE_ITEM[2]H�y ��a v�o  TONGMAP_PRICE_ITEM[3]H�y ��a v�o  TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] �쳣��Ǩ�ư���ͼ�۷�ʧ�ܣ�\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- Ǩ�Ƶ�ͼ
--	TONG_ApplyChangeMap(nTongIDH�y ��a v�o  nMapCopyId);
--end

-- ��ֵ����ͼ
function tongmap_recharge_1()
	local _H�y ��a v�o  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH�y ��a v�o  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("Gia h�n khu v�c bang h�i"..TONGMAP_PRICE_ITEM[5].."H�y ��a v�o "..TONGMAP_RECHARGE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].."c�i".."C� th� gia h�n s� d�ng th�m 1 tu�n. \n"..tongmap_get_expire_date(nTongID)H�y ��a v�o  "C� th�i h�n s� d�ng ��n "H�y ��a v�o  "tongmap_recharge_2");
end
function C� th�i h�n s� d�ng ��n (nItemCount)
	local _H�y ��a v�o  nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongIDH�y ��a v�o  GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	local aryTongMapItem = {};
	for i = 1H�y ��a v�o  nItemCount do
		local nItemIdx = GetGiveItemUnit(i);
		local nItemGenreH�y ��a v�o  nItemDetailTypeH�y ��a v�o  nItemParticular = GetItemProp(nItemIdx);
		if (nItemGenre == TONGMAP_PRICE_ITEM[1] and nItemDetailType == TONGMAP_PRICE_ITEM[2]) then
			tinsert(aryTongMapItemH�y ��a v�o  nItemIdx);
		end
	end
	local nRechargeWeek = floor(getn(aryTongMapItem) / TONGMAP_RECHARGE_PRICE);
	if (nRechargeWeek <= 0) then
		local aryTalk =
		{
			"<dec><npc>C�n ph�i ��a v�o t�i thi�u "..TONGMAP_RECHARGE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].."."H�y ��a v�o 
			"M� l�i/#tongmap_recharge_1()"H�y ��a v�o 
			"����Ҫ/tongmap_recharge_2"H�y ��a v�o 
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- ��Ǯ
	for i = 1H�y ��a v�o  nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] L�i x�y ra khi kh�u tr� chi ph� gia h�n khu v�c bang h�i!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- ������Ч����
	local szExpireDate = tongmap_add_expire_date(nTongIDH�y ��a v�o  nRechargeWeek);
	CreateTaskSay({"<dec><npc>Gia h�n th�nh c�ng th�m <color=yellow>"..nRechargeWeek.."<color> ��H�y ��a v�o  ��Ч�ڵ�<color=yellow>"..szExpireDate.."<color>"H�y ��a v�o  "Ti�p t�c gia h�n/tongmap_recharge_1"H�y ��a v�o  "R�i kh�i/tongmap_recharge_2"});
end

-- ���Ӱ���ͼ��Ч���ڣ���λΪ�ܣ�
function tongmap_add_expire_date(nTongIDH�y ��a v�o  nRechargeWeek)
	local nExpireTime = TONG_GetTaskValue(nTongIDH�y ��a v�o  TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d"H�y ��a v�o  nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d"H�y ��a v�o  nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	TONG_ApplySetTaskValue(nTongIDH�y ��a v�o  TONGTSK_MAP_EXPIRE_TIMEH�y ��a v�o  nExpireTime);
	return FormatTime2String("%Y-%m-%d"H�y ��a v�o  nExpireTime - DAY_SECOND_SUM);
end

-- ������ͼ�Ƿ��ѹ���Ч����
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d"H�y ��a v�o  nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongIDH�y ��a v�o  TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d"H�y ��a v�o  nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- �ѹ���
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1������ʾ��������
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d"H�y ��a v�o  nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- ��������
		else
			return 0;		-- ����
		end
	end
end

-- ��ȡ����ͼ��Ч����
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d"H�y ��a v�o  TONG_GetTaskValue(nTongIDH�y ��a v�o  TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function tongmap_recharge_2()
end