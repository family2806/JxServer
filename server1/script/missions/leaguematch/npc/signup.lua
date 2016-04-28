Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_want2transback()
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("NÕu rêi khái khu vùc chuÈn bŞ, sÏ kh«ng thÓ thi ®Êu",
			2, "Rêi khái!/wlls_transback", "Kh«ng cã g×!/OnCancel")
	else
		wlls_transback()
	end
end

--¼ì²éÊÇ·ñ¿ÉÒÔ½øÈë×¼±¸³¡£¬³É¹¦·µ»Ø£¨n_matchtype,leagueid£©£¬·ñÔò·µ»Ønil
function wlls_ready2join()
	local n_mtype, n_group = wlls_get_mapinfo()
	local n_lid = wlls_check_player(GetName(), nil, n_mtype)
	if (FALSE(n_lid)) then
		wlls_transback()
		return nil
	end
	
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	if (n_matchphase < 3) then
		Say("HiÖn t¹i ch­a cã liªn ®Êu !", 2, "Rêi khái!/wlls_transback", "Kh«ng cÇn/OnCancel")
		return nil
	end
	
	local tb_option = wlls_add_option({}, "Kh«ng cÇn")
	if (n_matchphase == 3) then	--¼äĞªÊ±¼ä
		--Èç¹û²»ÊÇ×îºóÒ»³¡£¿
		Say("H·y nghØ ng¬i mét chót, trËn tiÕp theo sÏ b¾t ®Çu sau İt phót n÷a", getn(tb_option), tb_option)
		return nil
	end
	
	--ÅĞ¶ÏÊÇ·ñÔ½¼¶
	local str = wlls_levelcheck(n_lid)
	if (str) then
		Say("Quan viªn liªn ®Êu: "..str, 2, "Ta muèn rêi khái ®©y!/wlls_want2transback", "Kh«ng cã g×!/OnCancel")
		return nil
	end

	if (n_matchphase == 5) then	--±ÈÈüÊ±¼ä
		local n_combatmap = wlls_get_mapid(3, n_mtype, n_group)
		local n_resttime = WLLS_TIMER_FIGHT_TOTAL - GetGlbValue(GLB_WLLS_TIME)
		n_resttime = ceil(n_resttime*WLLS_TIMER_FIGHT_FREQ/60)
		Say("§ang trong giai ®o¹n thi ®Êu, cßn l¹i "..n_resttime.." n÷a sÏ kÕt thóc", getn(tb_option), tb_option)
		return nil
	end

	if (n_matchphase == 4) then	--×¼±¸Ê±¼ä
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
	
	local tb_option = {"Ta muèn tham chiÕn!/wlls_en1"}
	wlls_add_option(tb_option, "Kh«ng cÇn")
	Say("Liªn ®Êu ®ang trong giai ®o¹n b¸o danh, ng­¬i muèn tham gia kh«ng ?", getn(tb_option), tb_option)
	
	local _, _, n_count = LG_GetLeagueInfo(n_lid)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_maxmem = WLLS_TAB[n_type].max_member
	if (n_count < n_maxmem) then
		Msg2Player("Ng­¬i ®éi b©y giê chØ cßn d­ <color=yellow>"..n_count.."<color> thµnh viªn , ng­¬i chiÕn ®éi cã thÓ nhiÒu nhÊt gia nhËp <color=yellow>"..n_maxmem.."<color> thµnh viªn .")
	end
end

function wlls_en1()
	Say("Vâ l©m ngay c¶ ®Êu kh«ng thÓ sö dông <color=red> bÊt luËn lo¹i nµo PK thuèc men <color>, <color=yellow> c¸c lo¹i kü n¨ng phô trî hiÖu qu¶ còng ®em mÊt ®i hiÖu lùc <color>. b¾t ®Çu tranh tµi sau cã thÓ <color=yellow> sö dông c¸c lo¹i kü n¨ng <color>. ë tiÕn vµo cuéc so tµi trµng tr­íc cÇn xem mét chót c¸c lo¹i chuÈn bŞ hao tæn ®é , cuéc so tµi trµng kh«ng cho phĞp ®em trang bŞ nĞm vÒ phİa bªn ngoµi ",2, "Ta ®· chuÈn bŞ xong !/wlls_en2", "Ta sau nµy trë l¹i !/OnCancel")
end

function wlls_en2()
	Say("Héi tr­êng quan viªn :<color=red> tiÕn vµo chuÈn bŞ khu vùc cïng tranh tµi khu vùc , nhµ ch¬i kh«ng thÓ di ®éng trang bŞ dÆm vËt phÈm , nh­ng lµ nh­ cò cã thÓ sö dông ®¹o cô lan cïng trang bŞ dÆm vËt phÈm . ng­¬i kiÓm tra c«ng cô lan dÆm vËt phÈm ®ñ ch­a ?",2,"X¸c ®Şnh /wlls_en3", "Ta kh«ng cã trang bŞ h¶o !/OnCancel")
end

function wlls_en3()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then return end
	if not wlls_en_check() then return end
	
	local szResult = n_mtype.." "..GetName()
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_want2join", szResult , "", "")
end

