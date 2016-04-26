IL("RELAYLADDER");

--查询（主对话）
function wlls_query()
	local str = "<enter>  当今乱世，英雄豪杰辈出，因为想反抗江湖上的争夺，所以，独孤盟主举行武林联赛: 首先是选出武林中优秀的人才，第二是一起献计。参加联赛如果表现好，可以获得奖励。<enter>"..
		"你依然还能在我这检查武林新秀联赛和武林联赛相关情况."
	local tb_option = {}
	if (LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()) ~= 0) then
		tb_option[getn(tb_option)+1] = "我想检查组队情况[自己的队]/wlls_query_mylg"
	end
	tb_option[getn(tb_option)+1] = "我想检查组队情况[排名前十]/wlls_query_level"
	tb_option[getn(tb_option)+1] = "我想检查指定战队情况[战队名称] /wlls_query_lgnamein"
	tb_option[getn(tb_option)+1] = "我想检查指定战队情况[人物名称]/wlls_query_plnamein"
	tb_option[getn(tb_option)+1] = "不需要!/OnCancel"
	wlls_descript(str, tb_option)
end

--查询自己战队（查询）
function wlls_query_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."对不起，你依然还未入队，不能检查!", 0)
	else
		wlls_query_do(n_lid)
	end
end

--查询排行前10的战队（级别列表：新秀、高级）
function wlls_query_level()
	wlls_descript("你想检查哪个级别战队的排名?",
		WLLS_LEVEL_DESC[1].."排名前十/#wlls_query_type(1)",
		WLLS_LEVEL_DESC[2].."排名前十/#wlls_query_type(2)",
		"返回/wlls_query",
		"我知道了/OnCancel")
end

--查询排行前10的战队（分类列表）
function wlls_query_type(n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_option = {}
	local n
	for n_mtype, tb_mtaype in WLLS_TAB[n_type].match_type do
		if (tb_mtaype.level == n_level) then
			n = n_mtype
			tb_option[getn(tb_option)+1] = WLLS_LEVEL_DESC[tb_mtaype.level].."-"..tb_mtaype.name.."排名前十/#wlls_query_top10("..n_mtype..")"
		end
	end
	if (getn(tb_option) == 1) then	--只有一个，直接显示
		wlls_query_top10(n)
		return
	end
	tb_option[getn(tb_option)+1] = "返回/wlls_query_level"
	tb_option[getn(tb_option)+1] = "我知道了/OnCancel"
	wlls_descript("此次 "..WLLS_LEVEL_DESC[n_level].."包括 "..(getn(tb_option) - 1).."你想检查哪个级别战队的排名?", tb_option)
end

--查询排行前10的战队（前十名列表）
function wlls_query_top10(n_mtype)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_ladder = WLLS_TAB[n_type].match_type[n_mtype].ladder
	local n_level = WLLS_TAB[n_type].match_type[n_mtype].level
	local tb_option = {}
	for i = 1, 10 do
		local str_lgname, n_order = Ladder_GetLadderInfo(n_ladder, i)
		if (not FALSE(n_order)) then
			tb_option[getn(tb_option)+1] = strfill_left("名次"..(-n_order).."danh ", 7)..str_lgname.."/#wlls_query_top("..n_ladder..","..i..")"
		end
	end
	if (getn(tb_option) <= 0) then
		Say(wlls_npcname().."对不起，目前还没有战队排名，不能检查!", 0)
	else
		tb_option[getn(tb_option)+1] = "返回/#wlls_query_type("..n_level..")"
		tb_option[getn(tb_option)+1] = "我知道了/OnCancel"
		Say(wlls_npcname().."你想检查哪个组?", getn(tb_option), tb_option)
	end
end

--查询前10的战队（查询）
function wlls_query_top(n_ladder, n_idx)
	local str_lgname = Ladder_GetLadderInfo(n_ladder, n_idx)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (n_lid ~= 0 and LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK) > 0) then
		wlls_query_do(n_lid)
	else
		Say(wlls_npcname().."对不起! 战队已解散, 不能检查!", 0)
	end
end

--查询指定战队(输入)
function wlls_query_lgnamein()
	AskClientForString("wlls_query_lgname", "", 1, 16, "输入想要检查的战队名称!")
end

--查询指定战队(查询)
function wlls_query_lgname(str_lgname)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."对不起! 战队不存在或者已解散.", 0)
	else
		wlls_query_do(n_lid)
	end
end

--查询指定角色(输入)
function wlls_query_plnamein()
	AskClientForString("wlls_query_plname", "", 1, 16, "请输入想要检查的人物名字!")
end

--查询指定角色(查询)
function wlls_query_plname(str_plname)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."对不起! 你输入的人物名字不存在或者没有加入战队, 不能检查!", 0)
	else
		wlls_query_do(n_lid)
	end
end

--查询指定战队（显示）
function wlls_query_do(n_lid)
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local str_mtype = wlls_get_desc(2, n_mtype, 1, n_type)
	local str_mem = join(wlls_get_mems(n_lid), "  ")
	local n_win = LG_GetLeagueTask(n_lid, WLLS_LGTASK_WIN)
	local n_tie = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIE)
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_point = LG_GetLeagueTask(n_lid, WLLS_LGTASK_POINT)
	local n_time = ceil(LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIME)/18)
	local n_lose = n_total - n_tie - n_win
	local f_rate = 0
	if (n_total > 0) then
		f_rate = n_win/n_total*100
	end
	local n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	local str_rank
	if (n_rank > 1000) then
		str_rank = "Sau 1000"
	elseif (n_rank > 0) then
		str_rank = "名次 "..n_rank.."danh "
	else
		str_rank = "还未排名"
	end
	local n_width = 17
	local str = "<enter>"
	str = str .. strfill_center(str_mtype.."小组[<color=yellow>"..str_lgname.."<color>]", 53+21, "-")
	str = str .. strfill_left("包括<color=yellow>"..n_memcount.."<color> 成员", n_width+21).."<color=cyan>"..str_mem.."<color><enter>"
	str = str .. strfill_left(" 参加<color=yellow>"..n_total.."<color>联赛:", n_width+21).."胜利<color=yellow>"..n_win.."<color>场/和<color=yellow>"..n_tie.."<color>场/失败<color=yellow>"..n_lose.."<color>场<enter>"
	str = str .. strfill_left("",n_width).."取胜比例<color=yellow>"..strsub(f_rate,1,4).."<color>%<enter>"
	str = str .. strfill_left("小组奖励:<color=yellow>"..n_point.."<color>", n_width+21).."战斗积累时间:<color=yellow>"..n_time.."<color>秒 <enter>"
	str = str .. ""..strfill_center("<<  <color=yellow>"..str_rank.."<color>  >>", 53+21).."<color>"
	wlls_descript(str)
end

--帮助
function wlls_help(n_type, n_level, n_id)
	local tb_option = {}
	local tb = WLLS_TAB[n_type].help_msg
	for i = 1, getn(tb) do
		if (i == n_id) then
			tb_option[getn(tb_option)+1] = "< "..tb[i][n_level][1].." >/#wlls_help("..n_type..","..n_level..","..i..")"
		else
			tb_option[getn(tb_option)+1] = tb[i][n_level][1].."/#wlls_help("..n_type..","..n_level..","..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "我明白了!/OnCancel"
	wlls_descript("<enter>"..strfill_center(" ( "..tb[n_id][n_level][1]..") ", 52).."<enter>"..tb[n_id][n_level][2], tb_option)
end

--Describe对话
function wlls_descript(str, ...)
	str = "<link=image[0,8]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>"..wlls_npcname().."<link>"..str
	if (type(arg[1]) == "table") then
		arg = arg[1]
	end
	if (getn(arg) <= 0) then
		Describe(str, 1, "结束对话/OnCancel")
	else
		Describe(str, getn(arg), arg)
	end
end

--得到所有的队员名字
function wlls_get_mems(n_lid)
	local str_lgame, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local tb = {""}
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgame, str_plname, WLLS_LGMTASK_JOB)
		if n_job == 1 then
			tb[1] = str_plname
		else
			tb[getn(tb)+1] = str_plname
		end
	end
	return tb
end

--得到对话Npc名称
function wlls_npcname()
	return GetNpcName(GetLastDiagNpc())..":"
end

--添加查询、帮助选项
function wlls_add_option(tb, str)
	tb[getn(tb)+1] = "我想检查目前联赛情况/wlls_query"
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local n_mtype, _, n_map = wlls_get_mapinfo()
	local n_level
	if (n_mtype) then
		n_level = WLLS_TAB[n_type].match_type[n_mtype].level
	else
		n_level = wlls_getcityinfo()
	end
	if (n_type == n_next) then
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. "联赛帮助/#wlls_help("..n_type..","..n_level..",1)"
	else
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. WLLS_TAB[n_type].name .. "联赛帮助/#wlls_help("..n_type..","..n_level..",1)"
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. WLLS_TAB[n_next].name .. "联赛帮助/#wlls_help("..n_next..","..n_level..",1)"
	end
	--if (n_map == 1) then
	--	tb[getn(tb)+1] = "我要离开会场/wlls_want2transback"
	--end
	tb[getn(tb)+1] = str.."/OnCancel"
	return tb
end
