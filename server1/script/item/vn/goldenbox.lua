Include("\\script\\lib\\award.lua")
--award_give
function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70331) then
		Msg2Player("宝箱已生锈，不能使用了.");
		return 0;
	end;
	
	local tb_goldenbox = {
								{1,	{6,1,124,1,0,0,0},	1,	38340,	"福缘露(大) ", 0},
								{1,	{4,353,1,1,0,0},	1,	18320,	"晶红宝石", 0},
								{1,	{6,1,71,1,0,0},	1,	17200,	"仙草露", 0},
								{1,	{4,238,1,1,0,0},	1,	15320,	"蓝水晶", 0},
								{1,	{6,1,147,3,0,0},	1,	10320,	"3级玄晶矿石", 0},
								{1,	{6,1,26,1,0,0,0},	1,	100,	"武林秘籍", 0},
								{1,	{6,1,22,1,0,0,0},	1,	100,	"洗髓经", 0},
								{1,	{6,1,147,4,0,0},	1,	100,	"4级玄晶矿石", 0},
								{2,	{0,164},	1,	20,	"安邦冰晶石项链", 1},
								{2,	{0,165},	1,	20,	"安邦菊花石指环", 1},
								{2,	{0,166},	1,	20,	"安邦田黄石玉佩", 1},
								{2,	{0,167},	1,	20,	"安邦鸡血石戒指", 1},
								{1,	{6,1,147,5,0,0},	1,	20,	"5级玄晶矿石", 0},
								{2,	{0,159},	1,	20,	"定国青纱长衫", 1},
								{2,	{0,160},	1,	20,	"定国钨砂发冠", 1},
								{2,	{0,161},	1,	20,	"定国赤绢软靴", 1},
								{2,	{0,162},	1,	20,	"定国紫藤护腕", 1},
								{2,	{0,163},	1,	20,	"定国银蚕腰带", 1},
		};
	local sum = 0;
	local nrand = random(100000);
	local strInfo=format("%s\t%s\tName:%s\tAccount:%s\t", 
								"秘图碎片收集活动", 
								GetLocalDate("%Y-%m-%d %H:%M"),
								GetName(), GetAccount());
	for i = 1, getn(tb_goldenbox) do
		sum = sum + tb_goldenbox[i][4]
		if (sum >= nrand) then
			award_give(tb_goldenbox[i]);
			Msg2Player(format("恭喜您获得- %s",tb_goldenbox[i][5]));
			WriteLog(strInfo..format("打开金箱活动 %s", tb_goldenbox[i][5]));
			if (tb_goldenbox[i][6] == 1) then
				AddGlobalNews(format("%s 已参加神秘卷轴收集活动!", GetName()));
			end;
			return 0;
		end;
	end;
	return 1;
end;
