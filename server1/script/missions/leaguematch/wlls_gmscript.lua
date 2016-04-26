Include( "\\script\\missions\\leaguematch\\head.lua" )

TB_WLLS_JOIN_SAY = {
	"这位大侠，进入赛场的时间已过，下次再来吧!",
	"大侠，未加入战队，怎么参加比赛?",
	"每个比赛场地只容纳400战队，目前已够了，你下次再来吧!",
	"这次联赛，阁下的战队参加场数已达最高，不能再参加了!",
	"对不起，你战队的成员和你一起进入准备区域，为了避免发生意外，请再试一次!",
	"人已够多了，不能进入了",
}

TB_WLLS_PHASE_MSG = {
	"武林联赛和武林新秀联赛这处于暂时休息阶段，各位勇士可以领取排名奖励，及整顿自己的战队。此次比赛的限制为%s",
	"武林联赛和武林新秀联赛即将开始，请各位勇士检查自己的战队。此次比赛的限制为?%s",
	"武林联赛今天暂时结束 ",	-- 不一定是今天再没有比赛了
	"武林新秀联赛 %d 正处于报名阶段，各队想参加，请快点来报名!",
}

--向指定角色名发消息
function wlls_gw_say(rolename, str, b_msg, b_sync)
	local n_playeridx = SearchPlayer(rolename)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		if b_msg then
			Msg2Player(str)
		else
			local str_npc = GetNpcName(GetLastDiagNpc())
			if (str_npc ~= "联赛使者" and str_npc ~= "武林新秀联赛官员" and str_npc ~= "会场官员") then str_npc = "武林官员" end
			Say(str_npc..":"..str, 0)
		end
		if b_sync then
			wlls_sync_lginfo(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))
		end
		PlayerIndex = n_old
	end
end

--当前比赛阶段调整
function wlls_setphase(n_sid, n_type, n_phase, n_mid, n_next, tbOpen)
	_M("wlls_setphase", n_sid, n_type, n_phase, n_mid, n_next, tbOpen)
	--数值化，安全起见
	n_sid = tonumber(n_sid)
	n_type = tonumber(n_type)
	n_phase = tonumber(n_phase)
	n_mid = tonumber(n_mid)
	n_next = tonumber(n_next)
	
	local nClose	= 0
	for i = 1, getn(tbOpen) do
		if (FALSE(tbOpen[i])) then
			nClose	= SetBit(nClose, i, 1)
		end
	end
	_M("{"..join(tbOpen).."}", nClose)

	--备份旧值
	local n_oldsid = GetGlbValue(GLB_WLLS_SID)
	local n_oldtype = GetGlbValue(GLB_WLLS_TYPE)
	local n_oldphase = GetGlbValue(GLB_WLLS_PHASE)
	local n_oldmid = GetGlbValue(GLB_WLLS_MATCHID)
	local n_oldnext = GetGlbValue(GLB_WLLS_NEXT)
	local nOldClose = GetGlbValue(GLB_WLLS_CLOSE)
	
	--无变化直接返回
	if (n_oldsid == n_sid and
		n_oldtype == n_type and
		n_oldphase == n_phase and
		n_oldmid == n_mid and
		n_oldnext == n_next and
		nOldClose == nClose) then	--无变化直接返回
		return
	end
	
	--保存新值
	SetGlbValue(GLB_WLLS_SID, n_sid)
	SetGlbValue(GLB_WLLS_TYPE, n_type)
	SetGlbValue(GLB_WLLS_PHASE, n_phase)
	SetGlbValue(GLB_WLLS_MATCHID, n_mid)
	SetGlbValue(GLB_WLLS_NEXT, n_next)
	SetGlbValue(GLB_WLLS_CLOSE, nClose)
	
	if (n_phase == 1) then	--间歇期
		local str = format(TB_WLLS_PHASE_MSG[1], WLLS_TAB[n_next].name)
		Msg2SubWorld(str)
	elseif (n_phase == 2) then	--比赛期，无比赛
		if (n_oldsid ~= n_sid) then	--新赛季
			local str = format(TB_WLLS_PHASE_MSG[2], WLLS_TAB[n_type].name)
			Msg2SubWorld(str)
		else
			Msg2SubWorld(TB_WLLS_PHASE_MSG[3])
		end
	elseif (n_phase == 4) then	--开始比赛
		local tb_sub = wlls_get_subworld(2)
		local n_oldsub = SubWorld

		--取消可能正在等待开始的比赛
		for n_idx, nGroupIdx in tb_sub do
			SubWorld = n_idx
			CloseMission(WLLS_MSID_SCHEDULE)
		end
		
		if (n_mid <= 0) then	--Relay刚刚启动，不能开始比赛
			SetGlbValue(GLB_WLLS_PHASE, 3)	--阻止继续进入准备场
			if (n_oldmid > 0) then
				--为可能已经开始比赛的玩家恢复比赛ID
				SetGlbValue(GLB_WLLS_MATCHID, n_oldmid)
			end
		else
			--关闭全局计时Mission
			CloseGlbMission(WLLS_MSID_GLB)
			if (nClose ~= 3) then	-- 不是所有比赛都关了
				--打开全局计时Mission
				OpenGlbMission(WLLS_MSID_GLB)
				
				local str = format(TB_WLLS_PHASE_MSG[4], mod(n_mid, 100))
				Msg2SubWorld(str)
				AddGlobalNews(str)
				WriteLog(date("%Y/%m/%d-%H:%M\t")..str)
				
				--开启所有准备场
				local tbGroup	= {}
				local n_oldsub = SubWorld
				for n_idx, nGroupIdx in tb_sub do
					SubWorld = n_idx
					local nMType	= wlls_get_mapinfo()
					local nLevel	= wlls_get_level(nMType)
					if (not FALSE(tbOpen[nLevel])) then	-- 没有关闭的话
						tbGroup[getn(tbGroup)+1]	= nGroupIdx
						print("sever开启准备"..wlls_get_desc(3).."sever")
						OpenMission(WLLS_MSID_SCHEDULE)
					end
				end
				if (getn(tbGroup) > 0) then
					local szParam = GetPlayerCount().." "..join(tbGroup).." 1"	-- 1表示是开始报名后的第一次汇报
					LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_GsState", szParam , "", "")
				end
			end
		end
		SubWorld = n_oldsub
	else
		print("武林大会正处于阶段:"..n_phase.."("..n_mid..") ???")
	end
end

--让指定角色进入指定服务器的准备场，加入指定阵营
function wlls_player_join(str_playername, n_mtype, n_group, n_mscamp)
	_M("wlls_player_join", str_playername, n_mtype, n_group, n_mscamp)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 4) then	--时间已过
		n_group = nil
		n_mtype = 1
	end
	local n_playeridx = SearchPlayer(str_playername)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		if n_group then	--relay认为可以进入
			if not wlls_en_check() then	--跨服失败怎么判断？？？！！！
				local szResult = n_mtype.." "..n_group.." "..GetName()
				LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_onleave", szResult , "", "")
				return
			end
			SetTask(WLLS_TASKID_ORGCAMP, n_mscamp)
			--清除附加状态
			for i = 1, getn(WLLS_FORBID_ITEM) do
				RemoveSkillState(WLLS_FORBID_ITEM[i][3])
			end
			for i = 1, getn(WLLS_FORBID_STATES) do
				RemoveSkillState(WLLS_FORBID_STATES[i][2])
			end
			Msg2Player("进入比赛区域后，不能移动装备里的物品，但是可以使用装备和工具栏里的物品");
			SetRevPos(wlls_get_mapid(1, n_mtype, n_group), 1)	--重生点在所在比赛服务器的会场
			local n_mapid = wlls_get_mapid(2, n_mtype, n_group)
			_M(n_mapid, "wlls_get_mapid", n_mtype, n_group)
			NewWorld(n_mapid, WLLS_MAPPOS_PRE[1], WLLS_MAPPOS_PRE[2])
		else	--不能进入
			Say(TB_WLLS_JOIN_SAY[n_mtype], 0)
		end
		PlayerIndex = n_old
	end
end

-- 返回指定奖品信息
function wlls_get_awardinfo(n_type, n_level, n_award)
	local str	= WLLS_LEVEL_DESC[n_level] .. " (" .. WLLS_TAB[n_type].name .. ")次"

	local tb_award	= WLLS_TAB[n_type].award_rank[n_level]
	
	local n_start, n_end	= 1, 1
	if (n_award > 1) then
		n_start	= tb_award[n_award - 1][1] + 1
	end
	n_end	= tb_award[n_award][1]
	
	if (n_start ~= n_end) then
		str	= str .. n_start .. "~" .. n_end
	else
		str	= str .. n_end
	end
	str	= str .. "奖励 (" .. tb_award[n_award][3] .. ") "
	
	return str
end

-- 返回指定排名应该领取的奖项
function wlls_get_rankinfo(tb_award, n_rank)
	if (n_rank <= 0) then
		return nil
	end
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award
end

--查询本角色已领取了什么奖励
function wlls_awardinfo(b_Msg)
	local str
	local n_got		= GetTask(WLLS_TASKID_GOTAWARD)
	local n_type	= GetByte(n_got, 4)
	local n_level	= GetByte(n_got, 3)
	local n_award	= GetByte(n_got, 2)
	local n_sid		= GetByte(n_got, 1)
	if (n_award == 0) then
		if (n_sid == 0) then
			str	= "未领过"
		else
			str	= "名次" .. n_sid .. "此次联赛，未知内容"
		end
	else 
		str	= "名次 " .. n_sid .. "此次" .. wlls_get_awardinfo(n_type, n_level, n_award)
	end

	local n_awardex	= GetTask(WLLS_TASKID_AWARDEX)
	local n_type	= GetByte(n_awardex, 4)
	local n_level	= GetByte(n_awardex, 3)
	local n_awarderr= GetByte(n_awardex, 2)
	local n_award	= GetByte(n_awardex, 1)
	
	if b_Msg then
		Msg2Player(str)
	end

	return str
end

function wlls_reload(bRelay)
	LoadScript( "\\script\\missions\\leaguematch\\npc\\officer.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\helper.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\signup.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\housecarl.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\chefu.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\chuwuxiang.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\yaoshang.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\combat\\mission.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\combat\\playerdeath.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\schedule\\newworld.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\schedule\\mission.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\schedule\\newworld.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\glbmission\\mission.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\glbmission\\combat.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\glbmission\\schedule.lua" )
	LoadScript( "\\script\\global\\server_playerlevelup.lua" )
	LoadScript( "\\script\\global\\login.lua" )
	if (bRelay) then
		LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "ReloadAllScript", "" , "", "")
	end
	Msg2Player("WLLS file 已超限"..date())
	print("===============WLLS file 已超限"..date())
end
