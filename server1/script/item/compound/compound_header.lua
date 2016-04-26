-- 功能：装备[合成]脚本头文件（此处[合成]泛指原料升级、打造、镶嵌等所有相关操作）
-- 说明：本文件提供了[合成]操作的一般流程框架及几个相关功能函数，仅供其他具体的[合成]操作脚本文件包含使用
--       包含该文件完成[合成]功能，需要实现以下几个函数和全局变量：
--       initData() （可选）	初始化数据
--       getCompoundParam()		获取[合成]操作参数（用于传递给ITEM_CalcItemValue计算物品价值量）
--       verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )	校验原料是否符合[合成]规则（同时存储一些原料数据）
--       genDesItemsInfo( arynNecessaryItemIdx )	生成目标物品信息
--       	物品信息结构：{ nItemVer, nRandSeed, nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, {arynMagicLevel}, {arynMagicID}, strCompoundParam }
--       function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )	完成选择目标物品、删除原料等收尾操作
--       COMPOUND_COST			[合成]费用
--       * 如果本[合成]流程框架不适用，则不包含本头文件，自己重写Compound接口函数即可
-- Fanghao Wu 2005.1.15


IncludeLib( "ITEM" );
Include( "\\script\\item\\itemvalue\\itemvalue_header.lua" );


-- 需要记录Log的物品
ITEM_TO_LOG =
{
	{ 4, 238, 1, "蓝水晶" },
	{ 4, 239, 1, "紫水晶" },
	{ 4, 240, 1, "绿水晶" },
	{ 6, 1, 122, "福缘露（小）" },
	{ 6, 1, 123, "福缘露（中）" },
	{ 6, 1, 124, "福缘露（大）" },
	{ 6, 1, 398, "神秘矿石" },
}


-- 以下各操作结果值必须和程序中GameDataDef.h里FOUNDRY_RESULT_TYPE枚举值一一对应
RESULT_UNKNOWN			=	-1;						-- 未知错误
RESULT_SUCCEED			=	0;						-- [合成]成功
RESULT_FAIL				=	1;						-- [合成]失败
RESULT_NO_MONEY			=	2;						-- 金钱不足
RESULT_LEVEL_FULL		=	3;						-- 原料已达到最高等级
RESULT_LACK_RESOURCE	=	4;			 			-- 原料不足
RESULT_LEVEL_ERROR		=	5;						-- 原料等级错误
RESULT_MAGIC_ERROR		=	6;						-- 原料魔法值错误
RESULT_SERIES_ERROR		=	7;						-- 原料五行错误
RESULT_RULE_ERROR		=	8;						-- 原料不符合规则


GLBID_LAST_CMP_DATE		=	32;						-- 全局变量ID of 最后一次[合成]的日期
GLBID_COMMON_VAL_SUM	=	33;						-- 全局变量ID of 普通物品价值量汇总值
GLBID_GOLD_VAL_SUM		=	34;						-- 全局变量ID of 黄金装备价值量汇总值

SUM_UNIT				=	10000000;					-- 存储到GlobalValue的单位（千万）
COMMON_SUM_BASE_VAL		=	100000000 / SUM_UNIT;		-- 需要计入普通物品价值量汇总值的最低价值量
COMMON_SUM_MAX_VAL		=	200000000000 / SUM_UNIT;	-- 每日允许[合成]的普通物品价值量汇总值的最大值，到达此值将不再允许进行任何[合成]操作
GOLD_SUM_BASE_VAL		=	1000000000 / SUM_UNIT;		-- 需要计入黄金装备价值量汇总值的最低价值量
GOLD_SUM_MAX_VAL		=	200000000000 / SUM_UNIT;	-- 每日允许[合成]的黄金装备价值量汇总值的最大值，到达此值将不再允许进行任何[合成]操作


-- 功能：被程序访问的接口函数，实现某一[合成]操作
-- 参数：arynNecessaryItemIdx		必须原料的物品索引数组
--       arynAlternativeItemIdx		可选原料的物品索引数组
--       bPreview					预览
-- 返回：生成的物品索引, [合成]结果
function Compound( arynNecessaryItemIdx, arynAlternativeItemIdx, bPreview )
	if( isCompoundableToday() ~= 1 ) then
		Say( "神秘铁匠：老夫本日已经筋疲力尽了，侠士还是明日再来铸造装备吧。", 0 );
		return -1, RESULT_FAIL;
	end
	-- 初始化数据
	if( initData ~= nil ) then
		initData();
	end
	-- 校验原料是否符合[合成]规则（同时存储一些原料数据）
	local nResult = verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx );
	if( nResult ~= RESULT_SUCCEED ) then
		return -1, nResult;
	end
	-- 支付[合成]费用
	if( COMPOUND_COST == nil or Pay( COMPOUND_COST ) ~= 1 ) then
		return -1, RESULT_NO_MONEY;
	end
	-- 计算所有原料价值量总和
	local nNecItemValSum = sumItemsVal( arynNecessaryItemIdx );
	local nAltItemValSum = sumItemsVal( arynAlternativeItemIdx );
	local dAltItemFinalVal = nAltItemValSum;
	if( sumMainItemVal ~= nil ) then
		nMainItemValSum = sumMainItemVal( arynNecessaryItemIdx );
		dAltItemFinalVal = calcAltItemFinalVal( nMainItemValSum, nAltItemValSum );
	end
	local nSrcItemValSum = nNecItemValSum + dAltItemFinalVal;
--	Msg2Player( "<color=yellow>-----------------------------------" );
--	Msg2Player( "<color=gold>TotalSrcSum: "..nNecItemValSum.."+"..dAltItemFinalVal.."="..nSrcItemValSum );
--	Msg2Player( "<color=yellow>-----------------------------------" );
	-- 生成目标物品信息
	local aryDesItemInfo = genDesItemsInfo( arynNecessaryItemIdx );
	-- 计算每个目标物品的价值量
	local arydDesItemVal = {};
	local nDesItemCount = getn( aryDesItemInfo );
	for i = 1, nDesItemCount do
		arydDesItemVal[i] = funitem_calcItemValue(aryDesItemInfo[i]);
--Msg2Player( "<color=green>DesValue"..i..": "..arydDesItemVal[i] );
	end
--	Msg2Player( "<color=yellow>-----------------------------------" );
	
	if( bPreview == 1 ) then	-- 预览[合成]的成功率
		if( previewProb ~= nil ) then
			previewProb( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
		end
		return -1, RESULT_SUCCEED;
	else						-- 进行[合成]操作
		-- 完成选择目标物品、删除原料等收尾操作
		nResultDesItemIdx, nResult = finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
		-- 返回生成物品索引，[合成]结果
		return nResultDesItemIdx, nResult;
	end
end

-- 一般的收尾操作函数（完成选择目标物品、删除原料等收尾操作）
function defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal, funcTransItemVal )
	if (funcTransItemVal == nil) then
		funcTransItemVal = TransItemVal;
	end
	local nSelDesItemIdx, arydDesItemProb, dDesItemProbSum = funcTransItemVal( nSrcItemValSum, arydDesItemVal );
	if( nSelDesItemIdx > 0 ) then
		-- 累积每日[合成]的物品价值量汇总值
		local nDesItemValCut = floor( arydDesItemVal[nSelDesItemIdx] / SUM_UNIT );
		if( aryDesItemInfo[nSelDesItemIdx][3] == 1 ) then
			if( nDesItemValCut >= GOLD_SUM_BASE_VAL ) then
				local nGoldEqVal = GetGlbValue( GLBID_GOLD_VAL_SUM );
				SetGlbValue( GLBID_GOLD_VAL_SUM, nGoldEqVal + nDesItemValCut );
				if( nGoldEqVal + nDesItemValCut >= GOLD_SUM_MAX_VAL ) then
					local strMsg = format( "[警报] %s 今日[合成]的黄金装备的价值总量（%0.2fE），已超过价值总量警报阈值（%0.2fE），可能出现刷物品现象，请尽快联系研发部！！！", date( "%Y-%m-%d %H:%M:%S" ), ( nGoldEqVal + nDesItemValCut ) * SUM_UNIT / 100000000, GOLD_SUM_MAX_VAL * SUM_UNIT / 100000000 );
					print( strMsg );
					WriteLog( strMsg );
				end
			end
		else
			if( nDesItemValCut >= COMMON_SUM_BASE_VAL ) then
				local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
				SetGlbValue( GLBID_COMMON_VAL_SUM, nCommonItemVal + nDesItemValCut );
				if( nCommonItemVal + nDesItemValCut >= COMMON_SUM_MAX_VAL ) then
				local strMsg = format( "[警报] %s 今日[合成]的紫色装备相关物品的价值总量（%0.2fE），已超过价值总量警报阈值（%0.2fE），可能出现刷物品现象，请尽快联系研发部！！！", date( "%Y-%m-%d %H:%M:%S" ), ( nCommonItemVal + nDesItemValCut ) * SUM_UNIT / 100000000, COMMON_SUM_MAX_VAL * SUM_UNIT / 100000000 );
					print( strMsg );
					WriteLog( strMsg );
				end
			end
		end
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo[nSelDesItemIdx], arydDesItemVal[nSelDesItemIdx], arydDesItemProb[nSelDesItemIdx] );
		removeItems( arynNecessaryItemIdx );
		removeItems( arynAlternativeItemIdx );
		local nResultDesItemIdx = addItemByInfo( aryDesItemInfo[nSelDesItemIdx] );
		if( nResultDesItemIdx > 0 ) then
			return nResultDesItemIdx, RESULT_SUCCEED;
		else	-- 生成物品失败的异常也当作随机失败，最好做记录
			return -1, RESULT_FAIL;
		end
	else
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, nil, 0, 1 - dDesItemProbSum );
		removeItems( arynNecessaryItemIdx );
		removeItems( arynAlternativeItemIdx );
		return -1, RESULT_FAIL;
	end
end

-- 计算物品数组价值量总和
function sumItemsVal( arynItemIdx )
	local nItemCount = getn( arynItemIdx );
	local nItemValSum = 0;
	local nCurItemVal;
--	Msg2Player( "<color=yellow>-----------------------------------" );
	for i = 1, nItemCount do
		nCurItemVal = ITEM_CalcItemValue( arynItemIdx[i], getCompoundParam() );
--		Msg2Player( "<color=yellow>Value"..i..": "..nCurItemVal );
		nItemValSum = nItemValSum + nCurItemVal;
	end	
--	Msg2Player( "<color=gold>ValueSum: "..nItemValSum );
	return nItemValSum;
end

-- 从玩家身上删除指定物品数组中的所有物品
function removeItems( arynItemIdx )
	local nItemCount = getn( arynItemIdx );
	for i = 1, nItemCount do
		if( arynItemIdx[i] ~= nil ) then
			RemoveItemByIndex( arynItemIdx[i] );
		end
	end
end

-- 给玩家增加指定物品信息的物品
function addItemByInfo( iteminfo )
	local nItemIdx;
	if( iteminfo[10] ~= nil ) then
		nItemIdx = AddItemEx( iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9], iteminfo[10][1], iteminfo[10][2], iteminfo[10][3], iteminfo[10][4], iteminfo[10][5], iteminfo[10][6] );
	else
		nItemIdx = AddItemEx( iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9], 0 );
	end
	if( nItemIdx > 0 ) then
		WriteCompoundLog( format( "DES_RANDSEED:\t%0.0f\tDES_GEN_TIME:\t%0.0f\r\n", ITEM_GetItemRandSeed( nItemIdx ), GetItemGenTime( nItemIdx ) ) );
	else
		WriteCompoundLog( format( "ADD_ITEM_BY_INFO FAILED:\t{%d,%d,%d,%d,%d,%d,%d,%d,%d}\r\n", iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9] ) );
	end
	return nItemIdx;
end

-- 写[合成]日志
function writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, desItemInfo, dDesItemVal, dDesProb )
	local arystrSrc = { "", "" };
	local arynItemIdx = { arynNecessaryItemIdx, arynAlternativeItemIdx };
	for i = 1, 2 do
		for j = 1, getn( arynItemIdx[i] ) do
			local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynItemIdx[i][j] );
			local nQuality = GetItemQuality( arynItemIdx[i][j] );
			local arynMagLvl = GetItemAllParams( arynItemIdx[i][j] );
			local nStackCount = GetItemStackCount( arynItemIdx[i][j] );
			arystrSrc[i] = arystrSrc[i]..format( "{%d, %d, %d, %d, %d, %d, %d, <%d, %d, %d, %d, %d, %d>}#%d\t", nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, arynMagLvl[1], arynMagLvl[2], arynMagLvl[3], arynMagLvl[4], arynMagLvl[5], arynMagLvl[6], nStackCount );
		end
	end
	local strDes = "";
	local strResult = "";
	if( desItemInfo ~= nil ) then
		strResult = "SUCCEED";
		if( desItemInfo[10] ~= nil ) then
			strDes = format( "{%d,%d,%d,%d,%d,%d,%d,<%d,%d,%d,%d,%d,%d>}", desItemInfo[3], desItemInfo[4], desItemInfo[5], desItemInfo[6], desItemInfo[7], desItemInfo[8], desItemInfo[9], desItemInfo[10][1], desItemInfo[10][2], desItemInfo[10][3], desItemInfo[10][4], desItemInfo[10][5], desItemInfo[10][6] );
		else
			strDes = format( "{%d,%d,%d,%d,%d,%d,%d,<%d,%d,%d,%d,%d,%d>}", desItemInfo[3], desItemInfo[4], desItemInfo[5], desItemInfo[6], desItemInfo[7], desItemInfo[8], desItemInfo[9], 0, 0, 0, 0, 0, 0 );
		end
	else
		strResult = "FAIL";
		strDes = "NONE";
	end
	WriteCompoundLog( format( "[%s]\t%s\t%s(%s)", getCompoundParam(), strResult, GetAccount( PlayerIndex ), GetName( PlayerIndex ) ) );
	WriteCompoundLog( format( "SRC:\t%s", arystrSrc[1] ) );
	WriteCompoundLog( format( "SRC_EX:\t%s", arystrSrc[2] ) );
	WriteCompoundLog( format( "DES:\t%s", strDes ) );
	WriteCompoundLog( format( "SRC_VAL_SUM:\t%0.0f\tDES_VAL:\t%0.0f\tDES_PROB:\t%0.2f%%", nSrcItemValSum, dDesItemVal, dDesProb*100 ) );
end

-- 判断是否可以进行[合成]，即还没到达当日[合成]价值总量上限
function isCompoundableToday()
	local nLastDate = GetGlbValue( GLBID_LAST_CMP_DATE );
	local nTodayString = tonumber( date( "%y%m%d" ) );
	if( nLastDate ~= nTodayString ) then
		SetGlbValue( GLBID_LAST_CMP_DATE, nTodayString );
		SetGlbValue( GLBID_COMMON_VAL_SUM, 0 );
		SetGlbValue( GLBID_GOLD_VAL_SUM, 0 );
	else
		local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
		local nGoldEqVal = GetGlbValue( GLBID_GOLD_VAL_SUM );
		if( nCommonItemVal >= COMMON_SUM_MAX_VAL or nGoldEqVal >= GOLD_SUM_MAX_VAL ) then
			return 0;
		end
	end
	return 1;
end

-- 计算可选物品的受[合成]关键物品限制加权后的价值量
function calcAltItemFinalVal( nMainItemValSum, nAltItemValSum )
	local dAltItemFinalVal = 0;
	local arySegmentScale = { { 0, 1 }, { 0.5, 0.9 }, { 1, 0.8 }, { 1.5, 0.7 }, { 2, 0.6 } };
	local nSegmentCount = getn( arySegmentScale );
	for i = nSegmentCount, 1, -1 do
		local nSegmentDiff = nAltItemValSum - nMainItemValSum * arySegmentScale[i][1];
		if( nSegmentDiff > 0 ) then
			dAltItemFinalVal = dAltItemFinalVal + nSegmentDiff * arySegmentScale[i][2];
			nAltItemValSum = nAltItemValSum - nSegmentDiff;
		end
	end
	return dAltItemFinalVal;
end

function funitem_calcItemValue(aryDesItemInfo)
	return ITEM_CalcItemValue(aryDesItemInfo[1], aryDesItemInfo[3], aryDesItemInfo[4], aryDesItemInfo[5], aryDesItemInfo[6], aryDesItemInfo[7], aryDesItemInfo[8], aryDesItemInfo[9], aryDesItemInfo[10], aryDesItemInfo[11])
end