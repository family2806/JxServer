Include("\\script\\lib\\string.lua")

function GetDesc(nItem)
	local _, _, _, _, series = GetItemProp(nItem)
	return "<color=blue>配合玄晶矿石可以提取"..toSeries(series).."<color=blue>系蓝色装备上第一个位置上的明属性<color>"
end

function main(nItem)
	return 1
end
