
Include("\\script\\lib\\string.lua")

function GetDesc(nItem)
	local series = GetItemSeries(nItem)
	return "<color=blue>���������ʯ������ȡ"..toSeries(series).."<color=blue>ϵ��ɫװ���ϵ��ĸ�λ���ϵ�<color=dblue>������<color>"
end

function main(nItem)
	return 1
end
