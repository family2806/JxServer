

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"何人我： 我丐帮的4年大会日又到了，这次，你想挑战我的丐帮静医吗?",
	"玩家: 天下间任何挑战我丐帮弟子都不怕接受，请帮主指教.",
	"何人我：近年来丐帮静医尽心抗金，声名渐渐远播，本教内一些巫医弟子不服，因此今天的丐帮大会我想让你和丐帮巫医比试,",
	"何人我：这次比试十分重要，你必须要自我努力一番。笔试共有3轮，规则细节传功长老也就是这次大会的主事人魏了翁会给大家讲明白，之前你得先到赛场准备一下.",
}

tbMissionDialog[1] = {
	"魏了翁: 今年丐帮巫医和净医比武有3重障碍，如果都胜了2关，那么之后剩下的是一同的胜利者.",
	"魏了翁: 参赛者正是你和巫医弟子孟晶。第一关，你和他公平比武。刀剑无眼，请小心."
}

tbMissionDialog[2] = {
	"魏了翁: 第一战你胜了，接下来的会更难，你和孟晶要一起越过我们丐帮的打狗阵法",
	"玩家: : 打狗阵法?",
	"魏了翁: 打狗阵法是我们丐帮用来对付武林高手的，诶，这次用来对付自己人也是万不得已啊.",
	"魏了翁: 还有这次主导打狗阵法的是执法长老孟苍浪。你要小心.",
}

tbMissionDialog[3] = {
	"魏了翁: 好好，你真不错，破阵很快，孟晶还在阵里，一个人在阵里恐怕凶多吉少.",
	"玩家: 什么，难道不是一个人破阵就分出胜负了吗?",
	"魏了翁: 哈哈，你以为打狗阵法是什么。当然是每个人一临阵就尝到了它的厉害。",
	"玩家: 等我回去帮助他.",
	"魏了翁: 喂，你又要进打狗阵法做什么，这样的话你之前的成绩都不算数了，何必这样做呢？",
	"玩家: 见死不救枉为人!",
}

tbMissionDialog[4] = {
	"孟晶: 你是回来嘲笑我的吧?",
	"玩家: 是大丈夫有必要这样说吗，我来为你疗伤，助你破阵.",
}

tbMissionDialog[5] = {
	"魏了翁: 想不到最后你们都破阵了，出乎我的意料，这样意外的结局我也不知道怎么判定，你们还是去找帮主仔细问问看怎么办吧.",
}

tbMissionDialog[6] = {
	"何人我：我果真没有看错人，你不仅武功高强，道骨也很好，有点像我!",
	"何人我：要知道如果在阵中不相互帮助，甚至为了胜利互相残杀，这样的话怎么会是我的弟子呢!好，非常好！",
	"玩家: 这样的话结果是怎么样的呢？就算是打和吧，我们丐帮一向讲义气，何必要在精医和巫医之间争呢?",
	"何人我：这样不行，第三场一定要比，各位兄弟，把酒抬上来!",
	"玩家: 拿酒做什么?",
	"何人我： 你们两个谁能够把我喝醉就算赢",
	"玩家： 也好！其他的我可以不争，但是喝酒我就不谦让了！哈哈.",
	"何人我：满上满上！比武破阵也不如喝酒来得畅快！也不知那个小崽子给我了一块令牌，老子我这才这么无聊.",
        "玩家: 令牌?",
	"何人我：哈哈！怎么了？你需要吗？把我喝醉了，令牌我就给你。",
	"玩家: 帮主大概喝醉了，我去看看.",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1863, nMapId = 115, nPosX = 195*8*32, nPosY = 207*16*32, nLevel = 95, szName = "孟晶:",
		szScriptPath = "\\script\\task\\150skilltask\\gaibang\\mengxing.lua",},
	{nNpcId = 1834, nMapId = 115, nPosX = 179*8*32, nPosY = 204*16*32, nLevel = 95, szName = "孟晶:", bNoRevive = 0, nIsboss = 1,},
	{nNpcId = 1835, nMapId = 115, nPosX = 195*8*32, nPosY = 212*16*32, nLevel = 95, szName = "孟苍浪", bNoRevive = 0, nIsboss = 1,},
	{nNpcId = 1804, nMapId = 115, nPosX = 195*8*32, nPosY = 208*16*32, nLevel = 95, szName = "护阵弟子", bNoRevive = 0,},
	{nNpcId = 1805, nMapId = 115, nPosX = 195*8*32, nPosY = 206*16*32, nLevel = 95, szName = "护阵弟子", bNoRevive = 0,},
	{nNpcId = 1806, nMapId = 115, nPosX = 194*8*32, nPosY = 207*16*32, nLevel = 95, szName = "护阵弟子", bNoRevive = 0,},
	{nNpcId = 1804, nMapId = 115, nPosX = 196*8*32, nPosY = 207*16*32, nLevel = 95, szName = "护阵弟子", bNoRevive = 0,},
	{nNpcId = 1805, nMapId = 115, nPosX = 195*8*32, nPosY = 207*16*32, nLevel = 95, szName = "护阵弟子", bNoRevive = 0,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"何人我："}},
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
		{"PlotDialogue", {1, 2885, 0, "丐帮", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"DialogWithNpc", {"魏了翁"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {3, "150级技能任务"}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "丐帮", -1}},
	},
 }

tbConfig[4] = {
	m_nCurStepId = 2, 
	tbMessage = {
		{"KillNpc", {"孟晶:"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"打败了孟晶"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"魏了翁"}},
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
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "丐帮", -1}},
	},
}

tbConfig[7] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"KillNpc", {"孟苍浪"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"打败了孟苍浪"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"魏了翁"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {9, "150级技能任务"}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 3, "丐帮", -1}},
	},
}

tbConfig[10] = {
	m_nCurStepId = 6,
	tbMessage = {
		{"DialogWithNpc", {"孟晶:"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {11, "150级技能任务"}},
	},
}

tbConfig[11] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "丐帮", 12}},
	},
}

tbConfig[12] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"ThisTask:Treat", {1, 2885, "丐帮", -1}},
	},
}

tbConfig[13] = {
	m_nCurStepId = 7,
	tbMessage = {
		{"DialogWithNpc", {"魏了翁"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {14, "150级技能任务"}},
	},
}

tbConfig[14] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 5, "丐帮", -1}},
	},
}
tbConfig[15] = {
	m_nCurStepId = 8,
	tbMessage = {
		{"DialogWithNpc", {"何人我："}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {16, "150级技能任务"}},
	},
}

tbConfig[16] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "你的背包至少要有1格空间"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 6, "丐帮", 17}},
	},
}

tbConfig[17] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "你的背包至少要有1格空间"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}





