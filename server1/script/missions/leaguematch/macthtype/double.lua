--==============双人赛相关数据===============
Include("\\script\\missions\\leaguematch\\tb_head.lua")

if (not tmp_process_data) then
	return
end

--全部双人赛相关数据
WLLS_DATA = {

	name = "自由双人赛",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10196,
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
			ladder = 10197,
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
			{2, 1500},	--第2名
			{3, 1200},	--第3名
			{4, 1000},	--第4名
			{8, 800},	--第5-8名
			{16, 500},	--第9-16名
			{32, 300},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}, {	--联赛
			{1, 2000},	--第1名
			{2, 1500},	--第2名
			{3, 1200},	--第3名
			{4, 1000},	--第4名
			{8, 800},	--第5-8名
			{16, 500},	--第9-16名
			{32, 300},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"本次武林新秀联赛为 <color=red>自由双人赛<color>",
		"本次武林新秀联赛为<color=red>自由双人赛<color>",
	},
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  此次"..str_des.."是<color=red>自由双人赛<color>. 你可以自选比赛队伍或者加入其他比赛队伍。队长与其他玩家组队后去"..str_des.."与官员对话，选择比赛队伍"..str_des.."选择队友就行。比赛队成员最多<color=red>2 人<color>",
				"我想建立"..str_des.."队/wlls_want2create",
				"我只是看看/OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>目前你的战队为 <color=yellow>"..str_lgname.."<color><enter>"
		.. "战队队长:"..join(wlls_get_mems(n_lid), "战队成员:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>注意：下季比赛限制为<color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, 如果下季比赛，请建立新的战队.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>   你可以选择 <color=red> 加入其他队<color> 或者 <color=red>离开比赛队<color>.<enter><enter>"..
			"建立组队过程，在<color=red>休息时间和比赛时间<color>, 你可以和其他玩家组队，选择队友加入比赛队.<enter>"..
			"离开比赛队伍：在<color=red>休息时间<color>, 你可以离开比赛队伍，在比赛时间，如果你的比赛队伍<color=red> 未加入上期比赛<color>, 你可以离开比赛队伍。如果已参加就不能离开。队长资格将会转交给其他成员 <color=yellow>如果没有成员，战队将被解散<color>."
			tb_option[getn(tb_option)+1] = "让我的队友加入比赛队伍/wlls_want2addmember"
		else
			str = str.."<enter>       你可以选择离开队伍.<enter><enter>"..
			"离开队伍：在 <color=red>休息时间<color>, 你可以离开比赛队伍，在比赛时间如果你的比赛队伍<color=red>未加入上期比赛<color>, 你也可以离开战队。如果已加入比赛，就不能离开战队."
		end
		tb_option[getn(tb_option)+1] = "离开队伍/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "看队伍战绩/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "我只是路过/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(1, WLLS_DATA)
