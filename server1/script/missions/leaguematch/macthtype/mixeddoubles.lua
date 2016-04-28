Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============»ìºÏË«ÈËÈüÏà¹ØÊı¾İ===============

if (not tmp_process_data) then
	return
end

--È«²¿»ìºÏË«ÈËÈüÏà¹ØÊı¾İ
WLLS_DATA = {
	
	name = "song ®Êu nam n÷",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10248,
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
			ladder = 10249,
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
			{1, 1500},	--µÚ1Ãû
			{2, 1200},	--µÚ2Ãû
			{3, 1000},	--µÚ3Ãû
			{4, 800},	--µÚ4Ãû
			{8, 500},	--µÚ5-8Ãû
			{16, 300},	--µÚ9-16Ãû
			{32, 200},	--µÚ17-32Ãû
			{64, 50},	--µÚ33-64Ãû
			{128, 10},	--µÚ65-128Ãû
		}, {	--ÁªÈü
			{1, 1500},	--µÚ1Ãû
			{2, 1200},	--µÚ2Ãû
			{3, 1000},	--µÚ3Ãû
			{4, 800},	--µÚ4Ãû
			{8, 500},	--µÚ5-8Ãû
			{16, 300},	--µÚ9-16Ãû
			{32, 200},	--µÚ17-32Ãû
			{64, 50},	--µÚ33-64Ãû
			{128, 10},	--µÚ65-128Ãû
		}
	},
	
	max_member = 2,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		" lÇn nµy t©n tó liªn cuéc so tµi t­íng sÜ nam n÷ hai ng­êi cuéc so tµi m« thøc , mäi ng­êi cã thÓ tù do thµnh lËp chiÕn ®éi , cè g¾ng luyÖn tËp phèi hîp ",
		" lÇn nµy t©n tó liªn cuéc so tµi t­íng sÜ nam n÷ hai ng­êi cuéc so tµi m« thøc , mäi ng­êi cã thÓ tù do thµnh lËp chiÕn ®éi , cè g¾ng luyÖn tËp phèi hîp ",
	},
	
	addmem_ex	= ", yªu cÇu <color=red> nam n÷ <color>",	--×é½¨Õ½¶Ó¶îÍâÒªÇó£¨¿ÉÑ¡£©

	--====Functions====
	
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> lÇn nµy "..str_des.." tham gia <color=red> nam n÷ hai ng­êi cuéc so tµi <color>. ng­¬i cã thÓ m×nh thµnh lËp chiÕn ®éi , còng cã thÓ tham gia ng­êi kh¸c ®İch chiÕn ®éi . ë ®éi tr­ëng cïng h¾n ng­êi häp thµnh ®éi sau , ®em "..str_des.." cïng quan viªn ®èi tho¹i , lùa chän tranh tµi ®éi ngò "..str_des.." lËp tøc t¹o thµnh chiÕn ®éi . thµnh viªn sè l­îng nhiÒu nhÊt v× <color=red>2 ng­êi <color=red>, cÇn kh¸c ph¸i .",
				"Ta muèn t¹o "..str_des.." ®éi/wlls_want2create",
				"Ta chØ ®i ngang qua/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> ng­¬i chiÕn ®éi tr­íc m¾t v× <color=yellow>"..str_lgname.."<color><enter>"
		.. " chiÕn ®éi ®éi tr­ëng :"..join(wlls_get_mems(n_lid), "ChiÕn ®éi thµnh viªn :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> chó ı  h¹ quı tranh tµi h¹n chÕ v× <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, nÕu nh­ muèn tranh tµi , xin/mêi thµnh lËp míi chiÕn ®éi .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng­¬i cã thÓ chän <color=red> gia nhËp nh÷ng kh¸c ®éi <color> hoÆc lµ <color=red> rêi ®i tranh tµi ®éi <color>.<enter><enter>"..
			" thµnh lËp chiÕn ®éi b­íc : ë <color=red> thêi gian nghØ ng¬i cïng tranh tµi thêi gian <color>, còng cã thÓ thay v× h¾n nhµ ch¬i häp thµnh ®éi , <color=red> kh¸c ph¸i <color>, lùa chän cïng ®Ó cho cïng ®éi gia nhËp vèn ®éi . <enter>"..
			" rêi ®i tranh tµi : ë <color=red> thêi gian nghØ ng¬i <color>, ng­¬i cã thÓ rêi ®i tranh tµi ®éi , ë tranh tµi thêi gian nÕu nh­ ng­¬i kh«ng ph¶i lµ ®éi <color=red> kh«ng gia nhËp th­îng kú tranh tµi <color>, ng­¬i cã thÓ rêi ®i tranh tµi ®éi , nÕu nh­ ®· tham gia th× kh«ng thÓ rêi ®i . ®éi tr­ëng t­ c¸ch ®em bŞ chuyÓn giao cho nh÷ng ®éi viªn kh¸c <color=yellow> nÕu nh­ kh«ng cã thµnh viªn , chiÕn ®éi ®em bŞ gi¶i t¸n <color>."
			tb_option[getn(tb_option)+1] = "Thªm thµnh viªn vµo ®éi/wlls_want2addmember"
		else
			str = str.."<enter> ng­¬i cã thÓ lùa chän rêi ®i ®éi .<enter><enter>"..
			" c¸ch ®éi  ë <color=red> thêi gian nghØ ng¬i <color>, ng­¬i cã thÓ rêi ®i tranh tµi ®éi , ë tranh tµi thêi gian nÕu nh­ m×nh ®İch tranh tµi ®éi <color=red> kh«ng gia nhËp lÇn tr­íc tranh tµi <color>, ng­¬i cã thÓ rêi ®i tranh tµi ®éi , nÕu nh­ gia nhËp tranh tµi th× kh«ng thÓ rêi ®i ."
		end
		tb_option[getn(tb_option)+1] = "Ta muèn rêi ®éi/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t×nh h×nh thi ®Êu hiÖn t¹i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta chØ ®i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
	check_addmem = function(nCapIdx, nLGID, nMType)
		print(nMType, wlls_player_type())
		if (nMType ~= wlls_player_type()) then
		 	return " thËt xin lçi , ®èi víi bªn trong ®éi viªn :"..GetName().." cïng <color=red> tham gia tranh tµi lo¹i h×nh <color> ng­¬i chiÕn ®éi kh«ng hîp , cho nªn , kh«ng thÓ vµo ng­¬i chiÕn ®éi !"
		end
		local nOldIdx = PlayerIndex
		PlayerIndex = nCapIdx
		local nSex	= GetSex()
		PlayerIndex = nOldIdx
		if (nSex == GetSex()) then
			return " lÇn nµy tû vâ dùa theo nam n÷ nam n÷ hai ng­êi cuéc so tµi m« thøc , ng­¬i muèn t×m mét kh¸c ph¸i !"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(7,WLLS_DATA)
