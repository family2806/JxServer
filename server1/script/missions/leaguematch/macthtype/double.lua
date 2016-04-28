--==============Ë«ÈËÈüÏà¹ØÊı¾İ===============
Include("\\script\\missions\\leaguematch\\tb_head.lua")

if (not tmp_process_data) then
	return
end

--È«²¿Ë«ÈËÈüÏà¹ØÊı¾İ
WLLS_DATA = {

	name = "song ®Êu tù do",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10196,
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
			ladder = 10197,
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
			{1, 2000},	--µÚ1Ãû
			{2, 1500},	--µÚ2Ãû
			{3, 1200},	--µÚ3Ãû
			{4, 1000},	--µÚ4Ãû
			{8, 800},	--µÚ5-8Ãû
			{16, 500},	--µÚ9-16Ãû
			{32, 300},	--µÚ17-32Ãû
			{64, 50},	--µÚ33-64Ãû
			{128, 10},	--µÚ65-128Ãû
		}, {	--ÁªÈü
			{1, 2000},	--µÚ1Ãû
			{2, 1500},	--µÚ2Ãû
			{3, 1200},	--µÚ3Ãû
			{4, 1000},	--µÚ4Ãû
			{8, 800},	--µÚ5-8Ãû
			{16, 500},	--µÚ9-16Ãû
			{32, 300},	--µÚ17-32Ãû
			{64, 50},	--µÚ33-64Ãû
			{128, 10},	--µÚ65-128Ãû
		}
	},
	
	max_member = 2,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"±¾´ÎÎäÁÖĞÂĞãÁªÈüÎª <color=red>song ®Êu tù do<color>",
		"±¾´ÎÎäÁÖĞÂĞãÁªÈüÎª<color=red>song ®Êu tù do<color>",
	},
	
	--====Functions====
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> "..str_des.."ÊÇ<color=red>song ®Êu tù do<color>. Äã¿ÉÒÔ×ÔÑ¡±ÈÈü¶ÓÎé»òÕß¼ÓÈëÆäËû±ÈÈü¶ÓÎé¡£¶Ó³¤ÓëÆäËûÍæ¼Ò×é¶ÓºóÈ¥"..str_des.." ®èi tho¹i víi quan viªn liªn ®Êu ®Ó ®¨ng kı "..str_des.." nhãm. 1 ®éi tèi ®a <color=red>2 ng­êi<color>",
				"Ta muèn lËp "..str_des.." ®éi/wlls_want2create",
				"Kh«ng cÇn/OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>ChiÕn ®éi <color=yellow>"..str_lgname.."<color><enter>"
		.. "§éi tr­ëng:"..join(wlls_get_mems(n_lid), "thµnh viªn:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>Liªn ®Êu giíi h¹n bëi <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, h·y t¹o ra mét chiÕn ®éi.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng­¬i cã thÓ lùa chän <color=red> gia nhËp nh÷ng kh¸c ®éi <color> hoÆc lµ <color=red> rêi ®i tranh tµi ®éi <color>.<enter><enter>"..
			" Thµnh lËp häp thµnh ®éi qu¸ tr×nh , ë <color=red> thêi gian nghØ ng¬i cïng tranh tµi thêi gian <color>, ng­¬i cã thÓ cïng nh÷ng kh¸c nhµ ch¬i häp thµnh ®éi , lùa chän ®éi h÷u gia nhËp tranh tµi ®éi .<enter>"..
			" Rêi ®i tranh tµi ®éi ngò  ë <color=red> thêi gian nghØ ng¬i <color>, ng­¬i cã thÓ rêi ®i tranh tµi ®éi ngò , ë tranh tµi thêi gian , nÕu nh­ ng­¬i tranh tµi ®éi ngò <color=red> kh«ng gia nhËp th­îng kú tranh tµi <color>, ng­¬i cã thÓ rêi ®i tranh tµi ®éi ngò . nÕu nh­ ®· tham gia th× kh«ng thÓ rêi ®i . ®éi tr­ëng t­ c¸ch sÏ chuyÓn giao cho thµnh viªn kh¸c <color=yellow> nÕu nh­ kh«ng cã thµnh viªn , chiÕn ®éi ®em bŞ gi¶i t¸n <color>."
			tb_option[getn(tb_option)+1] = "Thªm thµnh viªn vµo ®éi/wlls_want2addmember"
		else
			str = str.."<enter>       B¹n cã thÓ chän ®Ó rêi khái ®éi.<enter><enter>"..
			"Ra khái ®éi: Trong thêi gian <color=red>nghØ<color>, b¹n cã thÓ rêi khái ®éi. Trong thêi gian thi ®Êu, nÕu b¹n kh«ng <color=red>liªn ®Êu<color>, cã thÓ rêi khái ®éi."
		end
		tb_option[getn(tb_option)+1] = "Ta muèn rêi ®éi/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t×nh h×nh thi ®Êu hiÖn t¹i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta chØ ®i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(1, WLLS_DATA)
