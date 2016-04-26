--5.1劳动节活动脚本
--By LiuKuo 2005.4.20
IncludeLib("NPCINFO")

BOSSLASTDATE = tonumber(date("%d")) --上一次黄金Boss被召唤的日期 只记录天
BOSSMAXCOUNT = 3	--每天单服可以召出的黄金Boss的最大数，每台gameserver的上限，共24个
BOSSNOWCOUNT = 0 --当前召唤的黄金Boss数

--以下地图禁用
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--黄金Boss	{ID,Name,Series}
GoldenBoss = {{562, "道清真人", 4},
			  {563, "耶律辟离", 3},
			  {564, "完颜雪衣", 3},
			  {565, "端木睿", 3},
			  {566, "古柏", 0},
			  {567, "钟玲秀", 2},
			  {568, "何怜飘", 2},
			  {582, "蓝依依", 1},
			  {583, "孟苍浪", 3},
			  {739, "王佐", 0},
			  {740, "玄觉大师", 0},
			  {741, "唐不染", 1},
			  {742, "白莹莹", 1},
			  {743, "清晓师太", 2},
			  {744, "嫣小倩", 2},
			  {745, "何人我", 3},
			  {746, "单思南", 4},
			  {747, "璇玑子", 4},
			  {748, "韩蒙", 1},
			  {751, "大马虎",0}}

--大马虎Boss {ID,Name,Series}
DamahuBoss = {{751, "大马虎",0},
			  {752, "大马虎",0},
			  {753, "大马虎",1},
			  {754, "大马虎",1},
			  {755, "大马虎",2},
			  {756, "大马虎",2},
			  {757, "大马虎",3},
			  {758, "大马虎",3},
			  {759, "大马虎",4},
			  {760, "大马虎",4}}
			  
--小Boss	{ID,Name}
NormalBoss = {{511, "张宗正"},
			  {513, "妙如"},
			  {523, "柳青青"},
			  {725, "水贼首领"}}
			  
--杀手任务Boss	{ID,Name,面具编号}
MiniBoss = {{851, "步嚣尘", 79},
			{852, "乔鼎天", 80},
			{853, "刁易刀", 81},
			{854, "西门无戒", 82},
			{855, "候乞剑", 83},
			{856, "应啸风", 84},
			{857, "袁念夕", 85},
			{858, "楮天敏", 86}}

--蓝怪npc	{ID,Name}	同一行不同的id对应不同等级蓝怪的droprate
GoldenNpc = {{859, 859, 859, 859, 860, 861, 862, 863, "白虎"},
			 {864, 864, 864, 864, 865, 866, 867, 868, "黑叶猴"},
			 {869, 869, 869, 869, 870, 871, 872, 873, "山贼"},
			 {874, 874, 874, 874, 875, 876, 877, 878, "水贼"},
			 {879, 879, 879, 879, 880, 881, 882, 883, "飞沙"},
			 {884, 884, 884, 884, 885, 886, 887, 888, "冷枪"},
			 {889, 889, 889, 889, 890, 891, 892, 893, "银牙"},
			 {894, 894, 894, 894, 895, 896, 897, 898, "乘风"},
			 {899, 899, 899, 899, 900, 901, 902, 903, "蒙古武士"},
			 {904, 904, 904, 904, 905, 906, 907, 908, "霜刀"}}
			 
--普通npc	{ID,Name}
NormalNpc = {{2, "华南虎"},
			 {37, "黑叶猴"},
			 {169, "山贼"},
			 {674, "水贼"},
			 {703, "飞沙"},
			 {708, "冷枪"},
			 {589, "银牙"},
			 {713, "乘风"},
			 {673, "蒙古武士"},
			 {598, "霜刀"}}

function CallBoss( Level, Series )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("不在战斗状态不能使用");
		return 1
	end
	for i = 249, 318 do	--洗髓岛山洞
		if ( i == nMapId ) then
			Msg2Player("此处不能使用此物品");
			return 1
		end
	end	
	for i = 375, 415 do	--新增宋金战场地图 送信任务地图 比武大会地图
		if ( i == nMapId ) then
			Msg2Player("此处不能使用此物品");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--特殊地图禁用
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("此处不能使用此物品");
			return 1
		end
	end
	local nNowDate = tonumber(date("%d"));
	
	if ( nNowDate == BOSSLASTDATE ) then	--如果上次召唤日期是当天的话
		if ( BOSSNOWCOUNT >= BOSSMAXCOUNT ) then	--大于召唤最大数则不能再召唤黄金Boss
			print("你召唤的黄金Boss数已超过限制.")
			nBossRate =  random( 101, 10000);
		else
			nBossRate = random( 1, 10000);
		end
	else	--如果上次召唤日期与当前不是同一天
		BOSSLASTDATE = nNowDate;	--更新最近的日期
		BOSSNOWCOUNT = 0;	--当前召唤数置0
		nBossRate = random( 1, 10000);
	end
	
	if( Level < 90 ) then
		nBossRate =  random( 101, 10000);
	end
	
	if( nBossRate <= 100 ) then		--召唤黄金Boss
		local i = random( 1, getn(GoldenBoss));
		local GoldenBossId = GoldenBoss[i][1];
		local GoldenBossName = GoldenBoss[i][2];
		local GoldenBossSeries = GoldenBoss[i][3];
		if( GoldenBossId == 748 ) then	--韩蒙五行随机
			GoldenBossSeries = random( 0, 4);
		end
		if( GoldenBossId == 751 ) then	--随机大马虎
			i = random( 1, getn(DamahuBoss));
			GoldenBossId = DamahuBoss[i][1];
			GoldenBossName = DamahuBoss[i][2];
			GoldenBossSeries = DamahuBoss[i][3];
		end
		AddNpcEx( GoldenBossId, 95, GoldenBossSeries, SubWorldID2Idx(W), X * 32, (Y +  5)* 32, 1, GoldenBossName, 1 );
		BOSSNOWCOUNT = BOSSNOWCOUNT + 1;	--当前召唤的黄金Boss数加1
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] 召唤黄金Boss:"..GoldenBossName);
		Msg2Player("你召唤出一个黄金Boss:"..GoldenBossName);
	elseif ( nBossRate > 100 and nBossRate <= 300 ) then	--召唤小Boss
		local i = random( 1, getn(NormalBoss));
		local NormalBossId = NormalBoss[i][1];
		local NormalBossName = NormalBoss[i][2];
		AddNpcEx( NormalBossId, 95, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, NormalBossName, 1 );
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] 召唤小Boss:"..NormalBossName);
		Msg2Player("你召唤出一个小Boss:"..NormalBossName);
	elseif ( nBossRate > 300 and nBossRate <= 3000 ) then	--召唤杀手Boss
		local i = floor( Level - 20 ) / 10 + 1;	--根据杀手锏的等级选择召唤的杀手Boss
		local MiniBossId = MiniBoss[i][1];
		local MiniBossName = MiniBoss[i][2];
		local MaskId = MiniBoss[i][3];
	 	AddNpcEx( MiniBossId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, MiniBossName, 1 );
	 	Msg2Player("你召唤出一个杀手Boss"..MiniBossName);
	 	AddItem( 0, 11, MaskId, 1, 0, 0 );	--根据召出的Boss给玩家一个面具
	 	Msg2Player("你得到一个面具");
	elseif ( nBossRate > 3000 and nBossRate <= 6000 ) then	--召唤蓝怪
		local i =  random( 1, getn(GoldenNpc));		--随机选一个蓝怪npc
		local j =  floor( Level - 20 ) / 10 + 1;	--根据杀手锏的等级取对应droprate的蓝怪
		local GoldenNpcId = GoldenNpc[i][j];
		local GoldenNpcName = GoldenNpc[i][9];
		NPCINFO_AddBlueNpc( Series, GoldenNpcId, Level, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, GoldenNpcName, 15 );	--增加蓝怪的脚本，最后一个数是蓝怪模版
		Msg2Player("你召唤出一个蓝怪:"..GoldenNpcName);
	else	--召唤普通怪
		local i = random( 1, getn(NormalNpc));
		local NormalNpcId = NormalNpc[i][1];
		local NormalNpcName = NormalNpc[i][2];
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X* 32, (Y +  5) * 32, 1, NormalNpcName, 0 );
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y -  5) * 32, 1, NormalNpcName, 0 );
		Msg2Player("你只能召唤一些普通怪");
	end
	return 0	
end
