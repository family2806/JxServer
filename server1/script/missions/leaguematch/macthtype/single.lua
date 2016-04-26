Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============混合单人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部混合单人赛相关数据
WLLS_DATA = {
	
	name = "自由单人赛",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10235,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10236,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 2000},	--第1名
			{2, 1000},	--第2名
			{3, 800},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 100},	--第33-64名
			{128, 50},	--第65-128名
			{256, 20},	--第129-256名
			{512, 10},	--第257-512名
		}, {	--联赛
			{1, 2000},	--第1名
			{2, 1000},	--第2名
			{3, 800},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 100},	--第33-64名
			{128, 50},--第65-128名
			{256, 20},--第129-256名
			{512, 10},	--第257-512名
		}
	},
	
	max_member = 1,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"此次是自由单人赛，各位侠客努力练习，等富贵的一天",
		"此次是自由单人赛，各位侠客努力练习，等富贵的一天",
	},
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  此次"..str_des.."为<color=red>自由单人赛<color>, 不需要建立战队，系统将记录你的第一次比赛")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>你的战队目前为 <color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>注意：下期比赛限制为 <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, 如果想下期比赛，请建立新的战队.<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter>  在<color=red>暂时休息时间<color> 或者 <color=red>未参加上期比赛<color>, 你可以离开战队，战队将自动解散<color>."
		tb_option[getn(tb_option)+1] = "离队/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "看组队战绩/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "我只是路过/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--检查当前角色是否可以加入指定的战队
	check_addmem = function(n_capidx, n_lid, n_mtype)
		return "不能加入单人赛队!"
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(5,WLLS_DATA)
