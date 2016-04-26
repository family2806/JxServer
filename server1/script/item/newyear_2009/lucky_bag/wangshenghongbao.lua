Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_wangshenghongbao_award	=
{
	{szName="1 名望", 			nRepute = 1, 		nRate = 25},
	{szName="2 名望", 			nRepute = 2, 		nRate = 20},
	{szName="3 名望", 			nRepute = 3, 		nRate = 15},
	{szName="10 名望",			nRepute = 10, 		nRate = 3},
	{szName="50 名望",		 	nRepute = 50, 		nRate = 0.1},
	{szName="3级玄晶矿石", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 5},
	{szName="4级玄晶矿石", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 3},
	{szName="5级玄晶矿石", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 2},
	{szName="心心相印符",		tbProp={6, 1, 18,  1, 0, 0},	nRate = 3},
	{szName="飞速丸",			tbProp={6, 0, 6,   1, 0, 0}, 	nRate = 5},
	{szName="大力丸",			tbProp={6, 0, 3,   1, 0, 0}, 	nRate = 5},
	{szName="武林秘籍", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="洗髓经", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="盘若心经", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="铁罗汉", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 3},
	{szName="神秘大红包", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 7.779},
	{szName="定国钨砂发冠", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.008},
	{szName="定国青纱长衫", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="定国银蚕腰带", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="定国赤绢软靴",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.015},
	{szName="定国紫藤护腕", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.2},
	{szName="柔情巾帼霓裳", 	tbProp={0, 190}, 	nQuality = 1,	nRate = 0.008},
	{szName="柔情慧心玉佩", 	tbProp={0, 193}, 	nQuality = 1,	nRate = 0.07},
	{szName="柔情凤仪戒指", 	tbProp={0, 192}, 	nQuality = 1,	nRate = 0.3},
	{szName="柔情淑女项链", 	tbProp={0, 191}, 	nQuality = 1,	nRate = 0.4},
	{szName="侠骨情义结", 	tbProp={0, 189}, 	nQuality = 1,	nRate = 0.01},
	{szName="侠骨铁血衫", 	tbProp={0, 186}, 	nQuality = 1,	nRate = 0.1},
	{szName="侠骨丹心戒", 	tbProp={0, 188}, 	nQuality = 1,	nRate = 0.3},
	{szName="侠骨多情丸", 	tbProp={0, 187}, 	nQuality = 1,	nRate = 0.4},
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
		Say("大侠依然不足50级或者依然未充值，所以不能使用兴旺红包.", 0);
		return 1;
	end
	
	local subworld, x, y	= GetWorldPos();
	if (tb_openhongbao_mapid[subworld] == nil) then
		Say("兴旺红包只在城市和村镇使用.", 0);
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say("大侠的装备已满!", 0);
		return 1;
	end
	
	if (100 + GetTask(newyear0901_TSK_GetExp_Hongbao) <= GetTask(newyear0901_TSK_GetExpUpLimit))	then
		SetTask(newyear0901_TSK_GetExp_Hongbao, 100 + GetTask(newyear0901_TSK_GetExp_Hongbao));
		AddOwnExp(1000000);
		
    	subworld = SubWorldID2Idx(subworld);
    	local n_tree_idx		= random(1, 2);
    	local n_itemid 			= tb_tree_itemid[n_tree_idx];
    	local nItemIdx 			= DropItem(subworld, x * 32, y * 32, -1, 6, 1, n_itemid, 1, 0, 0, 0);
			
		tbAwardTemplet:GiveAwardByList(tb_wangshenghongbao_award, "兴旺红包");	
	else
		Say("大侠已达经验最高上限，所以不能再使用兴旺红包了.", 0);
		return 1;
	end
end