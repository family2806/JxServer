-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南板 - 天赐宝箱
-- 文件名　：tianci_baoxiang.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-21 14:38:37

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")

local tbItem = 
{
	{szName="雄", tbProp={6, 1, 2062, 1, 0, 0}, nRate = 25, nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="霸", tbProp={6, 1, 2063, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="天", tbProp={6, 1, 2064, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="下", tbProp={6, 1, 2065, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
}

function main(nItemIndex)
		
	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "该物品已过期")
		return 0
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1,"", format("装备空位不足%d 空位，请重新安排一下.", 1))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbItem, "use "..GetItemName(nItemIndex));
	
end

function IsPickable(nItemIndex)
	
	local nExpiredTime = tbBirthday0905.tbTask.item_expiredtime1;
	if tonumber(GetLocalDate("%Y%m%d")) >= nExpiredTime then
		Msg2Player("该物品已过期");
		return 0
	end
	
	if ITEM_GetExpiredTime(nItemIndex) == 0 then
		tbAwardTemplet:ITEM_SetExpiredTime(nItemIndex, nExpiredTime);
	end
	
	return 1
end