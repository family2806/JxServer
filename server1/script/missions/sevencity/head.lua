SCRIPT_WARRIORDEATH = "\\script\\missions\\sevencity\\warrior_death.lua"	-- 玩家死亡脚本
SCRIPT_MONSTERDEATH	= "\\script\\missions\\sevencity\\monster_death.lua"	-- 龙柱死亡脚本

FIELD_CHENGDU	= 926	-- 成都战场
FIELD_BIANJING	= 927	-- 汴京战场
FIELD_DALI		= 928	-- 大理战场
FIELD_FENGXIANG	= 929	-- 凤翔战场
FIELD_LINAN 	= 930	-- 临安战场
FIELD_XIANGYANG	= 931	-- 襄阳战场
FIELD_YANGZHOU	= 932	-- 扬州战场

FIELD_LIST = {
	FIELD_CHENGDU,		-- 成都战场
	FIELD_BIANJING,		-- 汴京战场
	FIELD_DALI,			-- 大理战场
	FIELD_FENGXIANG,	-- 凤翔战场
	FIELD_LINAN,		-- 临安战场
	FIELD_XIANGYANG,	-- 襄阳战场
	FIELD_YANGZHOU,		-- 扬州战场
}

BATTLE_LIST = {
	[11	] = FIELD_CHENGDU,		-- 成都战场
	[37	] = FIELD_BIANJING,		-- 汴京战场
	[162] = FIELD_DALI,			-- 大理战场
	[1	] = FIELD_FENGXIANG,	-- 凤翔战场
	[176] = FIELD_LINAN,		-- 临安战场
	[78	] = FIELD_XIANGYANG,	-- 襄阳战场
	[80	] = FIELD_YANGZHOU,		-- 扬州战场
}

PARAM_LIST = {
	FIELD_TONGMEMBER 	= 100, 			-- 每个场地每个帮会最大人数限制
	WORLD_TONGMEMBER 	= 200,			-- 整个城战每个帮会最大人数限制
	EXPTIMER_INTERVAL	= 1 * 60 * 18,	-- 给经验奖励的间隔（帧数）
	TIMEOUT_MONSTER		= 35 * 60 * 18,	-- 龙柱无敌时间（帧数）
	TIMEOUT_SCORE		= 300 * 18,		-- 龙柱积分奖励时间（帧数）
}

CAMP_MONSTER 				= 1
SIGNUP_MONEY 				= 20000000
SIGNUP_TIAOZHANLINGCOUNT	= 2000
TIMEAWARD_EXP				= 500000
TIMEAWARD_SCORE				= 1

MAP_INFO = {
	[FIELD_FENGXIANG] = {
		CityIndex = 1,
		CityName = "凤翔",
		Name = "凤翔战场",
		OutPos = {1, 1643, 3271},			-- 出战场位置
		MonsterPos = {56608, 112416},		-- 龙柱坐标
		},
	[FIELD_CHENGDU	] = {
		CityIndex = 2,
		CityName = "成都",
		Name = "成都战场",
		OutPos = {11, 3187, 5183},			-- 出战场位置
		MonsterPos = {54976, 105600},		-- 龙柱坐标
		},
	[FIELD_DALI		] = {
		CityIndex = 3,
		CityName = "大理",
		Name = "大理战场",
		OutPos = {162, 1681, 3277},			-- 出战场位置
		MonsterPos = {55040, 105568},		-- 龙柱坐标
		},
	[FIELD_BIANJING	] = {
		CityIndex = 4,
		CityName = "汴京",
		Name = "汴京战场",
		OutPos = {37, 1693, 3213},			-- 出战场位置
		MonsterPos = {56192, 108384},		-- 龙柱坐标
		},
	[FIELD_XIANGYANG] = {
		CityIndex = 5,
		CityName = "襄阳",
		Name = "襄阳战场",
		OutPos = {78, 1583, 3381},			-- 出战场位置
		MonsterPos = {54944, 105568},		-- 龙柱坐标
		},
	[FIELD_YANGZHOU	] = {
		CityIndex = 6,
		CityName = " 扬州",
		Name = " 扬州战场",
		OutPos = {80, 1693, 3219},			-- 出战场位置
		MonsterPos = {55008, 105568},		-- 龙柱坐标
		},
	[FIELD_LINAN	]= {
		CityIndex = 7,
		CityName = "临安",
		Name = "临安战场",
		OutPos = {176, 1690, 3290},			-- 出战场位置
		MonsterPos = {56160, 108512},		-- 龙柱坐标
		},
}
