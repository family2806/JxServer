Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============门派单项赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部门派单项赛相关数据
local nTmpLadderBase	= 10201
WLLS_DATA = {
	
	name = "比赛门派名单",
	
	--地图信息
	match_type = {
		{
			name = "少林",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "天王",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "唐门",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "五毒",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "峨眉",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "翠烟",
			level = 1,
			ladder = nTmpLadderBase + 5,
			map = {{406, 565, 407, ""}},
		},
		{
			name = "丐帮",
			level = 1,
			ladder = nTmpLadderBase + 6,
			map = {{408, 566, 409, ""}},
		},
		{
			name = "天忍",
			level = 1,
			ladder = nTmpLadderBase + 7,
			map = {{410, 567, 411, ""}},
		},
		{
			name = "武当",
			level = 1,
			ladder = nTmpLadderBase + 8,
			map = {{412, 568, 413, ""}},
		},
		{
			name = "昆仑",
			level = 1,
			ladder = nTmpLadderBase + 9,
			map = {{414, 569, 415, ""}},
		},
		{
			name = "少林",
			level = 2,
			ladder = nTmpLadderBase + 10,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "天王",
			level = 2,
			ladder = nTmpLadderBase + 11,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "唐门",
			level = 2,
			ladder = nTmpLadderBase + 12,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "五毒",
			level = 2,
			ladder = nTmpLadderBase + 13,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "峨眉",
			level = 2,
			ladder = nTmpLadderBase + 14,
			map = {{548, 574, 549, ""}},
		},
		{
			name = "翠烟",
			level = 2,
			ladder = nTmpLadderBase + 15,
			map = {{550, 575, 551, ""}},
		},
		{
			name = "丐帮",
			level = 2,
			ladder = nTmpLadderBase + 16,
			map = {{552, 576, 553, ""}},
		},
		{
			name = "天忍",
			level = 2,
			ladder = nTmpLadderBase + 17,
			map = {{554, 577, 555, ""}},
		},
		{
			name = "武当",
			level = 2,
			ladder = nTmpLadderBase + 18,
			map = {{556, 578, 557, ""}},
		},
		{
			name = "昆仑",
			level = 2,
			ladder = nTmpLadderBase + 19,
			map = {{558, 579, 559, ""}},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 1500},	--第1名
			{2, 1000},	--第2名
			{3, 800},	--第3名
			{4, 600},	--第4名
			{8, 400},	--第5-8名
			{16, 300},	--第9-16名
			{32, 250},	--第17-32名
			{64, 200},	--第33-64名
			{128, 150},	--第65-128名
		}, {	--联赛
			{1, 3000},	--第1名
			{2, 2000},	--第2名
			{3, 1600},	--第3名
			{4, 1200},	--第4名
			{8, 800},	--第5-8名
			{16, 600},	--第9-16名
			{32, 500},	--第17-32名
			{64, 400},	--第33-64名
			{128, 300},	--第65-128名
		}
	},
	
	max_member = 1,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"此次武林新秀联赛是门派单斗，选择每个门派最杰出的人",
		"此次武林新秀联赛是门派单斗，选择每个门派最杰出的人",
	},
	
	--====Functions====
	--返回当前角色可以参加的比赛类型，nil为不能参赛
	player_type = function()
		local n_level = wlls_player_level()
		if (n_level <= 0) then
			return nil
		end
		local n_fact = GetLastFactionNumber() + 1
		if (n_fact <= 0) then
			wlls_descript("<enter>  这是各门派间的比赛，你无门无派不能参加.")
			return nil
		end
		return (n_level - 1) * 10 + n_fact
	end,
	
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  此次"..str_des.."因为<color=red>门派单斗<color>,如果你第一次参加比赛，系统将为你建一个战队.")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>目前你的战队为<color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>注意：下季比赛限制为<color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, 如果想下季比赛，请建立新的战队.<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter>   在<color=red>休息时间内<color> 或者 <color=red>未加入上期比赛<color>, 你可以离开战队，战队将自动解散<color>."
		tb_option[getn(tb_option)+1] = "离开队伍/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "看队伍战绩/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "我只是路过/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(2,WLLS_DATA)
