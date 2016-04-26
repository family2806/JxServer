Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============同系双人赛相关数据===============

-- LLG_ALLINONE_TODO_20070802

if (not tmp_process_data) then
	return
end

--全部同系双人赛相关数据
local nTmpLadderBase	= 10238
WLLS_DATA = {
	
	name = "同系双人赛",
	
	--地图信息
	match_type = {
		{
			name = "金系",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "木系",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "水系",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "火系",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "土系",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "金系",
			level = 2,
			ladder = nTmpLadderBase + 5,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "木系",
			level = 2,
			ladder = nTmpLadderBase + 6,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "水系",
			level = 2,
			ladder = nTmpLadderBase + 7,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "火系",
			level = 2,
			ladder = nTmpLadderBase + 8,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "土系",
			level = 2,
			ladder = nTmpLadderBase + 9,
			map = {{548, 574, 549, ""}},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 4000},	--第1名
			{2, 3000},	--第2名
			{3, 2500},	--第3名
			{4, 2000},	--第4名
			{8, 1500},	--第5-8名
			{16, 1250},	--第9-16名
			{32, 1000},	--第17-32名
			{64, 750},	--第33-64名
			{128, 500},	--第65-128名
			{256, 250},	--第129-256名
		}, {	--联赛
			{1, 8000},	--第1名
			{2, 6000},	--第2名
			{3, 5000},	--第3名
			{4, 4000},	--第4名
			{8, 3000},	--第5-8名
			{16, 2500},	--第9-16名
			{32, 2000},	--第17-32名
			{64, 1500},	--第33-64名
			{128, 1000},	--第65-128名
			{256, 500},	--第129-256名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"本次比赛为同系双人赛",
		"本次比赛为同系双人赛",
	},
	
	addmem_ex	= ", 需要是玩家<color=red>同系<color> 一起",	--组建战队额外要求（可选）

	--====Functions====
	--返回当前角色可以参加的比赛类型，nil为不能参赛
	player_type = function()
		local nLevel = wlls_player_level()
		if (nLevel <= 0) then
			return nil
		end
		local nSeries = GetSeries() + 1
		if (nSeries <= 0) then
			wlls_error_log("GetSeries() = "..(nSeries - 1))
			return nil
		end
		return (nLevel - 1) * 5 + nSeries
	end,
	
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  此次"..str_des.." 为<color=red>同系双人赛<color>. 你可以选择建立组队，也可以加入其他战队，然后，队长去与 "..str_des.."官员对话，选择比赛队"..str_des.."每个战队成员为 <color=red>2 人<color> 需要是同系",
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
			str = str .. "<enter>   <color=yellow>注意：下期比赛限制为<color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, 如果想下期比赛，请建立新的战队.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>你可以选择<color=red>加入其它队伍<color>或者<color=red>离开比赛<color>.<enter><enter>"..
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
		if (nMType ~= wlls_player_type()) then
		 	return wlls_npcname().."对不起，队内成员:"..GetName().."<color=red>等级<color> 或者 <color=red>五行<color>两队不合理，不能成立战队!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(6,WLLS_DATA)
