-- 文件名　：xmas2007_itemsnowman.lua
-- 创建者　：zhongchaolong
-- 创建时间：2007-12-01 16:05:50

IncludeLib("NPCINFO")
IncludeLib("TASKSYS")
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\lib\\pay.lua")

xmas2007_SnowManItem_forbitmap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

xmas2007_tbSnowManBoss = 
{
	--[物品PID] = {名称,bossID}
	[1634] = {szName = "黄雪仁", nBossId = 1329},
	[1635] = {szName = "紫雪仁", nBossId = 1330},
	[1636] = {szName = "绿雪仁", nBossId = 1331},
}
xmas2007_SnowManItem_tbItemList = 
{
	--[物品PID] = {名称,物品prop，概率%}
	[1634] = {
		{"紫水晶",{4,238,1,1,0,0},6.00},
		{"绿水晶",{4,239,1,1,0,0},5.00},
		{"蓝水晶",{4,240,1,1,0,0},5.00},
		{"特效仙草露",{6,1,1181,1,0,0},5.00},
		{"仙草露",{6,1,71,1,0,0},10.00},
		{"福缘露(大) ",{6,1,124,1,0,0},30.00},
		{"晶红宝石",{4,353,1,1,0,0},5.60},
		{"安邦冰晶石项链",{0,164},0.01},
		{"安邦鸡血石戒指",{0,167},0.02},
		{"安邦菊花石指环",{0,165},0.02},
		{"安邦田黄石玉佩",{0,166},0.05},
		{"定国钨砂发冠",{0,160},0.06},
		{"定国青纱长衫",{0,159},0.06},
		{"定国银蚕腰带",{0,163},0.06},
		{"定国赤绢软靴",{0,161},0.06},
		{"定国紫藤护腕",{0,162},0.06},
		{"雪花",{6,0,1013,1,0,0},8.25},
		{"绿色礼品",{6,0,1012,1,0,0},8.25},
		{"玫瑰",{6,0,20,1,0,0},8.25},
		{"面具-驯鹿",{0,11,405,1,0,0},0.60},
		{"面具-圣诞老人(红色) ",{0,11,398,1,0,0},0.45},
		{"面具-圣诞老人(绿色) ",{0,11,397,1,0,0},0.45},
		{"面具-圣诞老人(白色) ",{0,11,399,1,0,0},0.45},
		{"面具-圣诞老人 (金色) ",{0,11,400,1,0,0},0.45},
		{"面具-圣诞老人 (红色) ",{0,11,394,1,0,0},0.45},
		{"面具-圣诞天使(红色) ",{0,11,395,1,0,0},0.45},
		{"面具-圣诞天使 (绿色) ",{0,11,401,1,0,0},0.45},
		{"面具-圣诞天使 (白色) ",{0,11,403,1,0,0},0.45},
		{"面具-圣诞天使 (金色) ",{0,11,404,1,0,0},0.45},
		{"面具-圣诞天使 (红色) ",{0,11,402,1,0,0},0.45},
		{"面具-精灵(红色) ",{0,11,423,1,0,0},0.45},
		{"面具-精灵(绿色) ",{0,11,396,1,0,0},0.45},
		{"面具-精灵((金色) ",{0,11,424,1,0,0},0.45},
		{"面具-精灵((紫色) ",{0,11,422,1,0,0},0.45},
		{"面具-黄雪仁",{0,11,425,1,0,0},0.45},
		{"面具-紫雪仁",{0,11,426,1,0,0},0.45},
		{"面具-绿雪仁",{0,11,427,1,0,0},0.45},
	},
	[1636] =
	{
		{"特效仙草露",{6,1,1181,1,0,0},0.50},
		{"仙草露",{6,1,71,1,0,0},9.50},
		{"百果露",{6,1,73,1,0,0},10.00},
		{"天山宝露",{6,1,72,1,0,0},10.00},
		{"福缘露(大) ",{6,1,124,1,0,0},5.00},
		{"福缘露(中) ",{6,1,123,1,0,0},10.00},
		{"桂花酒",{6,1,125,1,0,0},5.00},
		{"面具-驯鹿",{0,11,405,1,0,0},12.50},
		{"雪花 ",{6,0,1013,1,0,0},12.50},
		{"绿色礼品",{6,0,1012,1,0,0},8.25},
		{"玫瑰",{6,0,20,1,0,0},12.50},
	}
}
function main(nItemIndex)
	local _, _, PID			= GetItemProp(nItemIndex);
	local szItemName		= GetItemName(nItemIndex);
	local tbSnowManBossInfo	= xmas2007_tbSnowManBoss[PID];
	local nCurExp			= GetTask(xmas2007_SnowManItem_TSK_ExpLimit);
	local nExp				= 1000000
	local nTotalRate		= 100000;
	local nRate				= floor(nTotalRate*5/100)
	if xmas07_makeSnowMan_isUsePeriod() == 0 then
		Msg2Player("该物品已过使用期，将会消失.")
		return 0
	end
	if xmas2007_SnowManItem_CheckForbitMap() == 1 then
		return 1
	end
	if IsCharged() == 0 or GetLevel() < 50 then
		Msg2Player("50级以上充值玩家才能使用该物品.")
		return 1;
	end
	if nCurExp >= xmas2007_SnowManItem_ExpMax then
		Msg2Player("使用雪人已超过经验值上限，不能再使用了.")
		return 1;
	else
		AddOwnExp(nExp);
		SetTask(xmas2007_SnowManItem_TSK_ExpLimit,nCurExp+nExp);
	end
	
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tUse a %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	if random(1,nTotalRate) <= nRate then
		local W,X,Y=GetWorldPos()
		local nSeries = random(0,4)
		AddNpcEx(tbSnowManBossInfo.nBossId, 90, nSeries, SubWorld, X*32, Y*32,1, tbSnowManBossInfo.szName, 2)
		
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tcall a boss %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_SnowManItem_tbItemList[PID])
	return 0;
end



function xmas2007_SnowManItem_CheckForbitMap()
	local W,X,Y=GetWorldPos()
	local nMapId = W;
	local i;
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("不在战斗状态就不能使用");
		return 1
	end
	for i = 249, 318 do	--洗髓岛山洞
		if ( i == nMapId ) then
			Msg2Player("这里不能使用该物品");
			return 1
		end
	end	
	for i = 375, 415 do	--新增宋金战场地图 送信任务地图 比武大会地图
		if ( i == nMapId ) then
			Msg2Player("这里不能使用该物品");
			return 1
		end
	end	

	for i = 1, getn( xmas2007_SnowManItem_forbitmap ) do		--特殊地图禁用
		if( xmas2007_SnowManItem_forbitmap[i] == nMapId ) then
			Msg2Player("这里不能使用该物品");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("召回令牌不能在该特殊区域使用.");
		return 1
	end
	return 0		
end