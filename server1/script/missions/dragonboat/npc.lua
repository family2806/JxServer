-- description	: 创建NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")

-- 怪物数量<=>位置文件
map_file = {
	[16] = "\\settings\\maps\\dragonboat\\lineup16.txt",	
	[20] = "\\settings\\maps\\dragonboat\\lineup20.txt",
	[24] = "\\settings\\maps\\dragonboat\\lineup24.txt",
	[32] = "\\settings\\maps\\dragonboat\\lineup32.txt",
	[40] = "\\settings\\maps\\dragonboat\\lineup40.txt",
	[56] = "\\settings\\maps\\dragonboat\\lineup56.txt"
};

-- 五行
map_series = {
	[0] = "金",
	[1] = "木",
	[2] = "水 ",
	[3] = "火",
	[4] = "土 "
};

-- 初级怪物
map_lnpc = {
	{1, {909, "霜刀", 75, -1, 0, 16, 8}},
	{1, {910, "飞沙 ", 75, -1, 0, 16, 8}},
	{1, {911, "霜链", 75, -1, 0, 20, 8}},
	{1, {912, "乘风", 75, -1, 0, 20, 8}},
	{2, {921, "河魂", 75, 1, 1, 1,  1618, 3208},
		{909, "霜刀", 75, 1, 0, 16, 8}},
	{1, {913, "水魂", 75, 1, 0, 24, 7}},
	{1, {914, "神子 ", 75, 3, 0, 24, 7}},
	{1, {915, "争汉", 75, 2, 0, 32, 7}},
	{1, {916, "破浪", 75, 4, 0, 32, 7}},
	{2, {922, "河魂", 75, 3, 1, 1,  1618, 3208},
		{910, "飞沙 ", 75, 3, 0, 16, 8}},
	{1, {917, "棍影 ", 75, 0, 0, 40, 7}},
	{1, {918, "刀子 ", 75, -1, 0, 32, 7}},
	{2, {923, "河魂", 75, 2, 1, 1,  1618, 3208},
		{911, "霜链", 75, 2, 0, 16, 8}},
	{1, {919, "狼棒", 75, -1, 0, 24, 7}},
	{2, {924, "河魂", 75, 4, 1, 1,  1618, 3208},
	    {912, "乘风", 75, 4, 0, 16, 8}},
	{1, {920, "黑巾", 75, -1, 0, 56, 1}},
	{2, {925, "河魂", 75, 0, 1, 1,  1618, 3208},
		{918, "刀子", 75, 0, 0, 16, 8}},
	{1, {926, "河魂", 75, -1, 1, 1,  1618, 3208}}
};

-- 高级怪物
map_hnpc = {
	{1, {927, "霜刀", 95, -1, 0, 16, 8}},
	{1, {928, "飞沙 ", 95, -1, 0, 16, 8}},
	{1, {929, "霜链", 95, -1, 0, 20, 8}},
	{1, {930, "乘风", 95, -1, 0, 20, 8}},
	{2, {939, "河魂", 95, 1, 1, 1,  1618, 3208},
		{927, "霜刀", 95, 1, 0, 16, 8}},
	{1, {931, "水魂", 95, 1, 0, 24, 7}},
	{1, {932, "神子", 95, 3, 0, 24, 7}},
	{1, {933, "争汉", 95, 2, 0, 32, 7}},
	{1, {934, "破浪", 95, 4, 0, 32, 7}},
	{2, {940, "河魂", 95, 3, 1, 1,  1618, 3208},
	 	{928, "飞沙 ", 95, 3, 0, 16, 8}},
	{1, {935, "棍影 ", 95, 0, 0, 40, 7}},
	{1, {936, "刀子", 95, -1, 0, 32, 7}},
	{2, {941, "河魂", 95, 2, 1, 1,  1618, 3208},
	 	{929, "霜链", 95, 2, 0, 16, 8}},
	{1, {937, "狼棒", 95, -1, 0, 24, 7}},
	{2, {942, "河魂", 95, 4, 1, 1,  1618, 3208},
	 	{930, "乘风", 95, 4, 0, 16, 8}},
	{1, {938, "黑巾 ", 95, -1, 0, 56, 1}},
	{2, {943, "河魂", 95, 0, 1, 1,  1618, 3208},
	 	{936, "刀子", 95, 0, 0, 16, 8}},
	{1, {944, "河魂", 95, -1, 1, 1,  1618, 3208}}
};

-- 初级比赛过关奖品
map_ldrop = {
	{20, 6, 1, 435, 1, 0, 0, "<#> 豆沙粽子"},	-- 0.2概率，豆沙粽子
	{30, 6, 1, 436, 1, 0, 0, "<#> 香菇粽子"},	-- 0.3概率，香菇粽子
	{40, 6, 1, 437, 1, 0, 0, "<#> 蛋黄粽子"},	-- 0.4概率，蛋黄粽子
	{10, 6, 1, 425, 1, 0, 0, "<#> 鸟头龙舟"},	-- 0.1概率，鸟头龙舟
};

map_laward = {
	[1] = {2, 0, nil},
	[2] = {3, 0, nil},
	[3] = {3, 0, nil},
	[4] = {4, 0, nil},
	[5] = {12, 15, nil},
	[6] = {5, 0, nil},
	[7] = {5, 0, nil},
	[8] = {6, 0, nil},
	[9] = {6, 0, nil},
	[10] = {15, 20, nil},
	[11] = {8, 0, nil},
	[12] = {10, 0, nil},
	[13] = {18, 30, nil},
	[14] = {10, 0, nil},
	[15] = {20, 0, nil},
	[16] = {15, 60, nil},
	[17] = {25, 0, nil},
	[18] = {0, 0, map_ldrop},
};

-- 高级比赛过关奖品
map_hdrop = {
	{10, 6, 1, 435, 1, 0, 0, "<#> 豆沙粽子"},	-- 0.2概率，豆沙粽子
	{25, 6, 1, 436, 1, 0, 0, "<#> 香菇粽子"},	-- 0.3概率，香菇粽子
	{40, 6, 1, 437, 1, 0, 0, "<#> 蛋黄粽子"},	-- 0.4概率，蛋黄粽子
	{25, 6, 1, 425, 1, 0, 0, "<#> 鸟头龙舟"},	-- 0.1概率，鸟头龙舟
};

map_haward = {
	[1] = {4, 0, nil},
	[2] = {5, 0, nil},
	[3] = {6, 0, nil},
	[4] = {8, 0, nil},
	[5] = {24, 15, nil},
	[6] = {10, 0, nil},
	[7] = {10, 0, nil},
	[8] = {12, 0, nil},
	[9] = {12, 0, nil},
	[10] = {30, 20, nil},
	[11] = {16, 0, nil},
	[12] = {20, 0, nil},
	[13] = {36, 30, nil},
	[14] = {20, 0, nil},
	[15] = {40, 0, nil},
	[16] = {30, 60, nil},
	[17] = {50, 0, nil},
	[18] = {0, 0, map_hdrop},
};

-- 获取NPC的ID
function get_npc_id(item)
	return item[1];
end

-- 获取NPC的名字
function get_npc_name(item)
	return item[2];
end

-- 获取NPC的级别
function get_npc_level(item)
	return item[3];
end

-- 获取NPC的五行
function get_npc_series(item)
	if (item[4] == -1) then
		return random(0, 4);
	end
	return item[4];
end

-- 当前比赛是否高级比赛
function advanced()
	world = SubWorldIdx2ID(SubWorld);
	return map_isadvanced[world] ~= 0;
end

-- 获取批次数量
function get_batch_count()
	if (advanced()) then
		return getn(map_hnpc);
	end
	return getn(map_lnpc);
end

-- 是否BOSS
function is_boss(item)
	return item[5];
end

-- 获取NPC的数量
function get_npc_count(item)
	return item[6];
end

-- 从文件中读取NPC位置
function get_file_pos(file, line, column)
	x = GetTabFileData(file, line, column);
	y = GetTabFileData(file, line, column + 1);
	return x, y;
end

-- 根据设定创建NPC
function add_npc(item)
	local id = get_npc_id(item);
	local name = get_npc_name(item);
	local level = get_npc_level(item);
	local count = get_npc_count(item);
	local isboss = is_boss(item);
	local series = 0;

	local x = 0;
	local y = 0;
	local index = 0;
	local result = 0;
	
	if (count == 1) then
		x = item[7];
		y = item[8];
		series = get_npc_series(item);
		index = AddNpcEx(id, level, series, SubWorld, x * 32, y * 32, 1, name, isboss);
		if (index > 0) then
			result = count;
			SetNpcDeathScript(index, SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("DragonBoatMission: Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!",
				id, level, series, SubWorld, x, y, 1, name, isboss);
			print(msg);
		end
	elseif (count > 0) then
		local file = map_file[count];
		column = 2 * (random(1, item[7]) - 1) + 1;
		for i = 1, count do
			x, y = get_file_pos(file, i + 1, column);
			series = get_npc_series(item);
			index = AddNpcEx(
				id,			-- ID
				level,		-- 等级
				series,		-- 五行
				SubWorld,	-- 地图
				x * 32,		-- X坐标
				y * 32,		-- Y坐标
				1,			-- 不重生
				name,		-- 名字
				isboss);	-- 是否BOSS
			if (index > 0) then
				result = result + 1;
				SetNpcDeathScript(index, SCRIPT_NPC_DEATH);
			else
				-- DEBUG
				local msg = format("DragonBoatMission: Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!",
					id, level, series, SubWorld, x, y, 1, name, isboss);
				print(msg);
			end
		end
	else
		-- DEBUG
		local msg = "Wrong NpcCount: " .. count;
		print(msg);
	end
	return result;
end

-- 在地图上生成NPC
function create_npc(batch)
	npc = map_lnpc[batch];		-- 初级怪
	world = SubWorldIdx2ID(SubWorld);
	if (map_isadvanced[world] ~= 0) then
		npc = map_hnpc[batch];	-- 高级怪
	end
	
	local times = npc[1];
	local count = 0;
	for i = 1, times do
		count = count + add_npc(npc[i + 1]);
	end
	SetMissionV(VARV_NPC_COUNT, count);
	
	-- DEBUG
	local msg = "出现" .. count .. "con qu竔!";
	Msg2MSAll(MISSION_MATCH, msg);
end
