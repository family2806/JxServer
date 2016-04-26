Include("\\script\\lib\\award.lua")
--award_give
function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70331) then
		Msg2Player("宝箱已生锈，不能使用了.");
		return 0;
	end;
	
	local tb_goldenbox = {
						{1,	{6,1,124,1,0,0,0},	1,	23860,	"福缘露(大) ", 0},
						{1,	{6,1,71,1,0,0},	1,	17010,	"仙草露", 0},
						{1,	{6,1,26,1,0,0,0},	1,	100,	"武林秘籍", 0},
						{1,	{6,1,22,1,0,0,0},	1,	100,	"洗髓经", 0},
						{1,	{6,1,147,1,0,0},	1,	38590,	"1级玄晶矿石", 0},
						{1,	{6,1,147,2,0,0},	1,	12280,	"2级玄晶矿石", 0},
						{1,	{6,1,147,3,0,0},	1,	2150,	"3级玄晶矿石", 0},
						{1,	{4,353,1,1,0,0},	1,	2830,	"晶红宝石", 0},
						{1,	{4,238,1,1,0,0},	1,	2830,	"蓝水晶", 0},
						{2,	{0,159},	1,	50,	"定国青纱长衫", 1},
						{2,	{0,160},	1,	50,	"定国钨砂发冠", 1},
						{2,	{0,161},	1,	50,	"定国赤绢软靴", 1},
						{2,	{0,162},	1,	50,	"定国紫藤护腕", 1},
						{2,	{0,163},	1,	50,	"定国银蚕腰带", 1},
		};
	local sum = 0;
	local nrand = random(100000);
	local strInfo=format("%s\t%s\tName:%s\tAccount:%s\t", 
								"神秘卷轴收集活动", 
								GetLocalDate("%Y-%m-%d %H:%M"),
								GetName(), GetAccount());	
	for i = 1, getn(tb_goldenbox) do
		sum = sum + tb_goldenbox[i][4]
		if (sum >= nrand) then
			award_give(tb_goldenbox[i]);
			Msg2Player(format("恭喜您获得- %s",tb_goldenbox[i][5]));
			WriteLog(strInfo..format("打开箱子获得%s", tb_goldenbox[i][5]));
			if (tb_goldenbox[i][6] == 1) then
				AddGlobalNews(format("%s 已参加神秘卷轴活动饼获得一套黄金装备!", GetName()));
			end;
			return 0;
		end;
	end;
	return 1;
end;
