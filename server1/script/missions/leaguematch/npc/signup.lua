Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_want2transback()
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("会场侍卫：你的战队不是正在比赛吗？如果现在离开将不能领奖，你想好了吗?",
			2, "对!/wlls_transback", "不需要!/OnCancel")
	else
		wlls_transback()
	end
end

--检查是否可以进入准备场，成功返回（n_matchtype,leagueid），否则返回nil
function wlls_ready2join()
	local n_mtype, n_group = wlls_get_mapinfo()
	local n_lid = wlls_check_player(GetName(), nil, n_mtype)
	if (FALSE(n_lid)) then
		wlls_transback()
		return nil
	end
	
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	if (n_matchphase < 3) then
		Say("现在你没比赛，需要我送你回去吗?", 2, "对!/wlls_transback", "我还不想回/OnCancel")
		return nil
	end
	
	local tb_option = wlls_add_option({}, "不需要")
	if (n_matchphase == 3) then	--间歇时间
		--如果不是最后一场？
		Say("请暂时休息一下，目前还未开始比赛，你还有什么要求吗?", getn(tb_option), tb_option)
		return nil
	end
	
	--判断是否越级
	local str = wlls_levelcheck(n_lid)
	if (str) then
		Say("会场官员:"..str, 2, "我想离开会场!/wlls_want2transback", "不需要!/OnCancel")
		return nil
	end

	if (n_matchphase == 5) then	--比赛时间
		local n_combatmap = wlls_get_mapid(3, n_mtype, n_group)
		local n_resttime = WLLS_TIMER_FIGHT_TOTAL - GetGlbValue(GLB_WLLS_TIME)
		n_resttime = ceil(n_resttime*WLLS_TIMER_FIGHT_FREQ/60)
		Say("依然还在进行比赛，结束时间还剩"..n_resttime.."分钟，你需要什么帮助吗?", getn(tb_option), tb_option)
		return nil
	end

	if (n_matchphase == 4) then	--准备时间
		return n_mtype, n_lid
	end
	
	print("n_matchphase error! :"..n_matchphase)
end

function main()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then
		return
	end
	
	local nLevel	= wlls_get_level(n_mtype)
	if (not wlls_CheckIsOpen(nLevel)) then
		return
	end
	
	local tb_option = {"我想参战!/wlls_en1"}
	wlls_add_option(tb_option, "不需要")
	Say("现在正处于报名阶段，你想参加比赛是吗?", getn(tb_option), tb_option)
	
	local _, _, n_count = LG_GetLeagueInfo(n_lid)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_maxmem = WLLS_TAB[n_type].max_member
	if (n_count < n_maxmem) then
		Msg2Player("你的队现在只剩<color=yellow>"..n_count.."<color>成员，你的战队可以最多加入<color=yellow>"..n_maxmem.."<color>成员.")
	end
end

function wlls_en1()
	Say("武林连斗不能使用<color=red> 不论哪种PK药品<color>, <color=yellow>各种技能辅助效果也将失效<color>. 开始比赛后可以<color=yellow>使用各种技能<color>. 在进入赛场之前需要看看各种准备的耗损度，赛场不允许把装备丢向外面",2, "我已准备好!/wlls_en2", "我稍后再来!/OnCancel")
end

function wlls_en2()
	Say("会场官员:<color=red>进入准备区域和比赛区域，玩家不能移动装备里的物品，但是依然可以使用道具栏和装备里的物品。你检查工具栏里的物品够了吗?",2,"确定/wlls_en3", "我没装备好!/OnCancel")
end

function wlls_en3()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then return end
	if not wlls_en_check() then return end
	
	local szResult = n_mtype.." "..GetName()
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_want2join", szResult , "", "")
end

