--礼品盒
--2007-04-04
--by 小浪多多

TB_GIFT = {
	--物品名 概率				物品ID
	100000, -- 总概率
	{0.25,		{"铁罗汉",	6,1,23,0,0,0}},
	{0.25,		{"福缘露(大) ",	6,1,124,0,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"精炼石",	6,1,2280,1,0,0}},
	{0.02,	{"玉罐",	6,1,2311,1,0,0}},
	{0.2,			{"大补神丹",	6,1,1398,0,0,0	}},
	{0.1,		{"十全大补神丹",	6,1,1399,0,0,0}},
	{0.0288,		{"仙草露",6,1,71,0,0,0}},
}
function main(sel)
	if CalcFreeItemCellCount() < 12 then
		Say("大侠的装备太多了，可能会获得占很多空位的装备，请去除物品，确保有12个空位后打开",0);
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