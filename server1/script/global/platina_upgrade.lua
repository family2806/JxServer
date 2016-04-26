Include("\\script\\global\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>之前，我曾经帮助官府用<color=yellow>各种补天石碎片<color> 来制造神笔利器。比如<sex>可以找出<color=yellow>该补天石碎片<color>,我可以帮你制造白金装备，一定不能缺该原料.",
	"我想升级该白金装备/upgrade_paltinaequip",
	"我想制造黄金装备成白金装备/upgrade_goldformplatina",
	"收集补天石碎片/about_aerolite",
	"白金装备是什么about_platina",
	"让我再考虑/cancel",
	};
	CreateTaskSay(aryDescribe);
end;

----将黄金装备打造成白金装备
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>升级黄金装备到白金原料需要1补天石(中), 1 8级玄晶矿石, 1神秘矿石和1000万两. 补天石可以用荣誉值或者在奇珍阁买到。装备完所有原料，我们就可以开始装备制造工作。<enter> 如果你想知道升级成白金装备后的属性如何，把黄金装备给我就知道了.",
		"我想看从黄金装备升级后的白金装备属性./want_upgoldeq_preview",
		"可以帮我把这个装备制造成白金装备吗?/want_upgoldeq",
		"我想想看/cancel"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("看过制造白金装备", "把想制造的黄金装备放入储物盒.", "do_upgoldeq_preview", "cancel",1);
end;

function do_upgoldeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"让我试试看/want_upgoldeq_preview",
		"真不好意思，我稍候回来./cancel"
	};
	
	if (nItemCount ~= 1) then
		tbDialog[1] = "<dec><npc>大侠放入的物品数量不对.";
		CreateTaskSay(tbDialog);
		return
	end

	-- 判断黄金装备是否符合要求
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local bSuccess, szErrorMsg, nComposeEntryIdx = fit_formed_eq(nCurItemIdx);
	
	if (bSuccess == 0) then
		tbDialog[1] = szErrorMsg;
		return
	end
	
	
	-- 预览
	local szDesc = preview_eq_format(nCurItemIdx);
	CreateTaskSay({"<dec><npc>完成的白金装备为<color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", 属性如下: <enter>"..szDesc,
		"帮我看完成的白金装备属性如何./want_upgoldeq_preview",
		"可以帮我制造该装备成白金装备吗？/want_upgoldeq",
		"我知道了，谢谢！/cancel"});
end;

function want_upgoldeq()
	GiveItemUI("制造白金装备", "带需要制造的黄金，1块补天石碎片(中), 1个8级玄晶矿石，和一个神秘矿石到下面的物品箱。制造需要耗费1000万两，你准备好了吗？", "do_upgoldeq_process", "cancel",1);
end;

function do_upgoldeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"我再试试看/want_upgoldeq",
		"真是不好意思，我稍候再来./cancel"
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
		
		-- 黄金装备
		if (nCurItemQuality == 1) then
			
			-- 只能放入一件黄金装备
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>到底你想制造神秘装备?我没有眼花吧？";
				CreateTaskSay(tbDialog);
				return
			end
			
			-- 判断黄金装备是否符合条件
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
	
	-- 必须要有件黄金装备
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>如果想我帮你，请把那个装备给我.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- 必需材料的个数必须满足要求
	for szkey, tb_item in tb_gold2planita_material do
		if (tb_item.nCount) then
			if (tb_material[szkey][1] ~= tb_item.nCount) then
				tbDialog[1] = "<dec><npc>想制造该装备，最少我也要 <color=yellow>"..tb_item.nCount.."个"..tb_item.szName.."<color>, 设置太多，就会损失，但是，太少，我又不能制造."
				CreateTaskSay(tbDialog);
				return
			end
		end
	end

	do_upgrade_platina(nEquipItemIdx, TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4], tbMaterialIdx, tb_material, 1);
end

----白金装备升级
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>升级成白金装备需要以下物品:1块 <color=yellow>补天石(中)<color> 以及100万两。可以用荣誉值换取补天石碎片，你准备好了，我们可以开始了.<enter><color=red>升级白金装备会有一定的风险，如果失败，将失去物品和1000万两.<color><enter>如果你想知道完成的白金装备说下如何，可以带黄金装备到这里给我看看",
		"我想看完成的白金装备属性./#want_upplatinaeq(1)",
		"可以帮我升级该白金装备吗？/#want_upplatinaeq(0)",
		"我再想想 /cancel"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("看白金装备升级过程", "请把想升级的白金装备和补天石碎片放进物品盒.", "do_upplatinaeq_preview", "cancel",1);
	else
		GiveItemUI("升级白金装备", "请把想升级的白金装备和补天石碎片放进物品盒，升级消耗1000万两.", "do_upplatinaeq_process", "cancel",1);
	end;
end;

function do_upplatinaeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"让我再试试/#want_upplatinaeq(1)",
		"真是不好意思，我稍候回来./cancel"
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
				tbDialog[1] = "<dec><npc>你到底是想升级成那种白金装备？我是不是眼花了?";
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
		tbDialog[1] = "<dec><npc>把需要升级成白金的装备给我，不然我现在怎么知道升级?";
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
	CreateTaskSay({format("<dec><npc>根据我的经验，该白金装备有<color=yellow>%5.2f%%<color>可能升级到接下来的级别和有属性: <enter>%s", nUpGradeProb*100, szDesc),
					"帮我看看从其他装备完成的白金装备如何./#want_upplatinaeq(1)",
					"可以帮我制造该装备成白金装备吗/#want_upplatinaeq(0)",
					"我知道了，谢谢。/cancel"});
end

function do_upplatinaeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"让我再试试/#want_upplatinaeq(0)",
		"真是不好意思，我稍候回来./cancel"
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
	
	-- 先遍历一遍 找到需要升级的白金装备或者需要打造的黄金装备
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality == 4) then
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>到底你想升级才哪种白金装备？是不是我看花眼了?";
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
		tbDialog[1] = "<dec><npc>如果想我帮你，就把那个装备给我.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- 校验材料是否匹配
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
				tbDialog[1] = "<dec><npc>想制造该装备，我只需要<color=yellow>"..tb_item.nCount.."个"..tb_item.szName.."<color>, 设置太多就会损失，太少就不能制造."
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
----将黄金装备打造成白金装备 END


function getItemAllMagicList(nItemIdx)
	local tb_magic = {};
	for i = 1, 6 do
		tb_magic[getn(tb_magic) + 1] = pack(GetItemMagicAttrib(nItemIdx, i));
	end;
	return tb_magic;
end;

function about_aerolite()
	CreateTaskSay({
		"补天石碎片是天地宝物，人世间很难寻找，不过，你可以到<color=yellow>联赛使者<color> 问问看，如果你有<color=yellow>荣誉值<color> 就能买到。也可以到<color=yellow>奇珍阁<color> 看看",
		"我知道了!/cancel",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>白金装备的属性将由黄金装备的属性决定，黄金装备属性越好，制造成的白金越多。如果不满意现在的黄金装备，我建议你找其他黄金装备.", "结束对话/cancel"});
end;


-- new func
-- 判断给予界面中的白金或者黄金装备是否是存在并且唯一
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
		szEqType	= "黄金装备";
	else
		szGetEquipIDFunc = "GetPlatinaEquipIndex";
		szEqType	= "白金装备";
	end

	if (tbCurItemProp[1] ~= 0) then	--如果不是装备(可能是损坏装备)
		szErrorMsg = format("<dec><npc>只需要给我%s 制造白金装备就够了，其他的就放下.", szEqType);
		return 0, szErrorMsg
	end
	
	if (nExpiredTime > 0) then -- 有保质期的装备，不能！
		szErrorMsg = "<dec><npc>Trang b?c?<color=fire>使用时限<color> 就不能炼.";
		return 0, szErrorMsg
	end
	
	for szkey, tb_item in TB_PLATINAEQ_GOLDEQ do
		if (szkey == getglobal(szGetEquipIDFunc)(nCurItemIdx)) then
			nComposeEntryIdx = szkey;
			break;
		end
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	if (nComposeEntryIdx == 0) then
		szErrorMsg = format("<dec><npc>很遗憾，以我现在的经验，不能制造<color=yellow>%s<color>.", GetItemName(nCurItemIdx));
		return 0, szErrorMsg
	end
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
		szErrorMsg = "<dec><npc>以我现在的力量，只能帮你强化该装备到这个等级而已，但是，以后我还能继续帮你炼。相信我吧，会有一天，我帮你强化他们升级，到时你回来找我哦";
		return 0, szErrorMsg
	end;
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
		szErrorMsg = "<dec><npc>该装备已达最高等级，不需要再升级了.";
		return 0, szErrorMsg
	end;
	
	return 1, szErrorMsg, nComposeEntryIdx;
end

-- 判断给予界面中放入的材料是否合理（如果是预览，只要判断有价值量的材料是否都在（无价值量但是打造所需的材料不用管），如果是打造，则都要判断）
-- 参数：材料Idx，是否为预览，材料table，黄金装备idx
function fit_formed_material(nCurItemIdx, tb_material, nPlatinaIdx)
	local szErrorMsg	= "";
	local tbCurItemProp	= pack(GetItemProp(nCurItemIdx));
	local szItemKey		= tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];

	if (tb_material[szItemKey] == nil)  then
		szErrorMsg = "<dec><npc>大侠放入的原料和要求的不符";
		return 0, szErrorMsg;
	end
	
	if (tb_material[szItemKey].nItemLevel) then
		if (tbCurItemProp[4] ~= tb_material[szItemKey]["nItemLevel"]) then
			szErrorMsg = format("<dec><npc>装备等级 %s 好像是不对.", GetItemName(nCurItemIdx));
			return 0, szErrorMsg;
		end
	end
	if (tb_material[szItemKey]["nUpgradeLevel"]) then
		if (GetPlatinaLevel(nPlatinaIdx) ~= tb_material[szItemKey]["nUpgradeLevel"]) then
			szErrorMsg = "<dec><npc>升级该白金装备的原料有的不对";
			return 0, szErrorMsg;
		end
	end
	
	return 1, szErrorMsg;
end

-- 预览的格式
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

-- 打造白金的过程
function do_upgrade_platina(nEqIdx, nUpgradeEqName, tbMaterialIdx, tb_enhanceitem_count, nUpGradeProb)
	-- 扣钱
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>你没有带制造的费用<color=yellow>1000 万<color> 两.", "我知道了，让我先准备/cancel"});
		return
	end
	Pay(10000000);
	
	-- 删原料
	for i = 1, getn(tbMaterialIdx) do
		if (RemoveItemByIndex(tbMaterialIdx[i]) ~= 1) then
			WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t 删除物品失败:%s",
						"[Task 升级白金装备ERROR!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						GetItemName(tbMaterialIdx[i])));
			return
		end
	end
	
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>升级白金装备失败，失去了制造物品和100万两.", "我稍候回来/cancel"});
		Msg2Player("升级白金装备失败，失去了制造物品和100万两.");
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t 价值量不足，概率为%.4f",
						"[Task 升级白金装备失败!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						nUpGradeProb))
		return
	end

	local szLog = "消耗\t"..GetItemName(nEqIdx).."1 \t";
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
	
	local szBeforeItemInfo	= getItemInfo(nEqIdx);	--获得升级前的详细信息
	
	-- 升级后
	local nSuccess			= getglobal(szUpgradeItemFunc)(nEqIdx);
	local nItemLevel		= GetPlatinaLevel(nEqIdx);
	if nSuccess > 0 then		
		local szBehindItemInfo	= getItemInfo(nEqIdx);--获得升级后的详细信息
		
		CreateTaskSay({"<dec><npc>升级白金装备成功，获得一个白金装备<color=yellow>"..nUpgradeEqName.."<color>, 级"..nItemLevel..".", "我稍候回来/cancel"});
		Msg2Player("白金装备升级成功，等级为"..nItemLevel.."白金装备:"..nUpgradeEqName);
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t 领取白金装备:%s\t %s",
					"[Task 升级白金装备SUCCESS!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					nUpgradeEqName,
					szLog));
		writeRecoinLog("[升级白金装备原料]", szBeforeItemInfo);
		writeRecoinLog("[升级白金装备结果]", szBehindItemInfo);
	else
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t 获得白金装备失败:%s",
					"[Task 升级白金装备ERROR!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					szLog));
		writeRecoinLog("[白金装备升级原料]", szBeforeItemInfo);
	end	
end
