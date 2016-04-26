Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============师徒双人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部师徒双人赛相关数据
WLLS_DATA = {
	
	name = "师徒双人赛",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10221,
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
			ladder = 10222,
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
			{1, 5000},	--第1名
			{2, 4000},	--第2名
			{3, 3500},	--第3名
			{4, 3000},	--第4名
			{8, 2000},	--第5-8名
			{16, 1500},	--第9-16名
			{32, 1000},	--第17-32名
			{64, 500},	--第33-64名
			{128, 250},	--第65-128名
		}, {	--联赛
			{1, 10000},	--第1名
			{2, 8000},	--第2名
			{3, 7000},	--第3名
			{4, 6000},	--第4名
			{8, 4000},	--第5-8名
			{16, 3000},	--第9-16名
			{32, 2000},	--第17-32名
			{64, 1000},	--第33-64名
			{128, 500},	--第65-128名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	--帮助文字（主要的帮助文字在normal.lua中，这里只写特异的部分）
	help_msg = {
		["介绍武林新秀联赛"]	=
			{
				"    本次联赛为 <color=red>师徒双人赛<color>. 玩家去见 <color=red>杰出使者<color> 报名成立战队, 然后进入杰出连斗会场进行联赛. 队长(师傅等级需要 80- 119, 队员(徒弟) 50- 90",
				"    本次联赛为<color=red>师徒双人赛<color>. 玩家去见 <color=red>杰出使者<color> 报名成立战队, 然后进入杰出连斗会场进行联赛. 队长(师傅等级需要120 以上, 队员(徒弟) 50- 90",
			},
		["成立联赛过程"]	= "    玩家可以自己建立战队或者加入其他战队。队长需要是未出师徒弟。队长去见<s> 报名联赛",
		["离开联赛队"]	= "    在 <color=red>离休息阶段大约<color>, 玩家可以自行脱离战队。在联赛阶段，如果你的战队<color=red>未到联赛时候<color>, 玩家可以自行离开战队，如果已经联赛了就不能离开. <color=yellow>离开战队后，就不能领排名奖<color>. 如果队长离开队，战队就会被解散. <color=yellow>如果战队没有人了，就自动解散<color>. 每次连斗结束，哪个战队不符合下次联赛就自动被解散",
	},
	
	text_main = {	--officer主对话（末尾差异部分）
		"本次联赛为<color=red>师徒双人赛<color>. ",
		"本次联赛为<color=red>师徒双人赛<color>. ",
	},
	
	text_creat = "    在建立战队参加师徒双人赛后，你可以<color=red>自己是队长<color>.如果有师傅，就要由<color=red> 师傅做队长<color>.<enter>"
		.."    <color=red>如果未到联赛时间<color> 以及 <color=red>未比过任何一场<color>, 你可以离开战队。如果师傅离开战队，那个队立即被解散。你确定建立战队了吗?",
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>    此次"..str_des.."当 <color=red>师徒联赛<color>, 你可以选择建立战队，也可以加入其他战队. 队长加入队员需是未出师弟子。队长和徒弟组队完后，以及 "..str_des.."与官员对话，选择联赛队伍"..str_des.."选择队友加入就行。成员数量最多为<color=red>2 人<color>",
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
			str = str .. "<enter>   <color=yellow>注意：下季联赛限制为 <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, 如果想联赛，请建立新的战队.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>  你可以选<color=red> 加入其他队<color> 或者 <color=red>离开联赛队<color>.<enter><enter>"..
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
	
	--检查当前角色是否可以加入指定的战队
	check_addmem = function(n_capidx, n_lid, n_mtype)
		local n_oldidx = PlayerIndex
		PlayerIndex = n_capidx
		local n_lid = LG_GetLeagueObjByRole(1, GetName())	--师徒关系战队
		local n_num = GetTask(1403)	--TKID_APPRENTICE_COUNT = 1403 --收徒弟总数
		PlayerIndex = n_oldidx
		if (FALSE(n_lid) or n_num <= 0) then	
			return "对不起! 你未收弟子，不能与其他队员建立组队."
		end
		if (n_lid ~= LG_GetLeagueObjByRole(1, GetName())) then
			return "对不起! "..GetName().."不是你的弟子，不能加入你的联赛队."
		end
		if (GetLevel() > 90) then
			return "对不起! "..GetName().."超过90级，不能作为徒弟加入联赛队."
		end
		if (GetLevel() < 50) then
			return "对不起! "..GetName().."不够50，不能加入联赛队."
		end
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(3,WLLS_DATA)
