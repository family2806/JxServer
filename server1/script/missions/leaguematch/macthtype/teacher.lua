Include("\\script\\missions\\leaguematch\\tb_head.lua")
--============== thÇy trß hai ng­êi cuéc so tµi Ïà¹ØÊı¾İ===============

if (not tmp_process_data) then
	return
end

--È«²¿ thÇy trß hai ng­êi cuéc so tµi Ïà¹ØÊı¾İ
WLLS_DATA = {
	
	name = " thÇy trß hai ng­êi cuéc so tµi ",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10221,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10222,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--ÅÅĞĞ½±Àø£¬ĞÂĞã
			{1, 5000},	--µÚ1Ãû
			{2, 4000},	--µÚ2Ãû
			{3, 3500},	--µÚ3Ãû
			{4, 3000},	--µÚ4Ãû
			{8, 2000},	--µÚ5-8Ãû
			{16, 1500},	--µÚ9-16Ãû
			{32, 1000},	--µÚ17-32Ãû
			{64, 500},	--µÚ33-64Ãû
			{128, 250},	--µÚ65-128Ãû
		}, {	--ÁªÈü
			{1, 10000},	--µÚ1Ãû
			{2, 8000},	--µÚ2Ãû
			{3, 7000},	--µÚ3Ãû
			{4, 6000},	--µÚ4Ãû
			{8, 4000},	--µÚ5-8Ãû
			{16, 3000},	--µÚ9-16Ãû
			{32, 2000},	--µÚ17-32Ãû
			{64, 1000},	--µÚ33-64Ãû
			{128, 500},	--µÚ65-128Ãû
		}
	},
	
	max_member = 2,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	--°ïÖúÎÄ×Ö£¨Ö÷ÒªµÄ°ïÖúÎÄ×ÖÔÚnormal.luaÖĞ£¬ÕâÀïÖ»Ğ´ÌØÒìµÄ²¿·Ö£©
	help_msg = {
		[" giíi thiÖu vâ l©m t©n tó liªn cuéc so tµi "]	=
			{
				"    ±¾´ÎÁªÈüÎª <color=red> thÇy trß hai ng­êi cuéc so tµi <color>. Íæ¼ÒÈ¥¼û <color=red>½Ü³öÊ¹Õß<color> ±¨Ãû³ÉÁ¢Õ½¶Ó, È»ºó½øÈë½Ü³öÁ¬¶·»á³¡½øĞĞÁªÈü. ¶Ó³¤(Ê¦¸µµÈ¼¶ĞèÒª 80- 119, ¶ÓÔ±(Í½µÜ) 50- 90",
				"    ±¾´ÎÁªÈüÎª<color=red> thÇy trß hai ng­êi cuéc so tµi <color>. Íæ¼ÒÈ¥¼û <color=red>½Ü³öÊ¹Õß<color> ±¨Ãû³ÉÁ¢Õ½¶Ó, È»ºó½øÈë½Ü³öÁ¬¶·»á³¡½øĞĞÁªÈü. ¶Ó³¤(Ê¦¸µµÈ¼¶ĞèÒª120 ÒÔÉÏ, ¶ÓÔ±(Í½µÜ) 50- 90",
			},
		[" thµnh lËp liªn t¸i qu¸ tr×nh "]	= " nhµ ch¬i cã thÓ m×nh thµnh lËp chiÕn ®éi hoÆc lµ gia nhËp nh÷ng chiÕn ®éi kh¸c . ®éi tr­ëng cÇn lµ kh«ng xuÊt s­ ®å ®Ö . ®éi tr­ëng ®i gÆp <s> ghi danh liªn cuéc so tµi ",
		[" rêi ®i liªn cuéc so tµi ®éi "]	= " ë <color=red> c¸ch nghØ ng¬i giai ®o¹n ­íc chõng <color>, nhµ ch¬i cã thÓ tù ®i tho¸t khái chiÕn ®éi . ë liªn cuéc so tµi giai ®o¹n , nÕu nh­ ng­¬i chiÕn ®éi <color=red> ch­a tíi liªn cuéc so tµi thêi ®iÓm <color>, nhµ ch¬i cã thÓ tù ®i rêi ®i chiÕn ®éi , nÕu nh­ ®· liªn cuéc so tµi liÔu th× kh«ng thÓ rêi ®i . <color=yellow> rêi ®i chiÕn ®éi sau , th× kh«ng thÓ dÉn ®øng hµng t­ëng <color>. nÕu nh­ ®éi tr­ëng rêi ®i ®éi , chiÕn ®éi còng sÏ bŞ gi¶i t¸n . <color=yellow> nÕu nh­ chiÕn ®éi kh«ng cã ai liÔu , liÒn tù ®éng gi¶i t¸n <color>. mçi lÇn ngay c¶ ®Êu kÕt thóc , c¸i nµo chiÕn ®éi kh«ng phï hîp lÇn sau liªn cuéc so tµi liÒn tù ®éng bŞ gi¶i t¸n ",
	},
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"±¾´ÎÁªÈüÎª<color=red> thÇy trß hai ng­êi cuéc so tµi <color>. ",
		"±¾´ÎÁªÈüÎª<color=red> thÇy trß hai ng­êi cuéc so tµi <color>. ",
	},
	
	text_creat = "    ÔÚ½¨Á¢Õ½¶Ó²Î¼Ó thÇy trß hai ng­êi cuéc so tµi ºó£¬Äã¿ÉÒÔ<color=red>×Ô¼ºÊÇ¶Ó³¤<color>.Èç¹ûÓĞÊ¦¸µ£¬¾ÍÒªÓÉ<color=red> Ê¦¸µ×ö¶Ó³¤<color>.<enter>"
		.." <color=red> nÕu nh­ ch­a tíi liªn cuéc so tµi thêi gian <color> cïng víi <color=red> kh«ng so qua bÊt kú mét cuéc <color>, ng­¬i cã thÓ rêi ®i chiÕn ®éi . nÕu nh­ s­ phã rêi ®i chiÕn ®éi , c¸i ®ã ®éi lËp tøc bŞ gi¶i t¸n . ng­¬i x¸c ®Şnh thµnh lËp chiÕn ®éi liÔu sao ?",
	
	--====Functions====
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> lÇn nµy "..str_des.." khi <color=red> thÇy trß liªn cuéc so tµi <color>, ng­¬i cã thÓ lùa chän thµnh lËp chiÕn ®éi , còng cã thÓ gia nhËp nh÷ng chiÕn ®éi kh¸c . ®éi tr­ëng gia nhËp ®éi viªn cÇn lµ kh«ng xuÊt s­ ®Ö tö . ®éi tr­ëng cïng ®å ®Ö häp thµnh ®éi hoµn hËu , cïng víi "..str_des.." cïng quan viªn ®èi tho¹i , lùa chän liªn cuéc so tµi ®éi ngò "..str_des.." lùa chän ®éi h÷u gia nhËp lµ ®­îc . thµnh viªn sè l­îng nhiÒu nhÊt v× <color=red>2 ng­êi <color>",
				" ta muèn thµnh lËp "..str_des.." ®éi /wlls_want2create",
				" ta ch¼ng qua lµ xem mét chót /OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> ng­¬i chiÕn ®éi tr­íc m¾t v× <color=yellow>"..str_lgname.."<color><enter>"
		.. " chiÕn ®éi ®éi tr­ëng :"..join(wlls_get_mems(n_lid), "ChiÕn ®éi thµnh viªn :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> chó ı  h¹ quı liªn cuéc so tµi h¹n chÕ v× <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, nÕu nh­ muèn liªn cuéc so tµi , xin/mêi thµnh lËp míi chiÕn ®éi .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>  Äã¿ÉÒÔÑ¡<color=red> ¼ÓÈëÆäËû¶Ó<color> »òÕß <color=red> rêi ®i liªn cuéc so tµi ®éi <color>.<enter><enter>"..
			" thµnh lËp chiÕn ®éi b­íc : ë <color=red> thêi gian nghØ ng¬i cïng liªn cuéc so tµi thêi gian <color>, còng cã thÓ thay v× h¾n nhµ ch¬i häp thµnh ®éi , <color=red> kh¸c ph¸i <color>, lùa chän cïng ®Ó cho cïng ®éi gia nhËp vèn ®éi . <enter>"..
			"Àë¿ªÁªÈü: ÔÚ<color=red>ĞİÏ¢Ê±¼ä<color>,Äã¿ÉÒÔ rêi ®i liªn cuéc so tµi ®éi £¬ÔÚÁªÈüÊ±¼äÈç¹ûÄãµÄ²»ÊÇ¶Ó<color=red> Î´¼ÓÈëÉÏÆÚÁªÈü<color>, Äã¿ÉÒÔ rêi ®i liªn cuéc so tµi ®éi £¬Èç¹ûÒÑ²Î¼Ó¾Í²»ÄÜÀë¿ª¡£¶Ó³¤×Ê¸ñ½«±»×ª½»¸øÆäËû¶ÓÔ± <color=yellow>Èç¹ûÃ»ÓĞ³ÉÔ±£¬Õ½¶Ó½«±»½âÉ¢<color>."
			tb_option[getn(tb_option)+1] = "Thªm thµnh viªn vµo ®éi/wlls_want2addmember"
		else
			str = str.."<enter> ng­¬i cã thÓ lùa chän rêi ®i ®éi .<enter><enter>"..
			"Àë¶Ó£ºÔÚ <color=red>ĞİÏ¢Ê±¼ä<color>, Äã¿ÉÒÔ rêi ®i liªn cuéc so tµi ®éi £¬ÔÚÁªÈüÊ±¼äÈç¹û×Ô¼ºµÄÁªÈü¶Ó<color=red>Î´¼ÓÈëÉÏ´ÎÁªÈü<color>, Äã¿ÉÒÔ rêi ®i liªn cuéc so tµi ®éi £¬Èç¹û¼ÓÈëÁªÈü¾Í²»ÄÜÀë¿ª."
		end
		tb_option[getn(tb_option)+1] = "Ta muèn rêi ®éi/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t×nh h×nh thi ®Êu hiÖn t¹i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta chØ ®i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
	check_addmem = function(n_capidx, n_lid, n_mtype)
		local n_oldidx = PlayerIndex
		PlayerIndex = n_capidx
		local n_lid = LG_GetLeagueObjByRole(1, GetName())	--Ê¦Í½¹ØÏµÕ½¶Ó
		local n_num = GetTask(1403)	--TKID_APPRENTICE_COUNT = 1403 --ÊÕÍ½µÜ×ÜÊı
		PlayerIndex = n_oldidx
		if (FALSE(n_lid) or n_num <= 0) then	
			return " thËt xin lçi ! ng­¬i kh«ng thu ®Ö tö , kh«ng thÓ thay v× h¾n ®éi viªn thµnh lËp häp thµnh ®éi ."
		end
		if (n_lid ~= LG_GetLeagueObjByRole(1, GetName())) then
			return " thËt xin lçi ! "..GetName().." kh«ng ph¶i lµ ®Ö tö cña ng­¬i , kh«ng thÓ gia nhËp ng­¬i liªn cuéc so tµi ®éi ."
		end
		if (GetLevel() > 90) then
			return " thËt xin lçi ! "..GetName().." v­ît qua 90 cÊp , kh«ng thÓ lµm ®å ®Ö gia nhËp liªn cuéc so tµi ®éi ."
		end
		if (GetLevel() < 50) then
			return " thËt xin lçi ! "..GetName().." kh«ng ®ñ 50 , kh«ng thÓ gia nhËp liªn cuéc so tµi ®éi ."
		end
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(3,WLLS_DATA)
