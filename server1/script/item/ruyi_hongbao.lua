--�Զ����Ǯ�����ĺ��
IncludeLib("ITEM")

function main(nItemIdx)		
	local nMoney = GetItemParam(nItemIdx, 1)
	Earn(nMoney)
	Msg2Player("�������"..nMoney.."������")
end

function GetDesc(nItemIdx)
	local nM1 = GetItemParam(nItemIdx, 2)
	local nM2 = GetItemParam(nItemIdx, 3)
	local nM3 = GetItemParam(nItemIdx, 4)
	local nMoney = nM1 * 1000000 + nM2 * 1000 + nM3
	--local szDesc = ""
	
	local szDesc = "\n����а���������<color=yellow>"..nMoney.."<color=>��"
	return szDesc;
end


