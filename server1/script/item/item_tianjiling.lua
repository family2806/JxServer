Include("\\script\\lib\\gb_modulefuncs.lua")
IncludeLib("LEAGUE")
MAX_TJL_USE_COUNT = 5
str_endmsg = "你使用的天机令已经达到使用上限"..MAX_TJL_USE_COUNT.."次，因此从背包中去除！";

function main(nItem)
	local nUsedCount = GetItemParam(nItem, 1);

	Msg2Player("你使用了天机令！在一小时内你可获知所在地图所有贵重物品的拾取信息.")
	AddSkillState(707, 1, 1, 18*60*60);

	nUsedCount = nUsedCount + 1
	if (nUsedCount >= MAX_TJL_USE_COUNT) then
		Msg2Player(str_endmsg)
		return 0
	else
		SetItemMagicLevel(nItem, 1, nUsedCount)
	end
	SyncItem(nItem)
	return 1
end

function GetDesc(nItem)
	local nUsedCount = GetItemParam(nItem, 1);
	return "剩余使用次数:" ..(MAX_TJL_USE_COUNT - nUsedCount).." / "..MAX_TJL_USE_COUNT
end