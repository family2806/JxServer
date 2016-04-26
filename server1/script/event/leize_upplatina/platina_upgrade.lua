Include("\\script\\event\\leize_upplatina\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>之前，我曾帮助官府用<color=yellow>补天石碎片<color>制造出神兵利器.如果<sex>找到<color=yellow>这些补天石碎片<color> , 我便可以帮你打造白金装备, 这个物品一定不能少.",
	"我想升级这套白金装备/upgrade_paltinaequip",
	"我想把黄金装备打造成白金装备/upgrade_goldformplatina",
	"收集补天石碎片的方法/about_aerolite",
	"是什么白金装备/about_platina",
	"让我仔细想想看/no",
	};
	CreateTaskSay(aryDescribe);
end;

----将黄金装备打造成白金装备
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>一般的黄金装备升级成白金装备所需材料为: 雷泽鎚，以及1000万银两.如果是增加所有武功等级的黄金装备，由于其特殊的材料，要重新炼化需要精炼的炉火而听说天下只有混沌鼎才能承受如此高温.<enter>如果你想要知道升级后的白金装备的属性如何，只要把黄金装备给我看看就行!",
		"我想知道这件装备打造为白金装备后的属性./want_upgoldeq_preview",
		"能帮我把这件装备打造为白金装备吗?/want_upgoldeq",
		"我再想想看/no"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("看过打造白金装备", "要把黄金装备放入物品盒中.", "do_upgoldeq_preview", "no",1);
end;

function want_upgoldeq()
	GiveItemUI("打造白金装备", "要升级任何的黄金装备就只需要把所有原料放入下面，同时需要1000万.", "do_upgoldeq_process", "no",1);
end;

function do_upgoldeq_process(nItemCount)
	do_upgradeequip_process(nItemCount, 1, 0);
end;

function do_upgoldeq_preview(nItemCount)
	if (nItemCount == 0) then
		CreateTaskSay({"<dec><npc>你没有带黄金装备来，我们怎么能给你看完成后的白金装备是什么样子? ", "请放心，我不会损害你的装备的./want_upgoldeq_preview", "等我带过来./no"});
		return 0;
	elseif (nItemCount > 1) then
		CreateTaskSay({"<dec><npc>只要放入想制造的黄金装备就可以了，别的不需要.", "哈哈，大侠也有不小心的时候，让我来放./want_upgoldeq_preview", "我先整理背包/no"});
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local nCurItemName = GetItemName(nCurItemIdx);
	local nCurItemQuality = GetItemQuality(nCurItemIdx);
	local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
	if (nCurItemQuality == 1) then
		if (tbCurItemProp[1] ~= 0) then
			CreateTaskSay({"<dec><npc>只要放入想要制造的黄金装备就可以了，别的不需要.", "哈哈，大侠也有不小心点的时候，让我来放./want_upgoldeq_preview", "我先整理背包/no"});
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
		CreateTaskSay(	{	"<dec><npc>装备color=yellow>"..GetItemName(nCurItemIdx).."<color>  已打造成白金装备了.",
							"打造其他的黄金装备./want_upgoldeq_preview",
							"真不好意思，我待会回来./no"	}	);
		return
	elseif (nComposeEntryIdx == 0) then
		CreateTaskSay(	{	"<dec><npc>真遗憾，我能力有限，帮不了你<color=yellow>"..GetItemName(nCurItemIdx).."<color>这套黄金装备已打造成白金装备了.",
							"打造其他的黄金装备./want_upgoldeq_preview",
							"真不好意思，我待会回来./no"	}	);
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
	CreateTaskSay({"<dec><npc>完成的白金装备是<color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", 属性如下: <enter>"..szItemDesc,
	"帮我看看别的装备打造出来的白金装备会是什么样子./want_upgoldeq_preview",
	"能帮我把这套装备打造成白金装备吗/want_upgoldeq",
	"我知道了，多谢./no"});
end;
----白金装备升级
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>升级白金装备需要的材料如下:1块<color=yellow>补天石碎片（中）<color> 和1000万两.可以用荣誉点兑换补天石碎片，如果你已经准备好我们就可以开始了.<enter><color=red>升级白金装备有一定风险，如果失败了则物品和1000万都将损失.<color><enter>如果你想知道打造后的白金装备属性如何只要把黄金装备带给我看看就可以了.",
		"我想看看之后的白金装备的属性./#want_upplatinaeq(1)",
		"我可帮我升级装备吗/#want_upplatinaeq(0)",
		"我再想想看 /no"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("看升级白金装备过程", "把要升级的白金装备和补天石碎片放入物品盒.", "do_upplatinaeq_preview", "no",1);
	else
		GiveItemUI("升级白金装备", "把要升级的白金装备和补天石碎片放入物品盒，升级消耗1000万两.", "do_upplatinaeq_process", "no",1);
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
	
	local nItemBindState;	--原料黄金的绑定状态
	--local nItemLockState = 0;   --原料的锁魂状态
	local tb_enhanceitem_count = {};
	local tb_tempUpgrade = tbUpGradeProcess[nStep];
	local szContinueFunc = tb_tempUpgrade.szContinueFunc;
	
--	if (bPreview ~= 1) then
--		szContinueFunc = "#"..szContinueFunc.."(0)";
--	else
--		szContinueFunc = "#"..szContinueFunc.."(1)";
--	end
	
	-- 校验物品是否匹配
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nCurItemValue = 0;
		if (nCurItemQuality == tb_tempUpgrade.nItemQuality) then
			--如果不是装备(可能是损坏装备)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	szErrorMsg,
					"哈哈，大侠也有不小心的时候，我来放吧./".."#"..szContinueFunc.."("..bPreview..")",
					"真不好意思，我待会回来./no"	}	);
				return
			end
			if (nExpiredTime > 0) then -- 有保质期的装备，不能！
				CreateTaskSay(	{	"<dec><npc>装备有<color=fire>th使用期限<color> 不能锻造.",
									"真不好意思，我又放错了.一会又回来cancel"	}	);
				return
			end
			if (nComposeEntryIdx ~= 0) then
				CreateTaskSay(	{	"<dec><npc>最后你想打造哪套黄金装备？我没有眼花吧？",
									"哈哈，大侠也有不小心的时候，我来放吧./".."#"..szContinueFunc.."("..bPreview..")",
									"真不好意思，我待会回来./no"	}	);
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
				CreateTaskSay(	{	"<dec><npc>真不好意思，我现在的能力帮不了你什么<color=yellow>"..GetItemName(nCurItemIdx).."<color>.",
									"试试别的装备/".."#"..szContinueFunc.."("..bPreview..")",
									"真不好意思，我待会回来./no"	}	);
				return
			end
			
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
				CreateTaskSay(	{"<dec><npc>我现在的能力只能帮你把装备强化到这个级别了，之后我可以帮你继续修炼.相信我离开之后终有一日可以帮你强化这些物品，到那时再回来找我吧！",
									"试试别的装备/".."#"..szContinueFunc.."("..bPreview..")",
									"真不好意思，我待会回来./cancel"	}	);
				return
			end;
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
				CreateTaskSay(	{	"<dec><npc>装备已达到最高级，不需要再升级了.",
									"试试别的装备/".."#"..szContinueFunc.."("..bPreview..")",
									"真不好意思，我待会回来./no"	}	);
				return
			end;
			
			nEquipItemIdx = nCurItemIdx;
			nCurItemValue = 0;
			nItemBindState = GetItemBindState(nCurItemIdx)	--获取绑定状态
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
									"哈哈，大侠也有不小心的时候，我来放吧./".."#"..szContinueFunc.."("..bPreview..")",
									"真不好意思，我待会回来./no"	}	);
				return
			end
			if (tb_tempUpgrade.tbUpItemList[szItemKey][3] ~= -1) then
				if (tbCurItemProp[4] ~= tb_tempUpgrade.tbUpItemList[szItemKey][3]) then
					CreateTaskSay(	{	"<dec><npc>装备等级"..GetItemName(nCurItemIdx).." 这似乎不对.",
									"哈哈，大侠也有不小心的时候，我来放吧./".."#"..szContinueFunc.."("..bPreview..")",
									"真不好意思，我待会回来./no"	}	);
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
		CreateTaskSay(	{	"<dec><npc>如果需要我帮助，就把准备交给我.",
							"哈哈，大侠也有不小心的时候，我来放吧./".."#"..szContinueFunc.."("..bPreview..")",
							"真不好意思，我待会回来./no"	}	);
		return
	end
	
	local tbBeidoujuan = 
	{
		[6] = "北斗炼金术(卷 1)", [7] = "北斗炼金术(卷 2)", [8] = "北斗炼金术(卷 3)", [9] = "北斗炼金术(卷 4)"
	};
	local PLevel = GetPlatinaLevel(nEquipItemIdx);
	if (nStep == 3 and bPreview == 0) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_item[4]) then
				if (PLevel == tb_item[4] and tb_enhanceitem_count[szkey][1] ~= tb_item[1] or (PLevel ~= tb_item[4] and tb_enhanceitem_count[szkey][1] ~= 0)) then
					local szErrorMsg = "";
					if (PLevel < 6) then
						szErrorMsg = "<dec><npc> 打造此装备需要北斗炼金术";
					else
						szErrorMsg = "<dec><npc>打造此装备只需要<color=yellow>1"..tbBeidoujuan[GetPlatinaLevel(nEquipItemIdx)].."<color>, 放入太多会吃亏，但是少了又无法制造.";
					end
					CreateTaskSay({szErrorMsg,
									"我再试试./".."#"..szContinueFunc.."("..bPreview..")",
									"真不好意思，我待会回来./no"	}	);
					return
				end
			end
		end
	end
	if (nStep == 1) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_enhanceitem_count[szkey][1] ~= tb_tempUpgrade.tbUpItemList[szkey][1]) then
				CreateTaskSay(	{	"<dec><npc>要打造此装备，我最少需要 <color=yellow>"..tb_tempUpgrade.tbUpItemList[szkey][1].."个"..tb_tempUpgrade.tbUpItemList[szkey][2].."<color>, 放入太多会吃亏，但是少了又无法制造.",
										"我再试试./".."#"..szContinueFunc.."("..bPreview..")",
										"真不好意思，我待会回来./no"	}	);
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
			local szItemDesc = format("<dec><npc>根据我的经验，这套白金装备有 <color=yellow>%5.2f%%的几率<color> 升1级，属性如下:  <enter>", nUpGradeProb*100);
			
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
								"帮我看看其他装备打造出的白金装备是什么样子./".."#"..szContinueFunc.."("..bPreview..")",
								"可以帮我把这套装备打造成白金装备吗/".."#"..szContinueFunc.."(0)",
								"我知道了，多谢/no"});
			return
		end;
	end;
	
--	nItemLockState = GetLockItemState(nEquipItemIdx)  --获取锁魂状态
--	if (nItemLockState == 1) then	--锁魂
--        	local bOwner = IsLockItemOwner(nEquipItemIdx)
--		if (bOwner == 0) then
--			CreateTaskSay({"<dec><npc>升级的物品存在锁魂物品，锁魂物品在锁魂状态下，只允许物品归属人升级。", "知道了/cancel"});
--            		return
--            	end
--	elseif (nItemLockState == 2) then	--解魂
--			CreateTaskSay({"<dec><npc>升级的物品存在锁魂物品，锁魂物品在解魂状态下，禁止升级。", "知道了/cancel"});
--        		return	
--	end
	
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>你没有带打造费用<color=yellow>1000万<color> 两.", "我知道了，等我先准备/no"});
		return
	end;
	Pay(10000000);
	
	-- 删原料
	for i = 1, nItemCount do
		if (GetGiveItemUnit(i) ~= nEquipItemIdx and RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[Task 升级白金装备 ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t 删除失败物品\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>白金装备升级失败，丢失制造原料和1000万两.", "我一会回来/no"});
		Msg2Player("白金装备升级失败，丢失制造原料和1000万两.");
		WriteLog("[Task 升级白金装备 FAIL!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t 价值量不够，确定率为"..nUpGradeProb);
		return
	end;
	
	local szLog = "消耗 \t"..GetItemName(nEquipItemIdx).."1 \t";
	local szBeforeItemInfo = getItemInfo(nEquipItemIdx);	--获得升级前的详细信息
	
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
		local szBehindItemInfo = getItemInfo(nEquipItemIdx);--获得升级后的详细信息
		CreateTaskSay({"<dec><npc>升级白金装备成功，得到1套白金装备<color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."<color>, 级"..nItemLevel..".", "我一会回来/no"});
		Msg2Player("升级白金装备成功,等级是"..nItemLevel.."白金装备:"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]);
		WriteLog("[Task 升级白金装备 SUCCESS!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t 得到白金装备"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."\t"..szLog);
		writeRecoinLog("[升级白金装备原料]", szBeforeItemInfo);
		writeRecoinLog("[升级白金装备结果]", szBehindItemInfo);
	else
		WriteLog("[Task 升级白金装备 ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t 升级白金装备失败\t"..szLog);
		writeRecoinLog("[升级白金装备原料]", szBeforeItemInfo);
	end;
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
		"补天石碎片是天上的宝物，在人间很难找到. 虽然，你可以到<color=yellow>联赛使者<color> 问问看，如果你有<color=yellow>荣誉点<color> 就可以买到. 也可以到<color=yellow>奇珍阁<color> 看看",
		"知道了!/no",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>白金装备旳属性是由打造的黄金装备决定的. 黄金装备的属性越好那么打造出来的白金装备就越好，我建议用别的黄金装备.","结束对话”/no"});
end;
