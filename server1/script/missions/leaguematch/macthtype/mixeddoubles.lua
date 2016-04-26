Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============混合双人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部混合双人赛相关数据
WLLS_DATA = {
	
	name = "男女双人赛",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10248,
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
			ladder = 10249,
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
			{1, 1500},	--第1名
			{2, 1200},	--第2名
			{3, 1000},	--第3名
			{4, 800},	--第4名
			{8, 500},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}, {	--联赛
			{1, 1500},	--第1名
			{2, 1200},	--第2名
			{3, 1000},	--第3名
			{4, 800},	--第4名
			{8, 500},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"本次新秀联赛将士男女双人赛模式，大家可以自由成立战队，努力练习配合",
		"本次新秀联赛将士男女双人赛模式，大家可以自由成立战队，努力练习配合",
	},
	
	addmem_ex	= ", 要求 <color=red>男女<color>",	--组建战队额外要求（可选）

	--====Functions====
	
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  此次"..str_des.." 参加 <color=red>男女双人赛<color>.你可以自己建立战队，也可以参加他人的战队。在队长与他人组队后，将"..str_des.."与官员对话，选择比赛队伍"..str_des.."立即形成战队。成员数量最多为<color=red>2 人<color=red>, 需要异性.",
				"我想建立"..str_des.."队/wlls_want2create",
				"我只是看看/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>你的战队目前为 <color=yellow>"..str_lgname.."<color><enter>"
		.. "战队队长:"..join(wlls_get_mems(n_lid), "战队成员:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>注意：下季比赛限制为 <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, 如果想比赛，请建立新的战队.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>  你可以选<color=red> 加入其他队<color> 或者 <color=red>离开比赛队<color>.<enter><enter>"..
			"成立战队步骤: 在<color=red>休息时间和比赛时间<color>, 都可以与其他玩家组队, <color=red>异性<color>, 选择同一让同队加入本队. <enter>"..
			"离开比赛: 在<color=red>休息时间<color>,你可以离开比赛队，在比赛时间如果你的不是队<color=red> 未加入上期比赛<color>, 你可以离开比赛队，如果已参加就不能离开。队长资格将被转交给其他队员 <color=yellow>如果没有成员，战队将被解散<color>."
			tb_option[getn(tb_option)+1] = "让我的队友加入比赛队伍/wlls_want2addmember"
		else
			str = str.."<enter>  你可以选择离开队.<enter><enter>"..
			"离队：在 <color=red>休息时间<color>, 你可以离开比赛队，在比赛时间如果自己的比赛队<color=red>未加入上次比赛<color>, 你可以离开比赛队，如果加入比赛就不能离开."
		end
		tb_option[getn(tb_option)+1] = "离队/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "看队伍战绩/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "我只是路过/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--检查当前角色是否可以加入指定的战队
	check_addmem = function(nCapIdx, nLGID, nMType)
		print(nMType, wlls_player_type())
		if (nMType ~= wlls_player_type()) then
		 	return "对不起，对内队员:"..GetName().." 和 <color=red>参加比赛类型<color> 你的战队不符，所以，不能进入你的战队!"
		end
		local nOldIdx = PlayerIndex
		PlayerIndex = nCapIdx
		local nSex	= GetSex()
		PlayerIndex = nOldIdx
		if (nSex == GetSex()) then
			return "本次比武按照男女男女双人赛模式，你要找一个异性!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(7,WLLS_DATA)
