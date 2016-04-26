

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"叶婕美： 听说几天前，山下有个强人占山称王，欺负我武当派清净。但是，武功高强，你快去把他赶走",
	"玩家:十年学剑，也算是派上用处了，弟子遵命.",
}

tbMissionDialog[1] = {
	"玩家:弟子已赶走强人了，但是，这恐怕不是长久之计",
	"叶婕美：最近我听说很多地方，了解他们是大宋士兵，参加过太石战役，凤将军一人深入敌军探敌情.",
	"叶婕美： 不料战争取胜，将军却战死沙场，宋军最后的联系被割断....",
	"玩家:他们真是大宋的勇敢男儿，却客死他乡....",
	"叶婕美：国家就像漂流瓶，他们哪里能左右自己的生命",
	"玩家:既然如此，我将为他们去一趟，军事虞允文是我的老朋友，他也不想英雄落入草寇之手.",
}

tbMissionDialog[2] = {
	"虞允文:不懂道长路过，有什么事吗?",
	"玩家:吟风弄月，品道论剑，没事就不能来看看虞公啊",
	"虞允文:道长又开玩笑了，眼下多事之秋，一定有事了",
	"玩家:(交书信出来) 遗憾的是，事多又来一事，要让英雄落入草寇之手，想必虞公也不想吧.",
	"虞允文:哎呀，道长真是不懂了，这些事很少见.",
	"玩家:真的吗？如果这样就多事了",
	"虞允文:每次战争过去，不是江山萧条就是士兵变成草寇，这些事，不是我开口就能做的.",
	"虞允文: 只能整顿朝纲，完善法制才能做到。只是，不懂要等到何时才能做到....",
	"玩家 我太唐突了",
	"虞允文:道长是远客，不懂红尘之事.",
}

tbMissionDialog[3] = {
	"叶婕美：看起来要让他们返回宋朝，暂时不行。既然如此，他们可以走其他路.",
	"叶婕美：前方不远是宋金边界，他们不用再担心什么，继续努力，不能让百姓受苦了.",
	"玩家:正是",
	"叶婕美：我们武当也没有平静，风云又起，令牌给你，你帮我下山一趟",
	"玩家:我现在就去?",
	"叶婕美：武功高强天下第一，哈哈，我不信有这么好的事.",
	"玩家:事情总有它的原由，让我试试",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1843, nMapId = 78, nPosX = 202*8*32, nPosY = 200*16*32, nLevel = 95, szName = "虞允文",
		szScriptPath = "\\script\\task\\150skilltask\\wudang\\yuyunwen.lua"},
	{nNpcId = 1856, nMapId = 81, nPosX = 234*8*32, nPosY = 178*16*32, nLevel = 95, szName = "强人头领", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"叶婕美 "}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {1, "150级技能任务"}},
	},
}

tbConfig[1] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 0, "武当", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1, 
	tbMessage = {
		{"KillNpc", {"强人头领"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"打败强人"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[3] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"叶婕美"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {4, "150级技能任务"}},
	},
}
 
tbConfig[4] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "武当", -1}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"虞允文"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {6, "150级技能任务"}},
	},
}

tbConfig[6] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "武当", -1}},
	},
}


tbConfig[7] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"叶婕美"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {8, "150级技能任务"}},
	},
}

tbConfig[8] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "最少留下一个空位"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3, "武当", 9}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少留下一个空位"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




