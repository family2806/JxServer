Include("\\script\\global\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>֮ǰ�������������ٸ���<color=yellow>���ֲ���ʯ��Ƭ<color> �������������������<sex>�����ҳ�<color=yellow>�ò���ʯ��Ƭ<color>,�ҿ��԰�������׽�װ����һ������ȱ��ԭ��.",
	"���������ð׽�װ��/upgrade_paltinaequip",
	"��������ƽ�װ���ɰ׽�װ��/upgrade_goldformplatina",
	"�ռ�����ʯ��Ƭ/about_aerolite",
	"�׽�װ����ʲôabout_platina",
	"�����ٿ���/cancel",
	};
	CreateTaskSay(aryDescribe);
end;

----���ƽ�װ������ɰ׽�װ��
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>�����ƽ�װ�����׽�ԭ����Ҫ1����ʯ(��), 1 8��������ʯ, 1���ؿ�ʯ��1000����. ����ʯ����������ֵ������������򵽡�װ��������ԭ�ϣ����ǾͿ��Կ�ʼװ�����칤����<enter> �������֪�������ɰ׽�װ�����������Σ��ѻƽ�װ�����Ҿ�֪����.",
		"���뿴�ӻƽ�װ��������İ׽�װ������./want_upgoldeq_preview",
		"���԰��Ұ����װ������ɰ׽�װ����?/want_upgoldeq",
		"�����뿴/cancel"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("��������׽�װ��", "��������Ļƽ�װ�����봢���.", "do_upgoldeq_preview", "cancel",1);
end;

function do_upgoldeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"�������Կ�/want_upgoldeq_preview",
		"�治����˼�����Ժ����./cancel"
	};
	
	if (nItemCount ~= 1) then
		tbDialog[1] = "<dec><npc>�����������Ʒ��������.";
		CreateTaskSay(tbDialog);
		return
	end

	-- �жϻƽ�װ���Ƿ����Ҫ��
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local bSuccess, szErrorMsg, nComposeEntryIdx = fit_formed_eq(nCurItemIdx);
	
	if (bSuccess == 0) then
		tbDialog[1] = szErrorMsg;
		return
	end
	
	
	-- Ԥ��
	local szDesc = preview_eq_format(nCurItemIdx);
	CreateTaskSay({"<dec><npc>��ɵİ׽�װ��Ϊ<color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", ��������: <enter>"..szDesc,
		"���ҿ���ɵİ׽�װ���������./want_upgoldeq_preview",
		"���԰��������װ���ɰ׽�װ����/want_upgoldeq",
		"��֪���ˣ�лл��/cancel"});
end;

function want_upgoldeq()
	GiveItemUI("����׽�װ��", "����Ҫ����Ļƽ�1�鲹��ʯ��Ƭ(��), 1��8��������ʯ����һ�����ؿ�ʯ���������Ʒ�䡣������Ҫ�ķ�1000��������׼��������", "do_upgoldeq_process", "cancel",1);
end;

function do_upgoldeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"�������Կ�/want_upgoldeq",
		"���ǲ�����˼�����Ժ�����./cancel"
	};

	local nComposeEntryIdx	= 0;
	local nEquipItemIdx		= 0;
	local nSrcItemValueSum	= 0;
	local tbMaterialIdx		= {};
	
	local tb_material = {};
	for szkey, tb_item in tb_gold2planita_material do
		tb_material[szkey] = {};
		tb_material[szkey][1] = 0;
	end
	
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemName 		= GetItemName(nCurItemIdx);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));
		
		-- �ƽ�װ��
		if (nCurItemQuality == 1) then
			
			-- ֻ�ܷ���һ���ƽ�װ��
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>����������������װ��?��û���ۻ��ɣ�";
				CreateTaskSay(tbDialog);
				return
			end
			
			-- �жϻƽ�װ���Ƿ��������
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
			
		else
			
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_gold2planita_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
			
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			tb_material[szItemKey][1] = tb_material[szItemKey][1] + GetItemStackCount(nCurItemIdx);
			tbMaterialIdx[getn(tbMaterialIdx) + 1] = nCurItemIdx;
		end
	end
	
	-- ����Ҫ�м��ƽ�װ��
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>������Ұ��㣬����Ǹ�װ������.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- ������ϵĸ�����������Ҫ��
	for szkey, tb_item in tb_gold2planita_material do
		if (tb_item.nCount) then
			if (tb_material[szkey][1] ~= tb_item.nCount) then
				tbDialog[1] = "<dec><npc>�������װ����������ҲҪ <color=yellow>"..tb_item.nCount.."��"..tb_item.szName.."<color>, ����̫�࣬�ͻ���ʧ�����ǣ�̫�٣����ֲ�������."
				CreateTaskSay(tbDialog);
				return
			end
		end
	end

	do_upgrade_platina(nEquipItemIdx, TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4], tbMaterialIdx, tb_material, 1);
end

----�׽�װ������
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>�����ɰ׽�װ����Ҫ������Ʒ:1�� <color=yellow>����ʯ(��)<color> �Լ�100����������������ֵ��ȡ����ʯ��Ƭ����׼�����ˣ����ǿ��Կ�ʼ��.<enter><color=red>�����׽�װ������һ���ķ��գ����ʧ�ܣ���ʧȥ��Ʒ��1000����.<color><enter>�������֪����ɵİ׽�װ��˵����Σ����Դ��ƽ�װ����������ҿ���",
		"���뿴��ɵİ׽�װ������./#want_upplatinaeq(1)",
		"���԰��������ð׽�װ����/#want_upplatinaeq(0)",
		"�������� /cancel"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("���׽�װ����������", "����������İ׽�װ���Ͳ���ʯ��Ƭ�Ž���Ʒ��.", "do_upplatinaeq_preview", "cancel",1);
	else
		GiveItemUI("�����׽�װ��", "����������İ׽�װ���Ͳ���ʯ��Ƭ�Ž���Ʒ�У���������1000����.", "do_upplatinaeq_process", "cancel",1);
	end;
end;

function do_upplatinaeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"����������/#want_upplatinaeq(1)",
		"���ǲ�����˼�����Ժ����./cancel"
	};
	
	local nComposeEntryIdx	= 0;
	local nEquipItemIdx		= 0;
	local nSrcItemValueSum	= 0;
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in tb_upgrade_material do
		tb_enhanceitem_count[szkey] 	= {};
		tb_enhanceitem_count[szkey][1] 	= 0;
	end;
	 
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality == 4) then
			
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>�㵽���������������ְ׽�װ�������ǲ����ۻ���?";
				CreateTaskSay(tbDialog);
				return
			end
			
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
		else
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_upgrade_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
			
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_upgrade_material[szItemKey]["nValue"]) then
				nSrcItemValueSum = nSrcItemValueSum + tb_upgrade_material[szItemKey]["nValue"] * GetItemStackCount(nCurItemIdx);
			end
			
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		end
	end
	
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>����Ҫ�����ɰ׽��װ�����ң���Ȼ��������ô֪������?";
		CreateTaskSay(tbDialog);
		return
	end

	local nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);	
	if (nUpGradeProb >= 1) then
		nUpGradeProb = 1;
	elseif (nUpGradeProb >= 0.9999) then
		nUpGradeProb = 0.9999;
	end
	
	local szDesc = preview_eq_format(nEquipItemIdx);
	CreateTaskSay({format("<dec><npc>�����ҵľ��飬�ð׽�װ����<color=yellow>%5.2f%%<color>�����������������ļ����������: <enter>%s", nUpGradeProb*100, szDesc),
					"���ҿ���������װ����ɵİ׽�װ�����./#want_upplatinaeq(1)",
					"���԰��������װ���ɰ׽�װ����/#want_upplatinaeq(0)",
					"��֪���ˣ�лл��/cancel"});
end

function do_upplatinaeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"����������/#want_upplatinaeq(0)",
		"���ǲ�����˼�����Ժ����./cancel"
	};
	
	local nComposeEntryIdx 	= 0;
	local nEquipItemIdx 	= 0;
	local nSrcItemValueSum 	= 0;
	local nUpGradeProb 		= 0;
	local tbMaterialIdx		= {};

	local tb_enhanceitem_count = {};
	for szkey, tb_item in tb_upgrade_material do
		tb_enhanceitem_count[szkey]		= {};
		tb_enhanceitem_count[szkey][1] 	= 0;
	end
	
	-- �ȱ���һ�� �ҵ���Ҫ�����İ׽�װ��������Ҫ����Ļƽ�װ��
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality == 4) then
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>�����������������ְ׽�װ�����ǲ����ҿ�������?";
				CreateTaskSay(tbDialog);
				return
			end
			
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
		end
	end
	
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>������Ұ��㣬�Ͱ��Ǹ�װ������.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- У������Ƿ�ƥ��
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local nCurItemName 		= GetItemName(nCurItemIdx);
		local tbCurItemProp		= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality ~= 4) then
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_upgrade_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
				
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_upgrade_material[szItemKey]["nValue"]) then
				nSrcItemValueSum = nSrcItemValueSum + tb_upgrade_material[szItemKey]["nValue"] * GetItemStackCount(nCurItemIdx);
			end
			
			tbMaterialIdx[getn(tbMaterialIdx) + 1] = nCurItemIdx;
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		end
	end
	
	for szkey, tb_item in tb_upgrade_material do
		if (tb_item.nCount) then
			if (tb_item.nUpgradeLevel and tb_item.nUpgradeLevel ~= GetPlatinaLevel(nEquipItemIdx)) then
			elseif(tb_item.nCount ~= tb_enhanceitem_count[szkey][1]) then
				tbDialog[1] = "<dec><npc>�������װ������ֻ��Ҫ<color=yellow>"..tb_item.nCount.."��"..tb_item.szName.."<color>, ����̫��ͻ���ʧ��̫�پͲ�������."
				CreateTaskSay(tbDialog);
				return
			end
		end
	end
	
	nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);	
	if (nUpGradeProb >= 1) then
		nUpGradeProb = 1;
	elseif (nUpGradeProb >= 0.9999) then
		nUpGradeProb = 0.9999;
	end
	
	do_upgrade_platina(nEquipItemIdx, TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4], tbMaterialIdx, tb_enhanceitem_count, nUpGradeProb);
end;
----���ƽ�װ������ɰ׽�װ�� END


function getItemAllMagicList(nItemIdx)
	local tb_magic = {};
	for i = 1, 6 do
		tb_magic[getn(tb_magic) + 1] = pack(GetItemMagicAttrib(nItemIdx, i));
	end;
	return tb_magic;
end;

function about_aerolite()
	CreateTaskSay({
		"����ʯ��Ƭ����ر�����������Ѱ�ң�����������Ե�<color=yellow>����ʹ��<color> ���ʿ����������<color=yellow>����ֵ<color> �����򵽡�Ҳ���Ե�<color=yellow>�����<color> ����",
		"��֪����!/cancel",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>�׽�װ�������Խ��ɻƽ�װ�������Ծ������ƽ�װ������Խ�ã�����ɵİ׽�Խ�ࡣ������������ڵĻƽ�װ�����ҽ������������ƽ�װ��.", "�����Ի�/cancel"});
end;


-- new func
-- �жϸ�������еİ׽���߻ƽ�װ���Ƿ��Ǵ��ڲ���Ψһ
function fit_formed_eq(nCurItemIdx)	
	local nCurItemQuality	= GetItemQuality(nCurItemIdx);
	local nExpiredTime 		= ITEM_GetExpiredTime(nCurItemIdx);
	local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));
	
	local szErrorMsg 		= "";	
	local szGetEquipIDFunc 	= "";
	local nComposeEntryIdx	= 0;
	local szEqType			= "";
	if (nCurItemQuality == 1) then
		szGetEquipIDFunc = "GetGlodEqIndex";
		szEqType	= "�ƽ�װ��";
	else
		szGetEquipIDFunc = "GetPlatinaEquipIndex";
		szEqType	= "�׽�װ��";
	end

	if (tbCurItemProp[1] ~= 0) then	--�������װ��(��������װ��)
		szErrorMsg = format("<dec><npc>ֻ��Ҫ����%s ����׽�װ���͹��ˣ������ľͷ���.", szEqType);
		return 0, szErrorMsg
	end
	
	if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܣ�
		szErrorMsg = "<dec><npc>Trang b?c?<color=fire>ʹ��ʱ��<color> �Ͳ�����.";
		return 0, szErrorMsg
	end
	
	for szkey, tb_item in TB_PLATINAEQ_GOLDEQ do
		if (szkey == getglobal(szGetEquipIDFunc)(nCurItemIdx)) then
			nComposeEntryIdx = szkey;
			break;
		end
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	if (nComposeEntryIdx == 0) then
		szErrorMsg = format("<dec><npc>���ź����������ڵľ��飬��������<color=yellow>%s<color>.", GetItemName(nCurItemIdx));
		return 0, szErrorMsg
	end
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
		szErrorMsg = "<dec><npc>�������ڵ�������ֻ�ܰ���ǿ����װ��������ȼ����ѣ����ǣ��Ժ��һ��ܼ����������������Ұɣ�����һ�죬�Ұ���ǿ��������������ʱ���������Ŷ";
		return 0, szErrorMsg
	end;
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
		szErrorMsg = "<dec><npc>��װ���Ѵ���ߵȼ�������Ҫ��������.";
		return 0, szErrorMsg
	end;
	
	return 1, szErrorMsg, nComposeEntryIdx;
end

-- �жϸ�������з���Ĳ����Ƿ���������Ԥ����ֻҪ�ж��м�ֵ���Ĳ����Ƿ��ڣ��޼�ֵ�����Ǵ�������Ĳ��ϲ��ùܣ�������Ǵ��죬��Ҫ�жϣ�
-- ����������Idx���Ƿ�ΪԤ��������table���ƽ�װ��idx
function fit_formed_material(nCurItemIdx, tb_material, nPlatinaIdx)
	local szErrorMsg	= "";
	local tbCurItemProp	= pack(GetItemProp(nCurItemIdx));
	local szItemKey		= tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];

	if (tb_material[szItemKey] == nil)  then
		szErrorMsg = "<dec><npc>���������ԭ�Ϻ�Ҫ��Ĳ���";
		return 0, szErrorMsg;
	end
	
	if (tb_material[szItemKey].nItemLevel) then
		if (tbCurItemProp[4] ~= tb_material[szItemKey]["nItemLevel"]) then
			szErrorMsg = format("<dec><npc>װ���ȼ� %s �����ǲ���.", GetItemName(nCurItemIdx));
			return 0, szErrorMsg;
		end
	end
	if (tb_material[szItemKey]["nUpgradeLevel"]) then
		if (GetPlatinaLevel(nPlatinaIdx) ~= tb_material[szItemKey]["nUpgradeLevel"]) then
			szErrorMsg = "<dec><npc>�����ð׽�װ����ԭ���еĲ���";
			return 0, szErrorMsg;
		end
	end
	
	return 1, szErrorMsg;
end

-- Ԥ���ĸ�ʽ
function preview_eq_format(nCurItemIdx)
	local tbPlatinaMagicAttrib	= {};
	if (GetItemQuality(nCurItemIdx) == 4) then
		tbPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(nCurItemIdx));
	else
		tbPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(nCurItemIdx));
	end
	
	local tbGoldMagicAttrib = getItemAllMagicList(nCurItemIdx);
	local szItemDesc = "";
	
	for i = 1, getn(tbPlatinaMagicAttrib) do
		if (tbGoldMagicAttrib[i][1] == tbPlatinaMagicAttrib[i][1] and tbGoldMagicAttrib[i][2] ~= tbPlatinaMagicAttrib[i][2]) then
			local szD = (tbPlatinaMagicAttrib[i][2]-tbGoldMagicAttrib[i][2]);
			if (szD > 0) then
				szD = "(+"..szD..")";
			else
				szD = "("..szD..")";
			end;
			szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
		else
			szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbPlatinaMagicAttrib[i])).."<color><enter>";
		end;
	end
	return szItemDesc;
end

-- ����׽�Ĺ���
function do_upgrade_platina(nEqIdx, nUpgradeEqName, tbMaterialIdx, tb_enhanceitem_count, nUpGradeProb)
	-- ��Ǯ
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>��û�д�����ķ���<color=yellow>1000 ��<color> ��.", "��֪���ˣ�������׼��/cancel"});
		return
	end
	Pay(10000000);
	
	-- ɾԭ��
	for i = 1, getn(tbMaterialIdx) do
		if (RemoveItemByIndex(tbMaterialIdx[i]) ~= 1) then
			WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t ɾ����Ʒʧ��:%s",
						"[Task �����׽�װ��ERROR!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						GetItemName(tbMaterialIdx[i])));
			return
		end
	end
	
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>�����׽�װ��ʧ�ܣ�ʧȥ��������Ʒ��100����.", "���Ժ����/cancel"});
		Msg2Player("�����׽�װ��ʧ�ܣ�ʧȥ��������Ʒ��100����.");
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t ��ֵ�����㣬����Ϊ%.4f",
						"[Task �����׽�װ��ʧ��!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						nUpGradeProb))
		return
	end

	local szLog = "����\t"..GetItemName(nEqIdx).."1 \t";
	for szkey, tb_temp in tb_enhanceitem_count do
		if (tb_temp[2]) then
			szLog = szLog..tb_temp[2]..":"..tb_temp[1].." \t"
		end;
	end;
	
	local szUpgradeItemFunc	= "";
	if (GetItemQuality(nEqIdx) == 1) then
		szUpgradeItemFunc = "UpgradePlatinaFromGoldItem";
	else
		szUpgradeItemFunc = "UpgradePlatinaItem";
	end
	
	local szBeforeItemInfo	= getItemInfo(nEqIdx);	--�������ǰ����ϸ��Ϣ
	
	-- ������
	local nSuccess			= getglobal(szUpgradeItemFunc)(nEqIdx);
	local nItemLevel		= GetPlatinaLevel(nEqIdx);
	if nSuccess > 0 then		
		local szBehindItemInfo	= getItemInfo(nEqIdx);--������������ϸ��Ϣ
		
		CreateTaskSay({"<dec><npc>�����׽�װ���ɹ������һ���׽�װ��<color=yellow>"..nUpgradeEqName.."<color>, ��"..nItemLevel..".", "���Ժ����/cancel"});
		Msg2Player("�׽�װ�������ɹ����ȼ�Ϊ"..nItemLevel.."�׽�װ��:"..nUpgradeEqName);
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t ��ȡ�׽�װ��:%s\t %s",
					"[Task �����׽�װ��SUCCESS!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					nUpgradeEqName,
					szLog));
		writeRecoinLog("[�����׽�װ��ԭ��]", szBeforeItemInfo);
		writeRecoinLog("[�����׽�װ�����]", szBehindItemInfo);
	else
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t ��ð׽�װ��ʧ��:%s",
					"[Task �����׽�װ��ERROR!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					szLog));
		writeRecoinLog("[�׽�װ������ԭ��]", szBeforeItemInfo);
	end	
end
