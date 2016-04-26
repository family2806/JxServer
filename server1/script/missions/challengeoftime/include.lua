IncludeLib("RELAYLADDER")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\missions\\boss\\bigboss.lua") -- big boss

MISSION_MATCH			= 22		-- 比赛mission
TIMER_MATCH				= 41		-- 比赛开始定时器
TIMER_BOARD				= 42		-- 通告定时器
TIMER_CLOSE				= 43		-- 比赛结束定时器
INTERVAL_BOARD			= 1			-- 通报间隔（分钟）：每分钟通报一次
INTERVAL_MATCH			= 3600		-- 每小时比赛一次（秒）
TIME_SIGNUP				= 10
LIMIT_SIGNUP			= TIME_SIGNUP * 60		-- 报名时间期限（秒）：10分钟
LIMIT_FINISH 			= 30 * 60	-- 任务时间期限（秒）：30分钟
BOAT_POSX				= 1559		-- 玩家被传送到龙舟的x坐标
BOAT_POSY				= 3226		-- 玩家被传送到龙舟的y坐标
LIMIT_PLAYER_COUNT		= 8			-- 玩家数量的最大限制
AWARD_COUNT				= 10		-- 全部闯关成功之后可以瓜分10个闯关宝箱

SEX_BOY					= 0			-- 男性
SEX_GIRL				= 1			-- 女性
SEX_RENYAO				= 2			-- 人妖

-- 闯关调整 2011.03.04
CHUANGGUAN30_MAP_ID		= 957
CHUANGGUAN30_TIME_LIMIT = 13*60		-- 前二十九关需要提早完成的时间
CHUANGGUAN30_START_TIME = 10
CHUANGGUAN30_END_TIME	= 22
PLAYER_MAP_TASK			= 2852
COUNT_LIMIT 		= 1



-- NPC表格列含义
-- NPC参数各列的含义：后续处理、ID、名字、等级、五行、是否BOSS(0,1)、数量、位置
NPC_ATTRIDX_PROCEED		= 1			-- NPC后续处理
NPC_ATTRIDX_ID			= 2			-- NPC的ID
NPC_ATTRIDX_NAME		= 3			-- NPC名字
NPC_ATTRIDX_LEVEL		= 4			-- NPC等级
NPC_ATTRIDX_SERIES		= 5			-- NPC五行
NPC_ATTRIDX_ISBOSS		= 6			-- 是否BOSS
NPC_ATTRIDX_COUNT		= 7			-- NPC数量
NPC_ATTRIDX_POSITION	= 8			-- NPC位置

USE_NAME_ALL_PLAYERS	= 1			-- 使用全体玩家名字
USE_NAME_THE_TOPLIST	= 2			-- 使用随机榜上名

VARS_TEAM_NAME			= 1			-- 队伍名称
-- 以下变量从(VARS_PLAYER_NAME + 1)到(VARS_PLAYER_NAME + LIMIT_PLAYER_COUNT)分别保存不同玩家的名字
VARS_PLAYER_NAME		= 2			-- 玩家名字
VARS_TEAMLEADER_FACTION = 11        -- 队长门派
VARS_TEAMLEADER_GENDER  = 12        -- 队长性别

VARV_NPC_BATCH 			= 1			-- 怪的批次
VARV_NPC_COUNT 			= 2			-- 怪的数量
VARV_PLAYER_COUNT		= 3			-- 玩家的数量
VARV_STATE 				= 4			-- mission状态，1表示报名，2表示比赛
VARV_SIGNUP_WORLD		= 5			-- 报名地图
VARV_SIGNUP_POSX		= 6			-- 报名地点的X坐标
VARV_SIGNUP_POSY		= 7			-- 报名地点的Y坐标 
VARV_BOARD_TIMER		= 8			-- 比赛进行的时间（秒）
VARV_PLAYER_TOTAL_COUNT = 9		-- 玩家总的数量(不管是否已经死亡)
VARV_PLAYER_USE_INDEX	= 10		-- 使用到的玩家索引
VARV_NPC_USE_INDEX		= 11		-- 使用到的候选NPC索引
VARV_MISSION_RESULT		= 12		-- 任务结果，１为胜利通关，０为失败
VARV_PLAYER_SEX			= 13
-- 以下变量从(VARV_PLAYER_SEX + 1)到(VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT)分别保存不同玩家的性别，０为男性，１为女性，２为人妖
VARV_PLAYER_SERIES		= VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT + 1		-- 22


VARV_XIAONIESHICHEN_BATCH = 31		-- 小聂弑尘出现的关
VARV_BATCH_MODEL		= 32			-- 当前闯关的模式，0为正常模式，1为调整之后的模式


-- 以下变量从(VARV_PLAYER_SERIES + 1)到(VARV_PLAYER_SERIES + LIMIT_PLAYER_COUNT)分别保存不同玩家的五行

SCRIPT_NPC_DEATH 	= "\\script\\missions\\challengeoftime\\npc_death.lua"
SCRIPT_PLAYER_DEATH = "\\script\\missions\\challengeoftime\\player_death.lua"

-- 比赛地图ID
map_map = {
	464,
	465,
	466,
	467,
	468,
	469,
	470,
	471,
	472,
	473,
	474,
	475,
	476,
	477,
	478,
	479,
	
	480,
	481,
	482,
	483,
	484,
	485,
	486,
	487,
	488,
	489,
	490,
	491,
	492,
	493,
	494,
	495
};

-- 对应地图是否高级比赛
map_isadvanced = {
	[464] = 0,
	[465] = 0,
	[466] = 0,
	[467] = 0,
	[468] = 0,
	[469] = 0,
	[470] = 0,
	[471] = 0,
	[472] = 0,
	[473] = 0,
	[474] = 0,
	[475] = 0,
	[476] = 0,
	[477] = 0,
	[478] = 0,
	[479] = 0,
	
	[480] = 1,
	[481] = 1,
	[482] = 1,
	[483] = 1,
	[484] = 1,
	[485] = 1,
	[486] = 1,
	[487] = 1,
	[488] = 1,
	[489] = 1,
	[490] = 1,
	[491] = 1,
	[492] = 1,
	[493] = 1,
	[494] = 1,
	[495] = 1
};


-- 五行
map_series = {
	0,	-- 金
	1,	-- 木
	2,	-- 水
	3,	-- 火
	4	-- 土
};

-- 候选NPC的名字
map_npcname_candidates = {
	"候乞剑",
	"刁易刀",
	"乔鼎天",
	"任苍穹",
	"步嚣尘",
	"戊戌戎",
	"项浮崖"
};

-- 广播
function broadcast(msg)
	AddGlobalNews(msg);
end

-- 把玩家踢回报名点
function kickout()
	local index = 0;
	local player = 0;
	local players = {}
	local i = 1
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			players[i] = player
			i = i + 1
		end
		if (index == 0) then
			break;
		end	
	end
	
	local world = GetMissionV(VARV_SIGNUP_WORLD);
	local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	local OldPlayerIndex = PlayerIndex;
	for i = 1, getn(players) do 
		PlayerIndex = players[i];
		
		DelMSPlayer(MISSION_MATCH,1);
		SetLogoutRV(0);
		NewWorld(world, pos_x, pos_y);
	end
	PlayerIndex = OldPlayerIndex;
end

-- 启动通告定时器
function start_board_timer()
	StartMissionTimer(MISSION_MATCH, TIMER_BOARD, INTERVAL_BOARD * 60 * 18);
end

-- 关闭通告定时器
function close_board_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_BOARD);
end

-- 启动比赛关闭定时器
function start_close_timer()
	-- 10分钟后启动比赛任务
	StartMissionTimer(MISSION_MATCH, TIMER_CLOSE, LIMIT_FINISH * 18);
end

-- 关闭比赛关闭定时器
function close_close_timer()
	-- 10分钟后启动比赛任务
	StopMissionTimer(MISSION_MATCH, TIMER_CLOSE);
end

-- 结束比赛
function close_match()
	-- 把玩家踢出地图
	kickout();
	
	-- 清理地图
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- 也清理玩家
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- 获取玩家集合
function get_player_map()
	-- 玩家集合
	local players = {};
		
	-- 遍历每个队员，把玩家信息存入集合
	local index = 0;
	local player = 0;
	local player_count = 0;
	local old_index = PlayerIndex;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			player_count = player_count + 1;
			if (player_count > LIMIT_PLAYER_COUNT) then
				print(format("Mission player count exceed the limit %d!!!", LIMIT_PLAYER_COUNT));
				break;
			else
				-- DEBUG
				--print(format("player[%d]'s index:%d", player_count, player));
				PlayerIndex = player;
				players[player_count] = {
					GetName(),		-- 玩家名字
					GetSex(),		-- 玩家性别
					GetSeries()}; 	-- 玩家五行
				-- DEBUG
				--print(format("players[%d], index:%d, name:%s, sex:%d, series:%d",
				--	player_count,
				--	player,
				--	GetName(),
				--	GetSex(),
				--	GetSeries()));
			end
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = old_index;
	
	-- DEBUG
	--print(format("Now, we have %d players", getn(players)));

	return players;
end

-- 从一个表中删除一个元素，返回新表
function remove_element(map, index)
	local result = {};
	local count = 1;
	for i = 1, getn(map) do
		if (i ~= index) then
			result[count] = map[i];
			count = count + 1;
		end
	end
	return result;
end

-- 把玩家姓名、性别保存在mission变量中
function save_player_info()
	local players = get_player_map();
	-- DEBUG
	--print(format("We got %d players", getn(players)));
	for index = 1,getn(players) do
		-- 随机排序
		-- players = remove_element(players, random(1, getn(players)));
		SetMissionS(VARS_PLAYER_NAME + index, players[index][1]);	-- 名字
		SetMissionV(VARV_PLAYER_SEX + index, players[index][2]);	-- 性别
		SetMissionV(VARV_PLAYER_SERIES + index, players[index][3]);	-- 五行
		-- DEBUG
		--print(format("SetMissionS(%d, %s)", VARS_PLAYER_NAME + index, players[index][1]));	-- 名字
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SEX + index, players[index][2]));	-- 性别
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SERIES + index, players[index][3]));	-- 五行
	end
	
	-- 玩家总数
	SetMissionV(VARV_PLAYER_TOTAL_COUNT, getn(players));
	SetMissionV(VARV_PLAYER_USE_INDEX, 0);
end

lo_range_id = {
	{994, 1001},
	{1002, 1005}
};

hi_range_id = {
	{1026, 1033},
	{1034, 1037}
};

-- 根据性别随机获取NPC的ID
function get_random_npc_id(sex)
	if (sex ~= 0 and sex ~= 1) then
		-- 人妖该怎么处理？
		return nil;
	end

	local range_id = lo_range_id;
	if (advanced()) then
		range_id = hi_range_id;
	end
	return random(range_id[sex + 1][1], range_id[sex + 1][2]);
end

-- 从文件中读取NPC位置
function get_file_pos(file, line, column)
	x = GetTabFileData(file, line, column);
	y = GetTabFileData(file, line, column + 1);
	return x, y;
end

function func_npc_getid(item, index)
	-- 获取当前使用的玩家索引
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	local player_sex = GetMissionV(VARV_PLAYER_SEX + player_use_index);	
		
	-- 如果玩家数目不足，则随机产生男性NPC的ID
	local result = 0;
	if (player_use_index > player_all_count) then
		result = get_random_npc_id(0);
	else
		-- 根据使用的玩家索引获取当前玩家性别
		result = get_random_npc_id(player_sex);
	end

	-- DEBUG
	--print(format("func_npc_getid():%d, player_use_index:%d, player_all_count:%d, player_sex:%d",
	--	result, player_use_index, player_all_count, player_sex));
	return result;
end

function func_npc_getname(item, index)
	-- 获取当前使用的玩家索引
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- DEBUG
	--print(format("func_npc_getname(), player_use_index:%d, player_all_count:%d",
	--	player_use_index, player_all_count));
	
	-- 如果玩家数目不足，则依次使用候选NPC名字
	local result = "";
	if (player_use_index > player_all_count) then
		local npc_use_index = GetMissionV(VARV_NPC_USE_INDEX) + 1;
		if (npc_use_index > getn(map_npcname_candidates)) then
			npc_use_index = 1;
		end
		SetMissionV(VARV_NPC_USE_INDEX, npc_use_index);
		-- DEBUG
		--print(format("func_npc_getname(), npc_use_index:%d", npc_use_index));
		result = map_npcname_candidates[npc_use_index];
	else
		-- 根据使用的玩家索引获取名字
		result = GetMissionS(VARS_PLAYER_NAME + player_use_index);
	end
	
	-- DEBUG
	--print(format("func_npc_getname():%s", result));
	return result;
end

function func_ladder_getname(item, index)
	local map = item[NPC_ATTRIDX_NAME];
	if (type(map) ~= "table") then
		-- DEBUG
		--print("func_ladder_getname() fail!!!");
		return nil;
	end
	
	-- 随机获取排行榜玩家名字
	local name, data = Ladder_GetLadderInfo(map[2], random(1, 10));
	if (name ~= nil and name ~= "") then
		return name;
	end
	
	-- 随机使用候选NPC名字
	local pos = random(1, getn(map_npcname_candidates));
	return map_npcname_candidates[pos];
end

-- NPC使用全体玩家的名字
function func_npc_get_eachname(item, index)
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	if (index <= player_all_count) then
		return GetMissionS(VARS_PLAYER_NAME + index);
	else
		local count = getn(map_npcname_candidates);
		local pos = mod(index - player_all_count, count);
		if (pos == 0) then
			pos = count;
		end
		return map_npcname_candidates[pos];
	end
end

function func_npc_getseries(item, index)
	-- 获取当前使用的玩家索引
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- 如果玩家数目不足，则随机产生五行
	if (player_use_index > player_all_count) then
		local index = random(1, getn(map_series));
		return map_series[index];
	else
		-- 根据使用的玩家索引获取五行
		return GetMissionV(VARV_PLAYER_SERIES + player_use_index);
	end
end

function func_npc_getpos(item, index)
	local pos = item[NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type ~= "function") then
		return nil;
	end
	
	local func = pos;
	local file = map_posfiles[item[NPC_ATTRIDX_COUNT]];
	local file_name = file[1];	-- 坐标文件名
	local pos_count = file[2];	-- 坐标列数量
	
	local column = 2 * (random(1, pos_count) - 1) + 1;
	return get_file_pos(file_name, index + 1, column);
end

function func_npc_proceed(item)
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX);
	SetMissionV(VARV_PLAYER_USE_INDEX, player_use_index + 1);
end

-- 奖励物品
function award_item(item, player_index)
	local old_index = PlayerIndex;
	PlayerIndex = player_index;
	
	local name = item[1];
	if (getn(item) == 2) then
		AddEventItem(item[2]);
	elseif (getn(item) == 3) then
		AddGoldItem(item[2], item[3]);
	elseif (getn(item) == 7) then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	Msg2Player("<#>你得到" .. name .. "!");
	
	PlayerIndex = old_index;
end

-- 奖励随机物品
function award_random_object(objects, player_index)
	local base = objects[1];		-- 随机基数在第一个位置
	local sum = 0;
	local num = random(1, base);
	for i = 2, getn(objects) do		-- 随机物品从第二个位置开始
		local odds = objects[i][1];
		local item = objects[i][2];
		sum = sum + odds * base;
		if (num <= sum) then
			award_item(item, player_index);
			break;
		end
	end
end

