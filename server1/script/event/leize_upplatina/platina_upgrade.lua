Include("\\script\\event\\leize_upplatina\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>֮ǰ�����������ٸ���<color=yellow>����ʯ��Ƭ<color>������������.���<sex>�ҵ�<color=yellow>��Щ����ʯ��Ƭ<color> , �ұ���԰������׽�װ��, �����Ʒһ��������.",
	"�����������װ׽�װ��/upgrade_paltinaequip",
	"����ѻƽ�װ������ɰ׽�װ��/upgrade_goldformplatina",
	"�ռ�����ʯ��Ƭ�ķ���/about_aerolite",
	"��ʲô�׽�װ��/about_platina",
	"������ϸ���뿴/no",
	};
	CreateTaskSay(aryDescribe);
end;

----���ƽ�װ������ɰ׽�װ��
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>һ��Ļƽ�װ�������ɰ׽�װ���������Ϊ: �����m���Լ�1000������.��������������书�ȼ��Ļƽ�װ��������������Ĳ��ϣ�Ҫ����������Ҫ������¯�����˵����ֻ�л��綦���ܳ�����˸���.<enter>�������Ҫ֪��������İ׽�װ����������Σ�ֻҪ�ѻƽ�װ�����ҿ�������!",
		"����֪�����װ������Ϊ�׽�װ���������./want_upgoldeq_preview",
		"�ܰ��Ұ����װ������Ϊ�׽�װ����?/want_upgoldeq",
		"�������뿴/no"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("��������׽�װ��", "Ҫ�ѻƽ�װ��������Ʒ����.", "do_upgoldeq_preview", "no",1);
end;

function want_upgoldeq()
	GiveItemUI("����׽�װ��", "Ҫ�����κεĻƽ�װ����ֻ��Ҫ������ԭ�Ϸ������棬ͬʱ��Ҫ1000��.", "do_upgoldeq_process", "no",1);
end;

function do_upgoldeq_process(nItemCount)
	do_upgradeequip_process(nItemCount, 1, 0);
end;

function do_upgoldeq_preview(nItemCount)
	if (nItemCount == 0) then
		CreateTaskSay({"<dec><npc>��û�д��ƽ�װ������������ô�ܸ��㿴��ɺ�İ׽�װ����ʲô����? ", "����ģ��Ҳ��������װ����./want_upgoldeq_preview", "���Ҵ�����./no"});
		return 0;
	elseif (nItemCount > 1) then
		CreateTaskSay({"<dec><npc>ֻҪ����������Ļƽ�װ���Ϳ����ˣ���Ĳ���Ҫ.", "����������Ҳ�в�С�ĵ�ʱ����������./want_upgoldeq_preview", "����������/no"});
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local nCurItemName = GetItemName(nCurItemIdx);
	local nCurItemQuality = GetItemQuality(nCurItemIdx);
	local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
	if (nCurItemQuality == 1) then
		if (tbCurItemProp[1] ~= 0) then
			CreateTaskSay({"<dec><npc>ֻҪ������Ҫ����Ļƽ�װ���Ϳ����ˣ���Ĳ���Ҫ.", "����������Ҳ�в�С�ĵ��ʱ����������./want_upgoldeq_preview", "����������/no"});
			return 0;
		end;
		for szkey, tbPlatinaData in TB_PLATINAEQ_GOLDEQ do
			if (tbPlatinaData[2] == GetGlodEqIndex(nCurItemIdx)) then
				nComposeEntryIdx = szkey;
				break
			end;
		end;
	end;
	if (nCurItemQuality == 4) then
		CreateTaskSay(	{	"<dec><npc>װ��color=yellow>"..GetItemName(nCurItemIdx).."<color> �� ���Ѵ���ɰ׽�װ����.",
							"���������Ļƽ�װ��./want_upgoldeq_preview",
							"�治����˼���Ҵ������./no"	}	);
		return
	elseif (nComposeEntryIdx == 0) then
		CreateTaskSay(	{	"<dec><npc>���ź������������ޣ��ﲻ����<color=yellow>"..GetItemName(nCurItemIdx).."<color>���׻ƽ�װ���Ѵ���ɰ׽�װ����.",
							"���������Ļƽ�װ��./want_upgoldeq_preview",
							"�治����˼���Ҵ������./no"	}	);
		return
	end
	
	local tbPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(nCurItemIdx));
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
	end;
	CreateTaskSay({"<dec><npc>��ɵİ׽�װ����<color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", ��������: <enter>"..szItemDesc,
	"���ҿ������װ����������İ׽�װ������ʲô����./want_upgoldeq_preview",
	"�ܰ��Ұ�����װ������ɰ׽�װ����/want_upgoldeq",
	"��֪���ˣ���л./no"});
end;
----�׽�װ������
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>�����׽�װ����Ҫ�Ĳ�������:1��<color=yellow>����ʯ��Ƭ���У�<color> ��1000����.������������һ�����ʯ��Ƭ��������Ѿ�׼�������ǾͿ��Կ�ʼ��.<enter><color=red>�����׽�װ����һ�����գ����ʧ��������Ʒ��1000�򶼽���ʧ.<color><enter>�������֪�������İ׽�װ���������ֻҪ�ѻƽ�װ�������ҿ����Ϳ�����.",
		"���뿴��֮��İ׽�װ��������./#want_upplatinaeq(1)",
		"�ҿɰ�������װ����/#want_upplatinaeq(0)",
		"�������뿴 /no"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("�������׽�װ������", "��Ҫ�����İ׽�װ���Ͳ���ʯ��Ƭ������Ʒ��.", "do_upplatinaeq_preview", "no",1);
	else
		GiveItemUI("�����׽�װ��", "��Ҫ�����İ׽�װ���Ͳ���ʯ��Ƭ������Ʒ�У���������1000����.", "do_upplatinaeq_process", "no",1);
	end;
end;

function do_upplatinaeq_preview(nItemCount)
	do_upgradeequip_process(nItemCount, 3, 1);
end;

function do_upplatinaeq_process(nItemCount)
	do_upgradeequip_process(nItemCount, 3, 0);
end;

function do_upgradeequip_process(nItemCount, nStep, bPreview)
	local nComposeEntryIdx = 0;
	local nEquipIndex = 0;
	local nEquipItemIdx = 0;
	local nSrcItemValueSum = 0;
	local nUpGradeProb = 0;
	
	local nItemBindState;	--ԭ�ϻƽ�İ�״̬
	--local nItemLockState = 0;   --ԭ�ϵ�����״̬
	local tb_enhanceitem_count = {};
	local tb_tempUpgrade = tbUpGradeProcess[nStep];
	local szContinueFunc = tb_tempUpgrade.szContinueFunc;
	
--	if (bPreview ~= 1) then
--		szContinueFunc = "#"..szContinueFunc.."(0)";
--	else
--		szContinueFunc = "#"..szContinueFunc.."(1)";
--	end
	
	-- У����Ʒ�Ƿ�ƥ��
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nCurItemValue = 0;
		if (nCurItemQuality == tb_tempUpgrade.nItemQuality) then
			--�������װ��(��������װ��)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	szErrorMsg,
					"����������Ҳ�в�С�ĵ�ʱ�������Ű�./".."#"..szContinueFunc.."("..bPreview..")",
					"�治����˼���Ҵ������./no"	}	);
				return
			end
			if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܣ�
				CreateTaskSay(	{	"<dec><npc>װ����<color=fire>thʹ������<color> ���ܶ���.",
									"�治����˼�����ַŴ���.һ���ֻ���cancel"	}	);
				return
			end
			if (nComposeEntryIdx ~= 0) then
				CreateTaskSay(	{	"<dec><npc>�������������׻ƽ�װ������û���ۻ��ɣ�",
									"����������Ҳ�в�С�ĵ�ʱ�������Ű�./".."#"..szContinueFunc.."("..bPreview..")",
									"�治����˼���Ҵ������./no"	}	);
				return
			end
			
			local szcurEqGold = getglobal(tb_tempUpgrade.szGetEquipIDFunc)(nCurItemIdx);
			
			for szkey, tb_item in TB_PLATINAEQ_GOLDEQ do
			
				if (szkey == szcurEqGold) then
					nComposeEntryIdx = szkey;
					nEquipIndex = nCurItemIdx;
					if (nStep == 1 and tb_item[5] and tb_item[5] == 1) then
						tb_tempUpgrade = tbUpGradeProcess[4];
					end
					break;
				end
			end
			
			if (nComposeEntryIdx == 0) then
				CreateTaskSay(	{	"<dec><npc>�治����˼�������ڵ������ﲻ����ʲô<color=yellow>"..GetItemName(nCurItemIdx).."<color>.",
									"���Ա��װ��/".."#"..szContinueFunc.."("..bPreview..")",
									"�治����˼���Ҵ������./no"	}	);
				return
			end
			
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
				CreateTaskSay(	{"<dec><npc>�����ڵ�����ֻ�ܰ����װ��ǿ������������ˣ�֮���ҿ��԰����������.�������뿪֮������һ�տ��԰���ǿ����Щ��Ʒ������ʱ�ٻ������Ұɣ�",
									"���Ա��װ��/".."#"..szContinueFunc.."("..bPreview..")",
									"�治����˼���Ҵ������./cancel"	}	);
				return
			end;
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
				CreateTaskSay(	{	"<dec><npc>װ���Ѵﵽ��߼�������Ҫ��������.",
									"���Ա��װ��/".."#"..szContinueFunc.."("..bPreview..")",
									"�治����˼���Ҵ������./no"	}	);
				return
			end;
			
			nEquipItemIdx = nCurItemIdx;
			nCurItemValue = 0;
			nItemBindState = GetItemBindState(nCurItemIdx)	--��ȡ��״̬
		end
	end
	
	for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end;
	
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nCurItemValue = 0;
		if (nCurItemQuality ~= tb_tempUpgrade.nItemQuality) then
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_tempUpgrade.tbUpItemList[szItemKey] == nil) then
				CreateTaskSay(	{	tb_tempUpgrade.szErrorMsg,
									"����������Ҳ�в�С�ĵ�ʱ�������Ű�./".."#"..szContinueFunc.."("..bPreview..")",
									"�治����˼���Ҵ������./no"	}	);
				return
			end
			if (tb_tempUpgrade.tbUpItemList[szItemKey][3] ~= -1) then
				if (tbCurItemProp[4] ~= tb_tempUpgrade.tbUpItemList[szItemKey][3]) then
					CreateTaskSay(	{	"<dec><npc>װ���ȼ�"..GetItemName(nCurItemIdx).." ���ƺ�����.",
									"����������Ҳ�в�С�ĵ�ʱ�������Ű�./".."#"..szContinueFunc.."("..bPreview..")",
									"�治����˼���Ҵ������./no"	}	);
					return
				end;
			end;
			nCurItemValue = tb_tempUpgrade.tbUpItemList[szItemKey][1];
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
			tb_enhanceitem_count[szItemKey][2] = nCurItemName;
			if (tb_tempUpgrade.tbUpItemList[szItemKey][4] == nil) then
				nSrcItemValueSum = nSrcItemValueSum + nCurItemValue;
			end
		end
	end
	if (nComposeEntryIdx == 0) then
		CreateTaskSay(	{	"<dec><npc>�����Ҫ�Ұ������Ͱ�׼��������.",
							"����������Ҳ�в�С�ĵ�ʱ�������Ű�./".."#"..szContinueFunc.."("..bPreview..")",
							"�治����˼���Ҵ������./no"	}	);
		return
	end
	
	local tbBeidoujuan = 
	{
		[6] = "����������(�� 1)", [7] = "����������(�� 2)", [8] = "����������(�� 3)", [9] = "����������(�� 4)"
	};
	local PLevel = GetPlatinaLevel(nEquipItemIdx);
	if (nStep == 3 and bPreview == 0) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_item[4]) then
				if (PLevel == tb_item[4] and tb_enhanceitem_count[szkey][1] ~= tb_item[1] or (PLevel ~= tb_item[4] and tb_enhanceitem_count[szkey][1] ~= 0)) then
					local szErrorMsg = "";
					if (PLevel < 6) then
						szErrorMsg = "<dec><npc> �����װ����Ҫ����������";
					else
						szErrorMsg = "<dec><npc>�����װ��ֻ��Ҫ<color=yellow>1"..tbBeidoujuan[GetPlatinaLevel(nEquipItemIdx)].."<color>, ����̫���Կ��������������޷�����.";
					end
					CreateTaskSay({szErrorMsg,
									"��������./".."#"..szContinueFunc.."("..bPreview..")",
									"�治����˼���Ҵ������./no"	}	);
					return
				end
			end
		end
	end
	if (nStep == 1) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_enhanceitem_count[szkey][1] ~= tb_tempUpgrade.tbUpItemList[szkey][1]) then
				CreateTaskSay(	{	"<dec><npc>Ҫ�����װ������������Ҫ <color=yellow>"..tb_tempUpgrade.tbUpItemList[szkey][1].."��"..tb_tempUpgrade.tbUpItemList[szkey][2].."<color>, ����̫���Կ��������������޷�����.",
										"��������./".."#"..szContinueFunc.."("..bPreview..")",
										"�治����˼���Ҵ������./no"	}	);
				return
			end
		end
		nUpGradeProb = 1;
	else
	
		nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);
		
		if (nUpGradeProb >= 1) then
			nUpGradeProb = 1;
		elseif (nUpGradeProb >= 0.9999) then
			nUpGradeProb = 0.9999;
		end;
		if (bPreview == 1) then
			local szItemDesc = format("<dec><npc>�����ҵľ��飬���װ׽�װ���� <color=yellow>%5.2f%%�ļ���<color> ��1������������:  <enter>", nUpGradeProb*100);
			
			local tbNextPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(nEquipIndex));
			
			local tbCurPlatinaMagicAttrib = getItemAllMagicList(nEquipIndex);
			
			for i = 1, getn(tbNextPlatinaMagicAttrib) do
				if (tbCurPlatinaMagicAttrib[i][1] == tbNextPlatinaMagicAttrib[i][1] and tbCurPlatinaMagicAttrib[i][2] ~= tbNextPlatinaMagicAttrib[i][2]) then
					local szD = (tbNextPlatinaMagicAttrib[i][2]-tbCurPlatinaMagicAttrib[i][2]);
					if (szD > 0) then
						szD = "(+"..szD..")";
					else
						szD = "("..szD..")";
					end;
					szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
				else
					szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><enter>";
				end;
			end;
			CreateTaskSay({szItemDesc,
								"���ҿ�������װ��������İ׽�װ����ʲô����./".."#"..szContinueFunc.."("..bPreview..")",
								"���԰��Ұ�����װ������ɰ׽�װ����/".."#"..szContinueFunc.."(0)",
								"��֪���ˣ���л/no"});
			return
		end;
	end;
	
--	nItemLockState = GetLockItemState(nEquipItemIdx)  --��ȡ����״̬
--	if (nItemLockState == 1) then	--����
--        	local bOwner = IsLockItemOwner(nEquipItemIdx)
--		if (bOwner == 0) then
--			CreateTaskSay({"<dec><npc>��������Ʒ����������Ʒ��������Ʒ������״̬�£�ֻ������Ʒ������������", "֪����/cancel"});
--            		return
--            	end
--	elseif (nItemLockState == 2) then	--���
--			CreateTaskSay({"<dec><npc>��������Ʒ����������Ʒ��������Ʒ�ڽ��״̬�£���ֹ������", "֪����/cancel"});
--        		return	
--	end
	
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>��û�д��������<color=yellow>1000��<color> ��.", "��֪���ˣ�������׼��/no"});
		return
	end;
	Pay(10000000);
	
	-- ɾԭ��
	for i = 1, nItemCount do
		if (GetGiveItemUnit(i) ~= nEquipItemIdx and RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[Task �����׽�װ�� ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t ɾ��ʧ����Ʒ\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>�׽�װ������ʧ�ܣ���ʧ����ԭ�Ϻ�1000����.", "��һ�����/no"});
		Msg2Player("�׽�װ������ʧ�ܣ���ʧ����ԭ�Ϻ�1000����.");
		WriteLog("[Task �����׽�װ�� FAIL!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t ��ֵ��������ȷ����Ϊ"..nUpGradeProb);
		return
	end;
	
	local szLog = "���� \t"..GetItemName(nEquipItemIdx).."1 \t";
	local szBeforeItemInfo = getItemInfo(nEquipItemIdx);	--�������ǰ����ϸ��Ϣ
	
	local nSuccess = getglobal(tb_tempUpgrade.szDoProcessFunc)(nEquipItemIdx);
	for szkey, tb_temp in tb_enhanceitem_count do
		if (tb_temp[2]) then
			szLog = szLog..tb_temp[2]..":"..tb_temp[1].." \t"
		end;
	end;
	
	local nItemLevel = GetPlatinaLevel(nEquipItemIdx);
	if nSuccess > 0 then
		if (nItemBindState ~= 0) then
			--BindItem(nEquipItemIdx);
			SetItemBindState(nEquipItemIdx, nItemBindState)
		end;
		local szBehindItemInfo = getItemInfo(nEquipItemIdx);--������������ϸ��Ϣ
		CreateTaskSay({"<dec><npc>�����׽�װ���ɹ����õ�1�װ׽�װ��<color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."<color>, ��"..nItemLevel..".", "��һ�����/no"});
		Msg2Player("�����׽�װ���ɹ�,�ȼ���"..nItemLevel.."�׽�װ��:"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]);
		WriteLog("[Task �����׽�װ�� SUCCESS!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t �õ��׽�װ��"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."\t"..szLog);
		writeRecoinLog("[�����׽�װ��ԭ��]", szBeforeItemInfo);
		writeRecoinLog("[�����׽�װ�����]", szBehindItemInfo);
	else
		WriteLog("[Task �����׽�װ�� ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t �����׽�װ��ʧ��\t"..szLog);
		writeRecoinLog("[�����׽�װ��ԭ��]", szBeforeItemInfo);
	end;
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
		"����ʯ��Ƭ�����ϵı�����˼�����ҵ�. ��Ȼ������Ե�<color=yellow>����ʹ��<color> ���ʿ����������<color=yellow>������<color> �Ϳ�����. Ҳ���Ե�<color=yellow>�����<color> ����",
		"֪����!/no",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>�׽�װ���A�������ɴ���Ļƽ�װ��������. �ƽ�װ��������Խ����ô��������İ׽�װ����Խ�ã��ҽ����ñ�Ļƽ�װ��.","�����Ի���/no"});
end;
