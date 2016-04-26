Include( "\\script\\missions\\leaguematch\\head.lua" )
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	local n_mapid = wlls_get_mapid(1)
	if (not n_mapid) then
		wlls_error_log("��������׼������")
		wlls_transback()
		return
	end
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 4) then	--ʱ���ѹ�
		Say("�Բ����������ˣ��տ�ʼ������Ҫ���Ҵ����ȥ", 0)
		NewWorld(n_mapid, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
		return
	end
	
	wlls_set_pl_state()	--�������״̬
	SetCurCamp(1)	--�ı䵱ǰ��Ӫ
	
	--������Ӫ��
	local n_mscamp, str_lgname = wlls_findfriend(WLLS_MSID_SCHEDULE, GetName())
	if (n_mscamp) then
		_M("join in "..n_mscamp)
	else
		for i = 1, WLLS_MAX_COUNT do
			if (GetMSPlayerCount(WLLS_MSID_SCHEDULE, i) == 0) then
				n_mscamp = i
				break
			end
		end
		if (n_mscamp <= 0) then	--�쳣��û�пյ���Ӫ���Խ���
			wlls_error_log("OnNewWorld", "no free mscamp!")
			return
		end
		_M("new in "..n_mscamp)
	end
	AddMSPlayer(WLLS_MSID_SCHEDULE, n_mscamp)	--����Mission
	LG_ApplySetLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_MSCAMP, n_mscamp)
	
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local str_des = wlls_get_desc(3)
	Msg2Player("���ѽ���"..str_des.." ׼����������<color=yellow>"..mm.."<color>���Ӻ�ʼ")
	Msg2MSAll(WLLS_MSID_SCHEDULE, "<color=yellow>ս��["..str_lgname.."] "..GetName().."���ѽ���"..str_des.."׼������")
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 5) then	--����û�п�ʼ��Ӧ����׼��ʱ�䣩
		local n_mtype, n_group = wlls_get_mapinfo()
		local szResult = n_mtype.." "..n_group.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_onleave", szResult , "", "")
	end
	wlls_clear_pl_state()
	OnLeaveWorldDefault(szParam)
end