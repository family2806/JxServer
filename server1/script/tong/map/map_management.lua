-- IB����ͼ����

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4, 1290, 1, -1, "��ͭ��" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1�������
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1�ܵ�����


-- ����ͼ����
function tongmap_management()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>ֻ�а�������Ϊ��Ὠ������", "����!/cancel"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalk, "<dec><npc>�����ĸ���ᶼ���Խ����Լ������򡣽����Լ���������Ҫ <color=yellow>4 ��ͭ��<color>, ʹ��ʱ��Ϊ <color=yellow>2 ��<color>. ��ͭ�������ӳ��������ʹ��ʱ�䣬õ����ͭ�����ӳ�һ�ܵ�ʹ��ʱ��.");
		tinsert(aryTalk, "��ȥ���� \tongmap_preview_1");
		tinsert(aryTalk, "����������/tongmap_create_1");
	else
		tinsert(aryTalk, "<dec><npc>��İ������ʹ��ʱ��Ϊ <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalk, "Ǩ�ư���ͼ/tongmap_change_1");
		tinsert(aryTalk, "�ӳ��������ʹ��ʱ��./tongmap_recharge_1");
	end
	tinsert(aryTalk, "ȡ��/cancel");
	CreateTaskSay(aryTalk);
end
		
-- Ԥ������ͼ
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>ѡ���뿴����",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "ȡ�� /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyId, pos.x, pos.y);
end

-- ��������ͼ
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>��ѡ���뽨�������<enter>������������Ҫ��"..TONGMAP_CREATE_PRICE.."��"..TONGMAP_PRICE_ITEM[5]..", ������������ʹ��. :",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "ȡ��/cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>��ȷ������  "..aDynMapCopyName[nMapCopyId].." ѡ�������<enter>������������Ҫ��"..TONGMAP_CREATE_PRICE.."��"..TONGMAP_PRICE_ITEM[5].." ������������ʹ��.",
		"ȷ��/#tongmap_create_3("..nMapCopyId..")",
		"ȡ��/cancel",
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>������а��������.", "�õ�!/cancel"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>������������Ҫ4 ��ͭ��!", "�õ�!/cancel"});
		return
	end
	-- ��Ǯ
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] ���۳���Ὠ�����ʱ��������!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- ������ͼ
	TONG_ApplyCreatMap(nTongID, nMapCopyId);
	-- ������Ч����
	local szExpireDate = tongmap_add_expire_date(nTongID, TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>����ɹ����������Ч�ڵ�<color=yellow>"..szExpireDate.."<color>", "������ʱ/tongmap_recharge_1", "�뿪/cancel"});
end

---- Ǩ�ư���ͼ
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>��ѡ��ҪǨ�Ƶ��ĸ���ͼ���۸� "..TONGMAP_CHANGE_PRICE.."��"..TONGMAP_PRICE_ITEM[5].."����",
--	};
--	for nMapCopyId, szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalk, szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalk, "ȡ��/cancel");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>��ȷ��ҪǨ�Ƶ� "..aDynMapCopyName[nMapCopyId].." �����ͼ���۸� "..TONGMAP_CHANGE_PRICE.."��"..TONGMAP_PRICE_ITEM[5].."����",
--		"ȷ��/#tongmap_change_3("..nMapCopyId..")",
--		"ȡ��/cancel",
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _, nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>��ﻹû�а���ͼ��", "�õ�/cancel"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>�㲻��ǮǨ�ư���ͼ����ͬѧ��", "�õ�/cancel"});
--		return
--	end
--	-- ��Ǯ
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] �쳣��Ǩ�ư���ͼ�۷�ʧ�ܣ�\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- Ǩ�Ƶ�ͼ
--	TONG_ApplyChangeMap(nTongID, nMapCopyId);
--end

-- ��ֵ����ͼ
function tongmap_recharge_1()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("�ӳ������������� "..TONGMAP_PRICE_ITEM[5]..","..TONGMAP_RECHARGE_PRICE.."��"..TONGMAP_PRICE_ITEM[5].."��������ʹ��1��. \n".."����ʹ�õ�"..tongmap_get_expire_date(nTongID), "tongmap_recharge_2", "cancel");
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
			"<dec><npc>��Ҫ�������� "..TONGMAP_RECHARGE_PRICE.."��"..TONGMAP_PRICE_ITEM[5]..".",
			"�ٿ� /#tongmap_recharge_1()",
			"����Ҫ/cancel",
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- ��Ǯ
	for i = 1, nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] �۳������������ʱ�����쳣!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- ������Ч����
	local szExpireDate = tongmap_add_expire_date(nTongID, nRechargeWeek);
	CreateTaskSay({"<dec><npc>���ڳɹ� <color=yellow>"..nRechargeWeek.."<color> ��, ��Ч�ڵ�<color=yellow>"..szExpireDate.."<color>", "������ʱ/tongmap_recharge_1", "�뿪/cancel"});
end

-- ���Ӱ���ͼ��Ч���ڣ���λΪ�ܣ�
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

-- ������ͼ�Ƿ��ѹ���Ч����
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- �ѹ���
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1������ʾ��������
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d", nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- ��������
		else
			return 0;		-- ����
		end
	end
end

-- ��ȡ����ͼ��Ч����
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d", TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function cancel()
end