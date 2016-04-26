Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_strawberry_award	=
{
	{szName="3级玄晶矿石", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 3},
	{szName="4级玄晶矿石", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 2},
	{szName="5级玄晶矿石", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 0.8},
	{szName="寒铁荣誉令牌", 	tbProp={6, 1, 1257, 1, 0, 0},	nRate = 5},
	{szName="青铜荣誉令牌",	tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 2},
	{szName="白银荣誉令牌",	tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 0.8},
	{szName="黄金荣誉令牌", 	tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.05},
	{szName="武林秘籍", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.05},
	{szName="洗髓经", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.05},
	{szName="盘若心经", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="铁罗汉", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 2},
	{szName="神秘大红包", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 6},
	{szName="定国钨砂发冠", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="定国青纱长衫", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="定国银蚕腰带", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="定国赤绢软靴",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="定国紫藤护腕", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="1名望", 			nRepute = 1, 		nRate = 30},
	{szName="2 名望", 			nRepute = 2, 		nRate = 25},
	{szName="3 名望", 			nRepute = 3, 		nRate = 19},
	{szName="10 名望",			nRepute = 10, 		nRate = 2.494},
	{szName="50 名望",		 	nRepute = 50, 		nRate = 0.5},
};

function main(nItemIndex)
	christmas_resettask();
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "该物品已过期")
		return 0
	end
	if (CalcFreeItemCellCount() < 20) then
		Say("大侠的装备已满!", 0);
		return 1;
	end
	
	if (50 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 50 + GetTask(christmas_getexp_taskid));
		AddOwnExp(500000);
		tbAwardTemplet:GiveAwardByList(tb_strawberry_award, "2008圣诞活动-蛋糕");	
	else
		Say("大侠已获得最高经验，所以不能再使用蛋糕了.", 0);
		return 1;
	end
end