Include("\\script\\lib\\string.lua")

function GetDesc(nItem)
	local _, _, _, _, series = GetItemProp(nItem)
	return "<color=blue>���������ʯ������ȡ"..toSeries(series).."<color=blue>ϵ��ɫװ���ϵڶ���λ���ϵ�<color=dblue>������<color>"
end

function main(nItem)
	return 1
end
