Include( "\\script\\missions\\leaguematch\\head.lua" )

TB_WLLS_JOIN_SAY = {
	"Th�i gian v�o khu v�c �� h�t, l�n sau h�y t�i s�m h�n!",
	"Ch�a v�o ��i, kh�ng th� v�o h�i tr��ng",
	"M�i ��a �i�m ch� ch�a t�i �a ���c 400 ��i!",
	"Li�n ��u th�ng n�y, ��i b�n �� tham gia �� s� tr�n!",
	"Xin l�i! Th�nh vi�n trong ��i c�a b�n �� v�o khu v�c chu�n b�, h�y th� l�i",
	"S� ng��i �� ��, kh�ng th� v�o",
}

TB_WLLS_PHASE_MSG = {
	"V� l�m li�n ��u �ang trong giai �o�n ngh� ng�i, c� th� nh�n th��ng theo t�ng c�p b�c. H�n ch� %s",
	"V� l�m li�n ��u s�p b�t ��u, h�y ki�m tra chi�n ��i. H�n ch� %s",
	"V� l�m li�n ��u t�m th�i k�t th�c ",	-- ��һ���ǽ�����û�б�����
	"V� l�m li�n ��u %d ch�nh th�c v�o giai �o�n b�o danh, c�c ��i h�y mau ��ng k�!",
}

--��ָ����ɫ������Ϣ
function wlls_gw_say(rolename, str, b_msg, b_sync)
	local n_playeridx = SearchPlayer(rolename)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		if b_msg then
			Msg2Player(str)
		else
			local str_npc = GetNpcName(GetLastDiagNpc())
			if (str_npc ~= " S� gi� V� l�m li�n ��u" and str_npc ~= " v� l�m t�n t� li�n cu�c so t�i quan vi�n " and str_npc ~= " h�i tr��ng quan vi�n ") then str_npc = " v� l�m quan vi�n " end
			Say(str_npc..":"..str, 0)
		end
		if b_sync then
			wlls_sync_lginfo(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))
		end
		PlayerIndex = n_old
	end
end

--��ǰ�����׶ε���
function wlls_setphase(n_sid, n_type, n_phase, n_mid, n_next, tbOpen)
	_M("wlls_setphase", n_sid, n_type, n_phase, n_mid, n_next, tbOpen)
	--��ֵ������ȫ���
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

	--���ݾ�ֵ
	local n_oldsid = GetGlbValue(GLB_WLLS_SID)
	local n_oldtype = GetGlbValue(GLB_WLLS_TYPE)
	local n_oldphase = GetGlbValue(GLB_WLLS_PHASE)
	local n_oldmid = GetGlbValue(GLB_WLLS_MATCHID)
	local n_oldnext = GetGlbValue(GLB_WLLS_NEXT)
	local nOldClose = GetGlbValue(GLB_WLLS_CLOSE)
	
	--�ޱ仯ֱ�ӷ���
	if (n_oldsid == n_sid and
		n_oldtype == n_type and
		n_oldphase == n_phase and
		n_oldmid == n_mid and
		n_oldnext == n_next and
		nOldClose == nClose) then	--�ޱ仯ֱ�ӷ���
		return
	end
	
	--������ֵ
	SetGlbValue(GLB_WLLS_SID, n_sid)
	SetGlbValue(GLB_WLLS_TYPE, n_type)
	SetGlbValue(GLB_WLLS_PHASE, n_phase)
	SetGlbValue(GLB_WLLS_MATCHID, n_mid)
	SetGlbValue(GLB_WLLS_NEXT, n_next)
	SetGlbValue(GLB_WLLS_CLOSE, nClose)
	
	if (n_phase == 1) then	--��Ъ��
		local str = format(TB_WLLS_PHASE_MSG[1], WLLS_TAB[n_next].name)
		Msg2SubWorld(str)
	elseif (n_phase == 2) then	--�����ڣ��ޱ���
		if (n_oldsid ~= n_sid) then	--������
			local str = format(TB_WLLS_PHASE_MSG[2], WLLS_TAB[n_type].name)
			Msg2SubWorld(str)
		else
			Msg2SubWorld(TB_WLLS_PHASE_MSG[3])
		end
	elseif (n_phase == 4) then	--��ʼ����
		local tb_sub = wlls_get_subworld(2)
		local n_oldsub = SubWorld

		--ȡ���������ڵȴ���ʼ�ı���
		for n_idx, nGroupIdx in tb_sub do
			SubWorld = n_idx
			CloseMission(WLLS_MSID_SCHEDULE)
		end
		
		if (n_mid <= 0) then	--Relay�ո����������ܿ�ʼ����
			SetGlbValue(GLB_WLLS_PHASE, 3)	--��ֹ��������׼����
			if (n_oldmid > 0) then
				--Ϊ�����Ѿ���ʼ��������һָ�����ID
				SetGlbValue(GLB_WLLS_MATCHID, n_oldmid)
			end
		else
			--�ر�ȫ�ּ�ʱMission
			CloseGlbMission(WLLS_MSID_GLB)
			if (nClose ~= 3) then	-- �������б���������
				--��ȫ�ּ�ʱMission
				OpenGlbMission(WLLS_MSID_GLB)
				
				local str = format(TB_WLLS_PHASE_MSG[4], mod(n_mid, 100))
				Msg2SubWorld(str)
				AddGlobalNews(str)
				WriteLog(date("%Y/%m/%d-%H:%M\t")..str)
				
				--��������׼����
				local tbGroup	= {}
				local n_oldsub = SubWorld
				for n_idx, nGroupIdx in tb_sub do
					SubWorld = n_idx
					local nMType	= wlls_get_mapinfo()
					local nLevel	= wlls_get_level(nMType)
					if (not FALSE(tbOpen[nLevel])) then	-- û�йرյĻ�
						tbGroup[getn(tbGroup)+1]	= nGroupIdx
						print("sever li�n ��u chu�n b� "..wlls_get_desc(3).."sever")
						OpenMission(WLLS_MSID_SCHEDULE)
					end
				end
				if (getn(tbGroup) > 0) then
					local szParam = GetPlayerCount().." "..join(tbGroup).." 1"	-- 1��ʾ�ǿ�ʼ������ĵ�һ�λ㱨
					LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_GsState", szParam , "", "")
				end
			end
		end
		SubWorld = n_oldsub
	else
		print("��i h�i v� l�m �ang ��ng � giai �o�n :"..n_phase.."("..n_mid..") ???")
	end
end

--��ָ����ɫ����ָ����������׼����������ָ����Ӫ
function wlls_player_join(str_playername, n_mtype, n_group, n_mscamp)
	_M("wlls_player_join", str_playername, n_mtype, n_group, n_mscamp)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 4) then	--ʱ���ѹ�
		n_group = nil
		n_mtype = 1
	end
	local n_playeridx = SearchPlayer(str_playername)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		if n_group then	--relay��Ϊ���Խ���
			if not wlls_en_check() then	--���ʧ����ô�жϣ�����������
				local szResult = n_mtype.." "..n_group.." "..GetName()
				LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_onleave", szResult , "", "")
				return
			end
			SetTask(WLLS_TASKID_ORGCAMP, n_mscamp)
			--�������״̬
			for i = 1, getn(WLLS_FORBID_ITEM) do
				RemoveSkillState(WLLS_FORBID_ITEM[i][3])
			end
			for i = 1, getn(WLLS_FORBID_STATES) do
				RemoveSkillState(WLLS_FORBID_STATES[i][2])
			end
			Msg2Player("Khi v�o khu v�c chu�n b�, v�t ph�m s� kh�ng th� di chuy�n, nh�ng v�n c� th� s� d�ng trong thanh c�ng c�");
			SetRevPos(wlls_get_mapid(1, n_mtype, n_group), 1)	--�����������ڱ����������Ļ᳡
			local n_mapid = wlls_get_mapid(2, n_mtype, n_group)
			_M(n_mapid, "wlls_get_mapid", n_mtype, n_group)
			NewWorld(n_mapid, WLLS_MAPPOS_PRE[1], WLLS_MAPPOS_PRE[2])
		else	--���ܽ���
			Say(TB_WLLS_JOIN_SAY[n_mtype], 0)
		end
		PlayerIndex = n_old
	end
end

-- ����ָ����Ʒ��Ϣ
function wlls_get_awardinfo(n_type, n_level, n_award)
	local str	= WLLS_LEVEL_DESC[n_level] .. " (" .. WLLS_TAB[n_type].name .. ") l�n"

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
	str	= str .. " t��ng th��ng (" .. tb_award[n_award][3] .. ") "
	
	return str
end

-- ����ָ������Ӧ����ȡ�Ľ���
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

--��ѯ����ɫ����ȡ��ʲô����
function wlls_awardinfo(b_Msg)
	local str
	local n_got		= GetTask(WLLS_TASKID_GOTAWARD)
	local n_type	= GetByte(n_got, 4)
	local n_level	= GetByte(n_got, 3)
	local n_award	= GetByte(n_got, 2)
	local n_sid		= GetByte(n_got, 1)
	if (n_award == 0) then
		if (n_sid == 0) then
			str	= " kh�ng d�n qu� "
		else
			str	= " h�ng " .. n_sid .. " l�n n�y li�n cu�c so t�i , kh�ng bi�t n�i dung "
		end
	else 
		str	= " h�ng  " .. n_sid .. " l�n n�y " .. wlls_get_awardinfo(n_type, n_level, n_award)
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
	Msg2Player("WLLS file �� c�c k� h�n "..date())
	print("===============WLLS file �� c�c k� h�n "..date())
end
