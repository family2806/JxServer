SCRIPT_WARRIORDEATH = "\\script\\missions\\sevencity\\warrior_death.lua"	-- Íæ¼ÒËÀÍö½Å±¾
SCRIPT_MONSTERDEATH	= "\\script\\missions\\sevencity\\monster_death.lua"	-- ÁúÖùËÀÍö½Å±¾

FIELD_CHENGDU	= 926	-- Thµnh §«Õ½³¡
FIELD_BIANJING	= 927	-- BiÖn KinhÕ½³¡
FIELD_DALI		= 928	-- §¹i LýÕ½³¡
FIELD_FENGXIANG	= 929	-- Ph­îng T­êngÕ½³¡
FIELD_LINAN 	= 930	-- L©m AnÕ½³¡
FIELD_XIANGYANG	= 931	-- T­¬ng D­¬ngÕ½³¡
FIELD_YANGZHOU	= 932	--D­¬ng Ch©uÕ½³¡

FIELD_LIST = {
	FIELD_CHENGDU,		-- Thµnh §«Õ½³¡
	FIELD_BIANJING,		-- BiÖn KinhÕ½³¡
	FIELD_DALI,			-- §¹i LýÕ½³¡
	FIELD_FENGXIANG,	-- Ph­îng T­êngÕ½³¡
	FIELD_LINAN,		-- L©m AnÕ½³¡
	FIELD_XIANGYANG,	-- T­¬ng D­¬ngÕ½³¡
	FIELD_YANGZHOU,		--D­¬ng Ch©uÕ½³¡
}

BATTLE_LIST = {
	[11	] = FIELD_CHENGDU,		-- Thµnh §«Õ½³¡
	[37	] = FIELD_BIANJING,		-- BiÖn KinhÕ½³¡
	[162] = FIELD_DALI,			-- §¹i LýÕ½³¡
	[1	] = FIELD_FENGXIANG,	-- Ph­îng T­êngÕ½³¡
	[176] = FIELD_LINAN,		-- L©m AnÕ½³¡
	[78	] = FIELD_XIANGYANG,	-- T­¬ng D­¬ngÕ½³¡
	[80	] = FIELD_YANGZHOU,		--D­¬ng Ch©uÕ½³¡
}

PARAM_LIST = {
	FIELD_TONGMEMBER 	= 100, 			-- Ã¿¸ö³¡µØÃ¿¸ö°ï»á×î´óÈËÊýÏÞÖÆ
	WORLD_TONGMEMBER 	= 200,			-- Õû¸ö³ÇÕ½Ã¿¸ö°ï»á×î´óÈËÊýÏÞÖÆ
	EXPTIMER_INTERVAL	= 1 * 60 * 18,	-- ¸ø¾­Ñé½±ÀøµÄ¼ä¸ô£¨Ö¡Êý£©
	TIMEOUT_MONSTER		= 35 * 60 * 18,	-- ÁúÖùÎÞµÐÊ±¼ä£¨Ö¡Êý£©
	TIMEOUT_SCORE		= 300 * 18,		-- ÁúÖù»ý·Ö½±ÀøÊ±¼ä£¨Ö¡Êý£©
}

CAMP_MONSTER 				= 1
SIGNUP_MONEY 				= 20000000
SIGNUP_TIAOZHANLINGCOUNT	= 2000
TIMEAWARD_EXP				= 500000
TIMEAWARD_SCORE				= 1

MAP_INFO = {
	[FIELD_FENGXIANG] = {
		CityIndex = 1,
		CityName = "Ph­îng T­êng",
		Name = "Ph­îng T­êngÕ½³¡",
		OutPos = {1, 1643, 3271},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {56608, 112416},		-- ÁúÖù×ø±ê
		},
	[FIELD_CHENGDU	] = {
		CityIndex = 2,
		CityName = "Thµnh §«",
		Name = "Thµnh §«Õ½³¡",
		OutPos = {11, 3187, 5183},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {54976, 105600},		-- ÁúÖù×ø±ê
		},
	[FIELD_DALI		] = {
		CityIndex = 3,
		CityName = "§¹i Lý",
		Name = "§¹i LýÕ½³¡",
		OutPos = {162, 1681, 3277},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {55040, 105568},		-- ÁúÖù×ø±ê
		},
	[FIELD_BIANJING	] = {
		CityIndex = 4,
		CityName = "BiÖn Kinh",
		Name = "BiÖn KinhÕ½³¡",
		OutPos = {37, 1693, 3213},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {56192, 108384},		-- ÁúÖù×ø±ê
		},
	[FIELD_XIANGYANG] = {
		CityIndex = 5,
		CityName = "T­¬ng D­¬ng",
		Name = "T­¬ng D­¬ngÕ½³¡",
		OutPos = {78, 1583, 3381},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {54944, 105568},		-- ÁúÖù×ø±ê
		},
	[FIELD_YANGZHOU	] = {
		CityIndex = 6,
		CityName = "D­¬ng Ch©u",
		Name = "D­¬ng Ch©uÕ½³¡",
		OutPos = {80, 1693, 3219},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {55008, 105568},		-- ÁúÖù×ø±ê
		},
	[FIELD_LINAN	]= {
		CityIndex = 7,
		CityName = "L©m An",
		Name = "L©m AnÕ½³¡",
		OutPos = {176, 1690, 3290},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {56160, 108512},		-- ÁúÖù×ø±ê
		},
}
