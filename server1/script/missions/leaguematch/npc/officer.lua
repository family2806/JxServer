--武林联赛官员

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )
Include("\\script\\lib\\log.lua")


--主对话框
function main()
	local n_level = wlls_getcityinfo()
	if (not wlls_CheckIsOpen(n_level)) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (not FALSE(n_lid)) then
		--检查并提示找错官员的情况
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mylevel = WLLS_TAB[n_mytype].match_type[n_mtype].level
		if (n_mylevel ~= n_level) then
			wlls_descript("<enter>  阁下已加入<color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> 我是 <color=red>"..WLLS_LEVEL_DESC[n_level].."<color>,是不是找错人了?", wlls_add_option({}, "没有事"))
			return
		end
		
		--判断是否越级
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"我想离开小组!/wlls_want2leaveleague",
				"我想看看我有没有奖励/wlls_wantaward",
				"我稍候回来/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "我想到"..str_des.."赛场/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = " "..str_des.."小组/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "我想领取联赛奖励/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "我想检查威望值/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "关闭/ 打开领取经验/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "我只是路过"))
end

--领取奖励（对话）
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter>####不管是参加武林新秀联赛还是武林联赛，都能领奖。奖品包括<color=red>排名奖<color> 和<color=red>名望值<color>. 每个阶段的联赛结束后，将根据<color=red>积分, 取胜比例, 联赛总时间<color> 来排名. <color=red>"..n_awardmin.."排名最高队<color> 将获得<color=red>特别奖励<color>.玩家在联赛过程中可以用名望值换取名望奖励。你想领什么奖？"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "我想领排名奖!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "我想领称号奖励!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "我想换名望奖励/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "我想买威望奖励/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "我只是路过/OnCancel"
	wlls_descript(str, tb_option)
end

--领取排名奖励（对话）
function wlls_wantaward_rank()
	--检查排名奖励	
	local nAward, nLevel, szLGName, nRank = wlls_checkaward_rank()
	if nAward then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[nLevel][nAward]
		local str = "<enter>  你的战队:<color=yellow>"..szLGName.."<color>在联赛时"..str_des.."排名<color=yellow>"..nRank.."<color>. 你可以获得名望值"..tb_award[2].."点."
		if (tb_award[3]) then	--有队长额外奖励
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.."队长(师傅)领取名望值"..tb_award[3].."点."
			end
		end
		str = str.."现在领吗？"
		wlls_descript(str,
			"我想领奖励!/wlls_getaward_rank",
			"我稍候回来!/OnCancel")
		return
	end
end

--检查是否可以领取排名奖励，返回可以领的类型，nil为不可领
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--刚好在跨赛季的时候要领奖
		if (not b_silent) then
			Msg2Player("目前联赛已进行新的联赛，不能领上次联赛排名奖励.")
		end
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local str_des = wlls_get_desc(1)
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_awardmin = wlls_get_award_min()
	local n_rank = 0
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > n_awardmin) then
		if (not b_silent) then
			wlls_descript("<enter>  此次"..str_des.." <color=red>"..n_awardmin.."<color> 目前已经排名，好像阁下的战队没有在里面!"..n_awardmin.." 让我帮你检查一下")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>不要以为加入其他小组就能来假冒领奖。下期你再来吧!")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> 阁下已领奖了，想骗我吗?")
		end
		return nil
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_award = WLLS_TAB[n_type].award_rank[n_level]
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award, n_level, str_lgname, n_rank
end

--领取称号奖励
function wlls_wantaward_title()
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then
		Msg2Player("已进行新的联赛，不能领奖励!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().."奖励只送给"..wlls_get_desc(1).."你最出色(排名前四) . 你不是那个组的，不要来乱搞!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter>  不要以为加入其他小组就能来假冒领奖。下期你再来吧!")
		return nil
	end
	local n_title = WLLS_AWARD_TITLE[n_level] + n_rank - 1
	
	
	if (n_level == 2) then
		if WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)] then
			n_title = WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)][n_rank]
		end
	end
	
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	
	local nTime	= nMon * 1000000 + nDay * 10000	-- 持续到下届联赛结束
	_M("Title_AddTitle", n_title, nTime)
	
	--Remove武林盟主豪光，在add新的豪光之前- Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
		
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	
	
	SetTask(1122, n_title)	--当前玩家领取的是哪个头衔ID
	local tb = {"冠军", "亚军", "第三名", "第四名"}
	Msg2Player("阁下你获得称号<color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color>! 该称号可以维持 <color=yellow>20<color> 天.")
end

--最终领取排行奖励
function wlls_getaward_rank()
	local n_award, n_level, str_lgname, nRank = wlls_checkaward_rank();
	if (n_award) then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[n_level][n_award]
		local n_got = GetGlbValue(GLB_WLLS_SID)
		n_got = SetByte(n_got, 4, n_type)
		n_got = SetByte(n_got, 3, n_level)
		n_got = SetByte(n_got, 2, n_award)
		SetTask(WLLS_TASKID_GOTAWARD, n_got)
		local nPoint	= tb_award[2]
		Msg2Player("恭喜你达到"..str_des.."排名奖: 名望值"..tb_award[2].."点")
		wlls_award_log(format("获得排名奖 %s: 名望值%d 点",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--有队长额外奖励
			--该判断只对队长不能转移的情况（师徒赛）安全
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("恭喜你达到"..str_des.."排名奖 (队长): 名望值"..tb_award[3].."点")
				wlls_award_log(format("获得排名奖 %s (队长): 名望值 %d 点",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("总共有 %d 名望值", GetTask(WLLS_TASKID_HONOUR)))
		
		if (nRank == 1) then -- 获得第一名 荣誉排行榜 联赛值加1
		    local nCurPoint = GetTask(2601);
		    nCurPoint = nCurPoint + 1;
		    SetTask(2601, nCurPoint);
		end

		SyncTaskValue(WLLS_TASKID_HONOUR)
	end
end

--检查是否可以建立战队
function wlls_cancreate(n_level)
	local n_mylevel = wlls_player_level()
	--等级限制
	if (n_mylevel ~= n_level) then
		if (n_level == 1) then
			if (n_mylevel < n_level) then
				wlls_descript("<enter>  <color=red>武林新秀联赛<color>虽然是选出各门派的优秀豪杰，但是，你的等级不够!"..WLLS_LEVEL_JUNIOR.."级，武艺不精，只怕刀剑无眼，把你弄伤，你需要继续练习!")
			else
				wlls_descript("<enter> 阁下已是鼎鼎有名的江湖大侠, <color=red>武林新秀联赛<color> 是想选出年轻有为的人才，你需要在后面面前耍威风吗？要不你参加 <color=red>武林联赛<color> 吧!")
			end
		else
			wlls_descript("<enter>  <color=red>武林联赛<color>依然是天下英雄练剑之处，你的等级不够!"..WLLS_LEVEL_SENIOR.."级，天下英雄聚集，卧虎藏龙，恐怕你只是后辈，最好是多练习!")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter>  阁下入组了，不能成立其他组了!")
		return nil
	end
	return wlls_player_type()
end

--我的战队
function wlls_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local n_type

	if (FALSE(n_lid)) then
		n_type = GetGlbValue(GLB_WLLS_NEXT)
	else
		n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)		
	end
	
	WLLS_TAB[n_type].npc_mylg()
end

function wlls_want2create()
	local n_level = wlls_getcityinfo()
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	if (not wlls_cancreate(n_level)) then return end
	wlls_descript("<enter>"..WLLS_TAB[n_next].text_creat,
		"我想建立小组!/wlls_inputstr_lgname",
		"我再看看/OnCancel")
end

--输入战队名
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "输入想成立的小组名字")
end

--建立战队（最终）
function wlls_createleague(str_lgname)
	if (not str_lgname) then
		str_lgname = GetName()
	end
	local n_level = wlls_getcityinfo()
	local n_mtype = wlls_cancreate(n_level)
	if (not n_mtype) then return end
	str_lgname = strsub(str_lgname,1,16)
	local forbidstr={" ","\"","/","#","|","\t","\n"}
	local str
	for i = 1, getn(forbidstr) do
		if (not FALSE(strfind(str_lgname,forbidstr[i]))) then
			str = "对不起! 你的小组没有该字:"
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [拍照]"
				elseif (forbidstr[i]=="\t") then
					str = str .. "[TAB]"
				elseif (forbidstr[i]=="\n") then
					str = str .. " [Enter]"
				else
					str = str .. forbidstr[i]
				end
			end
			break
		end
	end
	if (not str) then
		if (not FALSE(LG_GetLeagueObj(WLLS_LGTYPE, str_lgname))) then
			str = "对不起! 该联赛队名字已有人使用."
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "对不起! 你的小组由的字不对."
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "明白了，我将重新输入!/wlls_inputstr_lgname", "不需要!/OnCancel")
		return
	end
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local szParam = GetName().." "..n_next.." "..n_mtype.." "..str_lgname
	LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, GetName(), "\\script\\leaguematch\\league.lua", "wlls_create", szParam , "", "")
	
	
	SetRespect(0)
end


--添加成员（对话）
function wlls_want2addmember()
	local teammember, _, str_lgname = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local str = wlls_npcname().."你想下面的人"..getn(teammember).."加入你的小组 ["..str_lgname.."] 是吗?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "对，登记让他(她) 加入联赛/wlls_sure2addmember","不需要!/OnCancel")
end

--添加成员（最终）
function wlls_sure2addmember()
	local teammember = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local str_lgname = LG_GetLeagueInfo(n_lid)
	for i = 1, getn(teammember) do
		local nPlayerIndex = SearchPlayer(teammember[i])
		if nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, SetRespect, 0)
			local szParam = teammember[i].." "..str_lgname.." "..GetName()
			LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, teammember[i], "\\script\\leaguematch\\league.lua", "wlls_add", szParam , "", "")
		end	
	end
end

--检查组队队员是否可以被添加到当前队伍中，成功返回组队队员名单、战队类型、战队名，否则返回nil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().."对不起! 你需要是 <color=red> 队长<color> 在<color=red>小组<color>, 才能登记加入战队队员.",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().."你的小组好像没有其他组的成员，你想让谁进入自己的组吗?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."对不起! 你没有建立小组，不能让其他人进入小组!", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().."对不起! 你不是队长，不能给其他人进入小组!", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().."对不起! 下次联赛类型不变, 你的战队目前已到期，不能继续使用.", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().."对不起! 你的战队["..str_lgname.."]已够人了，不能再加入成员了!",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().."对不起! 你的战队["..str_lgname.."]只需要重新输入"..n_mcount.." 人，不能让你的全部成员加入，请让余下的成员暂时离开小组!",0)
		return nil
	end

	local teammember = {}
	local str_capname = GetName()
	local n_capidx = PlayerIndex
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i)
		local membername = GetName()
		--避免重复加入队员
		if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, membername))) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname().."对不起! 在小组的队员:"..membername.." 已是其他战队成员，所以，不能进入你的战队!", 0)
		 	return nil
		end
		--加入队员特殊检查
		local str = wlls_check_addmem(n_capidx, n_lid, n_mtype)
		if (str) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname()..str, 0)
		 	return nil
		end
		teammember[i-1] = membername
	end
	PlayerIndex = n_capidx
	return teammember, n_mtype, str_lgname
end

--离开战队（对话）
function wlls_want2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB)
	local str = wlls_npcname().."你想离开战队["..str_lgname.."]ph秈 kh玭g?"
	if(n_memcount <= 1) then
		str = str .. "你现在是 <color=red>唯一的成员<color>在你的战队. 如果你离开战队，战队将被解散."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--师徒赛
			str = str .. "目前你是 <color=red>队长 (师傅)<color> 如果你离开战队，你的徒弟将<color=red>不能参加联赛<color>."
		else	--其他联赛
			str = str .. "目前你是 <color=red>队长<color>, 如果你离开小组, 队长职务将转交给其他成员."
		end
	end
	Say(str, 2, "对!/wlls_sure2leaveleague","不需要!/OnCancel")
end

--离开战队（确认对话）
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().."当你离开小组后，将<color=yellow>不能领取战队奖励<color>, 你确定想离开吗?", 2, "对!/wlls_leaveleague_final","不需要!/OnCancel")
end

--离开战队（最终）
function wlls_leaveleague_final()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	LG_ApplyDoScript(WLLS_LGTYPE, "", GetName(), "\\script\\leaguematch\\league.lua", "wlls_leave", GetName() , "", "")
end

--进入会场（对话）
function wlls_want2signmap()
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	
	if (n_matchphase < 2) then
		Say(wlls_npcname().."目前是联赛暂休时间，会场将暂时关闭，你等到联赛时再来吧!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("你没有"..str_des.."战队，如果参加联赛，系统将为你建立一个战队，你想建立一个战队吗?", "我想建立战队!/#wlls_createleague()", "我不想联赛!/OnCancel")
		else
			wlls_descript("<enter>  此次"..str_des.." 不见你战队报名，是不是弄错了？武林盟主规定很严格，我想帮你也不行。大侠确定一下，然后来找我!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--记录入场地点
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--传送到报名点地图
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("你已到<color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color>联赛区域")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--检查是否可以离开战队。可以返回n_lid，否则返回nil,原因字符串
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "你依然没有进入战队!"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "由于你的战队正在联赛，你不能离开战队，请等到联赛完再来!"
	end
	
	if(n_phase > 3) then
		return nil, "正在联赛，不能离开战队，请等下一场休息时间才能离开."
	end
	
	return n_lid
end

--取得当前联赛排名奖励至少需要多少名
function wlls_get_award_min()
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_level = wlls_getcityinfo()
	local tb = WLLS_TAB[n_type].award_rank[n_level]
	return tb[getn(tb)][1]
end

--经验领取开关
function wlls_show_expswitch()
	local b_exps = GetBit(GetTask(WLLS_TASKID_SWITCH), 1)
	local str = "<enter>   此次武林联赛奖励很丰富，如果你们想使用经验值就来我这里，打开经验值，你可以锁住自己的经验值奖励.<enter>"
	str = str.."<enter>   目前你的关闭/打开状态为"..iif(b_exps == 0, "<color=red>打开 color> (可以领取经验值) ", "<color=red>关闭<color> (不能领取经验值) ")..""
	wlls_descript(str, iif(b_exps == 0, "我想关闭奖励/#wlls_set_expswitch(1)", "我想打开奖励/#wlls_set_expswitch(0)"), "好的，我建立好了!/OnCancel")
end

--设置经验领取开关
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "成功"..iif(b_exps == 0, "打开", "关闭").."联赛经验奖励!")
end

--用荣誉换取商品
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end

	Msg2Player("目前你有<color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> 名望值")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- 商店的荣誉积分编号为11
	else
		Say(wlls_npcname().."请打开箱子锁后再买! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "目前大侠有的名望值为 <color=yellow>"..GetRespect().."<color>")
end

--用荣誉换取商品
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	--在名望商店取消卖道具的限制- Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "目前不能买名望道具")
--		return 
--	end
	
	
	Msg2Player("目前大侠有威望值为：<color=yellow>"..GetRespect().."<color>")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- 商店的荣誉积分编号为11
	else
		Say(wlls_npcname().."请打开箱子锁后再买! ", 0)
	end
end