IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINARECOIN_INFO ={
--[�׽�ID] = {װ����, ����������};
--[1] = {"����֮����ɮñ", 2},
}
RECOIN_PLATINA_DATE_RANGE = {20070420, 20070426};

function LoadPlatinaCoinSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataRecoinTmp")
	if b1~=1 then
		print("���������׽�װ����Ϣʧ��!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataRecoinTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "PLATINAID"));
		local recoin = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "RECOIN"));
		local name = TabFile_GetCell("PlatinaDataRecoinTmp", y, "EQUIPNAME");
		if (recoin ~= nil and recoin > 0) then
			TB_PLATINARECOIN_INFO[platinaid] = {name, recoin, platinaid};
		end;
	end	
end;

LoadPlatinaCoinSettingTmp()

--�׽�װ���������
function recoin_platina_main()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	local aryDescribe = {};
	reloadRecoinPlatinaDate();
	if (nTodayString < RECOIN_PLATINA_DATE_RANGE[1] or nTodayString > RECOIN_PLATINA_DATE_RANGE[2]) then
		aryDescribe = {"<dec><npc>�����׽�װ�������ʱ��, ����<color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[1]/10000).."��"..mod(floor(RECOIN_PLATINA_DATE_RANGE[1]/100),100).."��"..mod(RECOIN_PLATINA_DATE_RANGE[1], 100).."��"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n�m"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."��"..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).." ��<color> ��Ư��. ���첻��ʲô���������Բ�������.",
			"���ϧ��������ʱ�䣬���ʱ��������./no",};
	else
		aryDescribe = {"<dec><npc>�����׽�װ��ʱ��Ҫ{1���Ϭ}, {1��8��������ʯ}��һ��������{ ����ʯ��Ƭ(��)}. �����ǻƽ�װ������������Ҫ����ʯ�ǲ�һ����. ����˵˵�������Ұ�����ʲô�ɣ���  <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."��"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."��"..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).."<color> �ܲ��ܰ���Ͳ���˵��.", 
		"��������׽�װ����Ҫ���ٲ���ʯ��Ƭ(��)/want_recoinplatina_preview",
		"�Ҵ����˲���Ҫ�������װ׽�װ��./want_recoinplatina",
		"��ֻ����������/no"}
	end;
	CreateTaskSay(aryDescribe);
end;

--Ԥ������ʼ
function want_recoinplatina_preview()
	GiveItemUI("�����׽�װ��", "�뽫Ҫ�����İ׽�װ���ŵ�����. �ҿ�����Ҫ���ٲ���ʯ��Ƭ(��)", "do_recoinplatina_preview", "no", 1);
end;

function do_recoinplatina_preview(nCount)
	if (nCount <= 0) then	--û�и��������������Ի�ֱ�ӷ���
		return 0;
	end;
	
	if (nCount > 1) then	--һ��һ����������ʾ
		CreateTaskSay({"<dec><npc>һ��ֻ�ܸ���һ����Ʒ�Ҳſ��԰��㿴.",
			"�治����˼������������һ��/want_recoinplatina_preview",
			"��һ���ٻ���/no"});
		return 0;
	end;
	
	local nItemIdx = GetGiveItemUnit(nCount);
	local nCurItemName = GetItemName(nItemIdx);
	local nCurItemQuality = GetItemQuality(nItemIdx);
	local tbCurItemProp = pack(GetItemProp(nItemIdx));
	if (nCurItemQuality == 4) then		--���ڵ��ǰ׽�װ��
		if (tbCurItemProp[1] == 0) then		--���������װ��
			local nCurPlatinaEqID = GetPlatinaEquipIndex(nItemIdx);
			if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
				CreateTaskSay({format("<dec><npc>�׽�װ�� %s ��Ҫ {%d ��} ����ʯ��Ƭ(��) ��1���Ϭ�Լ�1��8��������ʯ.",TB_PLATINARECOIN_INFO[nCurPlatinaEqID][1],TB_PLATINARECOIN_INFO[nCurPlatinaEqID][2]),
					"������������װ׽�װ��/want_recoinplatina",
					"����׼�����˾ͻ�������/no"});
			else
				CreateTaskSay({format("<dec><npc>�������ڵ��������ܰ�������{%s} ���c.",nCurItemName),
				"��ô��Ҫ�һ�/want_recoinplatina_preview",
				"�����ٻ���/no"});
			end;
			return 0;
		end;
	end;
	CreateTaskSay({"<dec><npc>�㲻��Ҫ��֪�������׽�Ҫ���ٲ���ʯ��Ƭ�����������ҿ�����ô֪���أ�",
		"�治����˼�������������±���/want_recoinplatina_preview",
		"�����ٻ���/no"});
end;

--��������ʼ
function want_recoinplatina()
	GiveItemUI("�����׽�װ��", "�뽫�����׽�װ���ı�����Ʒ��������(1����Ϭ��1��8������ʯ��һЩ�����Ĳ���ʯ��Ƭ���У�)", "do_recoinplatina", "no", 1);
end;

function do_recoinplatina(nCount)
	if (nCount <= 0) then	--û�и��������������Ի�ֱ�ӷ���
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nComposeEntryLvl = 0;
	local szBeforeItemInfo = "";
	local szBehindItemInfo = ""
	local nMarkCount = 0;
	local nItemBindState = 0;	--ԭ�ϻƽ�İ�״̬
	local nItemLockState = 0;
	local bHaveLockItem  = 0;	
	local szMARKITEM_KEY = "6,1,1309";
	local tb_material = {
		--key = {���������ƣ��ȼ�} 
		["4,979,1"] = {1, "��Ϭ", -1},
		["6,1,147"] = {1, "8��������ʯ", 8},
		};
	local tb_curmaterial = {};
	for key, tb in tb_material do
		tb_curmaterial[key] = {};
		tb_curmaterial[key][1] = 0;
	end;
	
	for i = 1, nCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		if (nCurItemQuality == 4) then		--���ڵ��ǰ׽�װ��
			if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܲ�
				CreateTaskSay(	{	"<dec><npc>װ����<color=fire>ʹ������<color>, ��������.",
									"��Բ������ַŴ���. �����ٻ���/no"	}	);
				return
			end
			if (tbCurItemProp[1] == 0) then		--���������װ��
				local nCurPlatinaEqID = GetPlatinaEquipIndex(nCurItemIdx);
				if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
					if (nComposeEntryIdx ~= 0) then
						CreateTaskSay({"<dec><npc>�����������װ׽�װ��?",
							"����. ����Ҳ�в�С�ĵ�ʱ��./want_recoinplatina",
							"�治����˼����һ������./no"	});
									return 0;
					else
						nComposeEntryIdx = nCurPlatinaEqID;
						nComposeEntryLvl = GetPlatinaLevel(nCurItemIdx);
						szBeforeItemInfo = getItemInfo(nCurItemIdx);	--�������ǰ����ϸ��Ϣ
						nItemBindState = GetItemBindState(nCurItemIdx)	--��ȡ��״̬
					end;
				else
					CreateTaskSay({format("<dec><npc>�������ڵ��������ܰ�������{%s}.",nCurItemName),
						"��ô��Ҫ�һ�/want_recoinplatina_preview",
						"���»���/no"});
					return 0;
				end;
			end;
		else		--������ǰ׽�װ�������ж��ǲ����������
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (szItemKey == szMARKITEM_KEY) then	--����ʯ��Ƭ
				nMarkCount = nMarkCount + 1;
			else
				if (tb_material[szItemKey] == nil) then	--���ǰ��� and ���ǽ�Ϭ
					CreateTaskSay({	"<dec><npc>{�׽�װ��}��{��Ϭ}, { 8��������ʯ}, { ����ʯ��Ƭ (��)} ������Ҫ��ԭ��. ��������ռ���.",
						"����. ����Ҳ�в�С�ĵ�ʱ����������./want_recoinplatina",
						"�治����˼����һ������./no"	});
					return 0;
				else
					if (tb_material[szItemKey][3] ~= -1) then
						if (tb_material[szItemKey][3] ~= tbCurItemProp[4]) then
							CreateTaskSay({"<dec><npc>װ���ȼ�"..nCurItemName.."���񲻶�.",
								"����. ����Ҳ�в�С�ĵ�ʱ����������./want_recoinplatina",
								"�治����˼����һ������./no"	}	);
							return 0;
						end;
					end;
					tb_curmaterial[szItemKey][1] = tb_curmaterial[szItemKey][1] + 1;
					tb_curmaterial[szItemKey][2] = nCurItemName;
				end;
			end;
		end;
	end;	--end for nCout
	
	local szlog = ""
	if (nComposeEntryIdx == 0) then		--��Ȼ�����׽�װ��
		CreateTaskSay({"<dec><npc>�㲻��Ҫ�����׽�װ����㲻��׼������������ô��������.",
			"��Բ�������������/want_recoinplatina",
			"���»���/no"});
		return 0;
	end;
	if (nMarkCount ~= TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]) then
		CreateTaskSay({format("<dec><npc>�׽�װ�� {%s} Ҫ (%d) ����ʯ��Ƭ(��).",TB_PLATINARECOIN_INFO[nComposeEntryIdx][1],TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]),
					"��Բ�������������/want_recoinplatina",
					"����׼�����˾ͻ�������/no"});
		return 0;
	end;
	for key, tb in tb_material do
		if (tb[1] ~= tb_curmaterial[key][1]) then
			CreateTaskSay({format("<dec><npc>��������Ҫ�İ׽�װ��{%d} %s.", tb[1],tb[2]),
					"��Բ�������������/want_recoinplatina",
					"����׼�����˾ͻ�������/no"});
			return 0;
		end;
	end;

--	for i = 1, nCount do
--		local nCurItemIdx = GetGiveItemUnit(i)
--		nItemLockState = GetLockItemState(nCurItemIdx)
--		if (nItemLockState == 1) then
--			local bOwner = IsLockItemOwner(nCurItemIdx)
--			if (bOwner == 0)   then
--				CreateTaskSay({"<dec><npc>�����İ׽�װ����������Ʒ��������Ʒ��������״̬��ֻ������Ʒ������������","֪����/cancel"});
--				return
--			else
--				bHaveLockItem =	1;
--			end							
--		elseif (nItemLockState == 2) then
--			CreateTaskSay({"<dec><npc>�����İ׽�װ����������Ʒ��������Ʒ���ڽ��״̬����ֹ������","֪����/cancel"});
--			return
--		end
--	end;	
	
	-- ɾԭ��
	for i = 1, nCount do
		if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[�����׽�װ��]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t ɾ��ʧ����Ʒ\t"..GetItemName(GetGiveItemUnit(i)));
			return 0;
		end
	end
	
	--�¸����׽�װ��
	local nNewItemIdx = AddPlatinaItem(0, nComposeEntryIdx);	--��ʱ ��0���׽�
	if (nNewItemIdx <= 0) then
		WriteLog("[�����׽�װ��]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\���ʧ�ܵİ׽�ƽ�װ��\t"..GetItemName(GetGiveItemUnit(i)));
		return 0;
	end;

	if nItemBindState ~= 0 then 
		--����Ƭ����ΪԴ�ƽ�װ���İ�״ֵ̬
		SetItemBindState(nNewItemIdx, nItemBindState)
	end

	for i = 1, nComposeEntryLvl do								--����֮ԭװ���ȼ�
		UpgradePlatinaItem(nNewItemIdx);
	end;
	
--	if (bHaveLockItem == 1) then
--		LockItem(nNewItemIdx);
--	end
		
	szlog = format("[�����׽�װ��]\t%s\tAccount:%s\tName:%s\����%s ɾ��ԭ��: 1���Ϭ��1��8��������ʯ��%d�鲹��ʯ��Ƭ", 
				GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(),
				TB_PLATINARECOIN_INFO[nComposeEntryIdx][1], nMarkCount);
	szBehindItemInfo = getItemInfo(nNewItemIdx);	--���������Ϣ
	WriteLog(szlog);
	writeRecoinLog("[�����׽�װ��֮ǰ������]", szBeforeItemInfo);
	writeRecoinLog("[�����׽�װ��֮�������]", szBehindItemInfo);
	Msg2Player("�����ɹ�<color=green>"..TB_PLATINARECOIN_INFO[nComposeEntryIdx][1]);
end;

function reloadRecoinPlatinaDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_PLATINAEQUIP",1), gb_GetTask("RECOIN_PLATINAEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= RECOIN_PLATINA_DATE_RANGE[2]) then
		RECOIN_PLATINA_DATE_RANGE[1] = tb_NewAvailableDate[1];
		RECOIN_PLATINA_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;