--��Ʒ��
--2007-04-04
--by С�˶��

TB_GIFT = {
	--��Ʒ�� ����				��ƷID
	100000, -- �ܸ���
	{0.25,		{"Thi�t La H�n",	6,1,23,0,0,0}},
	{0.25,		{"Ph�c Duy�n L� (��i) ",	6,1,124,0,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	6,1,2280,1,0,0}},
	{0.02,	{"��nh Qu�c Ng�n T�m Y�u ��i",	6,1,2311,1,0,0}},
	{0.2,			{"��i b� th�n �an",	6,1,1398,0,0,0	}},
	{0.1,		{"Th�p to�n ��i b� th�n �an",	6,1,1399,0,0,0}},
	{0.0288,		{"Ti�n Th�o L� ",6,1,71,0,0,0}},
}
function main(sel)
	if CalcFreeItemCellCount() < 12 then
		Say("H�nh trang ��i hi�p nhi�u qu�, c� kh� n�ng s� nh�n ���c trang b� chi�m nhi�u �. H�y c�t b�t v�t ph�m �� ��m b�o c� 12 � tr�ng r�i h�y m�.",0);
		return 1;
	end
	local prob = TB_GIFT[1];
	local sum = 0;
	local num = random(1,prob);
	--print(num.."\t"..getn(TB_GIFT).."\t")
	for i = 2,getn(TB_GIFT) do
		local odds = TB_GIFT[i][1];
		local item = TB_GIFT[i][2];
		sum = sum + odds * prob;
		if num < sum then
			--print(item[1]);
			award_item(item);
			break;
		end
	end
end

function award_item(item)
	if getn(item) == 3 then
		AddGoldItem(item[2], item[3]);
	elseif getn(item) == 7 then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	WriteLog(format("[chuanguanGiftBox]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));
end