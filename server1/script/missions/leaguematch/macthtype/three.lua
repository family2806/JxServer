Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============ÈýÈËÈüÏà¹ØÊý¾Ý===============

if (not tmp_process_data) then
	return
end

--È«²¿ÈýÈËÈüÏà¹ØÊý¾Ý
WLLS_DATA = {
	
	name = " tù do ba ng­êi cuéc so tµi ",
	
	--µØÍ¼ÐÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10223,
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
			ladder = 10224,
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
		{	--ÅÅÐÐ½±Àø£¬ÐÂÐã
			{1, 1000},	--µÚ1Ãû
			{2, 800},	--µÚ2Ãû
			{3, 600},	--µÚ3Ãû
			{4, 500},	--µÚ4Ãû
			{8, 400},	--µÚ5-8Ãû
			{16, 200},	--µÚ9-16Ãû
			{32, 100},	--µÚ17-32Ãû
			{64, 50},	--µÚ33-64Ãû
			{128, 10},	--µÚ65-128Ãû
		}, {	--ÁªÈü
			{1, 1000},	--µÚ1Ãû
			{2, 800},	--µÚ2Ãû
			{3, 600},	--µÚ3Ãû
			{4, 500},	--µÚ4Ãû
			{8, 400},	--µÚ5-8Ãû
			{16, 200},	--µÚ9-16Ãû
			{32, 100},	--µÚ17-32Ãû
			{64, 50},	--µÚ33-64Ãû
			{128, 10},	--µÚ65-128Ãû
		}
	},
	
	max_member = 3,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊý
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		" lÇn nµy vâ l©m t©n tó liªn cuéc so tµi v× <color=red> tù do ba ng­êi cuéc so tµi <color>",
		" lÇn nµy vâ l©m t©n tó liªn cuéc so tµi v× <color=red> tù do ba ng­êi cuéc so tµi <color>",
	},
	
	--====Functions====
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> lÇn nµy "..str_des.." ë <color=red> tù do ba ng­êi cuéc so tµi <color>, ng­¬i cã thÓ lùa chän thµnh lËp häp thµnh ®éi , còng cã thÓ gia nhËp nh÷ng chiÕn ®éi kh¸c . ë ®éi tr­ëng cïng nhµ ch¬i häp thµnh ®éi hoµn hËu , "..str_des.." cïng quan viªn ®èi tho¹i , lùa chän liªn cuéc so tµi ®éi "..str_des.." gia nhËp ®éi h÷u ®Õn vèn ®éi lµ ®­îc , chiÕn ®éi thµnh viªn nhiÒu nhÊt v× <color=red>3 ng­êi <color>.",
				" ta muèn thµnh lËp "..str_des.." häp thµnh ®éi /wlls_want2create",
				" ta chØ nh×n mét chót /OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> tr­íc m¾t ng­¬i chiÕn ®éi v× <color=yellow>"..str_lgname.."<color><enter>"
		.. " chiÕn ®éi ®éi tr­ëng :"..join(wlls_get_mems(n_lid), "ChiÕn ®éi thµnh viªn :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> chó ý  h¹ kú liªn cuéc so tµi h¹n chÕ v× <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, nÕu nh­ muèn h¹ kú liªn cuéc so tµi , xin/mêi thµnh lËp míi chiÕn ®éi .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng­¬i cã thÓ lùa chän <color=red> gia nhËp nh÷ng kh¸c ®éi ngò <color> hoÆc lµ <color=red> rêi ®i liªn cuéc so tµi <color>.<enter><enter>"..
			" thµnh lËp chiÕn ®éi b­íc : ë <color=red> thêi gian nghØ ng¬i cïng liªn cuéc so tµi thêi gian <color>, còng cã thÓ thay v× h¾n nhµ ch¬i häp thµnh ®éi , <color=red> kh¸c ph¸i <color>, lùa chän cïng ®Ó cho cïng ®éi gia nhËp vèn ®éi . <enter>"..
			" rêi ®i liªn cuéc so tµi : ë <color=red> thêi gian nghØ ng¬i <color>, ng­¬i cã thÓ rêi ®i liªn cuéc so tµi ®éi , ë liªn cuéc so tµi thêi gian nÕu nh­ ng­¬i kh«ng ph¶i lµ ®éi <color=red> kh«ng gia nhËp th­îng kú liªn cuéc so tµi <color>, ng­¬i cã thÓ rêi ®i liªn cuéc so tµi ®éi , nÕu nh­ ®· tham gia th× kh«ng thÓ rêi ®i . ®éi tr­ëng t­ c¸ch ®em bÞ chuyÓn giao cho nh÷ng ®éi viªn kh¸c <color=yellow> nÕu nh­ kh«ng cã thµnh viªn , chiÕn ®éi ®em bÞ gi¶i t¸n <color>."
			tb_option[getn(tb_option)+1] = "Thªm thµnh viªn vµo ®éi/wlls_want2addmember"
		else
			str = str.."<enter> ng­¬i cã thÓ lùa chän rêi ®i ®éi .<enter><enter>"..
			" c¸ch ®éi  ë <color=red> thêi gian nghØ ng¬i <color>, ng­¬i cã thÓ rêi ®i liªn cuéc so tµi ®éi , ë liªn cuéc so tµi thêi gian nÕu nh­ m×nh ®Ých liªn cuéc so tµi ®éi <color=red> kh«ng gia nhËp lÇn tr­íc liªn cuéc so tµi <color>, ng­¬i cã thÓ rêi ®i liªn cuéc so tµi ®éi , nÕu nh­ gia nhËp liªn cuéc so tµi th× kh«ng thÓ rêi ®i ."
		end
		tb_option[getn(tb_option)+1] = "Ta muèn rêi ®éi/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t×nh h×nh thi ®Êu hiÖn t¹i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta chØ ®i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(4,WLLS_DATA)
