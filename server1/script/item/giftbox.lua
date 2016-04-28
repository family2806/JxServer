--ÀñÆ·ºÐ
--2007-04-04
--by Ð¡ÀË¶à¶à

TB_GIFT = {
	--ÎïÆ·Ãû ¸ÅÂÊ				ÎïÆ·ID
	100000, -- ×Ü¸ÅÂÊ
	{0.25,		{"ThiÕt La H¸n",	6,1,23,0,0,0}},
	{0.25,		{"Phóc Duyªn Lé (§¹i) ",	6,1,124,0,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	6,1,2280,1,0,0}},
	{0.02,	{"§Þnh Quèc Ng©n Tµm Yªu ®¸i",	6,1,2311,1,0,0}},
	{0.2,			{"§¹i bæ thÇn ®an",	6,1,1398,0,0,0	}},
	{0.1,		{"ThËp toµn ®¹i bæ thÇn ®an",	6,1,1399,0,0,0}},
	{0.0288,		{"Tiªn Th¶o Lé ",6,1,71,0,0,0}},
}
function main(sel)
	if CalcFreeItemCellCount() < 12 then
		Say("Hµnh trang ®¹i hiÖp nhiÒu qu¸, cã kh¶ n¨ng sÏ nhËn ®­îc trang bÞ chiÕm nhiÒu «. H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 12 « trèng råi h·y më.",0);
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