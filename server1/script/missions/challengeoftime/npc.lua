-- description	: ����NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

-- ��������<=>λ���ļ�
map_posfiles = {
	[8] = {"\\settings\\maps\\challengeoftime\\lineup8.txt", 1},	
	[16] = {"\\settings\\maps\\challengeoftime\\lineup16.txt", 1},	
	[20] = {"\\settings\\maps\\challengeoftime\\lineup20.txt", 1},
	[24] = {"\\settings\\maps\\challengeoftime\\lineup24.txt", 1},
	[32] = {"\\settings\\maps\\challengeoftime\\lineup32.txt", 1},
	[40] = {"\\settings\\maps\\challengeoftime\\lineup40.txt", 1},
	[56] = {"\\settings\\maps\\challengeoftime\\lineup56.txt", 1}
};

-- NPC��ID����Ϊ�������ͣ����֡���񡢺���
-- NPC�������еĺ��壺<NPC��������>, <����>, <��������ID�����֡��ȼ������С��Ƿ�BOSS(0,1)��������λ��>
-- ��������


map_lnpc = {
	-- 1
	{1, {1.5, 0, nil},
		{nil, 975, "˪��", 75, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {1.5, 0, nil},
		{nil, 976, "��ɳ", 75, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 977, "˪��", 75, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2,	{9, 0, nil},
		{nil, 975, "˪��", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 978, "�˷�", 75, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {4.5, 0, nil},
		{nil, 979, "ˮ��", 75, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {4.5, 0, nil},
		{nil, 980, "���", 75, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2,	{6, 10, nil},
		{nil, 976, "��ɳ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {5, 0, nil},
		{nil, 981, "����", 75, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {5, 0, nil},
		{nil, 982, "����", 75, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2,	{9, 0, nil},
		{nil, 977, "˪��", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {6, 0, nil},
		{nil, 983, "Ӱ��", 75, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2,	{6, 10, nil},
		{nil, 978, "�˷�", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1,	{4.5, 0, nil},
		{nil, 987, "������", 75, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1,	{6, 0, nil},
		{nil, 984, "����", 75, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2,	{9, 0, nil},
		{nil, 979, "ˮ��", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1,	{4.5, 0, nil},
		{nil, 988, "������", 75, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2,	{6, 10, nil},
		{nil, 980, "���", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1,	{4.5, 0, nil},
		{nil, 989, "�ư˷�", 75, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1,	{6, 0, nil},
		{nil, 985, "��ٺ", 75, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2,	{10.5, 0, nil},
		{nil, 981, "����", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1,	{4.5, 0, nil},
		{nil, 990, "��̾��", 75, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1,	{4.5, 0, nil},
		{nil, 991, "���ں�", 75, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1,	{7.5, 30, nil},
		{nil, 992, "Ϳ����", 75, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2,	{9, 0, nil},
		{nil, 984, "����", 75, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {7.5, 0, nil},
		{nil, 986, "�ڽ�", 75, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {24, 15, nil},
		{nil, 1006, "��s��", 75, -1, 0, 1, {1568, 3227}},
		{nil, 985, "��ٺ", 75, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 993, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- �߼�����
map_hnpc = {
	-- 1
	{1, {2, 0, nil},
		{nil, 1007, "˪��", 95, -1, 0, 16, func_npc_getpos}},
	-- 2
	{1, {2, 0, nil},
		{nil, 1008, "��ɳ", 95, -1, 0, 16, func_npc_getpos}},
	-- 3
	{1, {3, 0, nil},
		{nil, 1009, "˪��", 95, -1, 0, 20, func_npc_getpos}},
	-- 4
	{2, {9, 0, nil},
		{nil, 1007, "˪��", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 5
	{1, {3, 0, nil},
		{nil, 1010, "�˷�", 95, -1, 0, 20, func_npc_getpos}},
	-- 6
	{1, {5, 0, nil},
		{nil, 1011, "ˮ��", 95, 1, 0, 24, func_npc_getpos}},
	-- 7
	{1, {5, 0, nil},
		{nil, 1012, "���", 95, 3, 0, 24, func_npc_getpos}},
	-- 8
	{2, {9, 15, nil},
		{nil, 1008, "��ɳ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 9
	{1, {6, 0, nil},
		{nil, 1013, "����", 95, 2, 0, 32, func_npc_getpos}},
	-- 10
	{1, {6, 0, nil},
		{nil, 1014, "����", 95, 4, 0, 32, func_npc_getpos}},
	-- 11
	{2, {12, 0, nil},
		{nil, 1009, "˪��", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 12
	{1, {9, 0, nil},
		{nil, 1015, "Ӱ��", 95, 0, 0, 40, func_npc_getpos}},
	-- 13
	{2, {9, 15, nil},
		{nil, 1010, "�˷�", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 14
	{1, {6, 0, nil},
		{nil, 1019, "������", 95, -1, 0, 20, func_npc_getpos}},
	-- 15
	{1, {9, 0, nil},
		{nil, 1016, "����", 95, -1, 0, 32, func_npc_getpos}},
	-- 16
	{2, {14, 0, nil},
		{nil, 1011, "ˮ��", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 17
	{1, {6, 0, nil},
		{nil, 1020, "������", 95, -1, 0, 20, func_npc_getpos}},
	-- 18
	{2, {12, 20, nil},
		{nil, 1012, "���", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 19
	{1, {6, 0, nil},
		{nil, 1021, "�ư˷�", 95, -1, 0, 20, func_npc_getpos}},
	-- 20
	{1, {8, 0, nil},
		{nil, 1017, "��ٺ", 95, -1, 0, 24, func_npc_getpos}},
	-- 21
	{2, {14, 0, nil},
		{nil, 1013, "����", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 22
	{1, {6, 0, nil},
		{nil, 1022, "��̾��", 95, -1, 0, 20, func_npc_getpos}},
	-- 23
	{1, {6, 0, nil},
		{nil, 1023, "���ں�", 95, -1, 0, 20, func_npc_getpos}},
	-- 24
	{1, {10, 20, nil},
		{nil, 1024, "Ϳ����", 95, -1, 0, 20, func_npc_getpos}},
	-- 25
	{2, {15, 0, nil},
		{nil, 1016, "����", 95, func_npc_getseries, 0, 16, func_npc_getpos},
		{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- 26
	{1, {9, 0, nil},
		{nil, 1018, "�ڽ�", 95, -1, 0, 56, func_npc_getpos}},
	-- 27
	{2, {32, 32, nil},
		{nil, 1038, "��s��", 95, -1, 1, 1, {1568, 3227}},
		{nil, 1017, "��ٺ", 95, -1, 0, 16, func_npc_getpos}},
	-- 28
	{1, {0, 0, nil},
		{nil, 1025, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
};

-- �������عؿڹ���
map_lo_hidden_npc = {
	-- ��ս�ͽ�ʮ���������а����
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10119}, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
	-- ��ս����ʱ�����ս���а����
	{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10179}, 75, func_npc_getseries, 1, 1, {1568, 3227}}}
};

-- �߼����عؿڹ���
map_hi_hidden_npc = {
	-- ��ս�ͽ�ʮ���������а����
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}},
	-- ��ս�߼�ʱ�����ս���а����
	{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10180}, 75, -1, 1, 1, {1568, 3227}}}
};

-- С��߱�� �� ��boss
map_new_Ncp = {
	[1] = {nil, 1673, "С��s��", 95, -1, 1, 1, {1568, 3227}},
	[2] = { nNpcId = 1674, nLevel = 95,	bNoRevive = 1, szName = "����_�Ű�",	nIsboss = 1,},
	[3] = { nNpcId = 1675, nLevel = 95,	bNoRevive = 1, szName = "����_������ʦ",	nIsboss = 1,},
	[4] = { nNpcId = 1676, nLevel = 95,	bNoRevive = 1, szName = "����_�Ʋ�Ⱦ",	nIsboss = 1,},
	[5] = { nNpcId = 1677, nLevel = 95,	bNoRevive = 1, szName = "����_������",	nIsboss = 1,},
	[6] = { nNpcId = 1678, nLevel = 95,	bNoRevive = 1, szName = "���� _����ʦ̫",	nIsboss = 1,},
	[7] = { nNpcId = 1679, nLevel = 95,	bNoRevive = 1, szName = "����_������",	nIsboss = 1,},
	[8] = { nNpcId = 1680, nLevel = 95,	bNoRevive = 1, szName = "����_������",	nIsboss = 1,},
	[9] = { nNpcId = 1681, nLevel = 95,	bNoRevive = 1, szName = "���� _��ľ�",	nIsboss = 1,},
	[10] = { nNpcId = 1682, nLevel = 95,	bNoRevive = 1, szName = "����_��������",	nIsboss = 1,},
	[11] = { nNpcId = 1683, nLevel = 95,	bNoRevive = 1, szName = "���� _�����",	nIsboss = 1,},
};

-- �µ�ͼ����npc
map_transfer_npc = {
	[1] = { nNpcId = 1684,	bNoRevive = 1, szName = "����_���ҽ�����", szScriptPath = "\\script\\missions\\challengeoftime\\npc\\transfer.lua"},
}

-- �ͼ�����ͨ�ؽ������麯��
function lo_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 15;
	else
		return floor(172 * (1 - min / 25)) + 10;
	end
end

-- �ͼ�����ͨ�ؽ������廨�����顢��Ʒ
map_laward_success = {
	lo_exp_award, 0, nil
};

-- �߼�����ͨ�ؽ������麯��
function hi_exp_award(time)
	local min = floor(time / 60);
	if (min >= 25) then
		return 30;
	else
		return floor(233 * (1 - min / 25)) + 20;
	end
end

-- �߼�����ͨ�ؽ������廨�����顢��Ʒ
map_haward_success = {
	hi_exp_award, 0, nil
};

-- ����������������Ϊ100000
map_random_awards = {
	100000,													-- �������Ϊ100000
	{0.1, 	        {"�����ؼ�", 		6, 1, 26, 1, 0, 0}},	-- �����ؼ�
	{0.1, 	        {"ϴ�辭",		6, 1, 22, 1, 0, 0}},	-- ϴ�辭
	{0.1, 		{"��Ե¶���� ",	6, 1, 124, 1, 0, 0}},	-- ��Ե¶����
	{0.1, 		{"��Ե¶���У�", 	6, 1, 123, 1, 0, 0}},	-- ��Ե¶���У�
	{0.1, 		{"������յ�",	        6, 1, 2397, 1, 0, 0}},	-- ��Ե¶��С��
	{0.1, 	        {"�ɲ�¶",		6, 1, 71, 1, 0, 0}},	-- �ɲ�¶
	{0.1, 		{"��ɽ��¶",		6, 1, 72, 1, 0, 0}},	-- ��ɽ��¶
	{0.1, 		{"�ĺ���ң��",		6, 1, 2378, 1, 0, 0}},	-- �ٹ�¶
	{0.1, 		{"�������ε�",		6, 1, 2379, 1, 0, 0}},	-- ��׾���
	{0.1, 	        {"���",		6, 1, 2311, 1, 0, 0}},					-- ���
};

-- ��ȡNPC��ID
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

-- ��ȡNPC������
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

-- ��ȡNPC�ļ���
function get_npc_level(item, index)
	-- DEBUG
--	print(format("get_npc_level():%d", item[NPC_ATTRIDX_LEVEL]));
	return item[NPC_ATTRIDX_LEVEL];
end

-- ��ȡNPC������
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

-- NPC�ĺ��������ۼӵ�ǰʹ�õ����������
function npc_proceed(item)
	local proceed = item[NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		proceed(item);
	end
end

-- ��ȡNPC������
function get_npc_count(item)
	return item[NPC_ATTRIDX_COUNT];
end

-- ��ȡNPC��λ��
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

-- �Ƿ�BOSS
function get_npc_isboss(item)
	return item[NPC_ATTRIDX_ISBOSS];
end

-- ��ǰ�����Ƿ�߼�����
function advanced()
	world = SubWorldIdx2ID(SubWorld);
	return map_isadvanced[world] ~= 0;
end

-- ��ǰNPC���ñ�
function current_npc_map()
	if (advanced()) then
		return map_hnpc;
	else
		return map_lnpc;
	end
end

-- ��ȡ��������
function get_batch_count()
	return getn(current_npc_map());
end

-- �����趨����NPC�����ش�����NPC������
function add_npc(item)
	local npc_count = get_npc_count(item);			-- NPC����
	local res_count = 0;							-- ������NPC����
	
	for index = 1, npc_count do
		local id = get_npc_id(item, index);			-- NPC��ID
		local level = get_npc_level(item, index);	-- NPC�ȼ�
		local isboss = get_npc_isboss(item, index);	-- �Ƿ�boss
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
			level,		-- �ȼ�
			series,		-- ����
			SubWorld,	-- ��ͼ
			px * 32,	-- X����
			py * 32,	-- Y����
			1,			-- ������
			name,		-- ?��?
			isboss);	-- �Ƿ�BOSS
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- ���������ű�
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
	--print(format("������%dֻ��", count));
	
	SetMissionV(VARV_NPC_COUNT, count);
	return count;
end

-- �ڵ�ͼ������NPC
function create_batch_npc(batch)
	local map = current_npc_map();
	npc = map[batch];		-- ������

	local npc_count = create_all_npc(npc);	
	-- DEBUG
	
	-- ���ص��� by wangjingjun 2011.03.01
	if batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) and GetMissionV(VARV_BATCH_MODEL) == 1 then
	--	local nX,nY = func_npc_getpos()
	--	WriteLog("x = " .. tostring(nX) .. " Y = " .. tostring(nY))
	--	WriteLog("MapId = " .. tostring(SubWorldIdx2ID(SubWorld)))
		add_npc(map_new_Ncp[1])
	--	basemission_CallNpc(map_new_Ncp[1], SubWorldIdx2ID(SubWorld),nX, nY)
		SetMissionV(VARV_NPC_COUNT, npc_count + 1);
		WriteLog("С��s���Ѳμ�ս��!")
		Msg2MSAll(MISSION_MATCH, "С��s���Ѳμ�ս��!");
	end

	local msg = "����" .. npc_count .. "С��!";
	Msg2MSAll(MISSION_MATCH, msg);
	
	-- ��11��ˢ���ճ�����Ի�NPC
	if (batch == 11) then
		-- �ճ�����ˢ�¶Ի�NPC
		%tbTalkDailyTask:AddTalkNpc(SubWorldIdx2ID(SubWorld), SubWorldIdx2ID(SubWorld));
	end
end


-- ���Ӵ��ش���npc
function add_transfer_npc()
	local nX,nY, nMapIndex = GetPos()
	basemission_CallNpc(map_transfer_npc[1], SubWorldIdx2ID(nMapIndex),1568*32, 3227*32)
end