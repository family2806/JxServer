Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_facaihongbao_award	=
{
	{szName="1 名望", 			nRepute = 1, 		nRate = 1},
	{szName="2 名望", 			nRepute = 2, 		nRate = 2},
	{szName="3 名望", 			nRepute = 3, 		nRate = 3},
	{szName="10 名望",			nRepute = 10, 		nRate = 3.07},
	{szName="50 名望",		 	nRepute = 50, 		nRate = 1},
	{szName="定国钨砂发冠", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.2},
	{szName="定国青纱长衫", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.5},
	{szName="定国银蚕腰带", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 1},
	{szName="定国赤绢软靴",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.8},
	{szName="定国紫藤护腕", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 1.5},
	{szName="安邦冰晶石项链",	tbProp={0, 164},	nQuality = 1,	nRate = 0.03},
	{szName="安邦鸡血石戒指",	tbProp={0, 167},	nQuality = 1,	nRate = 0.08},
	{szName="安邦菊花石指环",	tbProp={0, 165},	nQuality = 1,	nRate = 0.08},
	{szName="安邦田黄石玉佩",	tbProp={0, 166},	nQuality = 1,	nRate = 0.1},
	{szName="洞察翡翠玉项圈",	tbProp={0, 146},	nQuality = 1,	nRate = 0.05},
	{szName="洞察白金秀凤戒",	tbProp={0, 145},	nQuality = 1,	nRate = 0.05},
	{szName="洞察白金雕龙戒",	tbProp={0, 143},	nQuality = 1,	nRate = 0.05},
	{szName="洞察白玉乾坤佩",	tbProp={0, 144},	nQuality = 1,	nRate = 0.05},
	{szName="6就玄晶矿石",		tbProp={6, 1, 147, 6, 0, 0},		nRate = 8},
	{szName="7就玄晶矿石",		tbProp={6, 1, 147, 7, 0, 0},		nRate = 2},
	{szName="8就玄晶矿石",		tbProp={6, 1, 147, 8, 0, 0},		nRate = 0.5},
	{szName="武林秘籍", 		tbProp={6, 1, 26, 1, 0, 0},	 		nRate = 0.5},
	{szName="洗髓经", 			tbProp={6, 1, 22, 1, 0, 0}, 		nRate = 0.5},
	{szName="盘若心经",			tbProp={6, 1, 398, 1, 0, 0},		nRate = 0.02},
	{szName="吉祥蜡烛",			tbProp={6, 1, 1915, 1, 0, 0},		nRate = 15,		nExpiredTime = newyear0901_lazhu_expiredtime},
	{szName="如意蜡烛",			tbProp={6, 1, 1916, 1, 0, 0},		nRate = 7,		nExpiredTime = newyear0901_lazhu_expiredtime},
	{szName="莽球", 			tbProp={6, 1, 1886, 1, 0, 0},		nRate = 12, 	nExpiredTime = newyear0901_item_expiredtime},
	{szName="椰子", 			tbProp={6, 1, 1887, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="木瓜", 			tbProp={6, 1, 1888, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="芒果", 			tbProp={6, 1, 1889, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="无花果", 			tbProp={6, 1, 1890, 1, 0, 0},		nRate = 17,		nExpiredTime = newyear0901_item_expiredtime},
	{szName="上等粽子", 		tbProp={6, 1, 1894, 1, 0, 0},		nRate = 0.3,	nExpiredTime = newyear0901_item_expiredtime},
	{szName="大眼神锤碎片(1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.01},
	{szName="大眼神锤碎片 (2/9) /9)",	tbProp={4, 595, 1, 1, 0, 0},	nRate = 0.01},
	{szName="大眼神锤碎片 (4/9) /9)",	tbProp={4, 597, 1, 1, 0, 0},	nRate = 0.01},
	{szName="大眼神锤碎片 (6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.01},
	{szName="大眼神锤碎片 (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.01},
	{szName="冰寒弹指飞刀碎片 (1/9)",		tbProp={4, 980, 1, 1, 0, 0},	nRate = 0.05},
	{szName="冰寒弹指飞刀碎片 (3/9)",		tbProp={4, 982, 1, 1, 0, 0},	nRate = 0.05},
	{szName="冰寒弹指飞刀碎片 (4/9)",		tbProp={4, 983, 1, 1, 0, 0},	nRate = 0.05},
	{szName="冰寒弹指飞刀碎片 (7/9)",		tbProp={4, 986, 1, 1, 0, 0},	nRate = 0.05},
	{szName="冰寒弹指飞刀碎片 (8/9)",		tbProp={4, 987, 1, 1, 0, 0},	nRate = 0.05},
	{szName="四空降魔戒刀碎片(1/9) /9)",		tbProp={4, 585, 1, 1, 0, 0},	nRate = 0.03},
	{szName="四空降魔戒刀碎片(4/9) /9)",		tbProp={4, 588, 1, 1, 0, 0},	nRate = 0.03},
	{szName="四空降魔戒刀碎片(5/9) /9)",		tbProp={4, 589, 1, 1, 0, 0},	nRate = 0.03},
	{szName="四空降魔戒刀碎片 (7/9) /9)",		tbProp={4, 591, 1, 1, 0, 0},	nRate = 0.03},
	{szName="四空降魔戒刀碎片 (9/9) /9)",		tbProp={4, 593, 1, 1, 0, 0},	nRate = 0.03},
	{szName="幽冥枪碎片(1/9) /9)",	tbProp={4, 684, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽冥枪碎片 (3/9) /9)",	tbProp={4, 686, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽冥枪碎片(5/9) /9)",	tbProp={4, 688, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽冥枪碎片 (6/9) /9)",	tbProp={4, 689, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽冥枪碎片 (8/9) /9)",	tbProp={4, 691, 1, 1, 0, 0},	nRate = 0.05},
	{szName="千年寒铁碎片 (1/9) /9)",		tbProp={4, 702, 1, 1, 0, 0},	nRate = 0.03},
	{szName="千年寒铁碎片 (4/9) /9)",		tbProp={4, 705, 1, 1, 0, 0},	nRate = 0.03},
	{szName="千年寒铁碎片 (5/9) /9)",		tbProp={4, 706, 1, 1, 0, 0},	nRate = 0.03},
	{szName="千年寒铁碎片 (7/9) /9)",		tbProp={4, 708, 1, 1, 0, 0},	nRate = 0.03},
	{szName="千年寒铁碎片(8/9) /9)",		tbProp={4, 709, 1, 1, 0, 0},	nRate = 0.03},
	{szName="洗象玉扣碎片 (2/6) /6)",		tbProp={4, 802, 1, 1, 0, 0},	nRate = 0.04},
	{szName="洗象玉扣碎片 (3/6) /6)",		tbProp={4, 803, 1, 1, 0, 0},	nRate = 0.04},
	{szName="洗象玉扣碎片 (4/6) /6)",		tbProp={4, 804, 1, 1, 0, 0},	nRate = 0.04},
	{szName="洗象玉扣碎片 (5/6) /6)",		tbProp={4, 805, 1, 1, 0, 0},	nRate = 0.04},
	{szName="栖凰凤仪刀碎片 (2/9) /9)",		tbProp={4, 631, 1, 1, 0, 0},	nRate = 0.05},
	{szName="栖凰凤仪刀碎片(5/9) /9)",		tbProp={4, 634, 1, 1, 0, 0},	nRate = 0.05},
	{szName="栖凰凤仪刀碎片(7/9) /9)",		tbProp={4, 636, 1, 1, 0, 0},	nRate = 0.05},
	{szName="栖凰凤仪刀碎片 (8/9) /9)",		tbProp={4, 637, 1, 1, 0, 0},	nRate = 0.05},
	{szName="栖凰凤仪刀碎片(9/9) /9)",		tbProp={4, 638, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽胧金蛇发带碎片 (1/6) /6)",		tbProp={4, 825, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽胧金蛇发带碎片 (2/6) /6)",		tbProp={4, 826, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽胧金蛇发带碎片 (4/6) /6)",		tbProp={4, 828, 1, 1, 0, 0},	nRate = 0.05},
	{szName="幽胧金蛇发带碎片(6/6) /6)",		tbProp={4, 830, 1, 1, 0, 0},	nRate = 0.05},
	{szName="同仇抗龙护腕碎片 (2/6) /6)",		tbProp={4, 856, 1, 1, 0, 0},	nRate = 0.02},
	{szName="同仇抗龙护腕碎片(3/6) /6)",		tbProp={4, 857, 1, 1, 0, 0},	nRate = 0.02},
	{szName="同仇抗龙护腕碎片 (4/6) /6)",		tbProp={4, 858, 1, 1, 0, 0},	nRate = 0.02},
	{szName="同仇抗龙护腕碎片 (5/6) /6)",		tbProp={4, 859, 1, 1, 0, 0},	nRate = 0.02},
	{szName="凌岳无极玄玉佩碎片  (1/6) /6)",	tbProp={4, 879, 1, 1, 0, 0},	nRate = 0.02},
	{szName="凌岳无极玄玉佩碎片  (2/6) /6)",	tbProp={4, 880, 1, 1, 0, 0},	nRate = 0.02},
	{szName="凌岳无极玄玉佩碎片 (4/6) /6)",	tbProp={4, 882, 1, 1, 0, 0},	nRate = 0.02},
	{szName="凌岳无极玄玉佩碎片  (6/6) /6)",	tbProp={4, 884, 1, 1, 0, 0},	nRate = 0.02},
};


tb_tree_itemid	=
{
	[1]	= 1917,
	[2]	= 1918,
};

tb_openhongbao_mapid	=
{
	[11]	= 1,
	[1] 	= 1,
	[37] 	= 1,
	[176] 	= 1,
	[162] 	= 1,
	[78] 	= 1,
	[80] 	= 1,
	[174] 	= 1,
	[121] 	= 1,
	[153] 	= 1,
	[101] 	= 1,
	[99] 	= 1,
	[100] 	= 1,
	[20]	= 1,
	[53] 	= 1,
	[54] 	= 1,
	[175] 	= 1,
	[55] 	= 1,
};

function main()
	newyear0901_resettask();
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("该物品已过期.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("大侠依然不足50级或者依然未充值，所以不能使用发财红包.", 0);
		return 1;
	end
	
	local subworld, x, y	= GetWorldPos();
	if (tb_openhongbao_mapid[subworld] == nil) then
		Say("发财红包只在城市和村镇使用.", 0);
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say("大侠的装备不足，请留下20个空位", 0);
		return 1;
	end
	
	if (300 + GetTask(newyear0901_TSK_GetExp_Hongbao) <= GetTask(newyear0901_TSK_GetExpUpLimit))	then
		SetTask(newyear0901_TSK_GetExp_Hongbao, 300 + GetTask(newyear0901_TSK_GetExp_Hongbao));
		AddOwnExp(3000000);
		tbAwardTemplet:GiveAwardByList(tb_facaihongbao_award, "发财红包");
		
		
    	subworld = SubWorldID2Idx(subworld);
    	local n_tree_idx		= random(1, 2);
    	local n_itemid 			= tb_tree_itemid[n_tree_idx];
    	local nItemIdx 			= DropItem(subworld, x * 32, y * 32, -1, 6, 1, n_itemid, 1, 0, 0, 0);
	else
		Say("大侠已达经验最高上限，所以不能再使用发财红包了.", 0);
		return 1;
	end
end
