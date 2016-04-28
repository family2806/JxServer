Include("\\script\\missions\\leaguematch\\tb_head.lua")
--============== cïng hÖ hai ng­êi cuéc so tµi Ïà¹ØÊı¾İ===============

-- LLG_ALLINONE_TODO_20070802

if (not tmp_process_data) then
	return
end

--È«²¿ cïng hÖ hai ng­êi cuéc so tµi Ïà¹ØÊı¾İ
local nTmpLadderBase	= 10238
WLLS_DATA = {
	
	name = " cïng hÖ hai ng­êi cuéc so tµi ",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = " kim hÖ ",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = " méc hÖ ",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = " thñy hÖ ",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = " háa hÖ ",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = " thæ hÖ ",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = " kim hÖ ",
			level = 2,
			ladder = nTmpLadderBase + 5,
			map = {{540, 570, 541, ""}},
		},
		{
			name = " méc hÖ ",
			level = 2,
			ladder = nTmpLadderBase + 6,
			map = {{542, 571, 543, ""}},
		},
		{
			name = " thñy hÖ ",
			level = 2,
			ladder = nTmpLadderBase + 7,
			map = {{544, 572, 545, ""}},
		},
		{
			name = " háa hÖ ",
			level = 2,
			ladder = nTmpLadderBase + 8,
			map = {{546, 573, 547, ""}},
		},
		{
			name = " thæ hÖ ",
			level = 2,
			ladder = nTmpLadderBase + 9,
			map = {{548, 574, 549, ""}},
		},
	},
	
	award_rank = {
		{	--ÅÅĞĞ½±Àø£¬ĞÂĞã
			{1, 4000},	--µÚ1Ãû
			{2, 3000},	--µÚ2Ãû
			{3, 2500},	--µÚ3Ãû
			{4, 2000},	--µÚ4Ãû
			{8, 1500},	--µÚ5-8Ãû
			{16, 1250},	--µÚ9-16Ãû
			{32, 1000},	--µÚ17-32Ãû
			{64, 750},	--µÚ33-64Ãû
			{128, 500},	--µÚ65-128Ãû
			{256, 250},	--µÚ129-256Ãû
		}, {	--ÁªÈü
			{1, 8000},	--µÚ1Ãû
			{2, 6000},	--µÚ2Ãû
			{3, 5000},	--µÚ3Ãû
			{4, 4000},	--µÚ4Ãû
			{8, 3000},	--µÚ5-8Ãû
			{16, 2500},	--µÚ9-16Ãû
			{32, 2000},	--µÚ17-32Ãû
			{64, 1500},	--µÚ33-64Ãû
			{128, 1000},	--µÚ65-128Ãû
			{256, 500},	--µÚ129-256Ãû
		}
	},
	
	max_member = 2,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		" lÇn nµy tranh tµi v× cïng hÖ hai ng­êi cuéc so tµi ",
		" lÇn nµy tranh tµi v× cïng hÖ hai ng­êi cuéc so tµi ",
	},
	
	addmem_ex	= ", cÇn lµ nhµ ch¬i <color=red> cïng hÖ <color> cïng nhau ",	--×é½¨Õ½¶Ó¶îÍâÒªÇó£¨¿ÉÑ¡£©

	--====Functions====
	--·µ»Øµ±Ç°½ÇÉ«¿ÉÒÔ²Î¼ÓµÄ±ÈÈüÀàĞÍ£¬nilÎª²»ÄÜ²ÎÈü
	player_type = function()
		local nLevel = wlls_player_level()
		if (nLevel <= 0) then
			return nil
		end
		local nSeries = GetSeries() + 1
		if (nSeries <= 0) then
			wlls_error_log("GetSeries() = "..(nSeries - 1))
			return nil
		end
		return (nLevel - 1) * 5 + nSeries
	end,
	
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> lÇn nµy "..str_des.." v× <color=red> cïng hÖ hai ng­êi cuéc so tµi <color>. ng­¬i cã thÓ lùa chän thµnh lËp häp thµnh ®éi , còng cã thÓ gia nhËp nh÷ng chiÕn ®éi kh¸c , sau ®ã , ®éi tr­ëng ®i cïng "..str_des.." quan viªn ®èi tho¹i , lùa chän tranh tµi ®éi "..str_des.." mçi chiÕn ®éi thµnh viªn v× <color=red>2 ng­êi <color> cÇn lµ cïng hÖ ",
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
			str = str .. "<enter> <color=yellow> chó ı  h¹ kú tranh tµi h¹n chÕ v× <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, nÕu nh­ muèn h¹ kú tranh tµi , xin/mêi thµnh lËp míi chiÕn ®éi .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng­¬i cã thÓ lùa chän <color=red> gia nhËp kú tha ®éi ngò <color> hoÆc lµ <color=red> rêi ®i tranh tµi <color>.<enter><enter>"..
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
		if (nMType ~= wlls_player_type()) then
		 	return wlls_npcname().." thËt xin lçi , ®éi bªn trong thµnh viªn :"..GetName().."<color=red> cÊp bËc <color> hoÆc lµ <color=red> ngò hµnh <color> hai ®éi kh«ng hîp lı , kh«ng thÓ thµnh lËp chiÕn ®éi !"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(6,WLLS_DATA)
