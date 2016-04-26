
Include("\\script\\lib\\string.lua")

function GetDesc(nItem)
	local series = GetItemSeries(nItem)
	return "<color=blue>配合玄晶矿石可以提取"..toSeries(series).."<color=blue>系蓝色装备上第四个位置上的<color=dblue>暗属性<color>"
end

function main(nItem)
	return 1
end
