Include( "\\script\\missions\\leaguematch\\head.lua" )
WLLS_FACTION_NAME	= {"少林 ", "天王", "唐门", "五毒", "峨眉", "翠烟", "丐帮", "天忍", "武当", "昆仑"}
WLLS_FACTION_NAME[0] = "无门派"
WLLS_FILE_ENTERPOS = "\\settings\\maps\\championship\\champion_gmpos.txt"
if (TabFile_Load(WLLS_FILE_ENTERPOS, "ENTERPOS") == 0) then
	wlls_error_log("Load TabFile Error!"..WLLS_FILE_ENTERPOS)
end

function wlls_GetPosFileData(row, col)
	return tonumber(TabFile_GetCell("ENTERPOS", row + 1, col))
end

function wlls_SaveMeetEmy(tbLG, nEmyNameID)
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLG.szName, WLLS_LGTASK_EMY2, LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY1))
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLG.szName, WLLS_LGTASK_EMY3, LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY2))
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLG.szName, WLLS_LGTASK_EMY1, nEmyNameID)
end

--将一组阵营编号乱序，如果总数是单数，选出一个轮空阵营
function wlls_buildup_vs( tb_camp , tbLGs )
	local n_allcamp = getn(tb_camp)
	--print("wlls_buildup_vs", n_allcamp)
	WriteLog(date("%y-%m-%d,%H:%M:%S").."\twlls_buildup_vs("..n_allcamp..")")
	local tb_winrate = {}	--得分率数组
	for i = 1, 10 do	--分成10段
		tb_winrate[i] = {}
	end
	for i = 1, n_allcamp do	--阵营放入得分率数组
		local n_camp = tb_camp[i]
		local n_winrate = 0.1
		local nWinPoint	= tbLGs[n_camp].nWin*3 + tbLGs[n_camp].nTie
		if (nWinPoint > 0) then
			n_winrate = nWinPoint/tbLGs[n_camp].nTotal
		end
		if (n_winrate > 3 or n_winrate <= 0) then
			wlls_error_log("wlls_buildup_vs Abnormal winrate "..nWinPoint.."/"..tbLGs[n_camp].nTotal)
			n_winrate = 0.1
		end
		local tb_twr = tb_winrate[ceil(n_winrate/0.3)]
		tb_twr[getn(tb_twr)+1] = n_camp
	end
	local tb_vscamp = {}
	for i = 10, 1, -1 do	--将每一段放入 tb_vscamp
		local tb_twr = tb_winrate[i]
		_M("TB_WinRate["..i.."] = "..join(tb_twr))
		local n_count = getn(tb_vscamp)
		for j = 1, getn(tb_twr) do
			tb_vscamp[n_count + j] = tb_twr[j]
		end
	end
	_M("TB_VSCamp1 = "..join(tb_vscamp))
	local n_blockpl = ceil(n_allcamp/5)
	if (n_blockpl < 5) then
		n_blockpl = 5
	end
	for i = 0, 4 do	--分5段乱序
		local n_start = i * n_blockpl	--本段乱序起始位置（-1）
		local n_len = n_allcamp - n_start	--本段乱序长度
		if (n_len > n_blockpl) then
			n_len = n_blockpl
		end
		for j = n_start + 1, n_start + n_len, 2 do
			local n_swap = random(n_len) + n_start	--与哪个交换
			local n_camp = tb_vscamp[n_swap]
			tb_vscamp[n_swap] = tb_vscamp[j]
			tb_vscamp[j] = n_camp
		end
	end
	_M("TB_VSCamp2 = "..join(tb_vscamp))
	--检查最近对阵情况
	for i = 1, n_allcamp - 1, 2 do
		local tbMyEmys	= tbLGs[tb_vscamp[i]].tbEmys
		local nSelectMeet	= 0
		for j = i + 1, n_allcamp do
			nMeet	= tbMyEmys[tbLGs[tb_vscamp[j]].nNameID]
			if (not nMeet or nMeet > nSelectMeet) then	--未相遇或相遇较早，选中
				if (j ~= i + 1) then
					local nCamp	= tb_vscamp[j]
					tb_vscamp[j]	= tb_vscamp[i+1]
					tb_vscamp[i+1]	= nCamp
				end
				nSelectMeet	= nMeet
			end
			if (not nSelectMeet) then
				break
			end
		end
		--记录对阵情况
		wlls_SaveMeetEmy(tbLGs[tb_vscamp[i]], tbLGs[tb_vscamp[i+1]].nNameID)
		wlls_SaveMeetEmy(tbLGs[tb_vscamp[i+1]], tbLGs[tb_vscamp[i]].nNameID)
		local szOut	= format("%s(%d)\tVS\t%s(%d)",
			tbLGs[tb_vscamp[i]].szName, tb_vscamp[i],
			tbLGs[tb_vscamp[i+1]].szName, tb_vscamp[i+1])
		--print(szOut)
		WriteLog("WLLS_VS\t"..szOut)
	end
	local n_wincamp = nil
	if (mod(n_allcamp, 2) == 1) then	--如果是单数，最后一个轮空
		local n_wincamp = tb_vscamp[n_allcamp]
		tb_vscamp[n_allcamp] = nil
		local szOut	= format("single\t%s(%d)", tbLGs[n_wincamp].szName, n_wincamp)
		--print(szOut)
		WriteLog("WLLS_VS\t"..szOut)
		return tb_vscamp, n_wincamp
	else
		return tb_vscamp
	end
end

--curmscamp阵营的玩家进入比赛场
function wlls_addplayer_combat(tbLGs, nOrgCamp, nEmyCamp, nNewCamp, tbNewPos)
	_M("wlls_addplayer_combat", nOrgCamp, nEmyCamp, nNewCamp, "{"..join(tbNewPos).."}")

	--战队信息，记录自己的阵营
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLGs[nOrgCamp].szName, WLLS_LGTASK_MSCAMP, nNewCamp)

	local nCombatMap = wlls_get_mapid(3)
	local nOldPlIdx = PlayerIndex

	for _, nIdx in tbLGs[nOrgCamp].tbPlayer do
		PlayerIndex = nIdx
		NewWorld(tbNewPos[1], tbNewPos[2], tbNewPos[3])  --传入赛场
		AddMSPlayer(WLLS_MSID_COMBAT, nNewCamp);  --加入阵营
		SetCurCamp(mod(nNewCamp, 2) + 2)
		wlls_set_pl_state()		--设置入场状态
		SetTask(WLLS_TASKID_ORGCAMP, nNewCamp)
		SetDeathScript(WLLS_FILE_DEATHSCRIPT);	--设置死亡脚本
		ST_StartDamageCounter()	--开始计算伤害
	end

	local szMsg	= "<color=pink>战事信息：对手[<color=yellow>"..tbLGs[nEmyCamp].szName.."<color>] 战队有<color=yellow>"..getn(tbLGs[nEmyCamp].tbPlayer).."<color> 人进入比赛"
	Msg2MSGroup(WLLS_MSID_COMBAT, szMsg, nNewCamp)
	szMsg	= "对手信息如下: "
	for _, nIdx in tbLGs[nEmyCamp].tbPlayer do
		PlayerIndex = nIdx
		szMsg	= szMsg..format("\n<color=white>%16s <color=green>%3d 级<color=yellow>%s", GetName(), GetLevel(), GetLastAddFaction())
	end
	Msg2MSGroup(WLLS_MSID_COMBAT, szMsg, nNewCamp)

	PlayerIndex = nOldPlIdx
end

--将一组MS阵营送入比赛场
function wlls_addtroop_combat( tb_vscamp , tbLGs )
	local nCombatMap	= wlls_get_mapid(3)
	local nOldWorld		= SubWorld
	SubWorld	= SubWorldID2Idx(nCombatMap)

	for i = 1, getn(tb_vscamp) - 1, 2 do
		local posx = wlls_GetPosFileData(ceil(i/2), 1)
		local posy = wlls_GetPosFileData(ceil(i/2), 2)
		
		--阵营进入比赛场
		wlls_addplayer_combat(tbLGs, tb_vscamp[i], tb_vscamp[i+1], i, {nCombatMap, posx, posy})
		wlls_addplayer_combat(tbLGs, tb_vscamp[i+1], tb_vscamp[i], i + 1, {nCombatMap, posx, posy})
		
	end
	
	Msg2MSAll(WLLS_MSID_COMBAT, "你已进入比赛区域，比赛在<color=yellow>"..(WLLS_TIMER_FIGHT_FREQ * WLLS_TIMER_FIGHT_PREP).."<color> 秒后正式开始")
	
	SubWorld	= nOldWorld
end

function OnTimer()
	--时间计数增加
	local n_timer = GetGlbValue(GLB_WLLS_TIME) + 1
	SetGlbValue(GLB_WLLS_TIME, n_timer)
	n_timer = WLLS_TIMER_PREP_TOTAL - n_timer	--准备完毕剩余时间
	
	local tb_sub = wlls_get_subworld(2)
	local n_oldsub = SubWorld
	if (n_timer <= 0) then	--准备结束，开始比赛
		StopGlbMSTimer(WLLS_MSID_GLB, WLLS_TIMERID_SCHEDULE)
		SetGlbValue(GLB_WLLS_PHASE, 5)
		SetGlbValue(GLB_WLLS_TIME, 0)
		StartGlbMSTimer(WLLS_MSID_GLB, WLLS_TIMERID_COMBAT, WLLS_TIMER_FIGHT_FREQ*WLLS_FRAME2TIME)
		Msg2SubWorld("报名武林新秀联赛已结束，比赛正式开始!")
		
		--处理每个准备场
		for n_idx, nGroupIdx in tb_sub do
			SubWorld = n_idx
			
			local tb_mstroop = wlls_get_ms_troop()
			_M("getn(tb_mstroop)="..getn(tb_mstroop))
			if (getn(tb_mstroop) < WLLS_MIN_TEAM) then
				Msg2SubWorld("参赛队伍太少, "..wlls_get_desc(3).."取消该场比赛")
				tb_mstroop = {}
			end
			
			--获取每个阵营战队信息
			local nOldPLIdx = PlayerIndex
			local tbLGs	= {}
			local tbPlayer	= {}
			for _, nCamp in tb_mstroop do
				tbPlayer = wlls_get_ms_plidx(nCamp)
				PlayerIndex = tbPlayer[1]
				if (not PlayerIndex or PlayerIndex <= 0) then
					wlls_error_log("schedule.lua:OnTimer", "bad PlayerIndex", PlayerIndex, nCamp)
					wlls_remove_camp(0)
					return
				end
				tbLGs[nCamp]	= wlls_GetLGInfo()
				if (not tbLGs[nCamp]) then
					wlls_error_log("schedule.lua:OnTimer", "bad LG", PlayerIndex, nCamp)
					wlls_remove_camp(0)
					return
				end
				tbLGs[nCamp].tbPlayer = tbPlayer
			end
			
			PlayerIndex = nOldPLIdx
			
			local tb_vstroop, n_wincamp = wlls_buildup_vs(tb_mstroop, tbLGs)
			_M("n_wincamp="..tostring(n_wincamp))
			
			--开启比赛场Mission
			local n_oldworld = SubWorld
			local n_combatmap = wlls_get_mapid(3)
			SubWorld = SubWorldID2Idx(n_combatmap)
			CloseMission(WLLS_MSID_COMBAT)	--以防万一，主要用于调试阶段
			OpenMission(WLLS_MSID_COMBAT)
			SubWorld = n_oldworld			
	
			--对直接获胜的战队进行奖励
			if n_wincamp then
				local n_usedtime = 5 * 60 * WLLS_FRAME2TIME	-- 5分钟
				wlls_matchresult(tbLGs[n_wincamp].szName, nil, nil, n_usedtime)
			end
	
			wlls_addtroop_combat(tb_vstroop, tbLGs)	--将一组MS阵营送入比赛场
			
			CloseMission(WLLS_MSID_SCHEDULE)
		end
	else
		-- 向Relay汇报当前负载
		local tbGroup	= {}
		local bReport	= (mod(n_timer, 60 / WLLS_TIMER_PREP_FREQ) == 0)
		for n_idx, nGroupIdx in tb_sub do
			tbGroup[getn(tbGroup)+1]	= nGroupIdx
			-- 1分钟一次，通知当前剩余时间
			if (bReport) then
				SubWorld = n_idx
				Msg2MSAll(WLLS_MSID_SCHEDULE, "比赛时间还剩 <color=yellow>"..(n_timer*WLLS_TIMER_PREP_FREQ/60).."<color> 分")
			end
		end
		if (getn(tbGroup) > 0) then
			local szParam = GetPlayerCount().." "..join(tbGroup)
			LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_GsState", szParam , "", "")
		end
	end
	SubWorld = n_oldsub
end
