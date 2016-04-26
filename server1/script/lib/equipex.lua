
-- ====================== 文件信息 ======================

-- 剑侠情缘online 世界杯活动实体处理文件
-- Edited by peres
-- 2006/05/31 PM 16:13

-- 凌晨五点，感觉身边躺着的女孩要起身离开。
-- 长长发辫扫过，身上裙褶发出簌簌响声。
-- 从皮肤散发出来的温热如小兽的气息，依旧熟悉。
-- 他惊醒过来，看到她背靠着墙坐在床的里边，静静对着洒进来的月光抽一枝烟。
-- 看着他，轻声微笑，
-- 说，我在这里。
-- 我还未走。

-- ======================================================

-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_debug.lua");

IncludeLib("ITEM");

-- 产生一件与传入的 Index 的 nMagicType 类似的黄金装备
-- 传入参数
-- nIndex: 原始装备的 Index
-- nNeedGold: 想要生成的黄金装备索引
-- nMagicType: 想要固定的装备魔法属性类型
-- nCount: 计算的次数
-- 返回值
-- int: 非零则为在服务器中产生装备的序号，0 则为失败
-- ary: 返回所产生的所有装备的 Index 数组
function createLikeEquip(nIndex, nNeedGold, nNeedMagicType, nCount)
	local nGoldIndex = 0;
	local nCreateIndex = 0;
	
	local nMagicIndex = 0;
	local nNeedValue = 0;
	
	local aryIndex = {};
	
	local nMagicType, nP1, nP2, nP3
	local i=0;
	
	if nIndex<1 or nIndex==nil then
		return 0;
	end;
	
	CDebug:MessageOut("开始产生临时装备！");
	
	nGoldIndex = GetGlodEqIndex(nIndex);

	CDebug:MessageOut("获取到传入的黄金装备序号为："..nGoldIndex);
	
	-- 获取指定魔法属性的值
	for i=1, 6 do
		nMagicType, nP1, nP2, nP3 = GetItemMagicAttrib(nIndex, i);
		if nMagicType==nNeedMagicType then
			nMagicIndex = i;
			nNeedValue = nP1;
			CDebug:MessageOut("获取到指定的属性位置在："..i.."  数值为："..nNeedValue);
		end;
	end;
	
	if nNeedValue==0 then
		return 0;
	end;

	--  // 功能：增加指定详细信息的物品到游戏世界 // 
	-- // 格式：NewItemEx( nVersion, uRandSeed, nQuality, nItemClass, nDetailType, nParticualrType, nLevel, nSeries, nLuck, nItemLevel..6 ) 
	--// 返回：nItemIdx // Fanghao_Wu 2006.06.01 //--
	for i=1, nCount do
		
		nCreateIndex = NewItemEx(4, 0, 1, 0, nNeedGold - 1, 0, 0, 0, 0, 0);
		nMagicType, nP1, nP2, nP3 = GetItemMagicAttrib(nCreateIndex, nMagicIndex);
		
		CDebug:MessageOut("产生了物品序号："..nCreateIndex.." 魔法属性为："..nP1);
		
		tinsert(aryIndex, nCreateIndex);
		
			if nMagicType==nNeedMagicType and nP1==nNeedValue then
				CDebug:MessageOut("与指定的属性相等："..nCreateIndex);
				return nCreateIndex, aryIndex;
			end;
	end;
	
	return 0, aryIndex;
end;