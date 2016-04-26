-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 挑战礼包
-- 文件名　：tiaozhan_libao.lua
-- 创建者　：子非魚
-- 创建时间：2009-04-26 13:16:50

-- ======================================================

Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");

function main(nItemIdx)
--	local n_level = GetLevel();
--	if (n_level < 50 or IsCharged() ~= 1) then
--		Say("只有50级以上已充值玩家才能使用.", 0)
--		return 1;
--	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say(format("为避免失去财产，请确保装备还够 %d 空位.", 20), 0);
		return 1;
	end
	tbItem = { tbProp = {6,1,1499,1,1,0}, nCount = 20};
	tbAwardTemplet:GiveAwardByList(tbItem, "挑战礼包")
end

