Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============»ìºÏµ¥ÈËÈüÏà¹ØÊı¾İ===============

if (not tmp_process_data) then
	return
end

--È«²¿»ìºÏµ¥ÈËÈüÏà¹ØÊı¾İ
WLLS_DATA = {
	
	name = " ®¬n ®Êu tù do ",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10235,
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
			ladder = 10236,
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
			{2, 1000},	--µÚ2Ãû
			{3, 800},	--µÚ3Ãû
			{4, 500},	--µÚ4Ãû
			{8, 400},	--µÚ5-8Ãû
			{16, 300},	--µÚ9-16Ãû
			{32, 200},	--µÚ17-32Ãû
			{64, 100},	--µÚ33-64Ãû
			{128, 50},	--µÚ65-128Ãû
			{256, 20},	--µÚ129-256Ãû
			{512, 10},	--µÚ257-512Ãû
		}, {	--ÁªÈü
			{1, 2000},	--µÚ1Ãû
			{2, 1000},	--µÚ2Ãû
			{3, 800},	--µÚ3Ãû
			{4, 500},	--µÚ4Ãû
			{8, 400},	--µÚ5-8Ãû
			{16, 300},	--µÚ9-16Ãû
			{32, 200},	--µÚ17-32Ãû
			{64, 100},	--µÚ33-64Ãû
			{128, 50},--µÚ65-128Ãû
			{256, 20},--µÚ129-256Ãû
			{512, 10},	--µÚ257-512Ãû
		}
	},
	
	max_member = 1,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"´Ë´ÎÊÇ ®¬n ®Êu tù do £¬¸÷Î»ÏÀ¿ÍÅ¬Á¦Á·Ï°£¬µÈ¸»¹óµÄÒ»Ìì",
		"´Ë´ÎÊÇ ®¬n ®Êu tù do £¬¸÷Î»ÏÀ¿ÍÅ¬Á¦Á·Ï°£¬µÈ¸»¹óµÄÒ»Ìì",
	},
	
	--====Functions====
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> lÇn nµy "..str_des.."Îª<color=red> ®¬n ®Êu tù do <color>, ²»ĞèÒª½¨Á¢Õ½¶Ó£¬ÏµÍ³½«¼ÇÂ¼ÄãµÄµÚÒ»´Î±ÈÈü")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> LÇn nµy  <color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow>Hñy liªn ®Êu h¹n chÕ v× <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, nÕu nh­ muèn hñy liªn ®Êu , xin mêi thµnh lËp míi chiÕn ®éi .<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter><color=red> t¹m thêi ®ang trong thêi gian nghØ ng¬i <color> hoÆc lµ <color=red> kh«ng tham gia cuéc tranh tµi <color>, ng­¬i cã thÓ rêi khái chiÕn ®éi, chiÕn ®éi tù ®éng gi¶i t¸n <color>."
		tb_option[getn(tb_option)+1] = "Ta muèn rêi ®éi/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t×nh h×nh thi ®Êu hiÖn t¹i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta chØ ®i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
	check_addmem = function(n_capidx, n_lid, n_mtype)
		return " kh«ng thÓ tham gia liªn ®Êu !"
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(5,WLLS_DATA)
