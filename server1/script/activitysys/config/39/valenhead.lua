ValenAct_nStartDate = 20120209
ValenAct_nEndDate = 20120301
ValenAct_TSK_REDLINE = 0
ValenAct_TREE_STATE = 1
ValenAct_TSK_STATE = 2
ValenAct_TSK_PUBTIME = 3
ValenAct_TSK_CREATETIME = 4
ValenAct_TSK_ID_AND_RANDOMTIME = 5
ValenAct_TSK_ACCTIME = 6
ValenAct_TSK_SCORE = 7
ValenAct_TSK_AWARD = 8
ValenAct_TSK_SINGLE_TIME = 9
--ValenAct_nLifePeriod = 30*60 
ValenAct_nMidTime = 60	-- Ã¿¸öÈÎÎñ·ÅÆúÎ´ÁìÈ¡Ê±¼ä
ValenAct_nLoopTime = 90	-- Ã¿¸öÈÎÎñÒÔÁìÈ¡Î´Íê³ÉÊ±¼ä
ValenAct_nStepTime = 300 -- ³É³¤½×¶Î
ValenAct_nStepTaskTime = 270 -- Ã¿¸ö½×¶ÎÈÎÎñÊ±¼ä
ValenAct_nStepPartTime = 30 -- Ã¿¸ö½×¶Î¿ÕÏÐÊ±¼ä
ValenAct_nPickTime = 10*60  -- ²ÉÕªÊ±¼ä
ValenAct_nTskStepCount = 3
ValenAct_tbMap = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53}
ValenAct_tbNpcId = {1252, 1253, 1254, 1255,}
ValenAct_nUnGrow = 0
ValenAct_nGrowing = 1
ValenAct_tbConfig = {
	["H¹t Gièng Hoa Hång"] = {nTeamSize = 2, nItemIndex = 3109, nSexScore = 1, 
		tbName = {"MÇm hoa hång", "C©y hoa hång nhá", "C©y hoa hång ch­a træ hoa", "C©y hoa hång në ®Çy hoa", },
		tbDialog = {
			"Qu©n T©m Tù Ng· T©m",
			"ChÊp Tö Chi Thñ, D÷ Tö Giai L·o.",
			"Thö T×nh V« KÕ Tiªu Trõ,Tµi H¹ Mao §Çu, Kh­íc Th­îng T©m §Çu.",
			"Ng· NguyÖn D÷ Qu©n T­¬ng Tri",
			"NguyÖn Thiªn H¹ H÷u T×nh Nh©n Chung Thµnh Tr­íc Thuéc.",
		},
		szAddStatKey = "qingrenjie_zhongmeiguihuazhong",
	},
	["§Ëu Hång"] = {nTeamSize = nil, nItemIndex = 3110,	nSexScore = nil,
		tbName = {"H¹t Gièng §Ëu Hång", "C©y §Ëu Hång nhá", "C©y §Ëu Hång ch­a ra hoa", "C©y §Ëu Hång kÕt tr¸i", },
		tbDialog = {
			"Hång §Ëu Sinh Nam Quèc, Xu©n Lai Ph¸t Kû Chi",
			"NguyÖn Qu©n §a Th¸i HiÖt, Thö VËt Tèi T­¬ng T­.",
			"T×nh Nh©n O¸n Dao, C¶nh TÞch Khëi T­¬ng T­.",
			"Tr­êng T­¬ng T­, Tr­êng T­¬ng T­, Nh­îc VÊn T­¬ng T­ ThËm LiÔu Kú, Trõ Phi T­¬ng KiÕn Thêi.",
			"Tr­êng T­ng T­, Tr­êng T­¬ng T­, Dôc B¶ T­¬ng T­ ThuyÕt T­ Thïy, ThiÓn T×nh Nh©n BÊt Tri.",
			"Tr­êng T­¬ng T­ HÒ Tr­êng T­¬ng ¦c, §o¶n T­¬ng T­ HÒ V« Cïng Cùc.",
		},
		szAddStatKey = "qingrenjie_zhonghongdou",
	},
}
ValenAct_nRedLineIndex = 3111
ValenAct_Op = {"T­íi n­íc", "Bãn ph©n", "C¾t cá d¹i", "B¾t s©u",}