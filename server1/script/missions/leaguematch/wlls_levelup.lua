Include( "\\script\\missions\\leaguematch\\head.lua" )

--ÖÃÔ½¼¶×´Ì¬
function wlls_set_over(str_lgname, str_plname)
	local n_over = GetGlbValue(GLB_WLLS_SID)
	if (GetGlbValue(GLB_WLLS_PHASE) == 1) then	--¼äÐªÆÚËãÏÂÒ»¸öÈü¼¾
		n_over = n_over + 1
	end
	LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER, n_over, "", "")
end

--Éý¼¶¼ì²é
function wlls_leveupcheck()
	local str_plname = GetName();
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then	--ÎÞÕ½¶Ó
		return
	end
	
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_over = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER)
	if (n_over > 0) then	--ÔçÒÑÔ½¼¶
		return
	end

	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_level = WLLS_TAB[n_mytype].match_type[n_mtype].level
	if (n_level == 1) then	--ÐÂÐãÕ½¶Ó³ÉÔ±£¬ÅÐ¶ÏÊÇ·ñÔ½¼¶
		if (GetLevel() >= WLLS_LEVEL_SENIOR) then	--ÒÑ¾­Ô½¼¶
			wlls_set_over(str_lgname, str_plname)
			Msg2Player("§¼ng cÊp cña b¹n ®· cao h¬n 119, kh«ng thÓ tham gia <color=yellow>vâ l©m liªn ®Êu kiÖt xuÊt<color> nh­ng b¹n cã thÓ tham gia <color=yellow>vâ l©m liªn ®Êu<color> .")
			return
		end
	end

	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_JOB)
	if (n_mytype == 3 and n_job == 0) then	--Ê¦Í½ÁªÈü£¬ÅÐ¶ÏÍ½µÜÊÇ·ñÔ½¼¶
		if (GetLevel() >= 90) then	--ÒÑ¾­Ô½¼¶
			wlls_set_over(str_lgname, str_plname)
			Msg2Player("§¼ng cÊp qu¸ cao so víi quy ®Þnh <color=yellow>song ®Êu s­ ®å<color> cã thÓ tham gia h×nh thøc kh¸c <color=yellow>tam ®Êu<color>. Tr­íc tiªn ph¶i lËp ®éi")
			return
		end
	end
end
