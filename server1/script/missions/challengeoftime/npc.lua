-- description	: 创建NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

-- 怪物数量<=>位置文件
map_posfiles = {
	[8] = {"\\settings\\maps\\challengeoftime\\lineup8.txt", 1},	
	[16] = {"\\settings\\maps\\challengeoftime\\lineup16.txt", 1},	
	[20] = {"\\settings\\maps\\challengeoftime\\lineup20.txt", 1},
	[24] = {"\\settings\\maps\\challengeoftime\\lineup24.txt", 1},
	[32] = {"\\settings\\maps\\challengeoftime\\lineup32.txt", 1},
	[40] = {"\\settings\\maps\\challengeoftime\\lineup40.txt", 1},
	[56] = {"\\settings\\maps\\challengeoftime\\lineup56.txt", 1}
};

-- NPC的ID可以为三种类型：数字、表格、函数
-- NPC参数各列的含义：<NPC类型数量>, <奖励>, <后续处理、ID、名字、等级、五行、是否BOSS(0,1)、数量、位置>
-- 初级怪物


map_lnpc = {
	-- 1
	{1, {1.5, 0, nil},
		{nil, 975, "霜刀", 75, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {1.5, 0, nil},
		{nil, 976, "飞沙", 75, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 977, "霜镰", 75, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2,	{9, 0, nil},
		{nil, 975, "霜刀", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 978, "乘风", 75, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {4.5, 0, nil},
		{nil, 979, "水魂", 75, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {4.5, 0, nil},
		{nil, 980, "神臂", 75, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2,	{6, 10, nil},
		{nil, 976, "飞沙", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {5, 0, nil},
		{nil, 981, "争汉", 75, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {5, 0, nil},
		{nil, 982, "破狼", 75, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2,	{9, 0, nil},
		{nil, 977, "霜镰", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {6, 0, nil},
		{nil, 983, "影坤", 75, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2,	{6, 10, nil},
		{nil, 978, "乘风", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1,	{4.5, 0, nil},
		{nil, 987, "江沉雁", 75, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1,	{6, 0, nil},
		{nil, 984, "刀子", 75, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2,	{9, 0, nil},
		{nil, 979, "水魂", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1,	{4.5, 0, nil},
		{nil, 988, "沽誉叟", 75, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2,	{6, 10, nil},
		{nil, 980, "神臂", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1,	{4.5, 0, nil},
		{nil, 989, "掌八方", 75, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1,	{6, 0, nil},
		{nil, 985, "狼俸", 75, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2,	{10.5, 0, nil},
		{nil, 981, "争汉", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1,	{4.5, 0, nil},
		{nil, 990, "箭叹妻", 75, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1,	{4.5, 0, nil},
		{nil, 991, "任宗衡", 75, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1,	{7.5, 30, nil},
		{nil, 992, "涂残生", 75, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2,	{9, 0, nil},
		{nil, 984, "刀子", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {7.5, 0, nil},
		{nil, 986, "黑巾", 75, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {24, 15, nil},
		{nil, 1006, "聂弒尘", 75, -1, 0, 1, {1568, 3227}},
		{nil, 985, "狼俸", 75, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 993, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- 高级怪物
map_hnpc = {
	-- 1
	{1, {2, 0, nil},
		{nil, 1007, "霜刀", 95, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {2, 0, nil},
		{nil, 1008, "飞沙", 95, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 1009, "霜镰", 95, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2, {9, 0, nil},
		{nil, 1007, "霜刀", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 1010, "乘风", 95, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {5, 0, nil},
		{nil, 1011, "水魂", 95, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {5, 0, nil},
		{nil, 1012, "神臂", 95, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2, {9, 15, nil},
		{nil, 1008, "飞沙", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {6, 0, nil},
		{nil, 1013, "争汉", 95, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {6, 0, nil},
		{nil, 1014, "破狼", 95, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2, {12, 0, nil},
		{nil, 1009, "霜镰", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {9, 0, nil},
		{nil, 1015, "影坤", 95, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2, {9, 15, nil},
		{nil, 1010, "乘风", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1, {6, 0, nil},
		{nil, 1019, "江沉雁", 95, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1, {9, 0, nil},
		{nil, 1016, "刀子", 95, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2, {14, 0, nil},
		{nil, 1011, "水魂", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1, {6, 0, nil},
		{nil, 1020, "沽誉叟", 95, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2, {12, 20, nil},
		{nil, 1012, "神臂", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1, {6, 0, nil},
		{nil, 1021, "掌八方", 95, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1, {8, 0, nil},
		{nil, 1017, "狼俸", 95, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2, {14, 0, nil},
		{nil, 1013, "争汉", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1, {6, 0, nil},
		{nil, 1022, "箭叹妻", 95, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1, {6, 0, nil},
		{nil, 1023, "任宗衡", 95, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1, {10, 20, nil},
		{nil, 1024, "涂残生", 95, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2, {15, 0, nil},
		{nil, 1016, "刀子", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {9, 0, nil},
		{nil, 1018, "黑巾", 95, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {32, 32, nil},
		{nil, 1038, "聂弒尘", 95, -1, 1, 1, {1568, 3227}},
		{nil, 1017, "狼俸", 95, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 1025, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- 初级隐藏关口怪物
map_lo_hidden_npc = {
	-- 挑战赏金十大猎人排行榜玩家
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10119}, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 挑战初级时间的挑战排行榜玩家
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10179}, 75, func_npc_getseries, 1, 1, {1568, 3227}}}
};

-- 高级隐藏关口怪物
map_hi_hidden_npc = {
	-- 挑战赏金十大猎人排行榜玩家
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}},
	-- 挑战高级时间的挑战排行榜玩家
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10180}, 75, -1, 1, 1, {1568, 3227}}}
};

-- 小聂弑尘 和 新boss
map_new_Ncp = {
	[1] = {nil, 1673, "小聂弒尘", 95, -1, 1, 1, {1568, 3227}},
	[2] = { nNpcId = 1674, nLevel = 95,	bNoRevive = 1, szName = "闯关_古柏",	nIsboss = 1,},
	[3] = { nNpcId = 1675, nLevel = 95,	bNoRevive = 1, szName = "闯关_玄觉大师",	nIsboss = 1,},
	[4] = { nNpcId = 1676, nLevel = 95,	bNoRevive = 1, szName = "闯关_唐不染",	nIsboss = 1,},
	[5] = { nNpcId = 1677, nLevel = 95,	bNoRevive = 1, szName = "闯关_蓝依依",	nIsboss = 1,},
	[6] = { nNpcId = 1678, nLevel = 95,	bNoRevive = 1, szName = "闯关 _清晓师太",	nIsboss = 1,},
	[7] = { nNpcId = 1679, nLevel = 95,	bNoRevive = 1, szName = "闯关_钟玲秀",	nIsboss = 1,},
	[8] = { nNpcId = 1680, nLevel = 95,	bNoRevive = 1, szName = "闯关_何人我",	nIsboss = 1,},
	[9] = { nNpcId = 1681, nLevel = 95,	bNoRevive = 1, szName = "闯关 _端木睿",	nIsboss = 1,},
	[10] = { nNpcId = 1682, nLevel = 95,	bNoRevive = 1, szName = "闯关_道清真人",	nIsboss = 1,},
	[11] = { nNpcId = 1683, nLevel = 95,	bNoRevive = 1, szName = "闯关 _璇玑子",	nIsboss = 1,},
};

-- 新地图传送npc
map_transfer_npc = {
	[1] = { nNpcId = 1684,	bNoRevive = 1, szName = "闯关_密室接引人", szScriptPath = "\\script\\missions\\challengeoftime\\npc\\transfer.lua"},
}

-- 低级比赛通关奖励经验函数
function lo_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 15;
	else
		return floor(172 * (1 - min / 25)) + 10;
	end
end

-- 低级比赛通关奖励：五花、经验、物品
map_laward_success = {
	lo_exp_award, 0, nil
};

-- 高级比赛通关奖励经验函数
function hi_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 30;
	else
		return floor(233 * (1 - min / 25)) + 20;
	end
end

-- 高级比赛通关奖励：五花、经验、物品
map_haward_success = {
	hi_exp_award, 0, nil
};

-- 随机奖励，随机基数为100000
map_random_awards = {
	100000,													-- 随机基数为100000
	{0.1, 	        {"武林秘籍", 		6, 1, 26, 1, 0, 0}},	-- 武林秘籍
	{0.1, 	        {"洗髓经",		6, 1, 22, 1, 0, 0}},	-- 洗髓经
	{0.1, 		{"福缘露（大） ",	6, 1, 124, 1, 0, 0}},	-- 福缘露（大）
	{0.1, 		{"福缘露（中）", 	6, 1, 123, 1, 0, 0}},	-- 福缘露（中）
	{0.1, 		{"五洲凌空丹",	        6, 1, 2397, 1, 0, 0}},	-- 福缘露（小）
	{0.1, 	        {"仙草露",		6, 1, 71, 1, 0, 0}},	-- 仙草露
	{0.1, 		{"天山玉露",		6, 1, 72, 1, 0, 0}},	-- 天山玉露
	{0.1, 		{"四海逍遥丹",		6, 1, 2378, 1, 0, 0}},	-- 百果露
	{0.1, 		{"九天云游丹",		6, 1, 2379, 1, 0, 0}},	-- 大白驹丸
	{0.1, 	        {"玉罐",		6, 1, 2311, 1, 0, 0}},					-- 玉罐
};

-- 获取NPC的ID
function get_npc_id(item, index)
	local id = item[NPC_ATTRIDX_ID];
	local id_type = type(id);
	if (id_type == "function") then
		return id(item, index);
	elseif (id_type == "number") then
		return id;
	elseif (id_type == "table") then
		local pos = random(1, getn(id));
		return id[pos];
	end
end

-- 获取NPC的名字
function get_npc_name(item, index)
	local name = item[NPC_ATTRIDX_NAME];
	local name_type = type(name);
	-- DEBUG
--	print(format("get_npc_name(): item is %s", name_type));
	
	if (name_type == "string") then
		return name;
	elseif (name_type == "function") then
		return name(item, index);
	elseif (name_type == "table") then
		local func = name[1];
		return func(item, index);
	else
		return nil;
	end
end

-- 获取NPC的级别
function get_npc_level(item, index)
	-- DEBUG
--	print(format("get_npc_level():%d", item[NPC_ATTRIDX_LEVEL]));
	return item[NPC_ATTRIDX_LEVEL];
end

-- 获取NPC的五行
function get_npc_series(item, index)
	local series = item[NPC_ATTRIDX_SERIES];
	local series_type = type(series);
	if (series_type == "function") then
		return series(item, index);
	elseif (series_type == "number") then
		if (series < 0) then
			local pos = random(1, getn(map_series));
			return map_series[pos];
		else
			return series;
		end
	else
		return nil;
	end
end

-- NPC的后续处理（累加当前使用的玩家索引）
function npc_proceed(item)
	local proceed = item[NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		proceed(item);
	end
end

-- 获取NPC的数量
function get_npc_count(item)
	return item[NPC_ATTRIDX_COUNT];
end

-- 获取NPC的位置
function get_npc_pos(item, index)
	local pos = item[NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type == "function") then
		return pos(item, index);
	else
		return nil;
	end
end

-- 是否BOSS
function get_npc_isboss(item)
	return item[NPC_ATTRIDX_ISBOSS];
end

-- 当前比赛是否高级比赛
function advanced()
	world = SubWorldIdx2ID(SubWorld);
	return map_isadvanced[world] ~= 0;
end

-- 当前NPC设置表　
function current_npc_map()
	if (advanced()) then
		return map_hnpc;
	else
		return map_lnpc;
	end
end

-- 获取批次数量
function get_batch_count()
	return getn(current_npc_map());
end

-- 根据设定创建NPC，返回创建的NPC的数量
function add_npc(item)
	local npc_count = get_npc_count(item);			-- NPC数量
	local res_count = 0;							-- 产生的NPC数量
	
	for index = 1, npc_count do
		local id = get_npc_id(item, index);			-- NPC的ID
		local level = get_npc_level(item, index);	-- NPC等级
		local isboss = get_npc_isboss(item, index);	-- 是否boss
		local series = get_npc_series(item, index);
		local name = get_npc_name(item, index);
		local px, py = get_npc_pos(item, index);
		npc_proceed(item);
		
		-- DEBUG
--		print("AddNpcEx");
--		print(format("id:%d", id));
--		print(format("level:%d", level));
--		print(format("series:%d", series));
--		print(format("isboss:%d", isboss));
--		print(format("name:%s", name));
--		print(format("pos: %d, %d", px, py));

		local npc_index = AddNpcEx(
			id,			-- ID
			level,		-- 等级
			series,		-- 五行
			SubWorld,	-- 地图
			px * 32,	-- X坐标
			py * 32,	-- Y坐标
			1,			-- 不重生
			name,		-- ??
			isboss);	-- 是否BOSS
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- 设置死亡脚本
			SetNpcDeathScript(npc_index, SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
	
	return res_count;
end

function create_all_npc(npcs)
	local times = npcs[1];
	local count = 0;
	for i = 1, times do
		count = count + add_npc(npcs[i + 2]);
	end
	-- DEBUG
	--print(format("产生了%d只怪", count));
	
	SetMissionV(VARV_NPC_COUNT, count);
	return count;
end

-- 在地图上生成NPC
function create_batch_npc(batch)
	local map = current_npc_map();
	npc = map[batch];		-- 初级怪

	local npc_count = create_all_npc(npc);	
	-- DEBUG
	
	-- 闯关调整 by wangjingjun 2011.03.01
	if batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) and GetMissionV(VARV_BATCH_MODEL) == 1 then
	--	local nX,nY = func_npc_getpos()
	--	WriteLog("x = " .. tostring(nX) .. " Y = " .. tostring(nY))
	--	WriteLog("MapId = " .. tostring(SubWorldIdx2ID(SubWorld)))
		add_npc(map_new_Ncp[1])
	--	basemission_CallNpc(map_new_Ncp[1], SubWorldIdx2ID(SubWorld),nX, nY)
		SetMissionV(VARV_NPC_COUNT, npc_count + 1);
		WriteLog("小聂弒尘已参加战斗!")
		Msg2MSAll(MISSION_MATCH, "小聂弒尘已参加战斗!");
	end

	local msg = "出现" .. npc_count .. "小怪!";
	Msg2MSAll(MISSION_MATCH, msg);
	
	-- 第11关刷出日常任务对话NPC
	if (batch == 11) then
		-- 日常任务刷新对话NPC
		%tbTalkDailyTask:AddTalkNpc(SubWorldIdx2ID(SubWorld), SubWorldIdx2ID(SubWorld));
	end
end


-- 增加闯关传送npc
function add_transfer_npc()
	local nX,nY, nMapIndex = GetPos()
	basemission_CallNpc(map_transfer_npc[1], SubWorldIdx2ID(nMapIndex),1568*32, 3227*32)
end