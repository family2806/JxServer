-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 百人擂台头文件
-- 文件名　：head.lua
-- 创建者　：子非魚
-- 创建时间：2011-04-24 15:08:47

-- ======================================================

tbArena_Info = {
	
	[1] = {
		nIndex = 1,
		InPos = {1784,3099},	-- 进擂台坐标
		OutPos = {
					{1776,3087},
					{1776,3115},
					{1796,3086},
					{1796,3116},
				},	-- 出擂台坐标
		NpcPos = {1789,3103},	-- 擂台刷NPC点
		RevivalPos = {1749, 3135},
	},
	[2] = {
		nIndex = 2,
		InPos = {1744,3061},
		OutPos = {
					{1737,3051},
					{1737,3077},
					{1757,3050},
					{1758,3077},
				},
		NpcPos = {1750,3065},
		RevivalPos = {1749, 3135},
	},
	[3] = {
		nIndex = 3,
		InPos = {1822,3138},
		OutPos = {
					{1816,3125},
					{1814,3153},
					{1836,3127},
					{1835,3153},

		},
		NpcPos = {1828,3142},
		RevivalPos = {1749, 3135},

	},
	[4] = {
		nIndex = 4,
		InPos = {1705,3101},

		OutPos = {
					{1699,3087},
					{1698,3116},
					{1720,3088},
					{1719,3117},

		},
		NpcPos = {1710,3104},
		RevivalPos = {1749, 3135},

	},
	[5] = {
		nIndex = 5,
		InPos = {1781,3178},

		OutPos = {
					{1774,3192},
					{1776,3163},
					{1795,3164},
					{1795,3190},

		},	-- 
		NpcPos = {1788,3181},	-- 
		RevivalPos = {1749, 3135},
	},
};


tbTimerInfo = {
	nApply = 30*18,		-- 擂主上台，等待时间
	nPrepare = 3*18,		-- 挑擂准备时间
	nFight = 3*60*18,--3*60*18,	-- 比赛时间
	nSchedule = 1*60*18,	-- 调度时间
	
};

tbTrapFile = {
	szPosFile = "\\settings\\maps\\missions\\bairenleitai\\arena%d.txt",
	szScriptFile = "\\script\\missions\\bairenleitai\\trap_arena.lua",
	
	szBeautyFile = "\\settings\\maps\\missions\\bairenleitai\\drummer.txt",
	szObstacleFile = "\\settings\\maps\\missions\\bairenleitai\\obstacle.txt",
	szEnterMapFile = "\\settings\\maps\\missions\\bairenleitai\\inmap.txt",
};

tbNpcFile = {
	szFightNpc = "\\script\\missions\\bairenleitai\\npc_death.lua",
	szTranserNpc = "\\script\\missions\\bairenleitai\\npc_trans.lua",
	szBeautyNpc = "\\script\\missions\\bairenleitai\\npc_beauty.lua",
	szBox = "\\script\\missions\\bairenleitai\\npc_chuwuxiang.lua",
	szDrugstore = "\\script\\missions\\bairenleitai\\npc_store.lua",
	
};

tbNpcTypeList = {--npc的类型
	[1] = {
			nNpcId = 1786,
			szName = "天王高手百人擂台",
			nLevel = 90,
			nSeries = 0,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[2] = {
			nNpcId = 1787,
			szName = "少林高手百人擂台",
			nLevel = 90,
			nSeries = 0,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[3] = {
			nNpcId = 1788,
			szName = "五毒高手百人擂台",
			nLevel = 90,
			nSeries = 1,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[4] = {
			nNpcId = 1789,
			szName = "唐门高手百人擂台",
			nLevel = 90,
			nSeries = 1,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[5] = {
			nNpcId = 1790,
			szName = "峨眉高手百人擂台",
			nLevel = 90,
			nSeries = 2,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[6] = {
			nNpcId = 1791,
			szName = "翠烟高手百人擂台",
			nLevel = 90,
			nSeries = 2,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[7] = {
			nNpcId = 1792,
			szName = "天忍高手百人擂台",
			nLevel = 90,
			nSeries = 3,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[8] = {
			nNpcId = 1793,
			szName = "丐帮高手百人擂台",
			nLevel = 90,
			nSeries = 3,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[9] = {
			nNpcId = 1794,
			szName = "武当高手百人擂台",
			nLevel = 90,
			nSeries = 4,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[10] = {
			nNpcId = 1795,
			szName = "昆仑高手百人擂台",
			nLevel = 90,
			nSeries = 4,
			nIsboss = 1, --对话npc可以不需要这个
	},
	[11] = {
			nNpcId = 1571,
			szName = "鼓手",
			nLevel = 90,
			szScriptPath = tbNpcFile.szBeautyNpc,
			nTime = 15*60,
	},
};

TSK_LEAVERMAPID = 2323	--存储离开报名点的mapid
TSK_LEAVERPOSX = 2324	--存储离开报名点的x坐标点
TSK_LEAVERPOSY = 2325	--存储离开报名点的y坐标点

HA_MAXSTAYTIME = 90*60	-- 90分钟最长停留时间
HA_DOUBLETIME = 30*60	-- 30分钟双倍效果
