IncludeLib("RELAYLADDER")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\missions\\boss\\bigboss.lua") -- big boss

MISSION_MATCH			= 22		-- ±ÈÈümission
TIMER_MATCH				= 41		-- ±ÈÈü¿ªÊ¼¶¨Ê±Æ÷
TIMER_BOARD				= 42		-- Í¨¸æ¶¨Ê±Æ÷
TIMER_CLOSE				= 43		-- ±ÈÈü½áÊø¶¨Ê±Æ÷
INTERVAL_BOARD			= 1			-- Í¨±¨¼ä¸ô£¨·ÖÖÓ£©£ºÃ¿·ÖÖÓÍ¨±¨Ò»´Î
INTERVAL_MATCH			= 3600		-- Ã¿Ğ¡Ê±±ÈÈüÒ»´Î£¨Ãë£©
TIME_SIGNUP				= 10
LIMIT_SIGNUP			= TIME_SIGNUP * 60		-- ±¨ÃûÊ±¼äÆÚÏŞ£¨Ãë£©£º10·ÖÖÓ
LIMIT_FINISH 			= 30 * 60	-- ÈÎÎñÊ±¼äÆÚÏŞ£¨Ãë£©£º30·ÖÖÓ
BOAT_POSX				= 1559		-- Íæ¼Ò±»´«ËÍµ½ÁúÖÛµÄx×ø±ê
BOAT_POSY				= 3226		-- Íæ¼Ò±»´«ËÍµ½ÁúÖÛµÄy×ø±ê
LIMIT_PLAYER_COUNT		= 8			-- Íæ¼ÒÊıÁ¿µÄ×î´óÏŞÖÆ
AWARD_COUNT				= 10		-- È«²¿´³¹Ø³É¹¦Ö®ºó¿ÉÒÔ¹Ï·Ö10¸ö´³¹Ø±¦Ïä

SEX_BOY					= 0			-- ÄĞĞÔ
SEX_GIRL				= 1			-- Å®ĞÔ
SEX_RENYAO				= 2			-- ÈËÑı

-- ´³¹Øµ÷Õû 2011.03.04
CHUANGGUAN30_MAP_ID		= 957
CHUANGGUAN30_TIME_LIMIT = 13*60		-- Ç°¶şÊ®¾Å¹ØĞèÒªÌáÔçÍê³ÉµÄÊ±¼ä
CHUANGGUAN30_START_TIME = 10
CHUANGGUAN30_END_TIME	= 22
PLAYER_MAP_TASK			= 2852
COUNT_LIMIT 		= 1



-- NPC±í¸ñÁĞº¬Òå
-- NPC²ÎÊı¸÷ÁĞµÄº¬Òå£ººóĞø´¦Àí¡¢ID¡¢Ãû×Ö¡¢µÈ¼¶¡¢ÎåĞĞ¡¢ÊÇ·ñBOSS(0,1)¡¢ÊıÁ¿¡¢Î»ÖÃ
NPC_ATTRIDX_PROCEED		= 1			-- NPCºóĞø´¦Àí
NPC_ATTRIDX_ID			= 2			-- NPCµÄID
NPC_ATTRIDX_NAME		= 3			-- NPCÃû×Ö
NPC_ATTRIDX_LEVEL		= 4			-- NPCµÈ¼¶
NPC_ATTRIDX_SERIES		= 5			-- NPCÎåĞĞ
NPC_ATTRIDX_ISBOSS		= 6			-- ÊÇ·ñBOSS
NPC_ATTRIDX_COUNT		= 7			-- NPCÊıÁ¿
NPC_ATTRIDX_POSITION	= 8			-- NPCÎ»ÖÃ

USE_NAME_ALL_PLAYERS	= 1			-- Ê¹ÓÃÈ«ÌåÍæ¼ÒÃû×Ö
USE_NAME_THE_TOPLIST	= 2			-- Ê¹ÓÃËæ»ú°ñÉÏÃû

VARS_TEAM_NAME			= 1			-- ¶ÓÎéÃû³Æ
-- ÒÔÏÂ±äÁ¿´Ó(VARS_PLAYER_NAME + 1)µ½(VARS_PLAYER_NAME + LIMIT_PLAYER_COUNT)·Ö±ğ±£´æ²»Í¬Íæ¼ÒµÄÃû×Ö
VARS_PLAYER_NAME		= 2			-- Íæ¼ÒÃû×Ö
VARS_TEAMLEADER_FACTION = 11        -- ¶Ó³¤ÃÅÅÉ
VARS_TEAMLEADER_GENDER  = 12        -- ¶Ó³¤ĞÔ±ğ

VARV_NPC_BATCH 			= 1			-- ¹ÖµÄÅú´Î
VARV_NPC_COUNT 			= 2			-- ¹ÖµÄÊıÁ¿
VARV_PLAYER_COUNT		= 3			-- Íæ¼ÒµÄÊıÁ¿
VARV_STATE 				= 4			-- mission×´Ì¬£¬1±íÊ¾±¨Ãû£¬2±íÊ¾±ÈÈü
VARV_SIGNUP_WORLD		= 5			-- ±¨ÃûµØÍ¼
VARV_SIGNUP_POSX		= 6			-- ±¨ÃûµØµãµÄX×ø±ê
VARV_SIGNUP_POSY		= 7			-- ±¨ÃûµØµãµÄY×ø±ê 
VARV_BOARD_TIMER		= 8			-- ±ÈÈü½øĞĞµÄÊ±¼ä£¨Ãë£©
VARV_PLAYER_TOTAL_COUNT = 9		-- Íæ¼Ò×ÜµÄÊıÁ¿(²»¹ÜÊÇ·ñÒÑ¾­ËÀÍö)
VARV_PLAYER_USE_INDEX	= 10		-- Ê¹ÓÃµ½µÄÍæ¼ÒË÷Òı
VARV_NPC_USE_INDEX		= 11		-- Ê¹ÓÃµ½µÄºòÑ¡NPCË÷Òı
VARV_MISSION_RESULT		= 12		-- ÈÎÎñ½á¹û£¬£±ÎªÊ¤ÀûÍ¨¹Ø£¬£°ÎªÊ§°Ü
VARV_PLAYER_SEX			= 13
-- ÒÔÏÂ±äÁ¿´Ó(VARV_PLAYER_SEX + 1)µ½(VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT)·Ö±ğ±£´æ²»Í¬Íæ¼ÒµÄĞÔ±ğ£¬£°ÎªÄĞĞÔ£¬£±ÎªÅ®ĞÔ£¬£²ÎªÈËÑı
VARV_PLAYER_SERIES		= VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT + 1		-- 22


VARV_XIAONIESHICHEN_BATCH = 31		-- Ğ¡Äôß±³¾³öÏÖµÄ¹Ø
VARV_BATCH_MODEL		= 32			-- µ±Ç°´³¹ØµÄÄ£Ê½£¬0ÎªÕı³£Ä£Ê½£¬1Îªµ÷ÕûÖ®ºóµÄÄ£Ê½


-- ÒÔÏÂ±äÁ¿´Ó(VARV_PLAYER_SERIES + 1)µ½(VARV_PLAYER_SERIES + LIMIT_PLAYER_COUNT)·Ö±ğ±£´æ²»Í¬Íæ¼ÒµÄÎåĞĞ

SCRIPT_NPC_DEATH 	= "\\script\\missions\\challengeoftime\\npc_death.lua"
SCRIPT_PLAYER_DEATH = "\\script\\missions\\challengeoftime\\player_death.lua"

-- ±ÈÈüµØÍ¼ID
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

-- ¶ÔÓ¦µØÍ¼ÊÇ·ñ¸ß¼¶±ÈÈü
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


-- ÎåĞĞ
map_series = {
	0,	-- ½ğ
	1,	-- Ä¾
	2,	-- Ë®
	3,	-- »ğ
	4	-- ÍÁ
};

-- ºòÑ¡NPCµÄÃû×Ö
map_npcname_candidates = {
	"HËu  KhÊt KiÕm",
	"§iªu DŞch §ao",
	"KiÒu §Ønh Thiªn",
	"NhËm Th­¬ng Khung",
	"Bé Hiªu TrÇn",
	"MËu TuÊt Nhung",
	"H¹ng Phï Nhai"
};

-- ¹ã²¥
function broadcast(msg)
	AddGlobalNews(msg);
end

-- °ÑÍæ¼ÒÌß»Ø±¨Ãûµã
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

-- Æô¶¯Í¨¸æ¶¨Ê±Æ÷
function start_board_timer()
	StartMissionTimer(MISSION_MATCH, TIMER_BOARD, INTERVAL_BOARD * 60 * 18);
end

-- ¹Ø±ÕÍ¨¸æ¶¨Ê±Æ÷
function close_board_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_BOARD);
end

-- Æô¶¯±ÈÈü¹Ø±Õ¶¨Ê±Æ÷
function start_close_timer()
	-- 10·ÖÖÓºóÆô¶¯±ÈÈüÈÎÎñ
	StartMissionTimer(MISSION_MATCH, TIMER_CLOSE, LIMIT_FINISH * 18);
end

-- ¹Ø±Õ±ÈÈü¹Ø±Õ¶¨Ê±Æ÷
function close_close_timer()
	-- 10·ÖÖÓºóÆô¶¯±ÈÈüÈÎÎñ
	StopMissionTimer(MISSION_MATCH, TIMER_CLOSE);
end

-- ½áÊø±ÈÈü
function close_match()
	-- °ÑÍæ¼ÒÌß³öµØÍ¼
	kickout();
	
	-- ÇåÀíµØÍ¼
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- Ò²ÇåÀíÍæ¼Ò
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- »ñÈ¡Íæ¼Ò¼¯ºÏ
function get_player_map()
	-- Íæ¼Ò¼¯ºÏ
	local players = {};
		
	-- ±éÀúÃ¿¸ö¶ÓÔ±£¬°ÑÍæ¼ÒĞÅÏ¢´æÈë¼¯ºÏ
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
					GetName(),		-- Íæ¼ÒÃû×Ö
					GetSex(),		-- Íæ¼ÒĞÔ±ğ
					GetSeries()}; 	-- Íæ¼ÒÎåĞĞ
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

-- ´ÓÒ»¸ö±íÖĞÉ¾³ıÒ»¸öÔªËØ£¬·µ»ØĞÂ±í
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

-- °ÑÍæ¼ÒĞÕÃû¡¢ĞÔ±ğ±£´æÔÚmission±äÁ¿ÖĞ
function save_player_info()
	local players = get_player_map();
	-- DEBUG
	--print(format("We got %d players", getn(players)));
	for index = 1,getn(players) do
		-- Ëæ»úÅÅĞò
		-- players = remove_element(players, random(1, getn(players)));
		SetMissionS(VARS_PLAYER_NAME + index, players[index][1]);	-- Ãû×Ö
		SetMissionV(VARV_PLAYER_SEX + index, players[index][2]);	-- ĞÔ±ğ
		SetMissionV(VARV_PLAYER_SERIES + index, players[index][3]);	-- ÎåĞĞ
		-- DEBUG
		--print(format("SetMissionS(%d, %s)", VARS_PLAYER_NAME + index, players[index][1]));	-- Ãû×Ö
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SEX + index, players[index][2]));	-- ĞÔ±ğ
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SERIES + index, players[index][3]));	-- ÎåĞĞ
	end
	
	-- Íæ¼Ò×ÜÊı
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

-- ¸ù¾İĞÔ±ğËæ»ú»ñÈ¡NPCµÄID
function get_random_npc_id(sex)
	if (sex ~= 0 and sex ~= 1) then
		-- ÈËÑı¸ÃÔõÃ´´¦Àí£¿
		return nil;
	end

	local range_id = lo_range_id;
	if (advanced()) then
		range_id = hi_range_id;
	end
	return random(range_id[sex + 1][1], range_id[sex + 1][2]);
end

-- ´ÓÎÄ¼şÖĞ¶ÁÈ¡NPCÎ»ÖÃ
function get_file_pos(file, line, column)
	x = GetTabFileData(file, line, column);
	y = GetTabFileData(file, line, column + 1);
	return x, y;
end

function func_npc_getid(item, index)
	-- »ñÈ¡µ±Ç°Ê¹ÓÃµÄÍæ¼ÒË÷Òı
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	local player_sex = GetMissionV(VARV_PLAYER_SEX + player_use_index);	
		
	-- Èç¹ûÍæ¼ÒÊıÄ¿²»×ã£¬ÔòËæ»ú²úÉúÄĞĞÔNPCµÄID
	local result = 0;
	if (player_use_index > player_all_count) then
		result = get_random_npc_id(0);
	else
		-- ¸ù¾İÊ¹ÓÃµÄÍæ¼ÒË÷Òı»ñÈ¡µ±Ç°Íæ¼ÒĞÔ±ğ
		result = get_random_npc_id(player_sex);
	end

	-- DEBUG
	--print(format("func_npc_getid():%d, player_use_index:%d, player_all_count:%d, player_sex:%d",
	--	result, player_use_index, player_all_count, player_sex));
	return result;
end

function func_npc_getname(item, index)
	-- »ñÈ¡µ±Ç°Ê¹ÓÃµÄÍæ¼ÒË÷Òı
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- DEBUG
	--print(format("func_npc_getname(), player_use_index:%d, player_all_count:%d",
	--	player_use_index, player_all_count));
	
	-- Èç¹ûÍæ¼ÒÊıÄ¿²»×ã£¬ÔòÒÀ´ÎÊ¹ÓÃºòÑ¡NPCÃû×Ö
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
		-- ¸ù¾İÊ¹ÓÃµÄÍæ¼ÒË÷Òı»ñÈ¡Ãû×Ö
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
	
	-- Ëæ»ú»ñÈ¡ÅÅĞĞ°ñÍæ¼ÒÃû×Ö
	local name, data = Ladder_GetLadderInfo(map[2], random(1, 10));
	if (name ~= nil and name ~= "") then
		return name;
	end
	
	-- Ëæ»úÊ¹ÓÃºòÑ¡NPCÃû×Ö
	local pos = random(1, getn(map_npcname_candidates));
	return map_npcname_candidates[pos];
end

-- NPCÊ¹ÓÃÈ«ÌåÍæ¼ÒµÄÃû×Ö
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
	-- »ñÈ¡µ±Ç°Ê¹ÓÃµÄÍæ¼ÒË÷Òı
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- Èç¹ûÍæ¼ÒÊıÄ¿²»×ã£¬ÔòËæ»ú²úÉúÎåĞĞ
	if (player_use_index > player_all_count) then
		local index = random(1, getn(map_series));
		return map_series[index];
	else
		-- ¸ù¾İÊ¹ÓÃµÄÍæ¼ÒË÷Òı»ñÈ¡ÎåĞĞ
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
	local file_name = file[1];	-- ×ø±êÎÄ¼şÃû
	local pos_count = file[2];	-- ×ø±êÁĞÊıÁ¿
	
	local column = 2 * (random(1, pos_count) - 1) + 1;
	return get_file_pos(file_name, index + 1, column);
end

function func_npc_proceed(item)
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX);
	SetMissionV(VARV_PLAYER_USE_INDEX, player_use_index + 1);
end

-- ½±ÀøÎïÆ·
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
	Msg2Player("<#>B¹n ®¹t ®­îc" .. name .. "!");
	
	PlayerIndex = old_index;
end

-- ½±ÀøËæ»úÎïÆ·
function award_random_object(objects, player_index)
	local base = objects[1];		-- Ëæ»ú»ùÊıÔÚµÚÒ»¸öÎ»ÖÃ
	local sum = 0;
	local num = random(1, base);
	for i = 2, getn(objects) do		-- Ëæ»úÎïÆ·´ÓµÚ¶ş¸öÎ»ÖÃ¿ªÊ¼
		local odds = objects[i][1];
		local item = objects[i][2];
		sum = sum + odds * base;
		if (num <= sum) then
			award_item(item, player_index);
			break;
		end
	end
end

