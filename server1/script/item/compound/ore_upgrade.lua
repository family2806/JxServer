-- 功能：紫色装备系统 - 矿石升级
-- Fanghao Wu 2005.1.15

Include( "\\script\\item\\compound\\compound_header.lua" );

-- [合成]费用
COMPOUND_COST = 5000;

-- 玄晶矿石物品参数（以后如果增加新版本物品需要作相应的处理）
XUANJING =	{ 6, 1, 147 };
-- 魔法属性矿石的物品参数（以后如果增加新版本物品需要作相应的处理）
MAGIC_ORE =	{
			{ 6, 1, 200 },
			{ 6, 1, 201 },
			{ 6, 1, 202 },
			{ 6, 1, 203 },
			{ 6, 1, 204 },
			{ 6, 1, 205 }
			};


-- 初始化数据
function initData()
	g_nOreGenre = 0;
	g_nOreDetailType = 0;
	g_nOreParticular = 0;
	g_nOreLevel = 0;
	g_nOreSeries = 0;
	g_nOreMagicID = 0;
end

-- 获取[合成]操作参数（用于传递给ITEM_CalcItemValue计算物品价值量）
function getCompoundParam()
	return "ORE_UPGRADE";
end

-- 校验原料是否符合[合成]规则（同时存储一些原料数据）
function verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )
	local nNecessaryItemCount = getn( arynNecessaryItemIdx );
	if( nNecessaryItemCount ~= 3 ) then
		return RESULT_LACK_RESOURCE;
	end
	local bIsXuanjing = 0;
	local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp( arynNecessaryItemIdx[1] );
	if( nGenre == XUANJING[1] and nDetailType ==XUANJING[2] and nParticular == XUANJING[3] ) then
		bIsXuanjing = 1;
	else
		for i = 1, getn( MAGIC_ORE ) do
			if( nGenre == MAGIC_ORE[i][1] and nDetailType == MAGIC_ORE[i][2] and nParticular == MAGIC_ORE[i][3] ) then
				g_nOreMagicID = GetItemParam( arynNecessaryItemIdx[1], 1 );
				break;
			end
		end
	end
	if( bIsXuanjing ~= 1 and g_nOreMagicID <= 0 ) then
		return RESULT_LACK_RESOURCE;
	end
	if( nLevel >= 10 ) then
		return RESULT_LEVEL_FULL;
	end
	g_nOreGenre = nGenre;
	g_nOreDetailType = nDetailType;
	g_nOreParticular = nParticular;
	g_nOreLevel = nLevel;
	g_nOreSeries = nSeries;
	for i = 2, 3 do
		local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp( arynNecessaryItemIdx[i] );
		if( g_nOreGenre ~= nGenre or g_nOreDetailType ~= nDetailType or g_nOreParticular ~= nParticular ) then
			return RESULT_LACK_RESOURCE;
		end
		if( g_nOreLevel ~= nLevel ) then
			return RESULT_LEVEL_ERROR;
		end
		if( g_nOreMagicID > 0 ) then
			if( mod( nParticular, 2 ) ~= 0 and g_nOreSeries ~= nSeries ) then
				return RESULT_SERIES_ERROR;
			end
			if( GetItemParam( arynNecessaryItemIdx[i], 1 ) ~= g_nOreMagicID ) then
				return RESULT_MAGIC_ERROR;
			end
		end
	end
	return RESULT_SUCCEED;
end

-- 生成目标物品信息
function genDesItemsInfo( arynNecessaryItemIdx )
	local aryDesItemInfo = {};
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	local arynMagLvl = { g_nOreMagicID, 0, 0, 0, 0, 0 };
	aryDesItemInfo[1] = { nLatestItemVer, 0, 0, g_nOreGenre, g_nOreDetailType, g_nOreParticular, g_nOreLevel + 1, g_nOreSeries, 0, arynMagLvl, nil, getCompoundParam() };
	return aryDesItemInfo;
end

-- 完成选择目标物品、删除原料等收尾操作
function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	local dDesProb = (nSrcItemValSum/3) / (arydDesItemVal[1]-(nSrcItemValSum/3)*2);
	if( random() < dDesProb ) then
		local nDesItemValCut = floor( arydDesItemVal[1] / SUM_UNIT );
		if( nDesItemValCut >= COMMON_SUM_BASE_VAL ) then
			local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
			SetGlbValue( GLBID_COMMON_VAL_SUM, nCommonItemVal );
			if( nCommonItemVal + nDesItemValCut >= COMMON_SUM_MAX_VAL ) then
				local strMsg = format( "[警报] %s 今日[合成]的紫色装备相关物品的价值总量（%0.2fE），已超过价值总量警报阈值（%0.2fE），可能出现刷物品现象，请尽快联系研发部！！！", date( "%Y-%m-%d %H:%M:%S" ), ( nCommonItemVal + nDesItemValCut ) * SUM_UNIT / 100000000, COMMON_SUM_MAX_VAL * SUM_UNIT / 100000000 );
				print( strMsg );
				WriteLog( strMsg );
			end
		end
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo[1], arydDesItemVal[1], dDesProb );
		local nResultDesItemIdx = addItemByInfo( aryDesItemInfo[1] );
		if( nResultDesItemIdx > 0 ) then
			removeItems( arynNecessaryItemIdx );
			removeItems( arynAlternativeItemIdx );
			return nResultDesItemIdx, RESULT_SUCCEED;
		end
	end
	writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, nil, 0, 1 - dDesProb );
	RemoveItemByIndex( arynNecessaryItemIdx[1] );
	removeItems( arynAlternativeItemIdx );
	return -1, RESULT_FAIL;
end