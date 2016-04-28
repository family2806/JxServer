--ÎäÁÖÁªÈü¹ÙÔ±

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )
Include("\\script\\lib\\log.lua")


--Ö÷¶Ô»°¿ò
function main()
	local n_level = wlls_getcityinfo()
	if (not wlls_CheckIsOpen(n_level)) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (not FALSE(n_lid)) then
		--¼ì²é²¢ÌáÊ¾ÕÒ´í¹ÙÔ±µÄÇé¿ö
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mylevel = WLLS_TAB[n_mytype].match_type[n_mtype].level
		if (n_mylevel ~= n_level) then
			wlls_descript("<enter> c¸c h¹ ®· gia nhËp <color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> ®iÓm vinh dù ta lµ <color=red>"..WLLS_LEVEL_DESC[n_level].."<color> ®iÓm vinh dù, cã ph¶i hay kh«ng t×m lén ng­êi ?", wlls_add_option({}, "Kh«ng cã chuyÖn g× "))
			return
		end
		
		--ÅĞ¶ÏÊÇ·ñÔ½¼¶
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"Ta muèn rêi khái ®éi!/wlls_want2leaveleague",
				"Ta muèn l·nh th­ëng/wlls_wantaward",
				"Ta chØ tiÖn ghĞ qua/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "Ta muèn ®Õn "..str_des.." héi tr­êng/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = " "..str_des.." nhãm/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "Ta muèn l·nh phÇn th­ëng liªn ®Êu/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "KiÓm tra ®iÓm vinh dù/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "T¾t më nhËn kinh nghiÖm/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "Ta chØ tiÖn ghĞ qua"))
end

--ÁìÈ¡½±Àø£¨¶Ô»°£©
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter> Gi¶i th­ëng liªn ®Êu bao gåm ®iÓm <color=red>xÕp h¹ng<color> ®iÓm vinh dù vµ ®iÓm <color=red>vinh dù<color> ®iÓm vinh dù. Sau khi kÕt thóc giai ®o¹n liªn ®Êu <color=red> dùa vµo sè trËn chiÕn th¾ng<color> ®iÓm vinh dù ®Ó xÕp thø h¹ng. <color=red>"..n_awardmin.." ®éi xÕp h¹ng cao nhÊt<color> ®iÓm vinh dù sÏ nhËn ®­îc <color=red>phÇn th­ëng ®Æc biÖt<color> ®iÓm vinh dù.Cã thÓ dïng ®iÓm vinh dù ®Ó mua vËt phÈm!"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "Ta muèn nhËn phÇn th­ëng xÕp h¹ng!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "Ta muèn nhËn phÇn th­ëng danh hiÖu!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "Ta muèn ®æi ®iÓm vinh dù/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "Ta muèn ®æi ®iÓm uy tİn/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "Ta chØ tiÖn ghĞ qua/OnCancel"
	wlls_descript(str, tb_option)
end

--ÁìÈ¡ÅÅÃû½±Àø£¨¶Ô»°£©
function wlls_wantaward_rank()
	--¼ì²éÅÅÃû½±Àø	
	local nAward, nLevel, szLGName, nRank = wlls_checkaward_rank()
	if nAward then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[nLevel][nAward]
		local str = "<enter>  ChiÕn ®éi: <color=yellow>"..szLGName.."<color> ®iÓm vinh dù trong "..str_des.." xÕp h¹ng <color=yellow>"..nRank.."<color> ®iÓm vinh dù. NhËn ®­îc "..tb_award[2].." ®iÓm danh väng."
		if (tb_award[3]) then	--ÓĞ¶Ó³¤¶îÍâ½±Àø
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.." ®éi tr­ëng nhËn ®­îc "..tb_award[3].." ®iÓm danh väng."
			end
		end
		str = str.." cã muèn lÜnh kh«ng ?"
		wlls_descript(str,
			"LÜnh th­ëng!/wlls_getaward_rank",
			"Trë vÒ!/OnCancel")
		return
	end
end

--¼ì²éÊÇ·ñ¿ÉÒÔÁìÈ¡ÅÅÃû½±Àø£¬·µ»Ø¿ÉÒÔÁìµÄÀàĞÍ£¬nilÎª²»¿ÉÁì
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--¸ÕºÃÔÚ¿çÈü¼¾µÄÊ±ºòÒªÁì½±
		if (not b_silent) then
			Msg2Player("Tr­íc m¾t liªn cuéc so tµi ®· tiÕn hµnh míi liªn cuéc so tµi , kh«ng thÓ dÉn lÇn tr­íc liªn cuéc so tµi ®øng hµng t­ëng th­ëng .")
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
			wlls_descript("<enter> lÇn nµy "..str_des.." <color=red>"..n_awardmin.."<color> ®iÓm vinh dù tr­íc m¾t ®· ®øng hµng , gièng nh­ c¸c h¹ ®İch chiÕn ®éi kh«ng cã ë bªn trong !"..n_awardmin.." ®Ó cho ta gióp ng­¬i kiÓm tra mét c¸i ")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> ®õng t­ëng r»ng gia nhËp nh÷ng kh¸c tiÓu tæ lµ cã thÓ tíi gi¶ m¹o dÉn t­ëng . h¹ kú ng­¬i trë l¹i ®i !")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> c¸c h¹ ®· dÉn t­ëng liÔu , muèn g¹t ta sao ?")
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

--ÁìÈ¡³ÆºÅ½±Àø
function wlls_wantaward_title()
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then
		Msg2Player("§· tiÕn hµnh liªn ®Êu, kh«ng thÓ nhËn th­ëng!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().." gi¶i th­ëng chØ giµnh cho "..wlls_get_desc(1).." xuÊt s¾c nhÊt(4 ®éi h¹ng ®Çu) . Ng­¬i kh«ng thuéc trong nhãm ®ã, ®õng ph¸ rèi!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter> ®õng t­ëng r»ng gia nhËp tæ ®éi lµ cã thÓ gi¶ m¹o tíi nhËn th­ëng. Ng­¬i trë l¹i ®i !")
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
	
	local nTime	= nMon * 1000000 + nDay * 10000	-- ³ÖĞøµ½ÏÂ½ìÁªÈü½áÊø
	_M("Title_AddTitle", n_title, nTime)
	
	--RemoveÎäÁÖÃËÖ÷ºÀ¹â£¬ÔÚaddĞÂµÄºÀ¹âÖ®Ç°- Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
		
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	
	
	SetTask(1122, n_title)	--µ±Ç°Íæ¼ÒÁìÈ¡µÄÊÇÄÄ¸öÍ·ÏÎID
	local tb = {"V« §Şch ", " ¸ qu©n ", "H¹ng Ba", "H¹ng T­"}
	Msg2Player("C¸c h¹ ng­¬i ®¹t ®­îc danh hiÖu <color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color> ®iÓm vinh dù! nªn danh hiÖu cã thÓ duy tr× <color=yellow>20<color> ®iÓm vinh dù ngµy .")
end

--×îÖÕÁìÈ¡ÅÅĞĞ½±Àø
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
		Msg2Player("Chóc mõng, b¹n ®¹t ®­îc "..str_des.." danh hiÖu: Gi¸ trŞ vinh dù "..tb_award[2].." ®iÓm")
		wlls_award_log(format("»ñµÃÅÅÃû½± %s: ÃûÍûÖµ%d  ®iÓm",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--ÓĞ¶Ó³¤¶îÍâ½±Àø
			--¸ÃÅĞ¶ÏÖ»¶Ô¶Ó³¤²»ÄÜ×ªÒÆµÄÇé¿ö£¨Ê¦Í½Èü£©°²È«
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("Chóc mõng, b¹n ®¹t ®­îc "..str_des.."danh hiÖu, gi¶i th­ëng(®éi tr­ëng): Gi¸ trŞ vinh dù "..tb_award[3].." ®iÓm")
				wlls_award_log(format("»ñµÃÅÅÃû½± %s (¶Ó³¤): ÃûÍûÖµ %d  ®iÓm",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("Tæng céng cã %d danh väng  ", GetTask(WLLS_TASKID_HONOUR)))
		
		if (nRank == 1) then -- »ñµÃµÚÒ»Ãû ÈÙÓşÅÅĞĞ°ñ ÁªÈüÖµ¼Ó1
		    local nCurPoint = GetTask(2601);
		    nCurPoint = nCurPoint + 1;
		    SetTask(2601, nCurPoint);
		end

		SyncTaskValue(WLLS_TASKID_HONOUR)
	end
end

--¼ì²éÊÇ·ñ¿ÉÒÔ½¨Á¢Õ½¶Ó
function wlls_cancreate(n_level)
	local n_mylevel = wlls_player_level()
	--µÈ¼¶ÏŞÖÆ
	if (n_mylevel ~= n_level) then
		if (n_level == 1) then
			if (n_mylevel < n_level) then
				wlls_descript("<enter>  <color=red>Vâ l©m liªn ®Êu<color> ®iÓm vinh dù héi tô tÊt c¶ c¸c anh hïng, nh­ng cÊp ®é cña b¹n kh«ng ®ñ! Ph¶i ®¹t level "..WLLS_LEVEL_JUNIOR.." trë lªn th× míi cã thÓ tham gia!")
			else
				wlls_descript("<enter> c¸c h¹ ®· lµ ®Ønh ®Ønh næi danh giang hå ®¹i hiÖp , <color=red> vâ l©m t©n tó liªn cuéc so tµi <color> ®iÓm vinh dù lµ muèn chän lùa tuæi trÎ tµi cao ng­êi cña míi , ng­¬i cÇn ë phİa sau tr­íc mÆt ®ïa bìn uy phong sao ? nÕu kh«ng ng­¬i tham gia <color=red> vâ l©m liªn cuéc so tµi <color> ®iÓm vinh dù ®i !")
			end
		else
			wlls_descript("<enter> <color=red> vâ l©m liªn cuéc so tµi <color> ®iÓm vinh dù vÉn lµ anh hïng thiªn h¹ luyÖn kiÕm chç , cÊp bËc cña ng­¬i kh«ng ®ñ !"..WLLS_LEVEL_SENIOR.." cÊp , anh hïng thiªn h¹ tô tËp , ®Çm rång hang hæ , chØ sî ng­¬i ch¼ng qua lµ hËu bèi , tèt nhÊt lµ luyÖn nhiÒu tËp !")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter> c¸c h¹ vµo ®éi råi , kh«ng thÓ thµnh lËp ®éi kh¸c!")
		return nil
	end
	return wlls_player_type()
end

--ÎÒµÄÕ½¶Ó
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
		"Ta muèn lËp ®éi!/wlls_inputstr_lgname",
		"Suy nghÜ l¹i/OnCancel")
end

--ÊäÈëÕ½¶ÓÃû
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "NhËp vµo tªn nhãm")
end

--½¨Á¢Õ½¶Ó£¨×îÖÕ£©
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
			str = "Xin lçi! Tªn kh«ng ®­îc cã kı tù: "
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [ chôp h×nh ]"
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
			str = "Xin lçi! Tªn nhãm ®· ®­îc sö dông"
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "Xin lçi! Tªn nhãm cã kı tù kh«ng ®óng"
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "NhËp l¹i!/wlls_inputstr_lgname", "Kh«ng cÇn!/OnCancel")
		return
	end
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local szParam = GetName().." "..n_next.." "..n_mtype.." "..str_lgname
	LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, GetName(), "\\script\\leaguematch\\league.lua", "wlls_create", szParam , "", "")
	
	
	SetRespect(0)
end


--Ìí¼Ó³ÉÔ±£¨¶Ô»°£©
function wlls_want2addmember()
	local teammember, _, str_lgname = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local str = wlls_npcname().." ng­¬i nghÜ ng­êi phİa d­íi "..getn(teammember).." gia nhËp tæ ®éi ["..str_lgname.."] ph¶i kh«ng ?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "Cho gia nhËp /wlls_sure2addmember","Kh«ng cÇn!/OnCancel")
end

--Ìí¼Ó³ÉÔ±£¨×îÖÕ£©
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

--¼ì²é×é¶Ó¶ÓÔ±ÊÇ·ñ¿ÉÒÔ±»Ìí¼Óµ½µ±Ç°¶ÓÎéÖĞ£¬Thµnh c«ng ·µ»Ø×é¶Ó¶ÓÔ±Ãûµ¥¡¢Õ½¶ÓÀàĞÍ¡¢Õ½¶ÓÃû£¬·ñÔò·µ»Ønil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().." thËt xin lçi ! ng­¬i cÇn lµ <color=red> ®éi tr­ëng <color> ®iÓm vinh dù ë <color=red> tiÓu tæ <color> ®iÓm vinh dù, míi cã thÓ ghi danh gia nhËp chiÕn ®éi ®éi viªn .",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().." ng­¬i tiÓu tæ gièng nh­ kh«ng cã nh÷ng kh¸c tæ thµnh viªn , ng­¬i muèn cho ng­êi nµo tiÕn vµo m×nh tæ sao ?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().." thËt xin lçi ! ng­¬i kh«ng cã thµnh lËp tiÓu tæ , kh«ng thÓ ®Ó cho nh÷ng ng­êi kh¸c tiÕn vµo tiÓu tæ !", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().." thËt xin lçi ! ng­¬i kh«ng ph¶i lµ ®éi tr­ëng , kh«ng thÓ cho nh÷ng ng­êi kh¸c tiÕn vµo tiÓu tæ !", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().." thËt xin lçi ! lÇn sau liªn cuéc so tµi lo¹i h×nh kh«ng thay ®æi , ng­¬i chiÕn ®éi tr­íc m¾t ®· ®Õn kú , kh«ng thÓ tiÕp tôc sö dông .", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().." thËt xin lçi ! ng­¬i chiÕn ®éi ["..str_lgname.."] ®· ®ñ ng­êi , kh«ng thÓ l¹i thªm vµo thµnh viªn !",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().." thËt xin lçi ! ng­¬i chiÕn ®éi ["..str_lgname.."] chØ cÇn lÇn n÷a ®­a vµo "..n_mcount.." ng­êi , kh«ng thÓ ®Ó cho tÊt c¶ cña ng­¬i thµnh viªn gia nhËp , xin cho cßn sãt l¹i thµnh viªn t¹m thêi rêi ®i tiÓu tæ !",0)
		return nil
	end

	local teammember = {}
	local str_capname = GetName()
	local n_capidx = PlayerIndex
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i)
		local membername = GetName()
		--±ÜÃâÖØ¸´¼ÓÈë¶ÓÔ±
		if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, membername))) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname().." thËt xin lçi ! ë tiÓu tæ ®éi viªn :"..membername.." ®· lµ nh÷ng chiÕn ®éi kh¸c thµnh viªn , cho nªn , kh«ng thÓ vµo ng­¬i chiÕn ®éi !", 0)
		 	return nil
		end
		--¼ÓÈë¶ÓÔ±ÌØÊâ¼ì²é
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

--Àë¿ªÕ½¶Ó£¨¶Ô»°£©
function wlls_want2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB)
	local str = wlls_npcname().." ng­¬i nghÜ rêi ®i chiÕn ®éi ["..str_lgname.."] ph¶i kh«ng?"
	if(n_memcount <= 1) then
		str = str .. " ng­¬i b©y giê lµ <color=red> duy nhÊt thµnh viªn <color> ®iÓm vinh dù ë ng­¬i chiÕn ®éi . nÕu nh­ ng­¬i rêi ®i chiÕn ®éi , chiÕn ®éi ®em bŞ gi¶i t¸n ."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--Ê¦Í½Èü
			str = str .. " tr­íc m¾t ng­¬i lµ <color=red> ®éi tr­ëng ( s­ phã )<color> ®iÓm vinh dù nÕu nh­ ng­¬i rêi ®i chiÕn ®éi , ®å ®Ö cña ng­¬i ®em <color=red> kh«ng thÓ tham gia liªn cuéc so tµi <color> ®iÓm vinh dù."
		else	--ÆäËûÁªÈü
			str = str .. " tr­íc m¾t ng­¬i lµ <color=red> ®éi tr­ëng <color> ®iÓm vinh dù, nÕu nh­ ng­¬i rêi ®i tiÓu tæ , ®éi tr­ëng chøc vô ®em chuyÓn giao cho thµnh viªn kh¸c ."
		end
	end
	Say(str, 2, "§èi víi !/wlls_sure2leaveleague","Kh«ng cÇn!/OnCancel")
end

--Àë¿ªÕ½¶Ó£¨È·ÈÏ¶Ô»°£©
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().." khi ng­¬i rêi ®i tiÓu tæ sau , ®em <color=yellow> kh«ng thÓ nhËn lÊy chiÕn ®éi t­ëng th­ëng <color> ®iÓm vinh dù, ng­¬i x¸c ®Şnh muèn rêi ®i sao ?", 2, "§èi víi !/wlls_leaveleague_final","Kh«ng cÇn!/OnCancel")
end

--Àë¿ªÕ½¶Ó£¨×îÖÕ£©
function wlls_leaveleague_final()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	LG_ApplyDoScript(WLLS_LGTYPE, "", GetName(), "\\script\\leaguematch\\league.lua", "wlls_leave", GetName() , "", "")
end

--½øÈë»á³¡£¨¶Ô»°£©
function wlls_want2signmap()
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	
	if (n_matchphase < 2) then
		Say(wlls_npcname()..": liªn ®Êu ®ang trong giai ®o¹n nghØ ng¬i, héi tr­êng liªn ®Êu t¹m thêi ®ãng!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("B¹n ch­a cã "..str_des.." nhãm, nÕu tham gia vµo liªn ®Êu, chóng t«i sÏ t¹o cho b¹n mét nhãm", "Ta muèn t¹o nhãm!/#wlls_createleague()", "Kh«ng cÇn!/OnCancel")
		else
			wlls_descript("<enter> lÇn nµy "..str_des.." nhãm, ph¶i cã chiÕn ®éi míi cã thÓ vµo héi tr­êng!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--¼ÇÂ¼Èë³¡µØ ®iÓm
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--´«ËÍµ½±¨Ãû ®iÓmµØÍ¼
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("B¹n ®Õn <color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color> ®iÓm vinh dù khu vùc liªn ®Êu")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--¼ì²éÊÇ·ñ¿ÉÒÔÀë¿ªÕ½¶Ó¡£¿ÉÒÔ·µ»Øn_lid£¬·ñÔò·µ»Ønil,Ô­Òò×Ö·û´®
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "Ng­¬i vÉn kh«ng cã tiÕn vµo chiÕn ®éi !"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "Bëi v× ng­¬i chiÕn ®éi ®ang liªn cuéc so tµi , ng­¬i kh«ng thÓ rêi ®i chiÕn ®éi , xin ®îi ®Õn liªn cuéc so tµi hoµn trë l¹i !"
	end
	
	if(n_phase > 3) then
		return nil, "§ang liªn cuéc so tµi , kh«ng thÓ rêi ®i chiÕn ®éi , xin chê chót mét cuéc thêi gian nghØ ng¬i míi cã thÓ rêi ®i ."
	end
	
	return n_lid
end

--È¡µÃµ±Ç°ÁªÈüÅÅÃû½±ÀøÖÁÉÙĞèÒª¶àÉÙÃû
function wlls_get_award_min()
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_level = wlls_getcityinfo()
	local tb = WLLS_TAB[n_type].award_rank[n_level]
	return tb[getn(tb)][1]
end

--¾­ÑéÁìÈ¡¿ª¹Ø
function wlls_show_expswitch()
	local b_exps = GetBit(GetTask(WLLS_TASKID_SWITCH), 1)
	local str = "<enter> lÇn nµy vâ l©m liªn cuéc so tµi t­ëng th­ëng rÊt phong phó , nÕu nh­ c¸c ng­¬i muèn sö dông kinh nghiÖm trŞ gi¸ sÏ tíi ta chç nµy , më ra kinh nghiÖm trŞ gi¸ , ng­¬i cã thÓ khãa l¹i m×nh kinh nghiÖm trŞ gi¸ t­ëng th­ëng .<enter>"
	str = str.."<enter> tr­íc m¾t ng­¬i t¾t / më ra tr¹ng th¸i v× "..iif(b_exps == 0, "<color=red> më ra color> ( cã thÓ nhËn lÊy kinh nghiÖm trŞ gi¸ ) ", "<color=red> t¾t <color> ®iÓm vinh dù ( kh«ng thÓ nhËn lÊy kinh nghiÖm trŞ gi¸ ) ")..""
	wlls_descript(str, iif(b_exps == 0, "Ta muèn t¾t t­ëng th­ëng /wlls_set_expswitch(1)", "Ta muèn më ra t­ëng th­ëng /wlls_set_expswitch(0)"), "Tèt , ta thµnh lËp tèt l¾m !/OnCancel")
end

--ÉèÖÃ¾­ÑéÁìÈ¡¿ª¹Ø
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "Thµnh c«ng "..iif(b_exps == 0, "Më ra ", "T¾t ").." liªn cuéc so tµi kinh nghiÖm t­ëng th­ëng !")
end

--ÓÃÈÙÓş»»È¡ÉÌÆ·
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end

	Msg2Player("B¹n cã <color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> ®iÓm vinh dù ®iÓm vinh dù")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- ÉÌµêµÄÈÙÓş»ı·Ö±àºÅÎª11
	else
		Say(wlls_npcname().."ÇëMë ra Ïä×ÓËøºóÔÙÂò! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "§iÓm vinh dù cña b¹n hiÖn t¹i lµ <color=yellow>"..GetRespect().."<color> ®iÓm vinh dù")
end

--ÓÃÈÙÓş»»È¡ÉÌÆ·
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end
	--ÔÚÃûÍûÉÌµêÈ¡ÏûÂôµÀ¾ßµÄÏŞÖÆ- Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "Ä¿Ç°²»ÄÜ¢òÃûÍûµÀ¾ß")
--		return 
--	end
	
	
	Msg2Player("B¹n ®ang cã <color=yellow>"..GetRespect().."<color> ®iÓm vinh dù")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- ÉÌµêµÄÈÙÓş»ı·Ö±àºÅÎª11
	else
		Say(wlls_npcname().."ÇëMë ra Ïä×ÓËøºóÔÙÂò! ", 0)
	end
end