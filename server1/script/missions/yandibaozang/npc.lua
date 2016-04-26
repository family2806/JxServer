-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..


Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")

-- 怪物数量<=>位置文件
YDBZ_map_posfiles = {
	[1]={	--前10关怪的三路的坐标点
		[1] = {
			[1] = {"\\settings\\maps\\yandibaozang\\waya_01.txt", 1},	
			[2] = {"\\settings\\maps\\yandibaozang\\waya_02.txt", 1},
			[3] = {"\\settings\\maps\\yandibaozang\\waya_03.txt", 1},	
			[4] = {"\\settings\\maps\\yandibaozang\\waya_04.txt", 1},
			[5] = {"\\settings\\maps\\yandibaozang\\waya_05.txt", 1},	
			[6] = {"\\settings\\maps\\yandibaozang\\waya_06.txt", 1},
			[7] = {"\\settings\\maps\\yandibaozang\\waya_07.txt", 1},	
			[8] = {"\\settings\\maps\\yandibaozang\\waya_08.txt", 1},
			[9] = {"\\settings\\maps\\yandibaozang\\waya_09.txt", 1},	
			[10]= {"\\settings\\maps\\yandibaozang\\waya_10.txt", 1},	
		},
		[2] = {
			[1] = {"\\settings\\maps\\yandibaozang\\wayb_01.txt", 1},	
			[2] = {"\\settings\\maps\\yandibaozang\\wayb_02.txt", 1},
			[3] = {"\\settings\\maps\\yandibaozang\\wayb_03.txt", 1},	
			[4] = {"\\settings\\maps\\yandibaozang\\wayb_04.txt", 1},
			[5] = {"\\settings\\maps\\yandibaozang\\wayb_05.txt", 1},	
			[6] = {"\\settings\\maps\\yandibaozang\\wayb_06.txt", 1},
			[7] = {"\\settings\\maps\\yandibaozang\\wayb_07.txt", 1},	
			[8] = {"\\settings\\maps\\yandibaozang\\wayb_08.txt", 1},
			[9] = {"\\settings\\maps\\yandibaozang\\wayb_09.txt", 1},	
			[10]= {"\\settings\\maps\\yandibaozang\\wayb_10.txt", 1},		
		},
		[3] = {
			[1] = {"\\settings\\maps\\yandibaozang\\wayc_01.txt", 1},	
			[2] = {"\\settings\\maps\\yandibaozang\\wayc_02.txt", 1},
			[3] = {"\\settings\\maps\\yandibaozang\\wayc_03.txt", 1},	
			[4] = {"\\settings\\maps\\yandibaozang\\wayc_04.txt", 1},
			[5] = {"\\settings\\maps\\yandibaozang\\wayc_05.txt", 1},	
			[6] = {"\\settings\\maps\\yandibaozang\\wayc_06.txt", 1},
			[7] = {"\\settings\\maps\\yandibaozang\\wayc_07.txt", 1},	
			[8] = {"\\settings\\maps\\yandibaozang\\wayc_08.txt", 1},
			[9] = {"\\settings\\maps\\yandibaozang\\wayc_09.txt", 1},	
			[10]= {"\\settings\\maps\\yandibaozang\\wayc_10.txt", 1},		
		},
	},
	[2] = {--中间争夺地带boss坐标点
		[1] = {"\\settings\\maps\\yandibaozang\\wayfinial.txt", 1},			
	},
};

-- NPC的ID可以为三种类型：数字、表格、函数
-- NPC参数各列的含义：<NPC类型数量>, <奖励>, <后续处理、ID、名字、等级、五行、是否BOSS(0,1)、数量、位置>
--位置table {x,y,nway} nway代表哪关,1-10代表A队的10关,11-20代表B队的10关,21-30代表C队的10关
-- 怪物
YDBZ_map_npc = {
	-- 1
	{
		{nil, 1299, "门第天王帮", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1289, "古天却", 95, 0, 1, 1, func_npc_getpos}
	},
	-- 2
	{
		{nil, 1300, " 少林弟子", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1290, "证语", 95, 0, 1, 1, func_npc_getpos}
	},
	-- 3
	{
		{nil, 1301, "五毒教徒", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1291, "照日冕", 95, 1, 1, 1, func_npc_getpos}
	},
	-- 4
	{
		{nil, 1302, "唐门弟子", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1292, "唐浩", 95, 1, 1, 1, func_npc_getpos}
	},
	-- 5
	{
		{nil, 1303, "峨眉弟子", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1293, "妙一", 95, 2, 1, 1, func_npc_getpos}
	},
	-- 6
	{
		{nil, 1304, "翠烟弟子", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1294, "黎哲梅", 95, 2, 1, 1, func_npc_getpos}
	},
	-- 7
	{
		{nil, 1305, "天忍教徒", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1295, "端木离", 95, 3, 1, 1, func_npc_getpos}
	},
	-- 8
	{
		{nil, 1306, "丐帮弟子", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1296, "白狼", 95, 3, 1, 1, func_npc_getpos}
	},
	-- 9
	{
		{nil, 1307, "武当弟子", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1297, "秦晓书", 95, 4, 1, 1, func_npc_getpos}
	},
	-- 10
	{
		{nil, 1308, "昆仑弟子", 95, -1, 0, 60, func_npc_getpos},
		{nil, 1298, "凌霄子", 95, 4, 1, 1, func_npc_getpos}
	},
};

--n路线,m关 boss
YDBZ_map_npcBossEx = 
{
	[1] = 
	{
		[3] = {nil, 1310, "古天却(怒)", 95, 0, 1, 1, func_npc_getpos},
		[6] = {nil, 1312, "照日冕(怒)",  95, 1, 1, 1, func_npc_getpos},
	},
	[2] = 
	{
		[3] = {nil, 1317, "白狼 (怒)",  95, 3, 1, 1, func_npc_getpos},
		[6] = {nil, 1314, "妙一 (怒)",  95, 2, 1, 1, func_npc_getpos},
	},
	[3] =
	{
		[3] = {nil, 1318, "秦晓书(怒)",  95, 4, 1, 1, func_npc_getpos},
		[6] = {nil, 1319, "凌霄子(怒)",  95, 4, 1, 1, func_npc_getpos},
	},
}

YDBZ_map_npcYuanJun =
{
	{nil, 1338, "佣兵", 90, -1, 1, 5, func_npc_getpos},
}
--位置table {x,y,nway} nway代表哪关,40-代表争夺点boss
YDBZ_map_npcboss = {
	{nil, 1311, "正语(怒)",  95, 0, 1, 1, func_npc_getpos},
	{nil, 1313, "唐浩(怒)",  95, 1, 1, 1, func_npc_getpos},
	{nil, 1315, "黎哲梅(怒)",  95, 2, 1, 1, func_npc_getpos},
	{nil, 1316, "端木离(怒)",  95, 3, 1, 1, func_npc_getpos},
}

YDBZ_map_npcfinal = {
	{nil, 1309, "梁眉儿", 95, -1, 1, 1, func_npc_getpos},
}

-- 获取NPC的ID
function YDBZ_get_npc_id(item, index)
	local id = item[YDBZ_NPC_ATTRIDX_ID];
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
function YDBZ_get_npc_name(item, index)
	local name = item[YDBZ_NPC_ATTRIDX_NAME];
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
function YDBZ_get_npc_level(item, index)
	-- DEBUG
--	print(format("get_npc_level():%d", item[NPC_ATTRIDX_LEVEL]));
	return item[YDBZ_NPC_ATTRIDX_LEVEL];
end

-- 获取NPC的五行
function YDBZ_get_npc_series(item, index)
	local series = item[YDBZ_NPC_ATTRIDX_SERIES];
	local series_type = type(series);
	if (series_type == "function") then
		return series(item, index);
	elseif (series_type == "number") then
		if (series < 0) then
			local pos = random(1, getn(YDBZ_map_series));
			return YDBZ_map_series[pos];
		else
			return series;
		end
	else
		return nil;
	end
end

-- NPC的后续处理（累加当前使用的玩家索引）
function YDBZ_npc_proceed(item)
	local proceed = item[YDBZ_NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		YDBZ_proceed(item);
	end
end

-- 获取NPC的数量
function YDBZ_get_npc_count(item)
	return item[YDBZ_NPC_ATTRIDX_COUNT];
end

-- 获取NPC的位置
function YDBZ_get_npc_pos(item, index,nnpclist)
	local pos = item[YDBZ_NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type == "function") then
		return pos(item, index,nnpclist);
	else
		return nil;
	end
end

-- 是否BOSS
function YDBZ_get_npc_isboss(item,index)
	return item[YDBZ_NPC_ATTRIDX_ISBOSS];
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
function YDBZ_add_npc(file,nteams,nway,nstate)
	local file_name = file[1];	-- 坐标文件名
	local pos_count = file[2];	-- 坐标列数量
	local column = 2 * (random(1, pos_count) - 1) + 1;
	local ntype = GetMissionV(YDBZ_NPC_TYPE[nteams][nway])
		local	items = YDBZ_map_npc[ntype]
	--for npcitem=1,getn(items) do
		local item = items[nstate]
		if nstate == 21 then
			item = YDBZ_map_npcBossEx[nteams][nway]
		end
		local npc_count = YDBZ_get_npc_count(item);			-- NPC数量
		local res_count = 0;							-- 产生的NPC数量
		local radomitem = {}
		
		local npc_create_point = YDBZ_GetTabFileHeight(file_name) - 1
		local nlistsum = 0 
		if npc_create_point < npc_count then
			nlistsum = npc_count
		else
			nlistsum = npc_create_point
		end
		for i=1,nlistsum do
			if i > npc_create_point then
				radomitem[i] = random(1,npc_create_point)
			else
				radomitem[i] = i
			end
		end
	  radomitem = YDBZ_get_randomlist(radomitem,nlistsum)
		for index = 1, npc_count do
			local id = YDBZ_get_npc_id(item, index);			-- NPC的ID
			local level = YDBZ_get_npc_level(item, index);	-- NPC等级
			local isboss = YDBZ_get_npc_isboss(item, index);	-- 是否boss
			local series = YDBZ_get_npc_series(item, index);
			local name = YDBZ_get_npc_name(item, index);
			
			--print(nteams.." way:"..nway.."callnpc:"..radomitem[index])
			local px,py = YDBZ_get_file_pos(file_name, radomitem[index] + 1, column);
			YDBZ_npc_proceed(item);
			
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
				px ,	-- X坐标
				py ,	-- Y坐标
				1,			-- 不重生
				name,		-- 名字
				isboss);	-- 是否BOSS
			if (npc_index ~= nil and npc_index > 0) then
				res_count = res_count + 1;
				-- 设置死亡脚本
				if isboss == 1 and ( nstate == 2 or nstate == 21 ) then
					SetNpcParam(npc_index,1,((nteams-1)*10 + nway))
				else
					SetNpcParam(npc_index,1,0)
					SetNpcParam(npc_index,2,(nteams-1)*10 + ntype)
				end
				SetNpcDeathScript(npc_index, YDBZ_SCRIPT_NPC_DEATH);
			else
				-- DEBUG
				local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
					id, level, series, SubWorld, px/32, py/32, 1, name, isboss);
				print(msg);
			end
			--print("产怪数量："..res_count)
		end
	--end
end

function YDBZ_add_npcboss(file,nway)
	local file_name = file[1];	-- 坐标文件名
	local pos_count = file[2];	-- 坐标列数量
	local column = 2 * (random(1, pos_count) - 1) + 1;
	local radomlist = {}
	local radsum = getn(YDBZ_map_npcboss)
	for i=1,radsum do
			radomlist[i] = i
	end
	radomlist = YDBZ_get_randomlist(radomlist,radsum)
	for index=1,radsum do
		local item = YDBZ_map_npcboss[radomlist[index]]
		local npc_count = YDBZ_get_npc_count(item);			-- NPC数量
		local res_count = 0;							-- 产生的NPC数量
		local id = YDBZ_get_npc_id(item, index);			-- NPC的ID
		local level = YDBZ_get_npc_level(item, index);	-- NPC等级
		local isboss = YDBZ_get_npc_isboss(item, index);	-- 是否boss
		local series = YDBZ_get_npc_series(item, index);
		local name = YDBZ_get_npc_name(item, index);
		local px,py = YDBZ_get_file_pos(file_name, index + 1, column);
		YDBZ_npc_proceed(item);
		
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
			px ,	-- X坐标
			py ,	-- Y坐标
			1,			-- 不重生
			name,		-- 名字
			isboss);	-- 是否BOSS
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- 设置死亡脚本
			if isboss == 1 then
				SetNpcParam(npc_index,1,40)
				local nsum = GetMissionV(YDBZ_NPC_BOSS_COUNT)
				SetMissionV(YDBZ_NPC_BOSS_COUNT,(nsum+1))
			end
			SetNpcDeathScript(npc_index, YDBZ_SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
end

function YDBZ_add_final_npc(world,x,y)
	for index=1,getn(YDBZ_map_npcfinal) do
		local item = YDBZ_map_npcfinal[index]
		local npc_count = YDBZ_get_npc_count(item);			-- NPC数量
		local res_count = 0;							-- 产生的NPC数量
		local id = YDBZ_get_npc_id(item, index);			-- NPC的ID
		local level = YDBZ_get_npc_level(item, index);	-- NPC等级
		local isboss = YDBZ_get_npc_isboss(item, index);	-- 是否boss
		local series = YDBZ_get_npc_series(item, index);
		local name = YDBZ_get_npc_name(item, index);
		local nsubworld = world
		local px = x
		local py = y
		local npc_index = AddNpcEx(
				id,			-- ID
				level,		-- 等级
				series,		-- 五行
				nsubworld,	-- 地图
				px ,	-- X坐标
				py ,	-- Y坐标
				1,			-- 不重生
				name,		-- 名字
				isboss);	-- 是否BOSS
		if (npc_index ~= nil and npc_index > 0) then
			if isboss == 1 then
				SetNpcParam(npc_index,1,50)
				--local nsum = GetMissionV(YDBZ_NPC_BOSS_COUNT)
				--SetMissionV(YDBZ_NPC_BOSS_COUNT,(nsum+1))
			end
			SetNpcDeathScript(npc_index, YDBZ_SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
end
function YDBZ_create_all_npc()
	--print("产生怪物")
	for nteam=1,getn(YDBZ_map_posfiles[1]) do
		
		local radomlist = {}
		local radsum = getn(YDBZ_map_posfiles[1][nteam])
		for i=1,radsum do
			radomlist[i] = i
		end
		radomlist = YDBZ_get_randomlist(radomlist,radsum)
		for i=1,radsum do
			SetMissionV(YDBZ_NPC_TYPE[nteam][i],radomlist[i])
		end
		local file = YDBZ_map_posfiles[1][nteam][1];
		YDBZ_add_npc(file,nteam,1,1,1)

	end
	for nway = 1,getn(YDBZ_map_posfiles[2]) do
		local file = YDBZ_map_posfiles[2][nway]
		YDBZ_add_npcboss(file,nway)
	end
end
YDBZ_YuanJunPos = 		--玩家争夺区传送点和重生点，随机
{
	[1]=
	{
		{1797,3514},
	},
	[2]=
	{
		{1806,3568},
	},
	[3]=
	{
		{1763,3524},
	},
}
function YDBZ_AddNpc_YuanJun(nTeam,nCurCamp)
	
	local item = YDBZ_map_npcYuanJun[1]
	local npc_count = YDBZ_get_npc_count(item);			-- NPC数量
	for index = 1, npc_count do
		local id		= YDBZ_get_npc_id(item, index);			-- NPC的ID
		local level		= YDBZ_get_npc_level(item, index);	-- NPC等级
		local isboss	= YDBZ_get_npc_isboss(item, index);	-- 是否boss
		local series	= YDBZ_get_npc_series(item, index);
		local name		= YDBZ_get_npc_name(item, index);
		local tbPos		= YDBZ_YuanJunPos[nTeam][random (1, getn(YDBZ_YuanJunPos[nTeam]))]
		local px		= ( tbPos[1]+random(-3,3) ) * 32
		local py		= ( tbPos[2]+random(-3,3) ) * 32
		YDBZ_npc_proceed(item);
			
		local npc_index = AddNpcEx(
				id,			-- ID
				level,		-- 等级
				series,		-- 五行
				SubWorld,	-- 地图
				px ,	-- X坐标
				py ,	-- Y坐标
				1,			-- 不重生
				name,		-- 名字
				isboss);	-- 是否BOSS
		SetNpcCurCamp( npc_index, nCurCamp )
	end
end
