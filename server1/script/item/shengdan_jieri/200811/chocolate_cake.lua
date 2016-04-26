Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_chocolate_award	=
{
	{szName="1 名望", 			nRepute = 1, 		nRate = 9.8545},
	{szName="2 名望", 			nRepute = 2, 		nRate = 23},
	{szName="3 名望", 			nRepute = 3, 		nRate = 25},
	{szName="10 名望",			nRepute = 10, 		nRate = 8},
	{szName="50 名望",		 	nRepute = 50, 		nRate = 1},
	{szName="定国钨砂发冠", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="定国青纱长衫", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.02},
	{szName="定国银蚕腰带", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="定国赤绢软靴",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="定国紫藤护腕", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="安邦冰晶石项链",	tbProp={0, 164},	nQuality = 1,	nRate = 0.005},
	{szName="安邦鸡血石戒指",	tbProp={0, 167},	nQuality = 1,	nRate = 0.015},
	{szName="安邦菊花石指环",	tbProp={0, 165},	nQuality = 1,	nRate = 0.015},
	{szName="安邦田黄石玉佩",	tbProp={0, 166},	nQuality = 1,	nRate = 0.02},
	{szName="洞察翡翠玉项圈",	tbProp={0, 146},	nQuality = 1,	nRate = 0.007},
	{szName="洞察白金秀凤戒",	tbProp={0, 145},	nQuality = 1,	nRate = 0.007},
	{szName="洞察白金雕龙戒",	tbProp={0, 143},	nQuality = 1,	nRate = 0.007},
	{szName="洞察白玉乾坤佩",	tbProp={0, 144},	nQuality = 1,	nRate = 0.007},
	{szName="6就玄晶矿石",					tbProp={6, 1, 147, 6, 0, 0},	nRate = 1},
	{szName="7就玄晶矿石",					tbProp={6, 1, 147, 7, 0, 0},	nRate = 0.2},
	{szName="8就玄晶矿石",					tbProp={6, 1, 147, 8, 0, 0},	nRate = 0.05},
	{szName="小冰晶",						tbProp={6, 1, 1850, 1, 0, 0},	nRate = 0.07,	nExpiredTime = 20090111},
	{szName="神秘矿石",						tbProp={6, 1, 398, 1, 0, 0},	nRate = 0.002},
	{szName="白色蜡烛",						tbProp={6, 1, 1851, 1, 0, 0},	nRate = 6,	nExpiredTime = 20090111},
	{szName="绿色蜡烛",						tbProp={6, 1, 1852, 1, 0, 0},	nRate = 3,	nExpiredTime = 20090111},
	{szName="大眼神锤碎片(1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="大眼神锤碎片 (3/9) /9)",	tbProp={4, 596, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="大眼神锤碎片 (5/9) /9)",	tbProp={4, 598, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="大眼神锤碎片 (6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="大眼神锤碎片 (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="冰寒弹指飞刀碎片 (2/9)",		tbProp={4, 981, 1, 1, 0, 0},	nRate = 0.005},
	{szName="冰寒弹指飞刀碎片 (3/9)",		tbProp={4, 982, 1, 1, 0, 0},	nRate = 0.005},
	{szName="冰寒弹指飞刀碎片 (4/9)",		tbProp={4, 983, 1, 1, 0, 0},	nRate = 0.005},
	{szName="冰寒弹指飞刀碎片 (7/9)",		tbProp={4, 986, 1, 1, 0, 0},	nRate = 0.005},
	{szName="冰寒弹指飞刀碎片 (9/9)",		tbProp={4, 988, 1, 1, 0, 0},	nRate = 0.005},
	{szName="四空降魔戒刀碎片(1/9) /9)",		tbProp={4, 585, 1, 1, 0, 0},	nRate = 0.005},
	{szName="四空降魔戒刀碎片 (4/9) /9)",		tbProp={4, 588, 1, 1, 0, 0},	nRate = 0.005},
	{szName="四空降魔戒刀碎片 (6/9) /9)",		tbProp={4, 590, 1, 1, 0, 0},	nRate = 0.005},
	{szName="四空降魔戒刀碎片 (8/9) /9)",		tbProp={4, 592, 1, 1, 0, 0},	nRate = 0.005},
	{szName="四空降魔戒刀碎片(9/9) /9)",		tbProp={4, 593, 1, 1, 0, 0},	nRate = 0.005},
	{szName="幽冥枪碎片 (2/9) /9)",	tbProp={4, 685, 1, 1, 0, 0},	nRate = 0.008},
	{szName="幽冥枪碎片 (3/9) /9)",	tbProp={4, 686, 1, 1, 0, 0},	nRate = 0.008},
	{szName="幽冥枪碎片(5/9) /9)",	tbProp={4, 688, 1, 1, 0, 0},	nRate = 0.008},
	{szName="幽冥枪碎片 (6/9) /9)",	tbProp={4, 689, 1, 1, 0, 0},	nRate = 0.008},
	{szName="幽冥枪碎片 (9/9) /9)",	tbProp={4, 692, 1, 1, 0, 0},	nRate = 0.008},
	{szName="千年寒铁碎片 (3/9) /9)",		tbProp={4, 704, 1, 1, 0, 0},	nRate = 0.004},
	{szName="千年寒铁碎片 (4/9) /9)",		tbProp={4, 705, 1, 1, 0, 0},	nRate = 0.004},
	{szName="千年寒铁碎片 (5/9) /9)",		tbProp={4, 706, 1, 1, 0, 0},	nRate = 0.004},
	{szName="千年寒铁碎片 (7/9) /9)",		tbProp={4, 708, 1, 1, 0, 0},	nRate = 0.004},
	{szName="千年寒铁碎片 (9/9) /9)",		tbProp={4, 710, 1, 1, 0, 0},	nRate = 0.004},
	{szName="洗象玉扣碎片 (2/6) /6)",		tbProp={4, 802, 1, 1, 0, 0},	nRate = 0.005},
	{szName="洗象玉扣碎片 (4/6) /6)",		tbProp={4, 804, 1, 1, 0, 0},	nRate = 0.005},
	{szName="洗象玉扣碎片 (5/6) /6)",		tbProp={4, 805, 1, 1, 0, 0},	nRate = 0.005},
	{szName="洗象玉扣碎片 (6/6) /6)",		tbProp={4, 806, 1, 1, 0, 0},	nRate = 0.005},
	{szName="栖凰凤仪刀碎片 (1/9) /9)",		tbProp={4, 630, 1, 1, 0, 0},	nRate = 0.01},
	{szName="栖凰凤仪刀碎片(3/9) /9)",		tbProp={4, 632, 1, 1, 0, 0},	nRate = 0.01},
	{szName="栖凰凤仪刀碎片 (4/9) /9)",		tbProp={4, 633, 1, 1, 0, 0},	nRate = 0.01},
	{szName="栖凰凤仪刀碎片 (6/9) /9)",		tbProp={4, 635, 1, 1, 0, 0},	nRate = 0.01},
	{szName="幽胧金蛇发带碎片  (2/6) /6)",		tbProp={4, 826, 1, 1, 0, 0},	nRate = 0.007},
	{szName="幽胧金蛇发带碎片 (3/6) /6)",		tbProp={4, 827, 1, 1, 0, 0},	nRate = 0.007},
	{szName="幽胧金蛇发带碎片 (4/6) /6)",		tbProp={4, 828, 1, 1, 0, 0},	nRate = 0.007},
	{szName="幽胧金蛇发带碎片 (6/6) /6)",		tbProp={4, 830, 1, 1, 0, 0},	nRate = 0.007},
	{szName="同仇抗龙护腕碎片(1/6) /6)",		tbProp={4, 855, 1, 1, 0, 0},	nRate = 0.003},
	{szName="同仇抗龙护腕碎片 (2/6) /6)",		tbProp={4, 856, 1, 1, 0, 0},	nRate = 0.003},
	{szName="同仇抗龙护腕碎片 (3/6) /6)",		tbProp={4, 857, 1, 1, 0, 0},	nRate = 0.003},
	{szName="同仇抗龙护腕碎片 (5/6) /6)",		tbProp={4, 859, 1, 1, 0, 0},	nRate = 0.003},
	{szName="御龙天门束腰环碎片(1/6)",	tbProp={4, 1152, 1, 1, 0, 0},	nRate = 0.007},
	{szName="御龙天门束腰环碎片(3/6)",	tbProp={4, 1154, 1, 1, 0, 0},	nRate = 0.007},
	{szName="御龙天门束腰环碎片 (5/6)",	tbProp={4, 1156, 1, 1, 0, 0},	nRate = 0.007},
	{szName="御龙天门束腰环碎片 (6/6)",	tbProp={4, 1157, 1, 1, 0, 0},	nRate = 0.007},
	{szName="凌岳无极玄玉佩碎片 (1/6) /6)",	tbProp={4, 879, 1, 1, 0, 0},	nRate = 0.003},
	{szName="凌岳无极玄玉佩碎片 (2/6) /6)",	tbProp={4, 880, 1, 1, 0, 0},	nRate = 0.003},
	{szName="凌岳无极玄玉佩碎片(4/6) /6)",	tbProp={4, 882, 1, 1, 0, 0},	nRate = 0.003},
	{szName="寒铁荣誉令牌", 				tbProp={6, 1, 1257, 1, 0, 0},	nRate = 10},
	{szName="青铜荣誉令牌",				tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 1},
	{szName="白银荣誉令牌",				tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 1},
	{szName="黄金荣誉令牌", 				tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.02},
	{szName="武林秘籍h", 					tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="洗髓经", 						tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="盘若心经", 					tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 2},
	{szName="铁罗汉", 						tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 5},
	{szName="神秘大红包", 					tbProp={6, 1, 402,1, 0, 0}, 	nRate = 3},

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
	if (100 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 100 + GetTask(christmas_getexp_taskid));
		AddOwnExp(1000000);
		tbAwardTemplet:GiveAwardByList(tb_chocolate_award, "Ho箃 ng gi竛g sinh 2008_B竛h Kem Socola");
	else
		Say("大侠已到达最高经验上限，不能继续使用蛋糕了.", 0);
		return 1;
	end
end