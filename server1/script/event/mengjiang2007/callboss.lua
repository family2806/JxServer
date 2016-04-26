
--zero 20070712 召唤boss

IncludeLib("NPCINFO")
IncludeLib("TASKSYS");
Include("\\script\\global\\forbidmap.lua");


--以下地图禁用
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--Boss	{ID,Name,Level,Series}
mengjiangBoss ={{562, "无名道人",95,4},--1 玉牌
	{565, "无名老人",95,3},--2
	{741, "无名杀手",95,1},--3
	{744, "无名美人",95,2},--4
	{1284, "金冠将军",95,-1},--5 金牌
	{511, "张宗正",95,4},--6 银牌
	{513, "妙如",95,2},--7
	{523, "柳青青",95,1},--8
	{725,"水贼首领",85,-1},--9 铜牌
	{851, "步嚣尘",20,-1},--10 以下是木牌
	{852, "乔鼎天",30,-1},--11
	{853, "刁易刀",40,-1},--12
	{854, "西门无戒",50,-1},--13
	{855, "候乞剑",60,-1},--14
	{856, "应啸风",70,-1},--15
	{857, "袁念夕",80,-1},--16
	{858, "楮天敏",90,-1}--17
}

function CallBoss( lingpai  )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("非战斗状态无法使用");
		return 1
	end
	for i = 249, 318 do	--洗髓岛山洞
		if ( i == nMapId ) then
			Msg2Player("这里无法使用此物品");
			return 1
		end
	end	
	for i = 375, 415 do	--新增宋金战场地图 送信任务地图 比武大会地图
		if ( i == nMapId ) then
			Msg2Player("这里无法使用此物品");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--特殊地图禁用
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("这里无法使用此物品");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("召回令牌不能在这个特殊区域使用.");
		return 1
	end;
	if(lingpai == 1) then -- 木牌
		i = random(10,17);	
		summonBoss(i);
		WriteLog(format("[召回猛将]\t%s\tAccount:%s\tName:%s\t%s 使用成功",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"木牌"));
	 elseif(lingpai == 2 ) then--铜牌
		summonBoss(9)
		WriteLog(format("[召回猛将]\t%s\tAccount:%s\tName:%s\t%s 使用成功",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"铜牌"));
	elseif(lingpai == 3 ) then --银牌
		i= random(6,8);
		summonBoss(i);
		WriteLog(format("[召回猛将]\t%s\tAccount:%s\tName:%s\t%s 使用成功",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"银牌"));
	elseif(lingpai == 4) then --金牌
		summonBoss(5);
		WriteLog(format("[召回猛将]\t%s\tAccount:%s\tName:%s\t%s 使用成功",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"金牌"));
	elseif(lingpai == 5) then --玉牌
		if( CalcFreeItemCellCount() < 10) then
			Say("背包已满！请整理出背包空间（最少10个空位）.",0);
			return 1;
		end
		local equit_index=random(159,167);--随机定国安邦
		AddGoldItem(0,equit_index);
		for i=1,5 do
			summonBoss(i);
		end
		Msg2SubWorld(format("玩家 %s 在 %s(%d,%d) 已经使用，使金冠将军出现.",GetName(),SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16),"玉牌"));
		WriteLog(format("[召回猛将]\t%s\tAccount:%s\tName:%s\t%s 使用成功",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"玉牌"));
	end
	return 0;
end
function summonBoss(mengjiang_index)
	local W,X,Y = GetWorldPos();
	BossId = mengjiangBoss[mengjiang_index][1];
	BossName = mengjiangBoss[mengjiang_index][2];
	BossLevel = mengjiangBoss[mengjiang_index][3];
	BossSeries = mengjiangBoss[mengjiang_index][4];
	if(BossSeries == -1) then BossSeries = random(0,4) end;
	AddNpcEx( BossId,BossLevel ,BossSeries, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1,BossName, 1 );
	Msg2Player(format("你已经召回了 %s",BossName));
end
