Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============三人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部三人赛相关数据
WLLS_DATA = {
	
	name = "自由三人赛",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10223,
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
			ladder = 10224,
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
			{1, 1000},	--第1名
			{2, 800},	--第2名
			{3, 600},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 200},	--第9-16名
			{32, 100},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}, {	--联赛
			{1, 1000},	--第1名
			{2, 800},	--第2名
			{3, 600},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 200},	--第9-16名
			{32, 100},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}
	},
	
	max_member = 3,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"此次武林新秀联赛为 <color=red>自由三人赛<color>",
		"此次武林新秀联赛为<color=red>自由三人赛<color>",
	},
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  此次"..str_des.."在 <color=red>自由三人赛<color>, 你可以选择建立组队，也可以加入其他战队。在队长与玩家组队完后，"..str_des.."与官员对话，选择联赛队"..str_des.."加入队友到本队就行，战队成员最多为<color=red>3 人<color>.",
				"我想建立"..str_des.."组队/wlls_want2create",
				"我只看看/OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>目前你的战队为<color=yellow>"..str_lgname.."<color><enter>"
		.. "战队队长:"..join(wlls_get_mems(n_lid), "战队成员:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>注意：下期联赛限制为<color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, 如果想下期联赛，请建立新的战队.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>你可以选择<color=red>加入其他队伍<color>或者<color=red>离开联赛<color>.<enter><enter>"..
			"成立战队步骤: 在<color=red>休息时间和联赛时间<color>, 都可以与其他玩家组队, <color=red>异性<color>, 选择同一让同队加入本队. <enter>"..
			"离开联赛: 在<color=red>休息时间<color>,你可以离开联赛队，在联赛时间如果你的不是队<color=red> 未加入上期联赛<color>, 你可以离开联赛队，如果已参加就不能离开。队长资格将被转交给其他队员 <color=yellow>如果没有成员，战队将被解散<color>."
			tb_option[getn(tb_option)+1] = "让我的队友加入联赛队伍/wlls_want2addmember"
		else
			str = str.."<enter>  你可以选择离开队.<enter><enter>"..
			"离队：在 <color=red>休息时间<color>, 你可以离开联赛队，在联赛时间如果自己的联赛队<color=red>未加入上次联赛<color>, 你可以离开联赛队，如果加入联赛就不能离开."
		end
		tb_option[getn(tb_option)+1] = "离队/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "看队伍战绩/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "我只是路过/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(4,WLLS_DATA)
