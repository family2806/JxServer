Include("\\script\\global\\forbidmap.lua");

--tinhpn 20100809: forbid Tong Map
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--特殊地图禁用
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end

function main(nItemIdx)
	local _, _, _, nLevel= GetItemProp( nItemIdx );
	local ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}
	local GoldenBoss = {{562, "道清真人", 4,12},
					  {563, "耶律辟离", 3,12},
					  --{564, "完颜雪衣", 3,12},
					  {565, "端木睿", 3,12},
					  {566, "古柏", 0,12},
					  {567, "钟灵秀", 2,12},
					  {568, "何怜飘", 2,12},
					  {582, "蓝伊伊", 1,12},
					  {583, "孟苍浪", 3,12},
					  {739, "王佐", 0,10},
					  {740, "玄觉大师", 0,12},
					  {741, "唐不染", 1,12},
					  {742, "白莹莹", 1,12},
					  {743, "清晓师太", 2,12},
					  {744, "鄢晓倩", 2,12},
					  {745, "何人我", 3,12},
					  --{746, "单思南", 4,10},
					  {747, "璇玑子", 4,12},
					  {511, "张宗正",5,270},
			  		  {513, "妙如",5,270},
			  		  {523, "柳青青",5,270}}
			  		  
	local bosspro = {};
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("非战斗状态下不能使用");
		return 1
	end
	
	--tinhpn 20100803:  forbid Tong Map
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("帮会地图禁止使用")
		return 1
	end
	
	for i = 249, 318 do	--洗髓岛山洞
		if ( i == nMapId ) then
			Msg2Player("此地不能使用此道具");
			return 1
		end
	end	
	for i = 375, 415 do	--新增宋金战场地图 送信任务地图 比武大会地图
		if ( i == nMapId ) then
			Msg2Player("此地不能使用此道具");
			return 1
		end
	end
	for i = 1, getn( ForbiddenMap ) do		--特殊地图禁用
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("此地不能使用此道具");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("此地不能使用此道具");
		return 1
	end
	
	for i = 1, getn(GoldenBoss) do
		bosspro[i] = GoldenBoss[i][4];
	end

	local doubleodds = 160 - (nLevel - 1) * 10
	local j = 1;
	if( random(1,doubleodds) == 1) then
		j = 2;
	end
	
	for k = 1, j do
		local numth = randomaward(bosspro);
		local GoldenBossId = GoldenBoss[numth][1];
		local GoldenBossName = GoldenBoss[numth][2];
		local GoldenBossSeries = GoldenBoss[numth][3];
		if (GoldenBossSeries == 5) then
			GoldenBossSeries = random( 0, 4);
		end
		local npcindex = AddNpcEx( GoldenBossId, 95, GoldenBossSeries, SubWorldID2Idx(W), X * 32, (Y +  5)* 32, 1, GoldenBossName, 1 );
		SetNpcDeathScript(npcindex, "\\script\\misc\\boss\\callbossdeath.lua");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().."，["..GetName().."]用Boss召唤符召唤了一个黄金Boss："..GoldenBossName);
		Msg2Player("你召唤出了一个Boss："..GoldenBossName);
	end
	return 0	
end

function randomaward(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	local nCompareSum = 0;
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = random(1,nSum);
	for i = 1,nArgCount do
		nCompareSum = nCompareSum + aryProbability[i]
		if( nRandNum <= nCompareSum) then
			return i;
		end
	end
end

function GetDesc(nItemIdx)
	local _, _, _, lvl = GetItemProp(nItemIdx);
	local doubleodds = 160 - (lvl - 1) * 10
	return "<color=blue>召出第2个Boss的几率：<color=yellow>1/"..doubleodds;
end