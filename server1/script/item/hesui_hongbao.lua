--�Զ���ͭǮ�����ĺ��
IncludeLib("ITEM")

function main(nItemIdx)		
	local nMoney = GetItemParam(nItemIdx,1)
	AddStackItem(nMoney,4,417,1,1,0,0,0)
	Msg2Player("�������"..nMoney.."öͭǮ")
end

function GetDesc(nItemIdx)
	local nMoney = GetItemParam(nItemIdx, 1)
	--local szDesc = ""
	local szDesc = "\n����а�����ͭǮ<color=yellow>"..nMoney.."<color=>ö"
	return szDesc;
end