--幸运礼包
--by 小浪多多
--2007.04.13

TB_LIBAO = 
{
	1000000,--总概率
	{0.00125,	{"九尾白狐装",					0,2,9,10,2,}}, --九尾白狐裘[水属性]
	{0.00125,	{"九尾白狐装",					0,2,9,10,3,}}, --九尾白狐裘[火属性]
	{0.00125,	{"璇龙袍",							0,2,6,10,2,}}, --璇龙袍[水属性]
	{0.00125,	{"璇龙袍",							0,2,6,10,3,}}, --璇龙袍[火属性]
	{0.00125,	{"天蚕腰带",						0,6,0,10,2,}}, --天蚕腰带[水属性]
	{0.00125,	{"天蚕腰带",						0,6,0,10,3,}}, --天蚕腰带[火属性]
	{0.00125,	{"白金腰带",						0,6,1,10,2,}}, --白金腰带[水属性]
	{0.00125,	{"白金腰带",						0,6,1,10,3,}}, --白金腰带[火属性]
	{0.15,		{"仙草露",							6,1,71,1,}},	 --仙草露
	{0.1796,	{"桂花酒",							6,1,125,1,}},	 --桂花酒
	{0.0001,	{"安邦冰晶石项链",		0,164,}},			 --安邦 – 冰晶石项链
	{0.0001,	{"安邦菊花石戒指",		0,165,}}, 		 --安邦 – 菊花石戒指
	{0.0001,	{"安邦鸡血石戒指",		0,167,}},			 --安邦 – 鸡血石戒指
	{0.0001,	{"安邦田黄石玉佩",		0,166,}}, 		 --安邦 – 田黄石玉佩
	{0.0004,	{"定国钨砂发冠",			0,160,}}, 		 --定国 – 钨砂发冠
	{0.0004,	{"定国青纱长衫",			0,159,}}, 		 --定国 – 青纱长衫
	{0.0004,	{"定国青纱长衫",			0,162,}},			 --定国 – 紫藤护腕
	{0.0004,	{"定国银蚕腰带",			0,163,}},			 --定国 – 银蚕腰带
	{0.0004,	{"定国赤绢软靴",			0,161,}},			 --定国 – 赤绢软靴
	{0.0002,	{"照夜玉狮子",					0,10,5,10,}},	 --照夜玉狮子80级马
	{0.0002,	{"赤兔",								0,10,5,2,}},	 --赤兔80级马
	{0.0002,	{"武林密籍",						6,1,26,1,}},	 --武林密籍
	{0.0002,	{"洗髓经",							6,1,22,1,}},	 --洗髓经
	{0.65,		{"战功花",							6,1,1414,1,}}	 --战功花
}

function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070513) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("50级以上已充值玩家才能使用.");
		return 1;
	end;
	if ( CalcFreeItemCellCount() < 12 ) then
		Say("请重新安排装备确保有12个空位.",0);
	return 1;
	end
	local SumPe =  TB_LIBAO[1];
	local Rand = random(1,SumPe);
	local Sum = 0;
	for i=2,getn(TB_LIBAO) do
		local pnum = TB_LIBAO[i][1];
		local item = TB_LIBAO[i][2];
		Sum = Sum + pnum * SumPe;
		if Rand < Sum then
			award_item(item);
			break;
		end
	end
end

function award_item(item)
	local nidx ;
	if getn(item) == 3 then
		nidx = AddGoldItem(item[2], item[3]);
	elseif getn(item) == 5 then
		nidx = AddItem(item[2], item[3], item[4], item[5],0,0);
	elseif getn(item) == 6 then
		nidx = AddQualityItem(2,item[2], item[3], item[4], item[5],item[6],255,-1,-1,-1,-1,-1,-1)
	end
	Msg2Player("您获得一个"..item[1]);
	WriteLog(format("[xingyunlibao]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));

end