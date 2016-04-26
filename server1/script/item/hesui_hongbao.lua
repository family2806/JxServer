--自定义铜钱数量的红包
IncludeLib("ITEM")

function main(nItemIdx)		
	local nMoney = GetItemParam(nItemIdx,1)
	AddStackItem(nMoney,4,417,1,1,0,0,0)
	Msg2Player("您获得了"..nMoney.."枚铜钱")
end

function GetDesc(nItemIdx)
	local nMoney = GetItemParam(nItemIdx, 1)
	--local szDesc = ""
	local szDesc = "\n红包中包含了铜钱<color=yellow>"..nMoney.."<color=>枚"
	return szDesc;
end