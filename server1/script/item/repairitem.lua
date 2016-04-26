-- 装备维修

IncludeLib( "ITEM" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

-- 临时任务变量ID: 101~110
TTID_ItemIndex 	= 101;
TTID_OrgMaxDur 	= 102;
TTID_CurMaxDur 	= 103;
-- TTID_CurDur 	= 104;
TTID_LostDur 	= 105;
TTID_CheapPrice	= 106;
TTID_CostlyPrice= 107;

-- 可镶嵌装备维修费用表
ENCHASABLE_EQUIP_PRICE =
{
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 明1位置10级魔法属性的费用值
	{ 100, 220, 360, 520, 700, 900, 1120, 1360, 1620, 1900 },		-- 暗1位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 明2位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 暗2位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 明3位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 暗3位置10级魔法属性的费用值
}

-- RPGE_RESTORMAX = 25;
function repair_goldequip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- 不是黄金装备，不在脚本中处理(由程序处理)
	if (nQuality ~= 1 and nQuality ~= 4) then
		return -1;
	end
	
	szAboutMsg = get_repair_qualityname(nQuality).."装备修理说明.../RePairGE_About";

	if (nQuality == 4 and GetPlatinaLevel(nItemIndex) >= 6) then
		Say("店主：在本店不能修+6以上白金装备", 0);
		return 1
	end
	-- 不需维修
	nFixDur = nCurMaxDur - nCurDur;
	if (nFixDur <= 0) and (nCurMaxDur == nOrgMaxDur) then
		Say("店主：此"..get_repair_qualityname(nQuality).."装备暂时不需修理。想了解如何修理"..get_repair_qualityname(nQuality).."装备吗？", 2, szAboutMsg, "已经明白了/RepairGE_Cancel")
		return 1;
	end;
	
	SetTaskTemp(TTID_ItemIndex, nItemIndex);
	SetTaskTemp(TTID_OrgMaxDur, nOrgMaxDur);
	SetTaskTemp(TTID_CurMaxDur, nCurMaxDur);
	-- SetTaskTemp(TTID_CurDur, nCurDur);

	-- 简单维修要下调的耐久度上限点数(至少一点)
	nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end
	
	--nCheapPrice =  nFixDur * 10000; -- 一点一万两 (nFixDur - nLostDur)
	--nCostlyPrice = nFixDur * 30000; -- -- 一点三万两
	
	-- 黄金装备修理价格公式调整为：100*(装备等级^2)/每点耐久度
	-- 越南版本的修理价格降10倍
	nItemLevel = GetItemLevel(nItemIndex);
	nCheapPrice = 10 * nItemLevel * nItemLevel * nFixDur;
	nCostlyPrice = nCheapPrice * 3; -- 简修的三倍

	SetTaskTemp(TTID_LostDur, nLostDur);
	SetTaskTemp(TTID_CheapPrice, nCheapPrice);
	SetTaskTemp(TTID_CostlyPrice, nCostlyPrice);

	-- 以万两作显示单位
	_nCheapW = floor(nCheapPrice / 10000);
	_nCheap = mod(nCheapPrice, 10000);
	_nCostlyW = floor(nCostlyPrice / 10000);
	_nCostly = mod(nCostlyPrice, 10000);
	
	szFixMsg = 
	{
		"简修 [".._nCheapW.."万".._nCheap.."两，耐久度上限下降"..nLostDur.."点]/RePairGE_Cheap", -- 1	
		"精修 [".._nCostlyW.."万".._nCostly.."两]/RePairGE_Costly",  -- 2
		"使用水晶修复耐久度上限/RepairGE_ReStoreMax", --3
		"使用修复神油修复耐久度上限/RepairGE_ReStoreMax_Oil", --4
	}
	szCancelMsg = "暂时不修了/RepairGE_Cancel";
	
	szSayMsg = 
	{
		"店主："..get_repair_qualityname(nQuality).."装备乃武林至宝,修理不易.大侠是想简修，还是精修？",	
		"店主：大侠的"..get_repair_qualityname(nQuality).."装备耐久度上限已被部分磨损，需要修复吗？",		
	}
	
	--print("黄金包装备维修(FixDur, CurMaxDur, OrgMaxDur): "..nFixDur..","..nCurMaxDur..","..nOrgMaxDur);
	if (nFixDur > 0) and (nCurMaxDur == nOrgMaxDur) then
		-- 只能修耐久度
		--print("只能修耐久度");
		Say(szSayMsg[1], 4, szFixMsg[1], szFixMsg[2], szAboutMsg, szCancelMsg)
	elseif (nFixDur <= 0) and (nCurMaxDur < nOrgMaxDur) then
		-- 只能修耐久度上限
		--print("只能修耐久度上限");
		Say(szSayMsg[2], 4, szFixMsg[3], szFixMsg[4], szAboutMsg, szCancelMsg)
	else
		-- 修精修、简修、上限
		--print("修精修、简修、上限");
		Say(szSayMsg[1], 6, szFixMsg[1], szFixMsg[2], szFixMsg[3], szFixMsg[4],szAboutMsg, szCancelMsg)
	end
	
	return 1;
end;

-- 精修 - 不掉耐久度上限
function RePairGE_Costly()
	nCostlyPrice = GetTaskTemp(TTID_CostlyPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	if (GetCash() >= nCostlyPrice) then
		Pay(nCostlyPrice)
		-- Msg2Player("修复装备！")
		SetCurDurability(nItemIndex, nCurMaxDur);
		WriteLog(date("%H%M%S").."："..GetAccount().."("..GetName()..") 使用("..nCostlyPrice..")两银子，精修"..get_repair_qualityname(nQuality).."装备(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nCurMaxDur..")");
	else
		-- 以万两作显示单位
		_nCostlyW = floor(nCostlyPrice / 10000);
		_nCostly = mod(nCostlyPrice, 10000);
		Talk(1,"","店主：修理需".._nCostlyW.."万".._nCostly.."两，您身上所带的银两不足！")
	end

end;

-- 简修 - 掉耐久度上限
function RePairGE_Cheap()
	nCheapPrice = GetTaskTemp(TTID_CheapPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	nLostDur = GetTaskTemp(TTID_LostDur);
	
	if (GetCash() >= nCheapPrice) then
		Pay(nCheapPrice)
		-- Msg2Player("修复装备！")
		
		-- 修复后的最大上限
		nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIndex, nFixMaxDur);
		SetCurDurability(nItemIndex, nFixMaxDur);
		
		WriteLog(date("%H%M%S").."："..GetAccount().."("..GetName()..") 使用("..nCheapPrice..")两银子，简修"..get_repair_qualityname(nQuality).."装备(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nFixMaxDur..")，耐久度上限下降"..nLostDur.."点");
		
	else
		-- 以万两作显示单位
		_nCheapW = floor(nCheapPrice / 10000);
		_nCheap = mod(nCheapPrice, 10000);
		Talk(1,"","店主：修理费用需[".._nCheapW.."万".._nCheap.."两]您身上所带的银两不足！")
	end
end;

-- 修复上限
function RepairGE_ReStoreMax()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."黄金装备耐久度上限有错!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "店主：您的装备暂时不需要修理。")
		return 1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)

	-- 扣技能宝石(水晶)
	if (j238 > 0) then
		DelItemEx(238)
	elseif (j239 > 0) then
		DelItemEx(239)
	elseif (j240 > 0) then
		DelItemEx(240)
	else
		Talk(1,"","店主：您身上没有水晶。")
		return -1;
	end

	-- 加耐久度上限
	nAddMaxDur = 25; -- 一颗水晶，加25点上限
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S").."："..GetAccount().."("..GetName()..") 使用一颗水晶，"..get_repair_qualityname(nQuality).."装备(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..")耐久度上限上升了"..nAddMaxDur.."点");
	Msg2Player("您使用了一颗水晶，装备耐久度上限上升了"..nAddMaxDur.."点");
end;

function RepairGE_ReStoreMax_Oil()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."黄金装备耐久度上限有错!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "店主：您的装备暂时不需要修理。")
		return 1;
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	if (nBindState == 0) then
		Talk(1, "", "店主：<color=yellow>修复神油<color>只能修复<color=red>绑定<color>状态的装备。")
		return 1;
	end
	
	local nOilCount = CalcEquiproomItemCount(6, 1, 2565, -1);

	-- 扣技能宝石(水晶)
	if (nOilCount > 0) then
		ConsumeEquiproomItem(1, 6, 1, 2565, -1);
	else
		Talk(1,"","店主：您身上没有修复神油。")
		return -1;
	end

	-- 加耐久度上限
	nAddMaxDur = 25; -- 一颗水晶，加25点上限
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S").."："..GetAccount().."("..GetName()..") 使用一瓶修复神油，"..get_repair_qualityname(nQuality).."装备(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..")耐久度上限上升了"..nAddMaxDur.."点");
	Msg2Player("您使用了一瓶修复神油，装备耐久度上限上升了"..nAddMaxDur.."点");
end;

-- 取消
function RepairGE_Cancel()
end;

-- 关于黄金装备的修理
function RePairGE_About()
	_szInfo = 
	{
		"<color=green>简修：<color>价格便宜，但修理后装备耐久度上限会降低<enter>",	
		"<color=green>精修：<color>价格昂贵，修理后装备耐久度上限不会降低<enter>",		
		"<color=green>修复耐久度上限：<color>使用水晶可以修复"..get_repair_qualityname(nQuality).."装备的部分耐久度上限<enter>",
		"修复神油只能修复绑定装备",
	}
	szInfo = _szInfo[1].._szInfo[2].._szInfo[3].._szInfo[4];

	Talk(1, "", szInfo)
end;

-- 关于黄金装备磨损上限的修复
--function RePairGE_AboutRestorMax()
--	Talk(1, "", "使用<color=red>水晶<color>可以修复黄金装备的部分耐久度上限")
--end;

-----------------------------------------------------------------------------
-- 计算装备维修价格 --
-- 返回值：-1 表示出错; >=0 表示修理所需的银两数
function get_repair_price(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice, nPriceScale, nMagicScale, nSumMagic)
	if( nCurMaxDur <= 0 or nCurMaxDur <= nCurDur ) then
		return 0;
	end
	local nRepairPrice = 0;
	if( nQuality == 0 ) then		-- 普通装备（蓝/白色装备）
		nRepairPrice = nEquipPrice * nPriceScale / 100 * ( nCurMaxDur - nCurDur ) / nCurMaxDur * ( nMagicScale + nSumMagic ) / nMagicScale;
	elseif( nQuality == 2 ) then	-- 可镶嵌装备（紫色装备）
		local arynMagLvl = GetItemAllParams( nItemIndex );
		local nItemVer = ITEM_GetItemVersion( nItemIndex );
		for i = 1, 6 do
			if( arynMagLvl[i] == 0 ) then
				break;
			elseif( arynMagLvl[i] < 0 or arynMagLvl[i] == 65535 ) then					-- MagicLevel传到客户端是用WORD传输的，(WORD)(-1) == 65535
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][4];				-- 空孔按4级魔法等级属性计算
			else
				local nCurMagLvl = getMagAttrLvlLevel( nItemVer, arynMagLvl[i] );
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][nCurMagLvl];	-- 按魔法等级属性计算
			end			
		end
		nRepairPrice = nRepairPrice * ( nCurMaxDur - nCurDur )
	end
	return nRepairPrice;
end;

-- 维修装备 --
-- 返回值：-1  表示出错，= 0 表示数据未被修改(不同步客户端); >0 表示成功(通知客户端)
function repair_equip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- SetMaxDurability(nItemIndex, 10);
	-- SetCurDurability(nItemIndex, 10);
	return -1;
end;

function get_repair_qualityname(nQ)
	if (nQ == 1) then
		return "黄金";
	elseif (nQ == 4) then
		return "白金";
	else
		return "";
	end;
end;